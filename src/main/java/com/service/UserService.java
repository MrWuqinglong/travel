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

    public User getUserByName(User user) {
        return userDAO.getByName(user);
    }

    public void cash(Integer totalPrice, User user) throws Exception {
        User dbUser = userDAO.get(user.getId());
        if (dbUser.getBalance() < totalPrice) {
            throw new Exception("账户余额不足");
        }
        dbUser.setBalance(dbUser.getBalance() - totalPrice);
        userDAO.update(dbUser);
    }
}
