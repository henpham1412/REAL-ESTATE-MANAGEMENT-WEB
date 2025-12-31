package com.javaweb.controller.web;


import com.javaweb.entity.NotificationEntity;
import com.javaweb.model.dto.NotificationDTO;
import com.javaweb.repository.NotificationRepository;
import com.javaweb.security.utils.SecurityUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/notifications")
public class NotificationController {
    @Autowired
    private NotificationRepository notificationRepository;

    @Autowired
    private ModelMapper modelMapper;

    @GetMapping
    public ResponseEntity<?> getMyNotifications() {
        // lấy thông tin user đang đăng nhập từ SecurityContextHolder
        Long userId = SecurityUtils.getPrincipal().getId();

        List<NotificationEntity> list = notificationRepository.findByUser_IdOrderByCreatedDateDesc(userId);

        List<NotificationDTO> dtos = list.stream().map(entity -> {
            NotificationDTO notificationDTO = modelMapper.map(entity, NotificationDTO.class);
            return notificationDTO;
        }).collect(Collectors.toList());

        long unreadCount = dtos.stream().filter(n -> n.getStatus() == 0).count();
        Map<String,Object> map = new HashMap<>();
        map.put("notifications",dtos);
        map.put("unreadCount",unreadCount);
        return ResponseEntity.ok(map);
    }

    @PutMapping("/{id}/read")
    public ResponseEntity<?> markAsRead(@PathVariable("id") Long id){
        NotificationEntity notification = notificationRepository.findById(id).
                orElseThrow(() -> new RuntimeException("Notification not found!"));
        notification.setStatus(1L);
        notificationRepository.save(notification);
        return ResponseEntity.ok("success");
    }

//    @GetMapping("/admin/notification/list")
//    public ModelAndView notificationList() {
//        return new ModelAndView("admin/notification/list");
//    }

    @PutMapping("/read-all")
    public ResponseEntity<?> markAllAsRead() {
        Long userId = SecurityUtils.getPrincipal().getId();

        List<NotificationEntity> unreadNotifications = notificationRepository.findByUser_IdAndStatus(userId, 0L);

        for (NotificationEntity item : unreadNotifications) {
            item.setStatus(1L);
        }
        notificationRepository.saveAll(unreadNotifications);

        return ResponseEntity.ok("Đã đánh dấu đọc tất cả");
    }
}
