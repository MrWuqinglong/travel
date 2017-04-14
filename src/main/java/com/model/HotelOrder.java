package com.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * 酒店预定表
 */
@Entity
public class HotelOrder {

    private Integer id;
    private Integer status; // 0: 过期; 1: 未使用
    private Timestamp expTime; // 失效时间
    private User user;
    private Hotel hotel;
    private Timestamp createTime;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Column(name = "exp_time", columnDefinition = "timestamp default current_timestamp")
    public Timestamp getExpTime() {
        return expTime;
    }

    public void setExpTime(Timestamp expTime) {
        this.expTime = expTime;
    }

    @Column(name = "create_time", columnDefinition = "timestamp default current_timestamp")
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id")
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne(targetEntity = Hotel.class)
    @JoinColumn(name = "hotel_id")
    public Hotel getHotel() {
        return hotel;
    }
    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }
}
