package com.dao;

import com.model.Admin;
import org.springframework.stereotype.Repository;

/**
 * Created by 吴庆龙
 * 2017/4/16 14:26
 */
@Repository
public class AdminDAO extends BaseDAO<Admin> {
    public Admin getByName(Admin admin) {
        String hql = "FROM Admin WHERE username=?";
        return get(hql, admin.getUsername());
    }
}
