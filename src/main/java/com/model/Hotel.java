package com.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * 酒店管理表
 */
@Entity
public class Hotel {

    private Integer id;
    private String name;
    private Integer price;
    private String breakfast;
    private String wifi;
    private String freeTake;
    private String airCondition;
    private String address;
    private String hotLine;
    private Timestamp createTime;

    private Set<HotelOrder> hotelOrders = new HashSet<>();

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getBreakfast() {
        return breakfast;
    }

    public void setBreakfast(String breakfast) {
        this.breakfast = breakfast;
    }

    public String getWifi() {
        return wifi;
    }

    public void setWifi(String wifi) {
        this.wifi = wifi;
    }

    public String getFreeTake() {
        return freeTake;
    }

    public void setFreeTake(String freeTake) {
        this.freeTake = freeTake;
    }

    public String getAirCondition() {
        return airCondition;
    }

    public void setAirCondition(String airCondition) {
        this.airCondition = airCondition;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHotLine() {
        return hotLine;
    }

    public void setHotLine(String hotLine) {
        this.hotLine = hotLine;
    }

    @Column(name = "create_time", columnDefinition = "timestamp default current_timestamp")
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @OneToMany(targetEntity = HotelOrder.class)
    @JoinColumn(name = "hotel_id")
    public Set<HotelOrder> getHotelOrders() {
        return hotelOrders;
    }
    public void setHotelOrders(Set<HotelOrder> hotelOrders) {
        this.hotelOrders = hotelOrders;
    }
}
