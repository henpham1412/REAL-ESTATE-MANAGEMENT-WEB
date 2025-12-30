package com.javaweb.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestWebSocketController {
    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;
    @GetMapping("/api/test-notify")
    public String test() {
        String msg = "Chào mọi người! Hệ thống sắp bảo trì lúc " + java.time.LocalTime.now();
        // Gửi tin nhắn đến tất cả những ai đang subscribe kênh /topic/news
        simpMessagingTemplate.convertAndSend("/topic/news", msg);
        return "Đã gửi thành công tin nhắn!";
    }
}
