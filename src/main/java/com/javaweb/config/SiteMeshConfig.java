package com.javaweb.config;

import com.opensymphony.module.sitemesh.filter.PageFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * SiteMesh Configuration for Spring Boot
 * Đăng ký SiteMesh PageFilter như một Spring Bean để hoạt động với embedded Tomcat
 */
@Configuration
public class SiteMeshConfig {

    @Bean
    public FilterRegistrationBean<PageFilter> siteMeshFilter() {
        FilterRegistrationBean<PageFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new PageFilter());
        registrationBean.addUrlPatterns("/*");
        registrationBean.setName("sitemesh");
        // Đặt order thấp để chạy trước các filter khác (sau encoding filter)
        registrationBean.setOrder(2);
        registrationBean.setAsyncSupported(true);
        return registrationBean;
    }
}
