package com.javaweb.config;

import com.javaweb.entity.UserEntity;
import com.javaweb.repository.UserRepository;
import com.javaweb.security.CustomSuccessHandler;
import com.javaweb.security.filters.JwtTokenFilter;
import com.javaweb.security.utils.JwtTokenUtil;
import com.javaweb.service.impl.CustomUserDetailService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import static org.springframework.http.HttpMethod.*;
import static org.springframework.http.HttpMethod.DELETE;
import static org.springframework.http.HttpMethod.GET;
import static org.springframework.http.HttpMethod.POST;
import static org.springframework.http.HttpMethod.PUT;
import org.springframework.security.config.http.SessionCreationPolicy;

import javax.servlet.http.Cookie;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    private final CustomSuccessHandler customSuccessHandler;
    private final CustomUserDetailService customUserDetailService; // Dùng trực tiếp Service của bạn
    private final PasswordEncoder passwordEncoder;
    private final JwtTokenUtil jwtTokenUtil;

    @Bean
    public JwtTokenFilter jwtTokenFilter() {
        return new JwtTokenFilter(customUserDetailService, jwtTokenUtil);
    }

    @Bean
    public CharacterEncodingFilter characterEncodingFilter() {
        CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        return filter;
    }

    @Bean
    public FilterRegistrationBean<JwtTokenFilter> jwtFilterRegistration(JwtTokenFilter filter) {
        FilterRegistrationBean<JwtTokenFilter> registration = new FilterRegistrationBean<>(filter);
        registration.setEnabled(false);
        return registration;
    }

    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(customUserDetailService); // Gán service đã viết sẵn vào đây
        authProvider.setPasswordEncoder(passwordEncoder);
        return authProvider;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
        encodingFilter.setEncoding("UTF-8");
        encodingFilter.setForceEncoding(true);
        http.addFilterBefore(encodingFilter, org.springframework.security.web.authentication.logout.LogoutFilter.class);
        http.csrf().disable()
                // 2. SỬA LỖI ĐĂNG NHẬP: Thêm JWT Filter trước UsernamePasswordAuthenticationFilter
                .addFilterBefore(jwtTokenFilter(), UsernamePasswordAuthenticationFilter.class)

                .authorizeRequests()
                // Cho phép tất cả tài nguyên và trang công khai
                .antMatchers("/", "/trang-chu", "/login", "/registers",
                        "/san-pham", "/gioi-thieu", "/tin-tuc", "/lien-he").permitAll()
                .antMatchers("/resource/**", "/static/**",
                        "/css/**", "/js/**", "/template/**", "/web/**", "/api/**").permitAll()
                .antMatchers("/admin/building-edit","/admin/user-edit-{id}").hasRole("MANAGER")
                .antMatchers("/admin/**").hasAnyRole("MANAGER","STAFF","ADMIN")
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/j_spring_security_check") // Khớp với form login của bạn
                .usernameParameter("j_username")
                .passwordParameter("j_password")
                .successHandler(customSuccessHandler) // Nơi tạo Cookie JWT
                .failureUrl("/login?incorrectAccount")
                .permitAll()
                .and()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .logout()
                .logoutUrl("/logout")
                .addLogoutHandler((request, response, authentication) -> {
                    // Ghi đè Cookie JWT bằng một Cookie rỗng có Max-Age = 0 để trình duyệt xóa ngay lập tức
                    Cookie cookie = new Cookie("JWT", null);
                    cookie.setPath("/");
                    cookie.setHttpOnly(true);
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                })
                .logoutSuccessUrl("/trang-chu") // Sau khi logout thì về trang chủ
                .deleteCookies("JWT", "JSESSIONID")
                .invalidateHttpSession(true);// Chế độ Stateless cho JWT
    }
}
