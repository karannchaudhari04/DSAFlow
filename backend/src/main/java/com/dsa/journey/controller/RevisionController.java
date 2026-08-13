package com.dsa.journey.controller;

import com.dsa.journey.dto.RevisionCompleteRequest;
import com.dsa.journey.entity.Revision;
import com.dsa.journey.service.RevisionService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping("/api/revisions")
@RequiredArgsConstructor
public class RevisionController {

    private final RevisionService revisionService;

    @GetMapping
    public ResponseEntity<List<Revision>> getRevisions() {
        List<Revision> revisions = revisionService.getAllRevisions();
        return ResponseEntity.ok(revisions);
    }

    @PostMapping("/{id}/complete")
    public ResponseEntity<Revision> completeRevision(
            @PathVariable UUID id,
            @RequestBody Optional<RevisionCompleteRequest> requestOpt) {
        RevisionCompleteRequest request = requestOpt.orElse(null);
        Integer rating = request != null ? request.getRating() : null;
        String notes = request != null ? request.getNotes() : null;
        Revision revision = revisionService.completeRevision(id, rating, notes);
        return ResponseEntity.ok(revision);
    }
}
