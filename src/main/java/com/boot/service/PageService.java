package com.boot.service;

import java.util.ArrayList;
import com.boot.dto.Criteria;
import com.boot.dto.EmpPostDTO;

public interface PageService {
    ArrayList<EmpPostDTO> listWithPaging(Criteria cri);
    int getTotalCount(Criteria cri);
}
