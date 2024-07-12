package com.boot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.boot.dto.Criteria;
import com.boot.dto.EmpPostDTO;
import com.boot.dto.PageDTO;

@Mapper //스프링부트에서는 추가/실행시 매퍼파일을 읽어 들이도록 지정
public interface PageDAO {
	//Criteria 객체를 이용해서 페이징 처리
	public ArrayList<EmpPostDTO> listWithPaging(Criteria cri);
//	public int getTotalCount();
	public int getTotalCount(Criteria cri);
	}