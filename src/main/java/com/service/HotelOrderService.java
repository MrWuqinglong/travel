package com.service;

import com.dao.BaseDAO;
import com.dao.HotelOrderDAO;
import com.model.Hotel;
import com.model.HotelOrder;
import com.model.User;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

/**
 * Created by 吴庆龙
 * 2017/4/16 10:05
 */
@Service
public class HotelOrderService extends BaseService<HotelOrder> {
    @Resource(name = "hotelOrderDAO")
    private HotelOrderDAO hotelOrderDAO;

    @Resource(name = "hotelOrderDAO")
    @Override
    public void setDao(BaseDAO<HotelOrder> dao) {
        super.setDao(dao);
    }

    public List<HotelOrder> listUserOrders(User user) {
        return hotelOrderDAO.listUserOrders(user);
    }

    public void generateHotelOrders(List<Hotel> hotels, User user) {
        for (Hotel hotel : hotels) {
            HotelOrder order = new HotelOrder();
            order.setStatus(0);
            String uuid = UUID.randomUUID().toString().replace("-", "");
            order.setUuid(uuid);
            order.setCreateTime(new Timestamp(System.currentTimeMillis()));
            order.setHotel(hotel);
            order.setUser(user);
            hotelOrderDAO.save(order);
        }
    }

    public HotelOrder getByUUID(String uuid) {
        HotelOrder order = hotelOrderDAO.getByUUID(uuid);
        Hibernate.initialize(order.getHotel());
        Hibernate.initialize(order.getUser());
        return order;
    }
}
