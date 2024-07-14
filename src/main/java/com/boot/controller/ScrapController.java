package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.boot.dto.ScrapDTO;
import com.boot.service.ScrapService;

@RestController
public class ScrapController {

    @Autowired
    private ScrapService scrapService;

    @PostMapping("/toggleScrap")
    public ResponseEntity<Boolean> toggleScrap(@RequestBody ScrapDTO scrapDTO) {
        // 서비스 호출
        boolean isScrapped = scrapService.isScrapped(scrapDTO.getJobId());
        boolean result = scrapService.toggleScrap(scrapDTO.getJobId(), isScrapped);
        return ResponseEntity.ok(result);
    }
}
