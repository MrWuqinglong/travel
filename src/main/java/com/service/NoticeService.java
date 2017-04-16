package com.service;

import com.dao.BaseDAO;
import com.dao.NoticeDAO;
import com.model.Notice;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 吴庆龙
 * 2017/4/16 10:24
 */
@Service
public class NoticeService extends BaseService<Notice> {
    @Resource(name = "noticeDAO")
    private NoticeDAO noticeDAO;

    @Resource(name = "noticeDAO")
    @Override
    public void setDao(BaseDAO<Notice> dao) {
        super.setDao(dao);
    }

    public List<Notice> listLastNotice() {
        return noticeDAO.listLastNotice();
    }

}
