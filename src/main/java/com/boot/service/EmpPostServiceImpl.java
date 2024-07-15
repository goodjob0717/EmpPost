package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.EmpAttachDAO;
import com.boot.dao.EmpPostDAO;
import com.boot.dto.EmpPostDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("EmpPostService")
public class EmpPostServiceImpl implements EmpPostService{
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private EmpPostService empPostService;
	
	@Override
	public ArrayList<EmpPostDTO> list() {
		log.info("@# EmpPostServiceImpl list");
		log.info("Fetched list size: " + list().size()); // 리스트 크기 로그
		
		EmpPostDAO dao = sqlSession.getMapper(EmpPostDAO.class);
		ArrayList<EmpPostDTO> list = dao.list();
		
		return list;		
	}

	@Override
//		public void write(HashMap<String, String> param) {
	//파일업로드는 파라미터 DTO를 사용
		public void write(EmpPostDTO postDTO) {
		log.info("@# EmpPostServiceImpl write");
		
		EmpPostDAO dao = sqlSession.getMapper(EmpPostDAO.class);
		EmpAttachDAO adao = sqlSession.getMapper(EmpAttachDAO.class);
//		dao.write(param);
		dao.contentpost(postDTO);
		log.info("@# postDTO => "+postDTO);
		
		//첨부파일 있는지 체크
		log.info("@# postDTO.getAttachList() =>"+postDTO.getAttachList());
		
		//게시글만저장하고 끝
		if (postDTO.getAttachList() == null || postDTO.getAttachList().size() == 0) {
			log.info("@# null");
			return;
		}
		
		log.info("@# postDTO => "+postDTO);
		//첨부파일이 있는 경우 처리
		postDTO.getAttachList().forEach(attach -> {
//			attach.setBoardNo(postDTO.getEmp_postNo());
			attach.setEmp_postNo(postDTO.getEmp_postNo());
//			adao.insertFile(attach);
			adao.insertFile(attach);
		}); //람다식
	}

	@Override
		public EmpPostDTO contentView(HashMap<String, String> param) {
		log.info("@# EmpPostServiceImpl content_view");
		
		EmpPostDAO dao = sqlSession.getMapper(EmpPostDAO.class);
		EmpPostDTO dto = dao.contentView(param);
		
		return dto;
	}

	@Override
		public void modify(HashMap<String, String> param) {
		
			log.info("@# EmpPostServiceImpl modify");
			
			EmpPostDAO dao = sqlSession.getMapper(EmpPostDAO.class);
			dao.modify(param);
//			
		}


	@Override
		public void delete(HashMap<String, String> param) {

		log.info("@# EmpPostServiceImpl delete");
		
		EmpPostDAO dao = sqlSession.getMapper(EmpPostDAO.class);
		EmpAttachDAO attachDAO = sqlSession.getMapper(EmpAttachDAO.class);
		
		//첨부파일 삭제 후 게시글 삭제 emp_postNo
		attachDAO.deleteFile(param.get("emp_postNo"));
		dao.delete(param);
	}
	
    @Override
    public void save(EmpPostDTO empPostDTO) {
        empPostService.save(empPostDTO);
    }
}
