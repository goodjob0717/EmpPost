package com.boot.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.Criteria;
import com.boot.dto.EmpPostDTO;
import com.boot.dto.PageDTO;
import com.boot.service.PageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PageController {

    @Autowired
    private PageService service;

    @RequestMapping("/list")
    public String listWithPaging(Criteria cri, Model model) {
        log.info("@# list");
        log.info("@# PageController cri => " + cri);

        ArrayList<EmpPostDTO> list = service.listWithPaging(cri);
        int total = service.getTotalCount(cri);
        log.info("@# total => " + total);

        model.addAttribute("list", list);
        model.addAttribute("pageMaker", new PageDTO(total, cri));

        return "list";
    }

    // 검색 메서드 추가
    @RequestMapping("/search")
    public String search(@RequestParam("type") String type, @RequestParam("keyword") String keyword, Criteria cri, Model model) {
        log.info("@# search - type: {}, keyword: {}", type, keyword);
        
        // 검색 조건 설정
        cri.setType(type);
        cri.setKeyword(keyword);

        ArrayList<EmpPostDTO> searchResults = service.listWithPaging(cri);
        int total = service.getTotalCount(cri);
        log.info("@# total => " + total);

        model.addAttribute("list", searchResults);
        model.addAttribute("pageMaker", new PageDTO(total, cri));

        return "list";
    }
}
