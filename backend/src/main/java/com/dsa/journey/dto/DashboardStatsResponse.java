package com.dsa.journey.dto;

import lombok.Builder;
import lombok.Data;

import java.util.List;
import java.util.UUID;

@Data
@Builder
public class DashboardStatsResponse {
    private Long totalSolved;
    private Long easyCount;
    private Long mediumCount;
    private Long hardCount;
    private Long masteredCount;
    private Long mistakesCount;
    private Long dueRevisionsCount;
    private Long independentSolveCount;
    private List<TopicReadiness> topicReadinessList;

    @Data
    @Builder
    public static class TopicReadiness {
        private UUID phaseId;
        private Integer phaseNumber;
        private String topic;
        private Long solvedCount;
        private Long masteredCount;
        private Integer readinessPercentage;
        private String priority;
        private String status;
    }
}
