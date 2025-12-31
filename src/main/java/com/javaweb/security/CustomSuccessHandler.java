package com.javaweb.security;

import com.javaweb.constant.SystemConstant;
import com.javaweb.model.dto.MyUserDetail;
import com.javaweb.security.utils.JwtTokenUtil;
import com.javaweb.security.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException {
        String targetUrl = determineTargetUrl(authentication);
        if (response.isCommitted()) {
            System.out.println("Can't redirect");
            return;
        }
        MyUserDetail userDetail = (MyUserDetail) authentication.getPrincipal();
        String token = null;
        try {
            token = jwtTokenUtil.generateToken(userDetail);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        //request.getSession().setAttribute("JWT_TOKEN", token);

        Cookie jwtCookie = new Cookie("JWT", token);
        jwtCookie.setHttpOnly(true); // Bảo mật: Không cho JavaScript truy cập Cookie này (chống XSS)
        jwtCookie.setPath("/");      // Cookie có hiệu lực cho toàn bộ website
        jwtCookie.setMaxAge(2592000); // Thời gian sống (30 ngày), khớp với expiration của Token

        response.addCookie(jwtCookie);
        System.out.println("Login thành công cho user: " + userDetail.getUsername());
        System.out.println("Token tạo ra: " + token);
        System.out.println("Redirect về: " + targetUrl);
        redirectStrategy.sendRedirect(request, response, targetUrl);
    }

    public String determineTargetUrl(Authentication authentication) {
        String url = "";
        List<String> roles = SecurityUtils.getAuthorities();
//        if (isUser(roles)) {
//            url = SystemConstant.HOME;
//        } else if (isAdmin(roles)) {
//            url = SystemConstant.ADMIN_HOME;
//        }
//        return url;
        if (isUser(roles)) {
            url = SystemConstant.HOME;
        } else if (isAdmin(roles)) {
            url = SystemConstant.ADMIN_HOME;
        }
        return url;
    }

    public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
        this.redirectStrategy = redirectStrategy;
    }

    public RedirectStrategy getRedirectStrategy() {
        return redirectStrategy;
    }

    private boolean isAdmin(List<String> roles) {
        if (roles.contains(SystemConstant.ADMIN_ROLE) || roles.contains(SystemConstant.MANAGER_ROLE)) {
            return true;
        }
        return false;
    }

    private boolean isUser(List<String> roles) {
        if (roles.contains(SystemConstant.USER_ROLE)) {
            return true;
        }
        return false;
    }
}
