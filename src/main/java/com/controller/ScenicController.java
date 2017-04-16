package com.controller;

import com.alibaba.fastjson.JSON;
import com.model.Scenic;
import com.service.ScenicService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 吴庆龙
 * 2017/4/16 10:19
 */
@Controller
@RequestMapping("/scenic")
@SessionAttributes(names = {"user"})
public class ScenicController extends BaseController{

    @Resource(name = "scenicService")
    private ScenicService scenicService;

    @PostMapping(value = "/listLastScenic.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String listLastScenic() {
        List<Scenic> list = scenicService.listLastScenic();
        return JSON.toJSONString(list);
    }

    @GetMapping(value = "/listAll.action")
    public String listAll(ModelMap modelMap) {
        List<Scenic> scenics = scenicService.listAll();
        modelMap.addAttribute("scenics", scenics);
        return "/order_scenic";
    }

}
