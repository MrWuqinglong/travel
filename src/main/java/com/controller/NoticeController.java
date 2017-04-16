package com.controller;

import com.alibaba.fastjson.JSON;
import com.model.Notice;
import com.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 吴庆龙
 * 2017/4/16 10:25
 */
@Controller
@RequestMapping("/notice")
public class NoticeController extends BaseController {

    @Resource(name = "noticeService")
    private NoticeService noticeService;

    @PostMapping(value = "/listLastNotice", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String listLastNotice() {
        List<Notice> list = noticeService.listLastNotice();
        return JSON.toJSONString(list);
    }

}
