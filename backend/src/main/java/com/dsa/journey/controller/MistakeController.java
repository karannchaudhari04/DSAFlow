package com.dsa.journey.controller;

import com.dsa.journey.entity.Mistake;
import com.dsa.journey.service.MistakeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/mistakes")
@RequiredArgsConstructor
public class MistakeController {

    private final MistakeService mistakeService;

    @GetMapping
    public ResponseEntity<List<Mistake>> getMistakes() {
        List<Mistake> mistakes = mistakeService.getAllMistakes();
        return ResponseEntity.ok(mistakes);
    }
}
