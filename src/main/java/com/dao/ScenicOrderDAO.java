package com.dao;

import com.model.ScenicOrder;
import com.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 吴庆龙
 * 2017/4/16 12:27
 */
@Repository
public class ScenicOrderDAO extends BaseDAO<ScenicOrder> {
    public List<ScenicOrder> listUserOrders(User user) {
        String hql = "FROM ScenicOrder WHERE user.id=?";
        return listWithCustom(hql, user.getId());
    }

    public ScenicOrder getByUUID(String uuid) {
        String hql = "FROM ScenicOrder WHERE uuid=?";
        return get(hql, uuid);
    }
}
