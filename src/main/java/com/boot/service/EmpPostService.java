package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.EmpPostDTO;

public interface EmpPostService {
	public ArrayList<EmpPostDTO> list();
	public void write(EmpPostDTO empPostDTO);
	public EmpPostDTO contentView(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
}
