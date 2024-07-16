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
        String currentUserId = getCurrentUserId();
        ScrapDTO scrapDTO = new ScrapDTO(jobId, currentUserId);
        return isScrapped ? scrapDAO.removeScrap(scrapDTO) : scrapDAO.addScrap(scrapDTO);
    }

    public boolean isScrapped(Long jobId) {
        String currentUserId = getCurrentUserId();
        ScrapDTO scrapDTO = new ScrapDTO(jobId.toString(), currentUserId);
        return scrapDAO.isScrapped(scrapDTO);
    }

    private String getCurrentUserId() {
        // 현재 사용자의 ID를 세션 또는 인증 정보에서 가져오는 로직을 구현해야 합니다.
        // 예를 들어, Spring Security를 사용한다면 다음과 같이 구현할 수 있습니다:
        // Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        // return authentication.getName(); // 현재 사용자의 username을 반환하는 예시
        return "currentUserId"; // 실제 구현 필요
    }
}
