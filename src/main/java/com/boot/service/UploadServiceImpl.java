package com.boot.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.EmpAttachDAO;
import com.boot.dto.EmpAttachDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("UploadService")
public class UploadServiceImpl implements UploadService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<EmpAttachDTO> getFilelist(int emp_postNo) {
		log.info("@# UploadServiceImpl getFilelist");
		
		EmpAttachDAO dao = sqlSession.getMapper(EmpAttachDAO.class);
//		ArrayList<BoardDTO> list = dao.list();
		
//		return dao.getFilelist(emp_postNo);
		return dao.getFilelist(emp_postNo);
	}

	//폴더에 저장된 파일들 삭제
	@Override
	public void deleteFiles(List<EmpAttachDTO> fileList) {
		log.info("@# deleteFiles");
		log.info("@# fileList => "+fileList);
		
		if (fileList == null || fileList.size() == 0) {
			return;
		}
		
		fileList.forEach(attach -> {
			try {
				Path file = Paths.get("D:\\dev\\upload\\"+attach.getUploadpath()+"\\"
											 +attach.getUuid()+"_"+attach.getFilename());
				//파일이 존재하면 삭제
				Files.deleteIfExists(file);
				
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("D:\\dev\\upload\\"+attach.getUploadpath()+"\\s_"
							+attach.getUuid()+"_"+attach.getFilename());					
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error"+e.getMessage());
			}
		}); //end of forEach
		
	}
}
