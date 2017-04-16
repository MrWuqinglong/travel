package com.controller;

import com.alibaba.fastjson.JSON;
import com.model.LeaveMsg;
import com.service.LeaveMsgService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.sql.Timestamp;

/**
 * Created by 吴庆龙
 * 2017/4/16 11:17
 */
@Controller
@RequestMapping("/leaveMsg")
public class LeaveMsgController extends BaseController {

    @Resource(name = "leaveMsgService")
    private LeaveMsgService leaveMsgService;

    @GetMapping(value = "/connectUs.action")
    public String connectUs() {
        return "/connect_us";
    }

    @PostMapping(value = "/leaveMsg.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String leaveMsg(LeaveMsg leaveMsg) {
        leaveMsg.setCreateTime(new Timestamp(System.currentTimeMillis()));
        leaveMsgService.save(leaveMsg);
        response.setMessage("留言成功");
        return JSON.toJSONString(response);
    }

}
