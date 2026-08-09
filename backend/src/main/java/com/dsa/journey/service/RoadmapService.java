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

    public List<Phase> getAllPhases() {
        return phaseRepository.findAllByOrderBySequenceOrderAsc();
    }

    public List<Pattern> getAllPatterns() {
        return patternRepository.findAllSortedForTeaching();
    }

    public List<Pattern> getPatternsByPhase(UUID phaseId) {
        return patternRepository.findByPhaseIdOrderBySequenceOrderAsc(phaseId);
    }
}
