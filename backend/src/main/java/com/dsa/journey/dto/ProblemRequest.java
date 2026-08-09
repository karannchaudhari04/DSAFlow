package com.dsa.journey.dto;

import lombok.Data;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Data
public class ProblemRequest {
    private Integer leetcodeNumber;
    private String name;
    private String url;
    private String difficulty;
    private String status;
    private LocalDate dateSolved;
    private Integer timeTakenMinutes;
    private Integer attemptsCount;
    private Boolean independentSolve;
    private UUID patternId;
    private String purpose;
    
    // Details
    private String intuition;
    private String approach;
    private String codeSnippet;
    private String complexityAnalysis;
    private String whatILearned;

    // Mistakes
    private List<MistakeRequest> mistakes;

    @Data
    public static class MistakeRequest {
        private String description;
        private String correctUnderstanding;
        private Boolean isResolved;
    }
}
