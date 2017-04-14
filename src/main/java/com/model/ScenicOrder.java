package com.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * 景点预定表
 */
@Entity
public class ScenicOrder {

    private Integer id;
    private Integer status; // 0: 过期; 1: 未使用
    private Timestamp expTime; // 失效时间， 默认一天失效
    private User user;
    private Scenic scenic;
    private Timestamp createTime; // 购买时间

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


    @ManyToOne(targetEntity = Scenic.class)
    @JoinColumn(name = "scenic_id")
    public Scenic getScenic() {
        return scenic;
    }
    public void setScenic(Scenic scenic) {
        this.scenic = scenic;
    }

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id")
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
}
