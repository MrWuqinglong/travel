package com.service;

import com.dao.AdminDAO;
import com.dao.BaseDAO;
import com.model.Admin;
import com.system.utils.MD5Util;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 吴庆龙
 * 2017/4/16 14:26
 */
@Service
public class AdminService extends BaseService<Admin> {
    @Resource(name = "adminDAO")
    private AdminDAO adminDAO;

    @Resource(name = "adminDAO")
    @Override
    public void setDao(BaseDAO<Admin> dao) {
        super.setDao(dao);
    }

    public Admin getByName(Admin admin) throws Exception {
        Admin dbAdmin = adminDAO.getByName(admin);
        if (!dbAdmin.getPassword().equals(MD5Util.generateMD5(admin.getPassword()))) {
            throw new Exception("密码不正确");
        }
        return dbAdmin;
    }
}
