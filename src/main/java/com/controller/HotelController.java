package com.controller;

import com.alibaba.fastjson.JSON;
import com.model.Hotel;
import com.service.HotelService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 吴庆龙
 * 2017/4/16 10:00
 */
@Controller
@RequestMapping("/hotel")
public class HotelController extends BaseController {

    @Resource(name = "hotelService")
    private HotelService hotelService;

    @PostMapping(value = "/listLastHotel", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String listLastHotel() {
        List<Hotel> list = hotelService.listLastHotel();
        return JSON.toJSONString(list);
    }

    @GetMapping(value = "/listAll.action")
    public String listAll(ModelMap modelMap) {
        List<Hotel> hotels = hotelService.listAll();
        modelMap.addAttribute("hotels", hotels);
        return "/order_hotel";
    }

    @GetMapping(value = "/hotelDetail.action")
    public String hotelDetail(Hotel hotel, ModelMap modelMap) {
        hotel = hotelService.get(hotel.getId());
        modelMap.addAttribute("hotel", hotel);
        return "/hotel_detail";
    }

}
