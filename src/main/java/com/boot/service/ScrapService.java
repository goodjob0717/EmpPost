package com.boot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.boot.dao.ScrapDAO;
import com.boot.dto.ScrapDTO;

@Service
public class ScrapService {

    @Autowired
    private ScrapDAO scrapDAO;

    public boolean toggleScrap(String jobId, boolean isScrapped) {
        ScrapDTO scrapDTO = new ScrapDTO(jobId, getCurrentUserId());
        return isScrapped ? scrapDAO.removeScrap(scrapDTO) : scrapDAO.addScrap(scrapDTO);
    }

    public boolean isScrapped(String jobId) {
        ScrapDTO scrapDTO = new ScrapDTO(jobId, getCurrentUserId());
        return scrapDAO.isScrapped(scrapDTO);
    }

    private String getCurrentUserId() {
        // 현재 사용자의 ID를 반환하는 로직 추가
        return "currentUserId"; // 실제 구현 필요
    }
}
