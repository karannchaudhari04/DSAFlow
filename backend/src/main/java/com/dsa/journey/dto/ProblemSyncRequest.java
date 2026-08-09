package com.dsa.journey.dto;

import lombok.Data;

@Data
public class ProblemSyncRequest {
    private Integer leetcodeNumber;
    private String name;
    private String url;
    private String difficulty;
}
