package com.service;

import com.dao.BaseDAO;
import com.dao.ScenicOrderDAO;
import com.model.Scenic;
import com.model.ScenicOrder;
import com.model.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

/**
 * Created by 吴庆龙
 * 2017/4/16 12:27
 */
@Service
public class ScenicOrderService extends BaseService<ScenicOrder> {
    @Resource(name = "scenicOrderDAO")
    private ScenicOrderDAO scenicOrderDAO;

    @Resource(name = "scenicOrderDAO")
    @Override
    public void setDao(BaseDAO<ScenicOrder> dao) {
        super.setDao(dao);
    }

    public List<ScenicOrder> listUserOrders(User user) {
        return scenicOrderDAO.listUserOrders(user);
    }

    public void generateScenicOrders(List<Scenic> scenics, User user) {
        for (Scenic scenic : scenics) {
            ScenicOrder order = new ScenicOrder();
            order.setStatus(0);
            String uuid = UUID.randomUUID().toString().replace("-", "");
            order.setUuid(uuid);
            order.setScenic(scenic);
            order.setUser(user);
            order.setCreateTime(new Timestamp(System.currentTimeMillis()));
            scenicOrderDAO.save(order);
        }
    }
}
