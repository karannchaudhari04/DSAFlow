package com.dsa.journey.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.util.UUID;

@Entity
@Table(name = "problem_details")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = "problem")
public class ProblemDetail {

    @Id
    @Column(name = "problem_id")
    private UUID problemId;

    @OneToOne(fetch = FetchType.LAZY)
    @MapsId
    @JoinColumn(name = "problem_id")
    @JsonIgnore
    private Problem problem;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String intuition;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String approach;

    @Column(name = "code_snippet", nullable = false, columnDefinition = "TEXT")
    private String codeSnippet;

    @Column(name = "complexity_analysis", columnDefinition = "TEXT")
    private String complexityAnalysis;

    @Column(name = "what_i_learned", columnDefinition = "TEXT")
    private String whatILearned;
}
