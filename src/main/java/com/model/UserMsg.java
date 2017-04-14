package com.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * 用户站内信
 * 管理员对用户发送方站内信
 */
@Entity
public class UserMsg {

    private Integer id;
    private String message;
    private Timestamp createTime;
    private User user;  // 哪个用户的站内信

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

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
}
