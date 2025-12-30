package com.javaweb.controller.web;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
public class GlobalControllerAdvice {
    @ModelAttribute("token")
    public String addTokenModel(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("JWT")) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }
}
