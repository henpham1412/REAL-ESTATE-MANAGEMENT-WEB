<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="/common/taglib.jsp" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Đăng nhập | SkyLand</title>
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
                rel="stylesheet">
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
                    background-color: #f8fafc;
                    padding: 20px;
                    line-height: 1.5;
                }

                .login-wrapper {
                    width: 100%;
                    max-width: 400px;
                }

                .login-card {
                    background: #ffffff;
                    border-radius: 12px;
                    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                    border: 1px solid #e2e8f0;
                }

                .login-header {
                    padding: 32px 32px 24px;
                    text-align: center;
                    border-bottom: 1px solid #f1f5f9;
                }

                .logo-text {
                    font-size: 28px;
                    font-weight: 700;
                    color: #1e293b;
                    margin-bottom: 4px;
                    letter-spacing: -0.5px;
                }

                .logo-subtitle {
                    font-size: 14px;
                    color: #64748b;
                }

                .login-body {
                    padding: 32px;
                }

                .alert-error {
                    background-color: #fef2f2;
                    border: 1px solid #fecaca;
                    color: #dc2626;
                    padding: 12px 16px;
                    border-radius: 8px;
                    margin-bottom: 24px;
                    font-size: 14px;
                }

                .form-group {
                    margin-bottom: 20px;
                }

                .form-label {
                    display: block;
                    font-size: 14px;
                    font-weight: 500;
                    color: #374151;
                    margin-bottom: 6px;
                }

                .form-input {
                    width: 100%;
                    height: 44px;
                    padding: 0 14px;
                    font-size: 15px;
                    font-family: inherit;
                    color: #1e293b;
                    background-color: #ffffff;
                    border: 1px solid #d1d5db;
                    border-radius: 8px;
                    transition: border-color 0.15s ease, box-shadow 0.15s ease;
                }

                .form-input:focus {
                    outline: none;
                    border-color: #3b82f6;
                    box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
                }

                .form-input::placeholder {
                    color: #9ca3af;
                }

                .form-options {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 24px;
                    font-size: 14px;
                }

                .checkbox-wrapper {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    cursor: pointer;
                }

                .checkbox-wrapper input[type="checkbox"] {
                    width: 16px;
                    height: 16px;
                    accent-color: #3b82f6;
                    cursor: pointer;
                }

                .checkbox-wrapper span {
                    color: #4b5563;
                }

                .forgot-link {
                    color: #3b82f6;
                    text-decoration: none;
                    font-weight: 500;
                }

                .forgot-link:hover {
                    text-decoration: underline;
                }

                .btn-login {
                    width: 100%;
                    height: 44px;
                    background-color: #3b82f6;
                    color: #ffffff;
                    border: none;
                    border-radius: 8px;
                    font-size: 15px;
                    font-weight: 600;
                    font-family: inherit;
                    cursor: pointer;
                    transition: background-color 0.15s ease;
                }

                .btn-login:hover {
                    background-color: #2563eb;
                }

                .btn-login:active {
                    background-color: #1d4ed8;
                }

                .login-footer {
                    padding: 16px 32px;
                    text-align: center;
                    background-color: #f8fafc;
                    border-top: 1px solid #f1f5f9;
                    border-radius: 0 0 12px 12px;
                }

                .login-footer p {
                    font-size: 13px;
                    color: #94a3b8;
                }

                @media (max-width: 480px) {

                    .login-header,
                    .login-body {
                        padding: 24px;
                    }

                    .login-footer {
                        padding: 16px 24px;
                    }
                }
            </style>
        </head>

        <body>
            <div class="login-wrapper">
                <div class="login-card">
                    <div class="login-header">
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
                                <input type="text" name="j_username" class="form-input" placeholder="Nhập tên đăng nhập"
                                    required autocomplete="username">
                            </div>

                            <div class="form-group">
                                <label class="form-label">Mật khẩu</label>
                                <input type="password" name="j_password" class="form-input" placeholder="Nhập mật khẩu"
                                    required autocomplete="current-password">
                            </div>

                            <div class="form-options">
                                <label class="checkbox-wrapper">
                                    <input type="checkbox" name="remember">
                                    <span>Ghi nhớ đăng nhập</span>
                                </label>
                                <a href="#" class="forgot-link">Quên mật khẩu?</a>
                            </div>

                            <button type="submit" class="btn-login">Đăng nhập</button>
                        </form>
                    </div>

                    <div class="login-footer">
                        <p>&copy; 2024 SkyLand. All rights reserved.</p>
                    </div>
                </div>
            </div>
        </body>

        </html>