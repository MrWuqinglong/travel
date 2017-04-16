package com.dao;

import com.model.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO extends BaseDAO<User> {

    public User getByName(User user) {
        String hql = "FROM User WHERE username=?";
        return get(hql, user.getUsername());
    }
}
