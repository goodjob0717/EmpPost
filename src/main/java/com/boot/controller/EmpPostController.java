package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.dto.EmpAttachDTO;
import com.boot.dto.EmpPostDTO;
import com.boot.service.EmpPostService;
import com.boot.service.UploadService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class EmpPostController {

	@Autowired
	private EmpPostService service;
	
	@Autowired
	private UploadService uploadService;

	//채용공고리스트
	@RequestMapping("/list_old")
//	@RequestMapping("/list")
	public String list(Model model) {
		log.info("@# list");
		
		ArrayList<EmpPostDTO> list = service.list();
		model.addAttribute("list", list);
		
		return "list";
	}
	
	@RequestMapping("/contentpost") //?
//		public String write(@RequestParam HashMap<String, String> param) {
		public String contentpost(EmpPostDTO postDTO) {
		log.info("@# contentpost");
		log.info("@# postDTO  => "+postDTO);
		
		//먼저 파악하기 위한 log
		if (postDTO.getAttachList() != null) {
			postDTO.getAttachList().forEach(attach -> log.info("@# attach =>"+attach));
		}
		
		service.write(postDTO);
	
		return "redirect:list";
	}
	
	//글작성누르면넘어가는페이지,채용공고등록페이지
	@RequestMapping("/contentpost_view")
	public String contentpost_view() {
		log.info("@# contentpost_view");
		return "contentpost_view";
	}
	
	//수정누르면 수정할 수 있게 등록했던것들 들고 오는 페이지 
	@RequestMapping("/content_view")
		public String content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# content_view");
		
		EmpPostDTO dto = service.contentView(param);
		model.addAttribute("content_view",dto);
		
		//content_view.jsp 에서 pageMaker를 가지고 페이징 처리
		model.addAttribute("pageMaker", param);
		
//		ArrayList<CommentDTO> commentList = commentService.findAll(param);
//		model.addAttribute("commentList", commentList);//commentList -> jsp에있는 이름 그대로 적용
		
		return "content_view";
	}
	
	//수정
	@RequestMapping("/modify")
//		public String modify(@RequestParam HashMap<String, String> param) {
		public String modify(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
		log.info("@# modify");
		log.info("@# param => "+param);
		
		service.modify(param);
		
		//페이지 이동시 뒤에 페이지 번호, 글 갯수 추가
		rttr.addAttribute("pageNum", param.get("pageNum"));
		rttr.addAttribute("amount", param.get("amount"));
		
		return "redirect:list";
	}
	
	//삭제
	@RequestMapping("/delete")
//	public String delete(@RequestParam HashMap<String, String> param, Model model) {
		public String delete(@RequestParam HashMap<String, String> param, Model model, RedirectAttributes rttr) {
		log.info("@# delete");
		log.info("@# param => "+param);
		log.info("@# emp_postNo => "+param.get("emp_postNo"));
		
		List<EmpAttachDTO> fileList = uploadService.getFilelist(Integer.parseInt(param.get("emp_postNo")));
		log.info("@# fileList => "+fileList);
		
		service.delete(param);
		uploadService.deleteFiles(fileList);
		
		//페이지 이동시 뒤에 페이지 번호, 글 갯수 추가
		rttr.addAttribute("pageNum", param.get("pageNum"));
		rttr.addAttribute("amount", param.get("amount"));
				
		return "redirect:list";
	}
}


/*
채용공고리스트
@RequestMapping("/list_old")
public String list(Model model) {
	log.info("@# list");
	
	ArrayList<EmpPostDTO> list = service.list();
	model.addAttribute("list", list);
	
	return "list";
}

@RequestMapping("/write") //?
//	public String write(@RequestParam HashMap<String, String> param) {
	public String write(EmpPostDTO empPostDTO) {
	log.info("@# write");
	log.info("@# empPostDTO  => "+empPostDTO);
	
	//먼저 파악하기 위한 log
	if (empPostDTO.getAttachList() != null) {
		empPostDTO.getAttachList().forEach(attach -> log.info("@# attach =>"+attach));
	}
	
	service.write(empPostDTO);

	return "redirect:list";
}

//글작성누르면넘어가는페이지,채용공고등록페이지
@RequestMapping("/write_view")
public String write_view() {
	log.info("@# write_view");
	return "write_view";
}

//수정누르면 수정할 수 있게 등록했던것들 들고 오는 페이지 
@RequestMapping("/content_view")
	public String content_view(@RequestParam HashMap<String, String> param, Model model) {
	log.info("@# content_view");
	
	EmpPostDTO dto = service.contentView(param);
	model.addAttribute("content_view",dto);
	
	//content_view.jsp 에서 pageMaker를 가지고 페이징 처리
	model.addAttribute("pageMaker", param);
	
//	ArrayList<CommentDTO> commentList = commentService.findAll(param);
//	model.addAttribute("commentList", commentList);//commentList -> jsp에있는 이름 그대로 적용
	
	return "content_view";
}
*/







