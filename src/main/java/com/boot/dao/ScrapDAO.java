package com.boot.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.boot.dto.ScrapDTO;

@Repository
public class ScrapDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public boolean isScrapped(ScrapDTO scrapDTO) {
        String sql = "SELECT COUNT(*) FROM scraps WHERE job_id = ? AND user_id = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, scrapDTO.getJobId(), scrapDTO.getUserId());
        return count != null && count > 0;
    }

    public boolean addScrap(ScrapDTO scrapDTO) {
        String sql = "INSERT INTO scraps (job_id, user_id) VALUES (?, ?)";
        int rowsAffected = jdbcTemplate.update(sql, scrapDTO.getJobId(), scrapDTO.getUserId());
        return rowsAffected > 0;
    }

    public boolean removeScrap(ScrapDTO scrapDTO) {
        String sql = "DELETE FROM scraps WHERE job_id = ? AND user_id = ?";
        int rowsAffected = jdbcTemplate.update(sql, scrapDTO.getJobId(), scrapDTO.getUserId());
        return rowsAffected > 0;
    }
}
