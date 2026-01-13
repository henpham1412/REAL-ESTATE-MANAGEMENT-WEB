package com.javaweb.config;

import org.springframework.boot.web.servlet.ServletContextInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.SessionTrackingMode;
import java.util.Collections;

/**
 * Cấu hình session để chỉ sử dụng COOKIE, không append jsessionid vào URL
 * Fix lỗi: sau logout, static resources (CSS/JS) bị 500 error vì URL chứa ;jsessionid
 */
@Configuration
public class SessionConfig {

    @Bean
    public ServletContextInitializer servletContextInitializer() {
        return servletContext -> {
            // Chỉ sử dụng COOKIE để track session, không URL rewriting
            servletContext.setSessionTrackingModes(Collections.singleton(SessionTrackingMode.COOKIE));
        };
    }
}
