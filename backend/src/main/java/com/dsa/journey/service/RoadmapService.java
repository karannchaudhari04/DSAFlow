package com.dsa.journey.service;

import com.dsa.journey.entity.Pattern;
import com.dsa.journey.entity.Phase;
import com.dsa.journey.repository.PatternRepository;
import com.dsa.journey.repository.PhaseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class RoadmapService {

    private final PhaseRepository phaseRepository;
    private final PatternRepository patternRepository;
    private final com.dsa.journey.repository.ProblemRepository problemRepository;

    @Transactional  // Override class-level readOnly=true — setStatus() mutates managed entities
    public List<Phase> getAllPhases() {
        List<Phase> phases = phaseRepository.findAllByOrderBySequenceOrderAsc();
        List<com.dsa.journey.entity.Problem> problems = problemRepository.findAll();
        for (Phase phase : phases) {
            phase.setStatus(phase.calculateStatus(problems));
        }
        return phases;
    }

    public List<Pattern> getAllPatterns() {
        return patternRepository.findAllSortedForTeaching();
    }

    public List<Pattern> getPatternsByPhase(UUID phaseId) {
        return patternRepository.findByPhaseIdOrderBySequenceOrderAsc(phaseId);
    }
}
