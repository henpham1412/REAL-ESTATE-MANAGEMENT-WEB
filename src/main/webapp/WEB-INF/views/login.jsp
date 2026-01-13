<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="/common/taglib.jsp" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Đăng nhập | SkyLand</title>
            <!-- Bootstrap 5 CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <!-- Font Awesome -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
            <!-- Google Fonts -->
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
                rel="stylesheet">

            <style>
                * {
                    font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
                }

                body {
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    /* Soft gradient - neutral, elegant */
                    background: linear-gradient(135deg, #f5f7fa 0%, #e4e8ec 100%);
                    padding: 20px;
                }

                .login-container {
                    width: 100%;
                    max-width: 420px;
                }

                .login-card {
                    background: #ffffff;
                    border-radius: 16px;
                    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
                    overflow: hidden;
                }

                .login-header {
                    background: linear-gradient(135deg, #4a90a4 0%, #357abd 100%);
                    padding: 40px 30px;
                    text-align: center;
                    color: white;
                }

                .logo-icon {
                    width: 70px;
                    height: 70px;
                    background: rgba(255, 255, 255, 0.2);
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0 auto 16px;
                    font-size: 28px;
                }

                .login-header h1 {
                    font-size: 28px;
                    font-weight: 700;
                    margin: 0 0 8px 0;
                    letter-spacing: 0.5px;
                }

                .login-header p {
                    font-size: 14px;
                    opacity: 0.9;
                    margin: 0;
                }

                .login-body {
                    padding: 35px;
                }

                .alert-danger {
                    background: #fef2f2;
                    border: 1px solid #fecaca;
                    color: #dc2626;
                    border-radius: 10px;
                    padding: 14px 16px;
                    margin-bottom: 24px;
                    font-size: 14px;
                }

                .form-group {
                    margin-bottom: 22px;
                }

                .form-group label {
                    display: block;
                    color: #374151;
                    font-weight: 600;
                    font-size: 14px;
                    margin-bottom: 8px;
                }

                .input-group {
                    position: relative;
                }

                .input-group .input-icon {
                    position: absolute;
                    left: 16px;
                    top: 50%;
                    transform: translateY(-50%);
                    color: #9ca3af;
                    font-size: 16px;
                    z-index: 10;
                }

                .form-control {
                    height: 50px;
                    padding: 12px 16px 12px 48px;
                    border: 2px solid #e5e7eb;
                    border-radius: 10px;
                    font-size: 15px;
                    transition: all 0.2s ease;
                    background: #f9fafb;
                }

                .form-control:focus {
                    outline: none;
                    border-color: #4a90a4;
                    background: #fff;
                    box-shadow: 0 0 0 4px rgba(74, 144, 164, 0.1);
                }

                .form-control::placeholder {
                    color: #9ca3af;
                }

                .remember-row {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 24px;
                }

                .form-check-input:checked {
                    background-color: #4a90a4;
                    border-color: #4a90a4;
                }

                .form-check-label {
                    color: #6b7280;
                    font-size: 14px;
                    cursor: pointer;
                }

                .forgot-link {
                    color: #4a90a4;
                    font-size: 14px;
                    text-decoration: none;
                    font-weight: 500;
                }

                .forgot-link:hover {
                    color: #357abd;
                    text-decoration: underline;
                }

                .btn-login {
                    width: 100%;
                    height: 50px;
                    background: linear-gradient(135deg, #4a90a4 0%, #357abd 100%);
                    border: none;
                    border-radius: 10px;
                    color: white;
                    font-size: 16px;
                    font-weight: 600;
                    cursor: pointer;
                    transition: all 0.2s ease;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    gap: 10px;
                }

                .btn-login:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 8px 20px rgba(74, 144, 164, 0.3);
                }

                .login-footer {
                    padding: 20px 35px;
                    background: #f9fafb;
                    text-align: center;
                    border-top: 1px solid #e5e7eb;
                }

                .login-footer p {
                    color: #6b7280;
                    font-size: 13px;
                    margin: 0;
                }

                /* Responsive */
                @media (max-width: 480px) {
                    .login-header {
                        padding: 30px 20px;
                    }

                    .login-body {
                        padding: 25px 20px;
                    }

                    .login-header h1 {
                        font-size: 24px;
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
                            <i class="fas fa-building"></i>
                        </div>
                        <h1>SkyLand</h1>
                        <p>Hệ thống quản lý bất động sản</p>
                    </div>

                    <!-- Body -->
                    <div class="login-body">
                        <!-- Error Messages -->
                        <c:if test="${param.incorrectAccount != null}">
                            <div class="alert alert-danger">
                                <i class="fas fa-exclamation-circle me-2"></i>
                                Tên đăng nhập hoặc mật khẩu không đúng
                            </div>
                        </c:if>
                        <c:if test="${param.accessDenied != null}">
                            <div class="alert alert-danger">
                                <i class="fas fa-ban me-2"></i>
                                Bạn không có quyền truy cập
                            </div>
                        </c:if>
                        <c:if test="${param.sessionTimeout != null}">
                            <div class="alert alert-danger">
                                <i class="fas fa-clock me-2"></i>
                                Phiên đăng nhập đã hết hạn
                            </div>
                        </c:if>

                        <!-- Login Form -->
                        <form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
                            <div class="form-group">
                                <label for="username">Tên đăng nhập</label>
                                <div class="input-group">
                                    <i class="fas fa-user input-icon"></i>
                                    <input type="text" id="username" name="j_username" class="form-control"
                                        placeholder="Nhập tên đăng nhập" required autocomplete="username">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="password">Mật khẩu</label>
                                <div class="input-group">
                                    <i class="fas fa-lock input-icon"></i>
                                    <input type="password" id="password" name="j_password" class="form-control"
                                        placeholder="Nhập mật khẩu" required autocomplete="current-password">
                                </div>
                            </div>

                            <div class="remember-row">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="remember" name="remember">
                                    <label class="form-check-label" for="remember">Ghi nhớ đăng nhập</label>
                                </div>
                                <a href="#" class="forgot-link">Quên mật khẩu?</a>
                            </div>

                            <button type="submit" class="btn-login">
                                <i class="fas fa-sign-in-alt"></i>
                                Đăng nhập
                            </button>
                        </form>
                    </div>

                    <!-- Footer -->
                    <div class="login-footer">
                        <p>&copy; 2024 SkyLand. All rights reserved.</p>
                    </div>
                </div>
            </div>

            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>