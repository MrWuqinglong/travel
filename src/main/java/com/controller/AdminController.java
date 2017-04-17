package com.controller;

import com.alibaba.fastjson.JSON;
import com.model.*;
import com.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by 吴庆龙
 * 2017/4/16 14:25
 */
@Controller
@RequestMapping("/admin")
@SessionAttributes(names = {"admin"})
public class AdminController extends BaseController {

    @Resource(name = "adminService")
    private AdminService adminService;
    @Resource(name = "noticeService")
    private NoticeService noticeService;
    @Resource(name = "hotelService")
    private HotelService hotelService;
    @Resource(name = "scenicService")
    private ScenicService scenicService;
    @Resource(name = "leaveMsgService")
    private LeaveMsgService leaveMsgService;
    @Resource(name = "hotelOrderService")
    private HotelOrderService hotelOrderService;
    @Resource(name = "scenicOrderService")
    private ScenicOrderService scenicOrderService;

    @GetMapping(value = "/login.action")
    public String login() {
        return "/admin_login";
    }

    @PostMapping(value = "/doLogin.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String doLogin(Admin admin, ModelMap modelMap) {
        try {
            adminService.getByName(admin);
            modelMap.addAttribute("admin", admin);
            response.setType("success");
        } catch (Exception e) {
            response.setType("error");
            response.setMessage(e.getMessage());
        }
        return JSON.toJSONString(response);
    }

    @GetMapping(value = "/index.action")
    public String index(ModelMap modelMap) {
        // 查询所有的公告
        List<Notice> notices = noticeService.listAll();
        // 查询所有酒店
        List<Hotel> hotels = hotelService.listAll();
        // 查询所有景点
        List<Scenic> scenics = scenicService.listAll();
        // 查询所有的用户留言
        List<LeaveMsg> leaveMsgs = leaveMsgService.listAll();

        modelMap.addAttribute("notices", notices);
        modelMap.addAttribute("hotels", hotels);
        modelMap.addAttribute("scenics", scenics);
        modelMap.addAttribute("leaveMsgs", leaveMsgs);
        return "/admin";
    }

    @PostMapping(value = "/addNotice.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String addNotice(Notice notice) {
        notice.setCreateTime(new Timestamp(System.currentTimeMillis()));
        noticeService.save(notice);
        response.setMessage("保存公告成功");
        return JSON.toJSONString(response);
    }

    @PostMapping(value = "/deleteNotice.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String deleteNotice(Notice notice) {
        notice = noticeService.get(notice.getId());
        noticeService.delete(notice);
        response.setMessage("删除成功");
        return JSON.toJSONString(response);
    }

    @PostMapping(value = "/addScenic.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String addScenic(Scenic scenic) {
        scenic.setCreateTime(new Timestamp(System.currentTimeMillis()));
        scenicService.save(scenic);
        response.setMessage("添加景点成功");
        return JSON.toJSONString(response);
    }

    @PostMapping(value = "/deleteScenic.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String deleteScenic(Scenic scenic) {
        scenic = scenicService.get(scenic.getId());
        scenicService.delete(scenic);
        response.setMessage("删除景点成功");
        return JSON.toJSONString(response);
    }

    @PostMapping(value = "/selectScenicOrder.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String selectScenicOrder(String uuid) {
        ScenicOrder scenicOrder = scenicOrderService.getByUUID(uuid);
        if (scenicOrder == null) {
            response.setType("error");
            response.setMessage("无此订单");
            return JSON.toJSONString(response);
        } else if (scenicOrder.getStatus() == 1) {
            response.setType("error");
            response.setMessage("此订单码已经被使用");
            return JSON.toJSONString(response);
        }
        return JSON.toJSONString(scenicOrder);
    }

    @PostMapping(value = "/useScenicOrder.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String useScenicOrder(String uuid) {
        ScenicOrder scenicOrder = scenicOrderService.getByUUID(uuid);
        scenicOrder.setStatus(1);
        scenicOrderService.update(scenicOrder);
        response.setMessage("使用成功");
        return JSON.toJSONString(response);
    }

    @PostMapping(value = "/addHotel.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String addHotel(Hotel hotel) {
        hotel.setCreateTime(new Timestamp(System.currentTimeMillis()));
        hotelService.save(hotel);
        response.setMessage("添加成功");
        return JSON.toJSONString(response);
    }

    @PostMapping(value = "/deleteHotel.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String deleteHotel(Hotel hotel) {
        hotel = hotelService.get(hotel.getId());
        hotelService.delete(hotel);
        response.setMessage("删除成功");
        return JSON.toJSONString(response);
    }

    @PostMapping(value = "/selectHotelOrder.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String selectHotelOrder(String uuid) {
        HotelOrder hotelOrder = hotelOrderService.getByUUID(uuid);
        if (hotelOrder == null) {
            response.setType("error");
            response.setMessage("无此订单");
            return JSON.toJSONString(response);
        } else if (hotelOrder.getStatus() == 1) {
            response.setType("error");
            response.setMessage("此订单码已经被使用");
            return JSON.toJSONString(response);
        }
        return JSON.toJSONString(hotelOrder);
    }

    @PostMapping(value = "/useHotelOrder.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String useHotelOrder(String uuid) {
        HotelOrder hotelOrder = hotelOrderService.getByUUID(uuid);
        hotelOrder.setStatus(1);
        hotelOrderService.update(hotelOrder);
        response.setMessage("使用成功");
        return JSON.toJSONString(response);
    }

    @PostMapping(value = "/deleteLeaveMsg.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String deleteLeaveMsg(LeaveMsg leaveMsg) {
        leaveMsg = leaveMsgService.get(leaveMsg.getId());
        leaveMsgService.delete(leaveMsg);
        response.setMessage("删除成功");
        return JSON.toJSONString(response);
    }
}
