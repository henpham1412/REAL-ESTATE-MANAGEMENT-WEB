package com.javaweb.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class NotificationControllerTest {

    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    // API này dùng để test gửi tin nhắn tới tất cả mọi người
    @GetMapping("/api/test-broadcast")
    public String sendTest(@RequestParam String message) {
        // Gửi nội dung tin nhắn tới channel /topic/news
        messagingTemplate.convertAndSend("/topic/news", message);
        return "Đã gửi thông báo: " + message;
    }

    @GetMapping("/api/test-private")
    public String testPrivate(@RequestParam String username, @RequestParam String message) {
        // username: tên đăng nhập của người nhận (ví dụ: "nguyenvana")
        // destination: đường dẫn con (Spring sẽ tự thêm tiền tố /user/username/ phía trước)
        messagingTemplate.convertAndSendToUser(username, "/queue/notifications", message);

        return "Đã gửi tin nhắn riêng cho " + username;
    }
}
