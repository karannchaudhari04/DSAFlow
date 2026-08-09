package com.dsa.journey.controller;

import com.dsa.journey.entity.Revision;
import com.dsa.journey.service.RevisionService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/revisions")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:5173")
public class RevisionController {

    private final RevisionService revisionService;

    @GetMapping
    public ResponseEntity<List<Revision>> getRevisions() {
        List<Revision> revisions = revisionService.getAllRevisions();
        return ResponseEntity.ok(revisions);
    }

    @PostMapping("/{id}/complete")
    public ResponseEntity<Revision> completeRevision(@PathVariable UUID id) {
        Revision revision = revisionService.completeRevision(id);
        return ResponseEntity.ok(revision);
    }
}
