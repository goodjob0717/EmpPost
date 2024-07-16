package com.boot.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.boot.dto.Criteria;
import com.boot.dto.EmpPostDTO;

@Mapper
public interface EmpPostDAO {
    ArrayList<EmpPostDTO> list();
    void contentpost(EmpPostDTO postDTO); 
    EmpPostDTO contentView(HashMap<String, String> param);
    void modify(HashMap<String, String> param);
    void delete(HashMap<String, String> param);
    
    // 페이지네이션 및 검색 메서드 추가
    ArrayList<EmpPostDTO> listWithPaging(Criteria cri);
    int getTotalCount(Criteria cri);
    
    // 새로운 save 메서드 추가
    void save(EmpPostDTO postDTO);
}

