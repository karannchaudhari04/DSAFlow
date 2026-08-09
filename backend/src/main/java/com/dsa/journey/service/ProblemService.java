package com.dsa.journey.service;

import com.dsa.journey.dto.ProblemRequest;
import com.dsa.journey.entity.Mistake;
import com.dsa.journey.entity.Pattern;
import com.dsa.journey.entity.Problem;
import com.dsa.journey.entity.ProblemDetail;
import com.dsa.journey.entity.Revision;
import com.dsa.journey.repository.PatternRepository;
import com.dsa.journey.repository.ProblemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Transactional
public class ProblemService {

    private final ProblemRepository problemRepository;
    private final PatternRepository patternRepository;

    @Transactional(readOnly = true)
    public List<Problem> getAllProblems() {
        return problemRepository.findAllByOrderByLeetcodeNumberAsc();
    }

    @Transactional(readOnly = true)
    public Problem getProblemById(UUID id) {
        return problemRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Problem not found with ID: " + id));
    }

    public Problem createProblem(ProblemRequest request) {
        Pattern pattern = patternRepository.findById(request.getPatternId())
                .orElseThrow(() -> new IllegalArgumentException("Pattern not found with ID: " + request.getPatternId()));

        String newStatus = request.getStatus();
        boolean isMarkingSolved = "COMPLETED".equalsIgnoreCase(newStatus) || 
                                  "MASTERED".equalsIgnoreCase(newStatus) || 
                                  "REVISION_SCHEDULED".equalsIgnoreCase(newStatus);
        if (isMarkingSolved) {
            throw new IllegalArgumentException("Cannot manually create a solved problem. Please solve it on LeetCode and sync it using the Chrome extension first!");
        }

        Problem problem = Problem.builder()
                .leetcodeNumber(request.getLeetcodeNumber())
                .name(request.getName())
                .url(request.getUrl())
                .difficulty(request.getDifficulty())
                .status(request.getStatus())
                .dateSolved(request.getDateSolved() != null ? request.getDateSolved() : LocalDate.now())
                .timeTakenMinutes(request.getTimeTakenMinutes())
                .attemptsCount(request.getAttemptsCount() != null ? request.getAttemptsCount() : 1)
                .independentSolve(request.getIndependentSolve() != null ? request.getIndependentSolve() : true)
                .leetcodeVerified(false)
                .pattern(pattern)
                .build();

        ProblemDetail detail = ProblemDetail.builder()
                .intuition(request.getIntuition() != null ? request.getIntuition() : "")
                .approach(request.getApproach() != null ? request.getApproach() : "")
                .codeSnippet(request.getCodeSnippet() != null ? request.getCodeSnippet() : "")
                .complexityAnalysis(request.getComplexityAnalysis())
                .whatILearned(request.getWhatILearned())
                .problem(problem)
                .build();

        problem.setDetail(detail);

        if (request.getMistakes() != null) {
            List<Mistake> mistakes = new ArrayList<>();
            for (ProblemRequest.MistakeRequest mReq : request.getMistakes()) {
                Mistake mistake = Mistake.builder()
                        .problem(problem)
                        .pattern(pattern)
                        .description(mReq.getDescription())
                        .correctUnderstanding(mReq.getCorrectUnderstanding())
                        .dateCreated(LocalDate.now())
                        .isResolved(mReq.getIsResolved() != null ? mReq.getIsResolved() : false)
                        .build();
                mistakes.add(mistake);
            }
            problem.setMistakes(mistakes);
        }

        scheduleRevisionsIfNecessary(problem);

        return problemRepository.save(problem);
    }

    public Problem updateProblem(UUID id, ProblemRequest request) {
        Problem problem = getProblemById(id);

        Pattern pattern = patternRepository.findById(request.getPatternId())
                .orElseThrow(() -> new IllegalArgumentException("Pattern not found with ID: " + request.getPatternId()));

        String newStatus = request.getStatus();
        boolean isMarkingSolved = "COMPLETED".equalsIgnoreCase(newStatus) || 
                                  "MASTERED".equalsIgnoreCase(newStatus) || 
                                  "REVISION_SCHEDULED".equalsIgnoreCase(newStatus);
        
        if (isMarkingSolved && !Boolean.TRUE.equals(problem.getLeetcodeVerified())) {
            throw new IllegalArgumentException("This problem has not been verified on LeetCode. Please solve it on LeetCode and sync it using the Chrome extension first!");
        }

        if ("NOT_STARTED".equalsIgnoreCase(newStatus) || "IN_PROGRESS".equalsIgnoreCase(newStatus)) {
            problem.setLeetcodeVerified(false);
        }

        problem.setLeetcodeNumber(request.getLeetcodeNumber());
        problem.setName(request.getName());
        problem.setUrl(request.getUrl());
        problem.setDifficulty(request.getDifficulty());
        problem.setStatus(request.getStatus());
        problem.setDateSolved(request.getDateSolved() != null ? request.getDateSolved() : LocalDate.now());
        problem.setTimeTakenMinutes(request.getTimeTakenMinutes());
        problem.setAttemptsCount(request.getAttemptsCount() != null ? request.getAttemptsCount() : 1);
        problem.setIndependentSolve(request.getIndependentSolve() != null ? request.getIndependentSolve() : true);
        problem.setPattern(pattern);

        // Update Detail
        ProblemDetail detail = problem.getDetail();
        if (detail == null) {
            detail = new ProblemDetail();
            detail.setProblem(problem);
            problem.setDetail(detail);
        }
        detail.setIntuition(request.getIntuition() != null ? request.getIntuition() : "");
        detail.setApproach(request.getApproach() != null ? request.getApproach() : "");
        detail.setCodeSnippet(request.getCodeSnippet() != null ? request.getCodeSnippet() : "");
        detail.setComplexityAnalysis(request.getComplexityAnalysis());
        detail.setWhatILearned(request.getWhatILearned());

        // Update Mistakes
        problem.getMistakes().clear();
        if (request.getMistakes() != null) {
            for (ProblemRequest.MistakeRequest mReq : request.getMistakes()) {
                Mistake mistake = Mistake.builder()
                        .problem(problem)
                        .pattern(pattern)
                        .description(mReq.getDescription())
                        .correctUnderstanding(mReq.getCorrectUnderstanding())
                        .dateCreated(LocalDate.now())
                        .isResolved(mReq.getIsResolved() != null ? mReq.getIsResolved() : false)
                        .build();
                problem.getMistakes().add(mistake);
            }
        }

        scheduleRevisionsIfNecessary(problem);

        return problemRepository.save(problem);
    }

    private void scheduleRevisionsIfNecessary(Problem problem) {
        if ("REVISION_SCHEDULED".equals(problem.getStatus())) {
            if (problem.getRevisions() == null || problem.getRevisions().isEmpty()) {
                List<Revision> revisions = new ArrayList<>();
                revisions.add(Revision.builder()
                        .problem(problem)
                        .revisionNumber(1)
                        .dueDate(problem.getDateSolved().plusDays(1))
                        .status("PENDING")
                        .build());
                revisions.add(Revision.builder()
                        .problem(problem)
                        .revisionNumber(2)
                        .dueDate(problem.getDateSolved().plusDays(7))
                        .status("PENDING")
                        .build());
                revisions.add(Revision.builder()
                        .problem(problem)
                        .revisionNumber(3)
                        .dueDate(problem.getDateSolved().plusDays(30))
                        .status("PENDING")
                        .build());
                problem.setRevisions(revisions);
            }
        }
    }

    public void syncProblems(List<com.dsa.journey.dto.ProblemSyncRequest> syncRequests) {
        UUID defaultPatternId = UUID.fromString("a0a00000-0000-0000-0000-000000000000");
        Pattern defaultPattern = patternRepository.findById(defaultPatternId)
                .orElseGet(() -> patternRepository.findAll().stream().findFirst()
                .orElseThrow(() -> new IllegalArgumentException("No patterns exist in database. Make sure migrations have run.")));

        for (com.dsa.journey.dto.ProblemSyncRequest req : syncRequests) {
            java.util.Optional<Problem> existingOpt = problemRepository.findByLeetcodeNumber(req.getLeetcodeNumber());

            if (existingOpt.isPresent()) {
                Problem existing = existingOpt.get();
                existing.setLeetcodeVerified(true);
                if (!"MASTERED".equals(existing.getStatus())) {
                    existing.setStatus("COMPLETED");
                }
                problemRepository.save(existing);
            } else {
                Problem problem = Problem.builder()
                        .leetcodeNumber(req.getLeetcodeNumber())
                        .name(req.getName())
                        .url(req.getUrl())
                        .difficulty(req.getDifficulty().toUpperCase())
                        .status("COMPLETED")
                        .dateSolved(LocalDate.now())
                        .attemptsCount(1)
                        .independentSolve(true)
                        .leetcodeVerified(true)
                        .pattern(defaultPattern)
                        .build();

                ProblemDetail detail = ProblemDetail.builder()
                        .intuition("Imported automatically from LeetCode.")
                        .approach("Imported automatically from LeetCode.")
                        .codeSnippet("// Add your solution code here")
                        .problem(problem)
                        .build();

                problem.setDetail(detail);
                problemRepository.save(problem);
            }
        }
    }

    public void deleteProblem(UUID id) {
        Problem problem = getProblemById(id);
        problemRepository.delete(problem);
    }
}
