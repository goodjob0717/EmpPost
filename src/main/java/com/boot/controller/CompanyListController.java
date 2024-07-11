package com.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompanyListController {

    @GetMapping("/company_list")
    public String showCompanyList() {
        return "company_list"; 
        // returns /WEB-INF/views/company_list.jsp
    }
}