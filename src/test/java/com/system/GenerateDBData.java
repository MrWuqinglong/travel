package com.system;

import com.model.Admin;
import com.service.AdminService;
import com.system.spring.config.RootConfig;
import com.system.utils.MD5Util;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by 吴庆龙
 * 2017/4/16 17:19
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = RootConfig.class)
public class GenerateDBData {

    @Resource(name = "adminService")
    private AdminService adminService;

    @Test
    public void generateAdmin() {
        Admin admin = new Admin();
        admin.setUsername("admin");
        admin.setPassword(MD5Util.generateMD5("admin"));
        adminService.save(admin);
    }

}
