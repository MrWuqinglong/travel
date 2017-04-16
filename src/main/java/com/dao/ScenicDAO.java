package com.dao;

import com.model.Scenic;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 吴庆龙
 * 2017/4/16 10:17
 */
@Repository
public class ScenicDAO extends BaseDAO<Scenic>{
    public List<Scenic> listLastScenic() {
        String hql = "FROM Scenic ORDER BY createTime DESC LIMIT ?";
        return listWithCustom(hql, 5);
    }
}
