package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.EmpPostDTO;

public interface EmpPostService {
    ArrayList<EmpPostDTO> list();
    void write(EmpPostDTO postDTO);
    EmpPostDTO contentView(HashMap<String, String> param);
    void modify(HashMap<String, String> param);
    void delete(HashMap<String, String> param);
    void save(EmpPostDTO empPostDTO);

    // user_id와 corp_id에 따른 contentView 메서드 추가
    EmpPostDTO contentViewWithUserCorp(int empPostNo, String userId, String corpId);
}
