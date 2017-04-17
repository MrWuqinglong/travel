package com.dao;

import com.model.HotelOrder;
import com.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 吴庆龙
 * 2017/4/16 10:04
 */
@Repository
public class HotelOrderDAO extends BaseDAO<HotelOrder> {
    public List<HotelOrder> listUserOrders(User user) {
        String hql = "FROM HotelOrder WHERE user.id=?";
        return listWithCustom(hql, user.getId());
    }

    public HotelOrder getByUUID(String uuid) {
        String hql = "FROM HotelOrder WHERE uuid=?";
        return get(hql, uuid);
    }
}
