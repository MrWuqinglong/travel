package com.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * 景点管理表
 */
@Entity
@Table(name = "scenic")
public class Scenic {

    private Integer id;
    private String name;    // 景点名称
    private String overview;    // 景点简介
    private Integer price;  // 价格
    private String openTime;    // 景点开放时间
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

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "over_view")
    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    @Column(name = "price")
    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    @Column(name = "open_time")
    public String getOpenTime() {
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }

    @Column(name = "mobile")
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
