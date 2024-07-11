package com.boot.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.PageDAO;
import com.boot.dto.Criteria;
import com.boot.dto.EmpPostDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("PageService")
public class PageServiceImpl implements PageService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<EmpPostDTO> listWithPaging(Criteria cri) {
		
		log.info("@# PageServiceImpl listWithPaging");
		log.info("@# PageServiceImpl cri => "+cri);
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
		ArrayList<EmpPostDTO> listWithPaging = dao.listWithPaging(cri);
		
		return listWithPaging;	
	}

	@Override
	public int getTotalCount(Criteria cri) {
		
		log.info("@# PageServiceImpl getTotalCount");
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
//		int total = dao.getTotalCount();
		int total = dao.getTotalCount(cri);
		
		return total;	
	}
}

