package com.javaweb.security.filters;

import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.MyUserDetail;
import com.javaweb.security.utils.JwtTokenUtil;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.data.util.Pair;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@RequiredArgsConstructor
public class JwtTokenFilter extends OncePerRequestFilter {
    private final UserDetailsService userDetailsService;
    private final JwtTokenUtil jwtTokenUtil;

    private boolean isByPassToken(@NonNull HttpServletRequest request) {
        String path = request.getServletPath();
        String method = request.getMethod();

        // 1. Cho phép các thư mục chứa tài nguyên tĩnh (Dùng startsWith)
        if (path.startsWith("/static/") || path.startsWith("/css/") ||
                path.startsWith("/js/") || path.startsWith("/web/") ||
                path.startsWith("/template/") || path.startsWith("/resource/")) {
            return true;
        }

        // 2. Cho phép các trang công khai CỐ ĐỊNH (Dùng equals để chính xác)
        List<String> publicPages = Arrays.asList(
                "/", "/trang-chu", "/login", "/registers",
                "/san-pham", "/gioi-thieu", "/tin-tuc", "/lien-he"
        );

        if (method.equals("GET") && publicPages.contains(path)) {
            return true;
        }

        // 3. Cho phép các API POST công khai
        List<String> publicApis = Arrays.asList("/login", "/registers", "/api/users/login");
        if (method.equals("POST") && publicApis.contains(path)) {
            return true;
        }

        return false;
    }


    @Override
    protected void doFilterInternal(@NonNull HttpServletRequest request,
                                   @NonNull HttpServletResponse response,
                                   @NonNull FilterChain filterChain) throws ServletException, IOException {
        String path = request.getServletPath();
        if (path.equals("/logout")) {
            filterChain.doFilter(request, response);
            return;
        }

        try {
            String token = null;

            String authHeader = request.getHeader("Authorization");
            if (authHeader != null && authHeader.startsWith("Bearer ")) {
                token = authHeader.substring(7).trim();
                System.out.println("Token nhận được từ Header: " + token);
            }

            // 1. Luôn cố gắng lấy Token từ Cookie
            if (token == null && request.getCookies() != null) {
                for (Cookie cookie : request.getCookies()) {
                    if (cookie.getName().equals("JWT")) {
                        token = cookie.getValue();
                        System.out.println("Token nhận được từ Cookie: " + token);
                        break;
                    }
                }
            }

            // 2. Nếu có token, hãy nạp User vào hệ thống
            if (token != null) {
                final String userName = jwtTokenUtil.extractUsername(token);
                if (userName != null && SecurityContextHolder.getContext().getAuthentication() == null) {
                    MyUserDetail user = (MyUserDetail) userDetailsService.loadUserByUsername(userName);
                    if (jwtTokenUtil.validateToken(token, user)) {
                        UsernamePasswordAuthenticationToken authentication = new
                                UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
                        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                        SecurityContextHolder.getContext().setAuthentication(authentication);
                    }
                }
            }

            // 3. Cho dù có token hay không, hãy cho request đi tiếp
            // Spring Security sẽ dựa vào cấu hình permitAll() ở WebSecurityConfig để quyết định chặn hay mở
            filterChain.doFilter(request, response);

        } catch (Exception e) {
            System.out.println("JWT Filter Error: " + e.getMessage());
            filterChain.doFilter(request, response);
        }
    }
}
