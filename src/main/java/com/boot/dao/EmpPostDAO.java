package com.boot.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.dto.EmpPostDTO;

@Mapper
public interface EmpPostDAO {
	
	public ArrayList<EmpPostDTO> list();
	public void contentpost(EmpPostDTO postDTO); 
	public EmpPostDTO contentView(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
	}

// contentpost 
// content
