package com.javaweb.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

    // Đọc từ application.properties hoặc environment variable
    // Nếu không có thì dùng giá trị mặc định cho local development
    @Value("${app.upload.dir:D:/spring/Project-spring-boot-web/images}")
    private String uploadDir;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Khi web gọi /images/**, Spring sẽ tìm file trong thư mục uploadDir
        registry.addResourceHandler("/images/**")
                .addResourceLocations("file:///" + uploadDir + "/");
    }
}
