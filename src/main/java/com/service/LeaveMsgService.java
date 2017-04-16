package com.service;

import com.dao.BaseDAO;
import com.dao.LeaveMsgDAO;
import com.model.LeaveMsg;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 吴庆龙
 * 2017/4/16 11:16
 */
@Service
public class LeaveMsgService extends BaseService<LeaveMsg> {
    @Resource(name = "leaveMsgDAO")
    private LeaveMsgDAO leaveMsgDAO;

    @Resource(name = "leaveMsgDAO")
    @Override
    public void setDao(BaseDAO<LeaveMsg> dao) {
        super.setDao(dao);
    }

}
