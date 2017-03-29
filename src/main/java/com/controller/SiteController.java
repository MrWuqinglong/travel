package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/site")
@Controller
public class SiteController {

    @RequestMapping("/index.action")
    public String toIndex() {
        return "/index";
    }

}
