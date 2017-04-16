package com.dao;

import com.model.User;
import com.model.UserMsg;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 吴庆龙
 * 2017/4/16 12:24
 */
@Repository
public class UserMsgDAO extends BaseDAO<UserMsg> {
    public List<UserMsg> listUserMsg(User user) {
        String hql = "FROM UserMsg WHERE user.id=?";
        return super.listWithCustom(hql, user.getId());
    }
}
