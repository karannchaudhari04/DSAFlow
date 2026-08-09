package com.dsa.journey.controller;

import com.dsa.journey.dto.ProblemRequest;
import com.dsa.journey.entity.Problem;
import com.dsa.journey.service.ProblemService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/problems")
@RequiredArgsConstructor
public class ProblemController {

    private final ProblemService problemService;

    @GetMapping
    public ResponseEntity<List<Problem>> getAllProblems() {
        List<Problem> problems = problemService.getAllProblems();
        return ResponseEntity.ok(problems);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Problem> getProblemById(@PathVariable UUID id) {
        Problem problem = problemService.getProblemById(id);
        return ResponseEntity.ok(problem);
    }

    @PostMapping
    public ResponseEntity<Problem> createProblem(@RequestBody ProblemRequest request) {
        Problem problem = problemService.createProblem(request);
        return ResponseEntity.ok(problem);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Problem> updateProblem(@PathVariable UUID id, @RequestBody ProblemRequest request) {
        Problem problem = problemService.updateProblem(id, request);
        return ResponseEntity.ok(problem);
    }

    @PostMapping("/sync")
    public ResponseEntity<Void> syncProblems(@RequestBody List<com.dsa.journey.dto.ProblemSyncRequest> request) {
        problemService.syncProblems(request);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProblem(@PathVariable UUID id) {
        problemService.deleteProblem(id);
        return ResponseEntity.noContent().build();
    }
}
