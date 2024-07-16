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
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
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

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Timestamp.class, new CustomDateEditor(dateFormat, true));
    }

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
        service.save(empPostDTO);
        return "redirect:/list_old";
    }

    @RequestMapping("/contentpost")
    public String contentpost(EmpPostDTO empPostDTO) {
        log.info("@# contentpost");
        log.info("@# postDTO => " + empPostDTO);

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

    @GetMapping("/content_view")
    public String contentView(@RequestParam("emp_postNo") int empPostNo, 
                              @RequestParam("user_id") String userId, 
                              @RequestParam("corp_id") String corpId, 
                              Model model) {
        EmpPostDTO dto = service.contentViewWithUserCorp(empPostNo, userId, corpId);
        model.addAttribute("dto", dto);

        if ("someUserId".equals(userId)) {
            return "userSpecificView";
        } else if ("someCorpId".equals(corpId)) {
            return "corpSpecificView";
        } else {
            return "defaultView";
        }
    }

    @RequestMapping("/empPostmodify")
    public String modify(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
        log.info("@# empPostmodify");
        log.info("@# param => " + param);

        service.modify(param);
        rttr.addAttribute("pageNum", param.get("pageNum"));
        rttr.addAttribute("amount", param.get("amount"));

        return "redirect:list";
    }

    @RequestMapping("/empPostdelete")
    public String delete(@RequestParam HashMap<String, String> param, Model model, RedirectAttributes rttr) {
        log.info("@# empPostdelete");
        log.info("@# param => " + param);
        log.info("@# emp_postNo => " + param.get("emp_postNo"));

        List<EmpAttachDTO> fileList = uploadService.getFilelist(Integer.parseInt(param.get("emp_postNo")));
        log.info("@# fileList => " + fileList);

        service.delete(param);
        uploadService.deleteFiles(fileList);

        rttr.addAttribute("pageNum", param.get("pageNum"));
        rttr.addAttribute("amount", param.get("amount"));

        return "redirect:list";
    }
}

