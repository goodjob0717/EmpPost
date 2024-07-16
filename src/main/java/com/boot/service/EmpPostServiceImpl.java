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

@Service("EmpPostService")
@Slf4j
public class EmpPostServiceImpl implements EmpPostService {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public ArrayList<EmpPostDTO> list() {
        log.info("@# EmpPostServiceImpl list");
        EmpPostDAO dao = sqlSession.getMapper(EmpPostDAO.class);
        return dao.list();
    }

    @Override
    public void write(EmpPostDTO postDTO) {
        log.info("@# EmpPostServiceImpl write");
        EmpPostDAO dao = sqlSession.getMapper(EmpPostDAO.class);
        EmpAttachDAO adao = sqlSession.getMapper(EmpAttachDAO.class);
        dao.contentpost(postDTO);

        if (postDTO.getAttachList() == null || postDTO.getAttachList().size() == 0) {
            return;
        }

        postDTO.getAttachList().forEach(attach -> {
            attach.setEmp_postNo(postDTO.getEmp_postNo());
            adao.insertFile(attach);
        });
    }

    @Override
    public EmpPostDTO contentView(HashMap<String, String> param) {
        log.info("@# EmpPostServiceImpl content_view");
        EmpPostDAO dao = sqlSession.getMapper(EmpPostDAO.class);
        return dao.contentView(param);
    }

    @Override
    public void modify(HashMap<String, String> param) {
        log.info("@# EmpPostServiceImpl modify");
        EmpPostDAO dao = sqlSession.getMapper(EmpPostDAO.class);
        dao.modify(param);
    }

    @Override
    public void delete(HashMap<String, String> param) {
        log.info("@# EmpPostServiceImpl delete");
        EmpPostDAO dao = sqlSession.getMapper(EmpPostDAO.class);
        EmpAttachDAO attachDAO = sqlSession.getMapper(EmpAttachDAO.class);

        attachDAO.deleteFile(param.get("emp_postNo"));
        dao.delete(param);
    }

    @Override
    public void save(EmpPostDTO empPostDTO) {
        EmpPostDAO dao = sqlSession.getMapper(EmpPostDAO.class);
        dao.save(empPostDTO);  // save 메서드 호출
    }

    @Override
    public EmpPostDTO contentViewWithUserCorp(int empPostNo, String userId, String corpId) {
        log.info("@# EmpPostServiceImpl content_view_with_user_corp");
        EmpPostDAO dao = sqlSession.getMapper(EmpPostDAO.class);
        HashMap<String, String> param = new HashMap<>();
        param.put("emp_postNo", String.valueOf(empPostNo));
        EmpPostDTO dto = dao.contentView(param);

        if ("someUserId".equals(userId)) {
            log.info("User-specific logic for userId: " + userId);
        } else if ("someCorpId".equals(corpId)) {
            log.info("Corp-specific logic for corpId: " + corpId);
        }

        return dto;
    }
}
