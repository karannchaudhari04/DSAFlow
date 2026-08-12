package com.dsa.journey.service;

import com.dsa.journey.entity.Problem;
import com.dsa.journey.entity.Revision;
import com.dsa.journey.repository.ProblemRepository;
import com.dsa.journey.repository.RevisionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Transactional
public class RevisionService {

    private final RevisionRepository revisionRepository;
    private final ProblemRepository problemRepository;

    @Transactional(readOnly = true)
    public List<Revision> getAllRevisions() {
        return revisionRepository.findAllByOrderByDueDateAsc();
    }

    public Revision completeRevision(UUID id, Integer rating, String notes) {
        Revision revision = revisionRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Revision not found with ID: " + id));

        revision.setStatus("COMPLETED");
        revision.setCompletedDate(LocalDate.now());
        if (rating != null) {
            revision.setRating(rating);
        }
        if (notes != null) {
            revision.setNotes(notes);
        }
        Revision savedRevision = revisionRepository.save(revision);

        Problem problem = revision.getProblem();
        
        // 7-day and then 30-day Spaced Repetition calculation
        // Quality q is mapped from rating (1 to 5)
        // If rating is null, default to 4 (Good)
        int q = (rating != null) ? rating : 4;
        int rep = problem.getRepetitionCount() != null ? problem.getRepetitionCount() : 1;
        int interval = 7;

        if (q < 3) {
            // Again / Forgot
            interval = 1; // Solved today, review again tomorrow
            rep = 1; // Reset to Round 1
            if ("MASTERED".equals(problem.getStatus())) {
                problem.setStatus("REVISION_SCHEDULED");
            }
        } else {
            // Passed the review!
            if (revision.getRevisionNumber() == 1) {
                // Passed Round 1 (due in 7 days). Next round is Round 2 (due in 30 days).
                interval = 30;
                rep = 2;
            } else {
                // Passed Round 2 (due in 30 days). Problem is now MASTERED!
                problem.setStatus("MASTERED");
                interval = 30;
                rep = 3;
            }
        }

        problem.setEaseFactor(2.5);
        problem.setRepetitionCount(rep);
        problem.setIntervalDays(interval);
        problemRepository.save(problem);

        // Schedule the next revision
        LocalDate nextDueDate = LocalDate.now().plusDays(interval);
        Revision nextRevision = Revision.builder()
                .problem(problem)
                .revisionNumber(revision.getRevisionNumber() + 1)
                .dueDate(nextDueDate)
                .status("PENDING")
                .build();
        revisionRepository.save(nextRevision);

        return savedRevision;
    }
}
