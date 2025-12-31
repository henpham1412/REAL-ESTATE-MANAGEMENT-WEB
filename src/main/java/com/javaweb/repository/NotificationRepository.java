package com.javaweb.repository;

import com.javaweb.entity.NotificationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface NotificationRepository extends JpaRepository<NotificationEntity,Long> {
    List<NotificationEntity> findByUser_UserNameOrderByCreatedDateDesc(String userUserName);
    List<NotificationEntity> findByUser_IdOrderByCreatedDateDesc(Long userId);
    List<NotificationEntity> findByUser_IdAndStatus(Long userId, Long status);
}
