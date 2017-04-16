package com.service;

import com.dao.BaseDAO;
import com.dao.HotelDAO;
import com.model.Hotel;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 吴庆龙
 * 2017/4/16 9:57
 */
@Service
public class HotelService extends BaseService<Hotel> {

    @Resource(name = "hotelDAO")
    private HotelDAO hotelDAO;

    @Resource(name = "hotelDAO")
    @Override
    public void setDao(BaseDAO<Hotel> dao) {
        super.setDao(dao);
    }

    public List<Hotel> listLastHotel() {
        return hotelDAO.listLastHotel();
    }
}
