package com.boot.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.EmpPostDAO;
import com.boot.dto.Criteria;
import com.boot.dto.EmpPostDTO;

@Service
public class PageService {

    @Autowired
    private EmpPostDAO empPostDAO;

    public ArrayList<EmpPostDTO> listWithPaging(Criteria cri) {
        return empPostDAO.listWithPaging(cri);
    }

    public int getTotalCount(Criteria cri) {
        return empPostDAO.getTotalCount(cri);
    }
}
