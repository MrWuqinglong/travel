package com.controller;

import com.alibaba.fastjson.JSON;
import com.model.Hotel;
import com.model.Scenic;
import com.service.HotelService;
import com.service.ScenicService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 吴庆龙
 * 2017/4/16 10:44
 */
@Controller
@RequestMapping("/cart")
@SessionAttributes(names = "carts")
public class ShoppingCartController extends BaseController {

    @Resource(name = "hotelService")
    private HotelService hotelService;

    @Resource(name = "scenicService")
    private ScenicService scenicService;

    @PostMapping(value = "/addCart.action", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String addCart(Integer id, String type, ModelMap modelMap) {
        if (id == null) {
            response.setMessage("参数为空");
            return JSON.toJSONString(response);
        }
        List<Object> carts = (List<Object>) modelMap.get("carts");
        if (carts == null) {
            carts = new ArrayList<>();
        }
        if ("hotel".equals(type)) {
            Hotel hotel = hotelService.get(id);
            carts.add(hotel);
        } else if ("scenic".equals(type)) {
            Scenic scenic = scenicService.get(id);
            carts.add(scenic);
        } else {
            response.setMessage("未知商品类型");
        }
        modelMap.addAttribute("carts", carts);
        response.setMessage("添加成功");
        return JSON.toJSONString(response);
    }

    @GetMapping(value = "/listShoppingCart.action")
    public String listShoppingCart(ModelMap modelMap) {
        List<Object> carts = (List<Object>) modelMap.get("carts");
        List<Scenic> scenics = new ArrayList<>();
        List<Hotel> hotels = new ArrayList<>();
        int totalPrice = 0;
        if (carts != null) {
            for (Object item : carts) {
                if (item instanceof Hotel) {
                    Hotel hotel = (Hotel) item;
                    totalPrice += hotel.getPrice();
                    hotels.add(hotel);
                } else if (item instanceof Scenic) {
                    Scenic scenic = (Scenic) item;
                    totalPrice += scenic.getPrice();
                    scenics.add(scenic);
                }
            }
        }

        modelMap.addAttribute("scenics", scenics);
        modelMap.addAttribute("hotels", hotels);
        modelMap.addAttribute("totalPrice", totalPrice);
        modelMap.addAttribute("totalNum", carts.size());
        return "/shopping_cart";
    }

}
