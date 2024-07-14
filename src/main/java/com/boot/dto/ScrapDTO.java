package com.boot.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ScrapDTO {
    private String jobId;
    private String userId;

    // 기본 생성자
    public ScrapDTO() {}

    // 매개변수가 있는 생성자
    public ScrapDTO(String jobId, String userId) {
        this.jobId = jobId;
        this.userId = userId;
    }
}
