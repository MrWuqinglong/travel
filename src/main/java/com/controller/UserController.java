package com.controller;

import com.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;

@Controller
@RequestMapping({"/user", "/site"})
@SessionAttributes(names = {"user"})
public class UserController extends BaseController{

    @Resource
    private UserService userService;

    @GetMapping("/index.action")
    public String index(){
        return "index";
    }

}
