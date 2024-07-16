package com.boot.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.boot.dto.ScrapDTO;
import com.boot.service.ScrapService;

@RestController
public class ScrapController {

    @Autowired
    private ScrapService scrapService;

    @GetMapping("/getScrapStatus")
    public ResponseEntity<Map<String, Boolean>> getScrapStatus(@RequestParam("empPostNo") Long empPostNo) {
        try {
            boolean isScrapped = scrapService.isScrapped(empPostNo);
//            boolean isScrapped = scrapService.isScrapped(empPostNo2);
            Map<String, Boolean> response = new HashMap<>();
            response.put("isScrapped", isScrapped);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace(); // 서버 로그에 오류 출력
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PostMapping("/toggleScrap")
    public ResponseEntity<Map<String, Boolean>> toggleScrap(@RequestBody Map<String, Object> request) {
        try {
            Long empPostNo = Long.valueOf(request.get("jobId").toString());
            boolean isScrapped = Boolean.valueOf(request.get("isScrapped").toString());
            scrapService.toggleScrap(empPostNo.toString(), isScrapped);
            Map<String, Boolean> response = new HashMap<>();
            response.put("success", true);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace(); // 서버 로그에 오류 출력
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
