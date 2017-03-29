package com.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * 用户表
 */
@Entity
@Table(name = "user")
public class User {

    private Integer id;
    private String username;
    private String password;
    private String gender;
    private String mobile;
    private String address;
    private Timestamp createTime;

    private Set<UserMsg> userMsgs = new HashSet<>();
    private Set<ScenicOrder> scenicOrders = new HashSet<>();
    private Set<HotelOrder> hotelOrders = new HashSet<>();

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "user_name")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "gender")
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Column(name = "mobile")
    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Column(name = "create_time", columnDefinition = "timestamp default current_timestamp")
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @OneToMany(targetEntity = UserMsg.class)
    @JoinColumn(name = "user_id")
    public Set<UserMsg> getUserMsgs() {
        return userMsgs;
    }
    public void setUserMsgs(Set<UserMsg> userMsgs) {
        this.userMsgs = userMsgs;
    }

    @OneToMany(targetEntity = ScenicOrder.class)
    @JoinColumn(name = "user_id")
    public Set<ScenicOrder> getScenicOrders() {
        return scenicOrders;
    }
    public void setScenicOrders(Set<ScenicOrder> scenicOrders) {
        this.scenicOrders = scenicOrders;
    }

    @OneToMany(targetEntity = HotelOrder.class)
    @JoinColumn(name = "user_id")
    public Set<HotelOrder> getHotelOrders() {
        return hotelOrders;
    }
    public void setHotelOrders(Set<HotelOrder> hotelOrders) {
        this.hotelOrders = hotelOrders;
    }
}
