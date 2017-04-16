package com.dao;

import com.model.Hotel;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 吴庆龙
 * 2017/4/16 9:56
 */
@Repository
public class HotelDAO extends BaseDAO<Hotel> {
    public List<Hotel> listLastHotel() {
        String hql = "FROM Hotel ORDER BY createTime DESC LIMIT ?";
        return listWithCustom(hql, 5);
    }
}
