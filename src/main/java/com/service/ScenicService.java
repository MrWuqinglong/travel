package com.service;

import com.dao.BaseDAO;
import com.dao.ScenicDAO;
import com.model.Scenic;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 吴庆龙
 * 2017/4/16 10:18
 */
@Service
public class ScenicService extends BaseService<Scenic> {
    @Resource(name = "scenicDAO")
    private ScenicDAO scenicDAO;

    @Resource(name = "scenicDAO")
    @Override
    public void setDao(BaseDAO<Scenic> dao) {
        super.setDao(dao);
    }

    public List<Scenic> listLastScenic() {
        return scenicDAO.listLastScenic();
    }
}
