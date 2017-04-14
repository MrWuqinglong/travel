package com.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * 景点管理表
 */
@Entity
public class Scenic {

    private Integer id;
    private String name;    // 景点名称
    private Integer price;  // 价格
    private String openTime;    // 景点开放时间
    private String address; // 景点地址
    private String mobile;  // 咨询电话
    private Timestamp createTime;   // 景点添加时间

    private Set<ScenicOrder> scenicOrders = new HashSet<>();

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

    public String getOpenTime() {
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    @Column(name = "create_time", columnDefinition = "timestamp default current_timestamp")
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @OneToMany(targetEntity = ScenicOrder.class)
    @JoinColumn(name = "scenic_id")
    public Set<ScenicOrder> getScenicOrders() {
        return scenicOrders;
    }

    public void setScenicOrders(Set<ScenicOrder> scenicOrders) {
        this.scenicOrders = scenicOrders;
    }
}
