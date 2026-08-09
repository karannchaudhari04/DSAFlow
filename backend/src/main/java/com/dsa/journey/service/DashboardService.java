package com.dsa.journey.service;

import com.dsa.journey.dto.DashboardStatsResponse;
import com.dsa.journey.entity.Phase;
import com.dsa.journey.entity.Problem;
import com.dsa.journey.entity.Revision;
import com.dsa.journey.repository.MistakeRepository;
import com.dsa.journey.repository.PhaseRepository;
import com.dsa.journey.repository.ProblemRepository;
import com.dsa.journey.repository.RevisionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class DashboardService {

    private final ProblemRepository problemRepository;
    private final MistakeRepository mistakeRepository;
    private final RevisionRepository revisionRepository;
    private final PhaseRepository phaseRepository;

    public DashboardStatsResponse getDashboardStats() {
        List<Problem> problems = problemRepository.findAll();
        List<Revision> pendingRevisions = revisionRepository.findByStatusOrderByDueDateAsc("PENDING");
        List<Phase> phases = phaseRepository.findAllByOrderBySequenceOrderAsc();

        LocalDate today = LocalDate.now();
        long dueRevisionsCount = pendingRevisions.stream()
                .filter(r -> r.getDueDate().isBefore(today) || r.getDueDate().isEqual(today))
                .count();

        List<Problem> solvedProblems = problems.stream()
                .filter(p -> "COMPLETED".equalsIgnoreCase(p.getStatus()) || 
                            "MASTERED".equalsIgnoreCase(p.getStatus()) || 
                            "REVISION_SCHEDULED".equalsIgnoreCase(p.getStatus()))
                .collect(Collectors.toList());

        long totalSolved = solvedProblems.size();
        long easyCount = solvedProblems.stream().filter(p -> "EASY".equalsIgnoreCase(p.getDifficulty())).count();
        long mediumCount = solvedProblems.stream().filter(p -> "MEDIUM".equalsIgnoreCase(p.getDifficulty())).count();
        long hardCount = solvedProblems.stream().filter(p -> "HARD".equalsIgnoreCase(p.getDifficulty())).count();
        long masteredCount = solvedProblems.stream().filter(p -> "MASTERED".equalsIgnoreCase(p.getStatus())).count();
        long independentSolveCount = solvedProblems.stream().filter(p -> Boolean.TRUE.equals(p.getIndependentSolve())).count();
        long mistakesCount = mistakeRepository.count();

        // Calculate readiness per phase/topic
        List<DashboardStatsResponse.TopicReadiness> topicReadinessList = new ArrayList<>();
        int targetProblemsPerPhase = 3;

        for (Phase phase : phases) {
            // Get all pattern IDs for this phase
            Set<UUID> patternIds = phase.getPatterns().stream()
                    .map(p -> p.getId())
                    .collect(Collectors.toSet());

            // Count problems solved in this phase
            long solvedCount = problems.stream()
                    .filter(p -> patternIds.contains(p.getPattern().getId()) && 
                                ("COMPLETED".equalsIgnoreCase(p.getStatus()) || 
                                 "MASTERED".equalsIgnoreCase(p.getStatus()) || 
                                 "REVISION_SCHEDULED".equalsIgnoreCase(p.getStatus())))
                    .count();

            // Count problems mastered in this phase
            long masteredCountInPhase = problems.stream()
                    .filter(p -> patternIds.contains(p.getPattern().getId()) && "MASTERED".equalsIgnoreCase(p.getStatus()))
                    .count();

            int readinessPercentage = (int) Math.min((solvedCount * 100) / targetProblemsPerPhase, 100);
            String dynamicStatus = phase.calculateStatus(problems);

            topicReadinessList.add(DashboardStatsResponse.TopicReadiness.builder()
                    .phaseId(phase.getId())
                    .phaseNumber(phase.getPhaseNumber())
                    .topic(phase.getTopic())
                    .solvedCount(solvedCount)
                    .masteredCount(masteredCountInPhase)
                    .readinessPercentage(readinessPercentage)
                    .priority(phase.getPriority())
                    .status(dynamicStatus)
                    .build());
        }

        return DashboardStatsResponse.builder()
                .totalSolved(totalSolved)
                .easyCount(easyCount)
                .mediumCount(mediumCount)
                .hardCount(hardCount)
                .masteredCount(masteredCount)
                .mistakesCount(mistakesCount)
                .dueRevisionsCount(dueRevisionsCount)
                .independentSolveCount(independentSolveCount)
                .topicReadinessList(topicReadinessList)
                .build();
    }
}
