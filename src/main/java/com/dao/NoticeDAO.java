package com.dao;

import com.model.Notice;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 吴庆龙
 * 2017/4/16 10:24
 */
@Repository
public class NoticeDAO extends BaseDAO<Notice> {
    public List<Notice> listLastNotice() {
        String hql = "FROM Notice ORDER BY createTime DESC LIMIT ?";
        return listWithCustom(hql, 5);
    }
}
