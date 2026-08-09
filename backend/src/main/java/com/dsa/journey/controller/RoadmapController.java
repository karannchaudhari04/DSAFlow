package com.dsa.journey.controller;

import com.dsa.journey.entity.Pattern;
import com.dsa.journey.entity.Phase;
import com.dsa.journey.service.RoadmapService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:5173")
public class RoadmapController {

    private final RoadmapService roadmapService;

    @GetMapping("/phases")
    public ResponseEntity<List<Phase>> getPhases() {
        List<Phase> phases = roadmapService.getAllPhases();
        return ResponseEntity.ok(phases);
    }

    @GetMapping("/patterns")
    public ResponseEntity<List<Pattern>> getPatterns() {
        List<Pattern> patterns = roadmapService.getAllPatterns();
        return ResponseEntity.ok(patterns);
    }

    @GetMapping("/phases/{phaseId}/patterns")
    public ResponseEntity<List<Pattern>> getPatternsByPhase(@PathVariable UUID phaseId) {
        List<Pattern> patterns = roadmapService.getPatternsByPhase(phaseId);
        return ResponseEntity.ok(patterns);
    }
}
