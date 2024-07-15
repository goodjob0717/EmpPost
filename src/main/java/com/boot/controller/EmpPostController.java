package com.boot.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

    // 채용공고리스트
    @RequestMapping("/list_old")
    public String list(Model model) {
        log.info("@# list");
        
        List<EmpPostDTO> list = service.list();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        List<EmpPostDTO> formattedList = list.stream().map(dto -> {
            if (dto.getEmp_endDate() != null) {
                dto.setEmp_endDateStr(dateFormat.format(dto.getEmp_endDate()));
            }
            return dto;
        }).collect(Collectors.toList());

        model.addAttribute("list", formattedList);
        return "list";
    }
    
    @RequestMapping("/save")
    public String save(@ModelAttribute EmpPostDTO empPostDTO, Model model) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            empPostDTO.setEmp_endDate(new Timestamp(dateFormat.parse(empPostDTO.getEmp_endDateStr()).getTime()));
        } catch (ParseException e) {
            e.printStackTrace();
            // 에러 처리
        }

        service.save(empPostDTO);//
        return "redirect:/list_old";
    }
    
    @RequestMapping("/contentpost")
    public String contentpost(EmpPostDTO empPostDTO) {
        log.info("@# contentpost");
        log.info("@# postDTO  => " + empPostDTO);
        
        if (empPostDTO.getAttachList() != null) {
            empPostDTO.getAttachList().forEach(attach -> log.info("@# attach =>" + attach));
        }
        
        service.write(empPostDTO);
    
        return "redirect:list";
    }
    
    @RequestMapping("/contentpost_view")
    public String contentpost_view() {
        log.info("@# contentpost_view");
        return "contentpost_view";
    }
    
    // 수정 페이지로 이동
    @RequestMapping("/content_view")
    public String content_view(@RequestParam HashMap<String, String> param, Model model, HttpSession session) {
        log.info("@# content_view");
        
        EmpPostDTO dto = service.contentView(param);
        model.addAttribute("content_view", dto);
        
        // 세션에서 corp_id 가져오기 -> corp_id 데이터에 넣기
//        String corpId = (String) session.getAttribute("corp_id");
//        model.addAttribute("corp_id", corpId);
        
        // content_view.jsp 에서 pageMaker를 가지고 페이징 처리
        model.addAttribute("pageMaker", param);
        
        return "content_view";
    }
    
    // 수정
    @RequestMapping("/empPostmodify")
    public String modify(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
        log.info("@# empPostmodify");
        log.info("@# param => " + param);
        
        service.modify(param);
        
        // 페이지 이동시 뒤에 페이지 번호, 글 갯수 추가
        rttr.addAttribute("pageNum", param.get("pageNum"));
        rttr.addAttribute("amount", param.get("amount"));
        
        return "redirect:list";
    }
    
    // 삭제
    @RequestMapping("/empPostdelete")
    public String delete(@RequestParam HashMap<String, String> param, Model model, RedirectAttributes rttr) {
        log.info("@# empPostdelete");
        log.info("@# param => " + param);
        log.info("@# emp_postNo => " + param.get("emp_postNo"));
        
        List<EmpAttachDTO> fileList = uploadService.getFilelist(Integer.parseInt(param.get("emp_postNo")));
        log.info("@# fileList => " + fileList);
        
        service.delete(param);
        uploadService.deleteFiles(fileList);
        
        // 페이지 이동시 뒤에 페이지 번호, 글 갯수 추가
        rttr.addAttribute("pageNum", param.get("pageNum"));
        rttr.addAttribute("amount", param.get("amount"));
                
        return "redirect:list";
    }
}
