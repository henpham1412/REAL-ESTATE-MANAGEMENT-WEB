<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="/common/taglib.jsp" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Đăng nhập | SkyLand</title>
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
                rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
            <style>
                *,
                *::before,
                *::after {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                body {
                    font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    background: linear-gradient(135deg, #0f0c29 0%, #302b63 50%, #24243e 100%);
                    padding: 20px;
                    line-height: 1.5;
                    position: relative;
                    overflow: hidden;
                }

                /* Animated background particles */
                body::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    bottom: 0;
                    background-image:
                        radial-gradient(2px 2px at 20px 30px, rgba(255, 255, 255, 0.3), transparent),
                        radial-gradient(2px 2px at 40px 70px, rgba(255, 255, 255, 0.2), transparent),
                        radial-gradient(2px 2px at 50px 160px, rgba(255, 255, 255, 0.3), transparent),
                        radial-gradient(2px 2px at 90px 40px, rgba(255, 255, 255, 0.2), transparent),
                        radial-gradient(2px 2px at 130px 80px, rgba(255, 255, 255, 0.3), transparent),
                        radial-gradient(2px 2px at 160px 120px, rgba(255, 255, 255, 0.2), transparent),
                        radial-gradient(2px 2px at 200px 200px, rgba(255, 255, 255, 0.15), transparent),
                        radial-gradient(2px 2px at 250px 50px, rgba(255, 255, 255, 0.25), transparent),
                        radial-gradient(2px 2px at 300px 150px, rgba(255, 255, 255, 0.2), transparent);
                    background-repeat: repeat;
                    background-size: 350px 350px;
                    animation: twinkle 8s ease-in-out infinite;
                    pointer-events: none;
                }

                @keyframes twinkle {

                    0%,
                    100% {
                        opacity: 0.5;
                    }

                    50% {
                        opacity: 1;
                    }
                }

                /* Floating orbs */
                .orb {
                    position: absolute;
                    border-radius: 50%;
                    filter: blur(60px);
                    opacity: 0.5;
                    animation: float 15s ease-in-out infinite;
                }

                .orb-1 {
                    width: 400px;
                    height: 400px;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    top: -100px;
                    right: -100px;
                    animation-delay: 0s;
                }

                .orb-2 {
                    width: 300px;
                    height: 300px;
                    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
                    bottom: -50px;
                    left: -50px;
                    animation-delay: -5s;
                }

                .orb-3 {
                    width: 200px;
                    height: 200px;
                    background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    animation-delay: -10s;
                }

                @keyframes float {

                    0%,
                    100% {
                        transform: translateY(0) rotate(0deg);
                    }

                    33% {
                        transform: translateY(-20px) rotate(5deg);
                    }

                    66% {
                        transform: translateY(10px) rotate(-5deg);
                    }
                }

                .login-wrapper {
                    width: 100%;
                    max-width: 420px;
                    position: relative;
                    z-index: 10;
                    animation: slideUp 0.6s ease-out;
                }

                @keyframes slideUp {
                    from {
                        opacity: 0;
                        transform: translateY(30px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                .login-card {
                    background: rgba(255, 255, 255, 0.1);
                    backdrop-filter: blur(20px);
                    -webkit-backdrop-filter: blur(20px);
                    border-radius: 24px;
                    box-shadow:
                        0 25px 50px -12px rgba(0, 0, 0, 0.5),
                        0 0 0 1px rgba(255, 255, 255, 0.1),
                        inset 0 1px 0 0 rgba(255, 255, 255, 0.2);
                    border: 1px solid rgba(255, 255, 255, 0.15);
                    overflow: hidden;
                }

                .login-header {
                    padding: 40px 40px 30px;
                    text-align: center;
                    position: relative;
                }

                .logo-icon {
                    width: 70px;
                    height: 70px;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    border-radius: 20px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0 auto 20px;
                    box-shadow: 0 10px 30px -5px rgba(102, 126, 234, 0.5);
                    animation: pulse 2s ease-in-out infinite;
                }

                @keyframes pulse {

                    0%,
                    100% {
                        box-shadow: 0 10px 30px -5px rgba(102, 126, 234, 0.5);
                    }

                    50% {
                        box-shadow: 0 15px 40px -5px rgba(102, 126, 234, 0.7);
                    }
                }

                .logo-icon i {
                    font-size: 32px;
                    color: #fff;
                }

                .logo-text {
                    font-size: 32px;
                    font-weight: 800;
                    background: linear-gradient(135deg, #fff 0%, #e0e0e0 100%);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    background-clip: text;
                    margin-bottom: 8px;
                    letter-spacing: -0.5px;
                }

                .logo-subtitle {
                    font-size: 14px;
                    color: rgba(255, 255, 255, 0.6);
                    font-weight: 500;
                }

                .login-body {
                    padding: 10px 40px 40px;
                }

                .alert-error {
                    background: rgba(239, 68, 68, 0.2);
                    border: 1px solid rgba(239, 68, 68, 0.3);
                    color: #fca5a5;
                    padding: 14px 18px;
                    border-radius: 12px;
                    margin-bottom: 24px;
                    font-size: 14px;
                    display: flex;
                    align-items: center;
                    gap: 12px;
                    backdrop-filter: blur(10px);
                }

                .alert-error::before {
                    content: '\f071';
                    font-family: 'Font Awesome 6 Free';
                    font-weight: 900;
                    font-size: 16px;
                }

                .form-group {
                    margin-bottom: 22px;
                }

                .form-label {
                    display: block;
                    font-size: 13px;
                    font-weight: 600;
                    color: rgba(255, 255, 255, 0.8);
                    margin-bottom: 10px;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                .input-wrapper {
                    position: relative;
                }

                .input-wrapper i {
                    position: absolute;
                    left: 18px;
                    top: 50%;
                    transform: translateY(-50%);
                    color: rgba(255, 255, 255, 0.4);
                    font-size: 16px;
                    transition: color 0.3s ease;
                }

                .form-input {
                    width: 100%;
                    height: 54px;
                    padding: 0 18px 0 50px;
                    font-size: 15px;
                    font-family: inherit;
                    color: #fff;
                    background: rgba(255, 255, 255, 0.08);
                    border: 2px solid rgba(255, 255, 255, 0.1);
                    border-radius: 14px;
                    transition: all 0.3s ease;
                }

                .form-input:focus {
                    outline: none;
                    border-color: rgba(102, 126, 234, 0.8);
                    background: rgba(255, 255, 255, 0.12);
                    box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.2);
                }

                .form-input:focus+i,
                .input-wrapper:hover i {
                    color: rgba(255, 255, 255, 0.8);
                }

                .form-input::placeholder {
                    color: rgba(255, 255, 255, 0.35);
                }

                .form-options {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 28px;
                    font-size: 14px;
                }

                .checkbox-wrapper {
                    display: flex;
                    align-items: center;
                    gap: 10px;
                    cursor: pointer;
                    color: rgba(255, 255, 255, 0.7);
                    transition: color 0.3s ease;
                }

                .checkbox-wrapper:hover {
                    color: rgba(255, 255, 255, 0.9);
                }

                .checkbox-wrapper input[type="checkbox"] {
                    width: 18px;
                    height: 18px;
                    accent-color: #667eea;
                    cursor: pointer;
                    border-radius: 4px;
                }

                .forgot-link {
                    color: rgba(255, 255, 255, 0.7);
                    text-decoration: none;
                    font-weight: 500;
                    transition: all 0.3s ease;
                    position: relative;
                }

                .forgot-link::after {
                    content: '';
                    position: absolute;
                    bottom: -2px;
                    left: 0;
                    width: 0;
                    height: 2px;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    transition: width 0.3s ease;
                }

                .forgot-link:hover {
                    color: #fff;
                }

                .forgot-link:hover::after {
                    width: 100%;
                }

                .btn-login {
                    width: 100%;
                    height: 54px;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    color: #ffffff;
                    border: none;
                    border-radius: 14px;
                    font-size: 16px;
                    font-weight: 700;
                    font-family: inherit;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    position: relative;
                    overflow: hidden;
                }

                .btn-login::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: -100%;
                    width: 100%;
                    height: 100%;
                    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
                    transition: left 0.5s ease;
                }

                .btn-login:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 15px 35px -5px rgba(102, 126, 234, 0.5);
                }

                .btn-login:hover::before {
                    left: 100%;
                }

                .btn-login:active {
                    transform: translateY(0);
                }

                .login-footer {
                    padding: 20px 40px;
                    text-align: center;
                    background: rgba(0, 0, 0, 0.1);
                    border-top: 1px solid rgba(255, 255, 255, 0.05);
                }

                .login-footer p {
                    font-size: 13px;
                    color: rgba(255, 255, 255, 0.4);
                }

                /* Responsive */
                @media (max-width: 480px) {
                    .login-header {
                        padding: 30px 24px 20px;
                    }

                    .login-body {
                        padding: 10px 24px 30px;
                    }

                    .login-footer {
                        padding: 16px 24px;
                    }

                    .logo-icon {
                        width: 60px;
                        height: 60px;
                    }

                    .logo-icon i {
                        font-size: 26px;
                    }

                    .logo-text {
                        font-size: 26px;
                    }

                    .form-input {
                        height: 50px;
                    }

                    .btn-login {
                        height: 50px;
                        font-size: 15px;
                    }
                }
            </style>
        </head>

        <body>
            <!-- Floating orbs for background effect -->
            <div class="orb orb-1"></div>
            <div class="orb orb-2"></div>
            <div class="orb orb-3"></div>

            <div class="login-wrapper">
                <div class="login-card">
                    <div class="login-header">
                        <div class="logo-icon">
                            <i class="fas fa-building"></i>
                        </div>
                        <div class="logo-text">SkyLand</div>
                        <div class="logo-subtitle">Hệ thống quản lý bất động sản</div>
                    </div>

                    <div class="login-body">
                        <c:if test="${param.incorrectAccount != null}">
                            <div class="alert-error">Tên đăng nhập hoặc mật khẩu không đúng</div>
                        </c:if>
                        <c:if test="${param.accessDenied != null}">
                            <div class="alert-error">Bạn không có quyền truy cập</div>
                        </c:if>
                        <c:if test="${param.sessionTimeout != null}">
                            <div class="alert-error">Phiên đăng nhập đã hết hạn</div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
                            <div class="form-group">
                                <label class="form-label">Tên đăng nhập</label>
                                <div class="input-wrapper">
                                    <input type="text" name="j_username" class="form-input"
                                        placeholder="Nhập tên đăng nhập" required autocomplete="username">
                                    <i class="fas fa-user"></i>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Mật khẩu</label>
                                <div class="input-wrapper">
                                    <input type="password" name="j_password" class="form-input"
                                        placeholder="Nhập mật khẩu" required autocomplete="current-password">
                                    <i class="fas fa-lock"></i>
                                </div>
                            </div>

                            <div class="form-options">
                                <label class="checkbox-wrapper">
                                    <input type="checkbox" name="remember">
                                    <span>Ghi nhớ đăng nhập</span>
                                </label>
                                <a href="#" class="forgot-link">Quên mật khẩu?</a>
                            </div>

                            <button type="submit" class="btn-login">
                                <i class="fas fa-sign-in-alt" style="margin-right: 10px;"></i>Đăng nhập
                            </button>
                        </form>
                    </div>

                    <div class="login-footer">
                        <p>&copy; 2024 SkyLand. All rights reserved.</p>
                    </div>
                </div>
            </div>
        </body>

        </html>