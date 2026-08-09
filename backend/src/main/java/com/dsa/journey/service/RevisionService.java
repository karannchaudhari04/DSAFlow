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

    public Revision completeRevision(UUID id) {
        Revision revision = revisionRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Revision not found with ID: " + id));

        revision.setStatus("COMPLETED");
        revision.setCompletedDate(LocalDate.now());
        Revision savedRevision = revisionRepository.save(revision);

        // Check if all revisions for the problem are complete
        Problem problem = revision.getProblem();
        boolean allCompleted = problem.getRevisions().stream()
                .allMatch(r -> "COMPLETED".equals(r.getStatus()));

        if (allCompleted) {
            problem.setStatus("MASTERED");
            problemRepository.save(problem);
        }

        return savedRevision;
    }
}
