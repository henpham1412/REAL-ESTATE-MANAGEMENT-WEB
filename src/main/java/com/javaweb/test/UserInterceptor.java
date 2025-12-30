package com.javaweb.test;

import com.javaweb.model.dto.MyUserDetail;
import com.javaweb.security.utils.JwtTokenUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.messaging.support.MessageHeaderAccessor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class UserInterceptor implements ChannelInterceptor {
    private final JwtTokenUtil jwtTokenUtil;
    private final UserDetailsService userDetailsService;

    @Override
    public Message<?> preSend(Message<?> message, MessageChannel channel) {
        StompHeaderAccessor accessor = MessageHeaderAccessor.getAccessor(message, StompHeaderAccessor.class);
        if (StompCommand.CONNECT.equals(accessor.getCommand())) {
            String token = accessor.getFirstNativeHeader("Authorization");
            if (token != null && token.startsWith("Bearer ")) {
                token = token.substring(7);
                String username = jwtTokenUtil.extractUsername(token);
                if (username != null) {
                    MyUserDetail userDetail = (MyUserDetail) userDetailsService.loadUserByUsername(username);
                    if (jwtTokenUtil.validateToken(token, userDetail)) {
                        UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(userDetail, null, userDetail.getAuthorities());
                        // Gắn User vào kết nối WebSocket này
                        accessor.setUser(auth);
                    }
                }
            }
        }
        return message;
    }
}
