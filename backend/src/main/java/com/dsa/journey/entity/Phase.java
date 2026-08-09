package com.dsa.journey.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "phases")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Phase {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @Column(name = "phase_number", nullable = false, unique = true)
    private Integer phaseNumber;

    @Column(nullable = false, length = 100)
    private String topic;

    @Column(nullable = false, length = 50)
    private String priority;

    @Column(nullable = false, length = 50)
    private String status;

    @Column(name = "sequence_order", nullable = false)
    private Integer sequenceOrder;

    @OneToMany(mappedBy = "phase", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    @OrderBy("sequenceOrder ASC")
    @Builder.Default
    private List<Pattern> patterns = new ArrayList<>();

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

    public String calculateStatus(List<Problem> allProblems) {
        if (patterns == null || patterns.isEmpty()) {
            return "NOT_STARTED";
        }
        java.util.Set<UUID> patternIds = new java.util.HashSet<>();
        for (Pattern p : patterns) {
            patternIds.add(p.getId());
        }
        
        long totalProblems = 0;
        long solvedProblems = 0;
        
        for (Problem p : allProblems) {
            if (p.getPattern() != null && patternIds.contains(p.getPattern().getId())) {
                totalProblems++;
                String stat = p.getStatus();
                if ("COMPLETED".equalsIgnoreCase(stat) || 
                    "MASTERED".equalsIgnoreCase(stat) || 
                    "REVISION_SCHEDULED".equalsIgnoreCase(stat)) {
                    solvedProblems++;
                }
            }
        }
        
        if (totalProblems == 0) {
            return "NOT_STARTED";
        }
        if (solvedProblems == totalProblems) {
            return "COMPLETED";
        }
        if (solvedProblems > 0) {
            return "IN_PROGRESS";
        }
        return "NOT_STARTED";
    }
}
