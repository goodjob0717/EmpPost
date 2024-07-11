package com.boot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.dto.EmpAttachDTO;

@Mapper
public interface EmpAttachDAO {
	public void insertFile(EmpAttachDTO attach);
	public List<EmpAttachDTO> getFilelist(int emp_postNo);
	public void deleteFile(String emp_postNo);
}
