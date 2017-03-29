package com.service;

import com.dao.BaseDAO;
import com.dao.UserDAO;
import com.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserService extends BaseService<User> {

    @Autowired
    private UserDAO userDAO;

    @Resource(name = "userDAO")
    @Override
    public void setDao(BaseDAO<User> dao) {
        super.setDao(dao);
    }



}
