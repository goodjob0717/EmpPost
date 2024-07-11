package com.boot.service;

import java.util.List;

import com.boot.dto.EmpAttachDTO;


public interface UploadService {
	public List<EmpAttachDTO> getFilelist(int boardNo);
	public void deleteFiles(List<EmpAttachDTO> fileList);
}
