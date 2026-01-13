<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="/common/taglib.jsp" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Đăng nhập | SkyLand</title>
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <!-- Google Fonts -->
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
                rel="stylesheet">

            <style>
                * {
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
                    /* Gradient xanh dương dịu nhẹ */
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #6B8DD6 100%);
                    padding: 20px;
                }

                .login-container {
                    width: 100%;
                    max-width: 420px;
                }

                .login-card {
                    background: #ffffff;
                    border-radius: 16px;
                    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
                    overflow: hidden;
                }

                .login-header {
                    /* Gradient header xanh dịu */
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    padding: 40px 30px;
                    text-align: center;
                    color: white;
                }

                .logo-icon {
                    width: 80px;
                    height: 80px;
                    background: rgba(255, 255, 255, 0.2);
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0 auto 20px;
                    font-size: 36px;
                    backdrop-filter: blur(10px);
                }

                .logo-icon svg {
                    width: 40px;
                    height: 40px;
                    fill: white;
                }

                .login-header h2 {
                    font-size: 28px;
                    font-weight: 700;
                    margin-bottom: 8px;
                    letter-spacing: 1px;
                }

                .login-header p {
                    font-size: 14px;
                    opacity: 0.9;
                    font-weight: 400;
                }

                .login-body {
                    padding: 35px;
                }

                .alert-error {
                    background: #fef2f2;
                    border: 1px solid #fecaca;
                    color: #dc2626;
                    border-radius: 10px;
                    padding: 14px 16px;
                    margin-bottom: 24px;
                    font-size: 14px;
                    display: flex;
                    align-items: center;
                    gap: 12px;
                }

                .alert-error svg {
                    width: 20px;
                    height: 20px;
                    flex-shrink: 0;
                }

                .form-group {
                    margin-bottom: 24px;
                }

                .form-group label {
                    display: block;
                    color: #374151;
                    font-weight: 600;
                    font-size: 14px;
                    margin-bottom: 8px;
                }

                .input-wrapper {
                    position: relative;
                }

                .input-wrapper svg {
                    position: absolute;
                    left: 16px;
                    top: 50%;
                    transform: translateY(-50%);
                    width: 20px;
                    height: 20px;
                    fill: #9ca3af;
                    transition: fill 0.3s;
                }

                .form-control {
                    width: 100%;
                    height: 52px;
                    padding: 14px 16px 14px 50px;
                    border: 2px solid #e5e7eb;
                    border-radius: 12px;
                    font-size: 15px;
                    font-family: inherit;
                    transition: all 0.3s ease;
                    background: #f9fafb;
                }

                .form-control:focus {
                    outline: none;
                    border-color: #667eea;
                    background: white;
                    box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
                }

                .form-control:focus+svg {
                    fill: #667eea;
                }

                .form-control::placeholder {
                    color: #9ca3af;
                }

                .remember-row {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    margin-bottom: 28px;
                }

                .remember-check {
                    display: flex;
                    align-items: center;
                    gap: 10px;
                    cursor: pointer;
                }

                .remember-check input[type="checkbox"] {
                    width: 18px;
                    height: 18px;
                    accent-color: #667eea;
                    cursor: pointer;
                }

                .remember-check span {
                    color: #6b7280;
                    font-size: 14px;
                }

                .forgot-link {
                    color: #667eea;
                    font-size: 14px;
                    font-weight: 500;
                    text-decoration: none;
                    transition: color 0.3s;
                }

                .forgot-link:hover {
                    color: #5a67d8;
                    text-decoration: underline;
                }

                .btn-login {
                    width: 100%;
                    height: 52px;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    border: none;
                    border-radius: 12px;
                    color: white;
                    font-size: 16px;
                    font-weight: 600;
                    font-family: inherit;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    gap: 10px;
                }

                .btn-login:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 10px 20px rgba(102, 126, 234, 0.35);
                }

                .btn-login:active {
                    transform: translateY(0);
                }

                .btn-login svg {
                    width: 20px;
                    height: 20px;
                    fill: white;
                }

                .login-footer {
                    padding: 24px 35px;
                    background: #f9fafb;
                    text-align: center;
                    border-top: 1px solid #e5e7eb;
                }

                .login-footer p {
                    color: #6b7280;
                    font-size: 14px;
                    margin-bottom: 16px;
                }

                .social-login {
                    display: flex;
                    justify-content: center;
                    gap: 12px;
                }

                .social-btn {
                    width: 44px;
                    height: 44px;
                    border-radius: 10px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    text-decoration: none;
                    transition: transform 0.3s, box-shadow 0.3s;
                }

                .social-btn:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
                }

                .social-btn svg {
                    width: 22px;
                    height: 22px;
                    fill: white;
                }

                .social-btn.facebook {
                    background: #1877f2;
                }

                .social-btn.google {
                    background: #ea4335;
                }

                .social-btn.twitter {
                    background: #1da1f2;
                }

                /* Responsive */
                @media (max-width: 480px) {
                    .login-header {
                        padding: 30px 20px;
                    }

                    .login-body {
                        padding: 25px 20px;
                    }

                    .login-footer {
                        padding: 20px;
                    }
                }
            </style>
        </head>

        <body>
            <div class="login-container">
                <div class="login-card">

                    <!-- Header -->
                    <div class="login-header">
                        <div class="logo-icon">
                            <!-- Building icon SVG -->
                            <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M19 2H9c-1.103 0-2 .897-2 2v5.586l-4.707 4.707A1 1 0 0 0 3 16v5a1 1 0 0 0 1 1h16a1 1 0 0 0 1-1V4c0-1.103-.897-2-2-2zm-8 18H5v-5.586l3-3 3 3V20zm8 0h-6v-4a.999.999 0 0 0-.293-.707L9 11.586V4h10v16z" />
                                <path d="M11 6h2v2h-2zm4 0h2v2h-2zm0 4.031h2v2h-2zm0 4h2v2h-2zm-8 0h2v2H7z" />
                            </svg>
                        </div>
                        <h2>SkyLand</h2>
                        <p>Hệ thống quản lý bất động sản</p>
                    </div>

                    <!-- Body -->
                    <div class="login-body">

                        <!-- Error messages -->
                        <c:if test="${param.incorrectAccount != null}">
                            <div class="alert-error">
                                <svg viewBox="0 0 20 20" fill="currentColor">
                                    <path fill-rule="evenodd"
                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z"
                                        clip-rule="evenodd" />
                                </svg>
                                <span>Tên đăng nhập hoặc mật khẩu không đúng</span>
                            </div>
                        </c:if>

                        <c:if test="${param.accessDenied != null}">
                            <div class="alert-error">
                                <svg viewBox="0 0 20 20" fill="currentColor">
                                    <path fill-rule="evenodd"
                                        d="M13.477 14.89A6 6 0 015.11 6.524l8.367 8.368zm1.414-1.414L6.524 5.11a6 6 0 018.367 8.367zM18 10a8 8 0 11-16 0 8 8 0 0116 0z"
                                        clip-rule="evenodd" />
                                </svg>
                                <span>Bạn không có quyền truy cập</span>
                            </div>
                        </c:if>

                        <c:if test="${param.sessionTimeout != null}">
                            <div class="alert-error">
                                <svg viewBox="0 0 20 20" fill="currentColor">
                                    <path fill-rule="evenodd"
                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z"
                                        clip-rule="evenodd" />
                                </svg>
                                <span>Phiên đăng nhập đã hết hạn</span>
                            </div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">

                            <div class="form-group">
                                <label>Tên đăng nhập</label>
                                <div class="input-wrapper">
                                    <input type="text" name="j_username" class="form-control"
                                        placeholder="Nhập tên đăng nhập" required>
                                    <!-- User icon -->
                                    <svg viewBox="0 0 20 20" fill="currentColor">
                                        <path fill-rule="evenodd"
                                            d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z"
                                            clip-rule="evenodd" />
                                    </svg>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Mật khẩu</label>
                                <div class="input-wrapper">
                                    <input type="password" name="j_password" class="form-control"
                                        placeholder="Nhập mật khẩu" required>
                                    <!-- Lock icon -->
                                    <svg viewBox="0 0 20 20" fill="currentColor">
                                        <path fill-rule="evenodd"
                                            d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z"
                                            clip-rule="evenodd" />
                                    </svg>
                                </div>
                            </div>

                            <div class="remember-row">
                                <label class="remember-check">
                                    <input type="checkbox" name="remember">
                                    <span>Ghi nhớ đăng nhập</span>
                                </label>
                                <a href="#" class="forgot-link">Quên mật khẩu?</a>
                            </div>

                            <button type="submit" class="btn-login">
                                <!-- Login icon -->
                                <svg viewBox="0 0 20 20" fill="currentColor">
                                    <path fill-rule="evenodd"
                                        d="M3 3a1 1 0 011 1v12a1 1 0 11-2 0V4a1 1 0 011-1zm7.707 3.293a1 1 0 010 1.414L9.414 9H17a1 1 0 110 2H9.414l1.293 1.293a1 1 0 01-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0z"
                                        clip-rule="evenodd" />
                                </svg>
                                Đăng nhập
                            </button>

                        </form>
                    </div>

                    <!-- Footer -->
                    <div class="login-footer">
                        <p>Hoặc đăng nhập bằng</p>
                        <div class="social-login">
                            <a href="#" class="social-btn facebook">
                                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z" />
                                </svg>
                            </a>
                            <a href="#" class="social-btn google">
                                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M12.48 10.92v3.28h7.84c-.24 1.84-.853 3.187-1.787 4.133-1.147 1.147-2.933 2.4-6.053 2.4-4.827 0-8.6-3.893-8.6-8.72s3.773-8.72 8.6-8.72c2.6 0 4.507 1.027 5.907 2.347l2.307-2.307C18.747 1.44 16.133 0 12.48 0 5.867 0 .307 5.387.307 12s5.56 12 12.173 12c3.573 0 6.267-1.173 8.373-3.36 2.16-2.16 2.84-5.213 2.84-7.667 0-.76-.053-1.467-.173-2.053H12.48z" />
                                </svg>
                            </a>
                            <a href="#" class="social-btn twitter">
                                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z" />
                                </svg>
                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </body>

        </html>