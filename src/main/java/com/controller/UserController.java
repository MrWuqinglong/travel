package com.controller;

import com.alibaba.fastjson.JSON;
import com.model.*;
import com.service.*;
import com.system.utils.MD5Util;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping({"/user", "/site"})
@SessionAttributes(names = {"user"})
public class UserController extends BaseController{

    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "hotelOrderService")
    private HotelOrderService hotelOrderService;
    @Resource(name = "scenicOrderService")
    private ScenicOrderService scenicOrderService;
    @Resource(name = "userMsgService")
    private UserMsgService userMsgService;

    @GetMapping("/index.action")
    public String index(){
        return "/site_index";
    }

    @GetMapping("/register.action")
    public String register() {
        return "/user_register";
    }

    @PostMapping(value = "/doRegister.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String doRegister(User user, ModelMap modelMap) {
        user.setPassword(MD5Util.generateMD5(user.getPassword()));
        user.setCreateTime(new Timestamp(System.currentTimeMillis()));
        userService.save(user);
        response.setMessage("注册成功");
        modelMap.addAttribute("user", user);
        return JSON.toJSONString(response);
    }

    @PostMapping(value = "/doLogin.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String doLogin(User user) {
        User dbUser = userService.getUserByName(user);
        if (dbUser == null) {
            response.setType("error");
            response.setMessage("用户不存在");
            return JSON.toJSONString(response);
        }
        if (!dbUser.getPassword().equals(MD5Util.generateMD5(user.getPassword()))) {
            response.setType("error");
            response.setMessage("密码不正确");
            return JSON.toJSONString(response);
        }
        response.setType("success");
        return JSON.toJSONString(response);
    }

    @PostMapping(value = "/cashShoppingCart.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String cashShoppingCart(Integer totalPrice, ModelMap modelMap) {
        User user = (User) modelMap.get("user");
        try {
            List<Object> carts = (List<Object>) modelMap.get("carts");
            List<Scenic> scenics = new ArrayList<>();
            List<Hotel> hotels = new ArrayList<>();
            if (carts != null) {
                for (Object item : carts) {
                    if (item instanceof Hotel) {
                        hotels.add((Hotel) item);
                    } else if (item instanceof Scenic) {
                        scenics.add((Scenic) item);
                    }
                }
            }
            hotelOrderService.generateHotelOrders(hotels, user);
            scenicOrderService.generateScenicOrders(scenics, user);
            userService.cash(totalPrice, user);
            response.setMessage("购买成功");
        } catch (Exception e) {
            response.setMessage(e.getMessage());
        }
        return JSON.toJSONString(response);
    }

    @GetMapping(value = "/userBack.action")
    public String userBack(ModelMap modelMap) {
        User user = (User) modelMap.get("user");
        List<HotelOrder> hotelOrders = hotelOrderService.listUserOrders(user);
        List<ScenicOrder> scenicOrders = scenicOrderService.listUserOrders(user);
        List<UserMsg> userMsgs = userMsgService.listUserMsg(user);
        modelMap.addAttribute("user", user);
        modelMap.addAttribute("hotelOrders", hotelOrders);
        modelMap.addAttribute("scenicOrders", scenicOrders);
        modelMap.addAttribute("useMsgs", userMsgs);
        return "/user_back";
    }

}
