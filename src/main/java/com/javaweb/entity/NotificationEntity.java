package com.javaweb.entity;

import javax.persistence.*;

@Entity
@Table(name = "notification")
public class NotificationEntity extends BaseEntity{
    @Column(name="content")
    private String content;

    @Column(name="status")
    private Long status = 0L; // 1 là đọc rồi , 0 là chưa đọc

    @Column(name="link")
    private String link;

    @ManyToOne
    @JoinColumn(name="user_id")
    private UserEntity user;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }
}
