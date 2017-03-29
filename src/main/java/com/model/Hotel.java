package com.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * 酒店管理表
 */
@Entity
@Table(name = "hotel")
public class Hotel {

    private Integer id;
    private String name;
    private String description;
    private Integer price;
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

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name = "price")
    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
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
