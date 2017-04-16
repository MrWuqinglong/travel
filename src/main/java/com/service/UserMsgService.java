package com.service;

import com.dao.BaseDAO;
import com.dao.UserMsgDAO;
import com.model.User;
import com.model.UserMsg;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 吴庆龙
 * 2017/4/16 12:24
 */
@Service
public class UserMsgService extends BaseService<UserMsg> {
    @Resource(name = "userMsgDAO")
    private UserMsgDAO userMsgDAO;

    @Resource(name = "userMsgDAO")
    @Override
    public void setDao(BaseDAO<UserMsg> dao) {
        super.setDao(dao);
    }

    public List<UserMsg> listUserMsg(User user) {
        return userMsgDAO.listUserMsg(user);
    }
}
