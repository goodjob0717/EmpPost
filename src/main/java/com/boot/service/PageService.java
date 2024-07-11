package com.boot.service;

import java.util.ArrayList;

import com.boot.dto.Criteria;
import com.boot.dto.EmpPostDTO;


public interface PageService {
	public ArrayList<EmpPostDTO> listWithPaging(Criteria cri);
//	public int getTotalCount();
	public int getTotalCount(Criteria cri);
	}
