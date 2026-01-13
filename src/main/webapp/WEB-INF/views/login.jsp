<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="/common/taglib.jsp" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Đăng nhập | SkyLand</title>
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.min.css">

            <!-- Font Awesome for icons -->
            <link rel="stylesheet"
                href="${pageContext.request.contextPath}/admin/font-awesome/4.5.0/css/font-awesome.min.css">

            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                body {
                    font-family: 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    background: linear-gradient(135deg, #1abc9c 0%, #16a085 50%, #27ae60 100%);
                    background-size: 400% 400%;
                    animation: gradientBG 15s ease infinite;
                }

                @keyframes gradientBG {
                    0% {
                        background-position: 0% 50%;
                    }

                    50% {
                        background-position: 100% 50%;
                    }

                    100% {
                        background-position: 0% 50%;
                    }
                }

                .login-container {
                    width: 100%;
                    max-width: 420px;
                    padding: 20px;
                }

                .login-card {
                    background: rgba(255, 255, 255, 0.95);
                    border-radius: 20px;
                    box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15),
                        0 0 0 1px rgba(255, 255, 255, 0.3);
                    overflow: hidden;
                    backdrop-filter: blur(10px);
                    animation: slideUp 0.5s ease;
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

                .login-header {
                    background: linear-gradient(135deg, #2ecc71, #27ae60);
                    padding: 35px 30px;
                    text-align: center;
                    color: white;
                }

                .login-header .logo-icon {
                    width: 70px;
                    height: 70px;
                    background: rgba(255, 255, 255, 0.2);
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0 auto 15px;
                    font-size: 32px;
                }

                .login-header h2 {
                    font-size: 26px;
                    font-weight: 700;
                    margin-bottom: 8px;
                    text-transform: uppercase;
                    letter-spacing: 2px;
                }

                .login-header p {
                    font-size: 14px;
                    opacity: 0.9;
                }

                .login-body {
                    padding: 35px;
                }

                .alert-danger {
                    background: #fff5f5;
                    border: 1px solid #feb2b2;
                    color: #c53030;
                    border-radius: 10px;
                    padding: 12px 15px;
                    margin-bottom: 20px;
                    font-size: 14px;
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                .alert-danger i {
                    color: #e53e3e;
                }

                .form-group {
                    margin-bottom: 22px;
                    position: relative;
                }

                .form-group label {
                    display: block;
                    color: #4a5568;
                    font-weight: 600;
                    font-size: 13px;
                    margin-bottom: 8px;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                .input-wrapper {
                    position: relative;
                }

                .input-wrapper i {
                    position: absolute;
                    left: 15px;
                    top: 50%;
                    transform: translateY(-50%);
                    color: #a0aec0;
                    font-size: 16px;
                    transition: color 0.3s;
                }

                .form-control {
                    width: 100%;
                    height: 50px;
                    padding: 12px 15px 12px 45px;
                    border: 2px solid #e2e8f0;
                    border-radius: 12px;
                    font-size: 15px;
                    transition: all 0.3s ease;
                    background: #f8fafc;
                }

                .form-control:focus {
                    outline: none;
                    border-color: #2ecc71;
                    background: white;
                    box-shadow: 0 0 0 4px rgba(46, 204, 113, 0.1);
                }

                .form-control:focus+i,
                .form-control:focus~i {
                    color: #2ecc71;
                }

                .form-control::placeholder {
                    color: #a0aec0;
                }

                .remember-row {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    margin-bottom: 25px;
                }

                .remember-check {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                }

                .remember-check input[type="checkbox"] {
                    width: 18px;
                    height: 18px;
                    accent-color: #2ecc71;
                    cursor: pointer;
                }

                .remember-check label {
                    color: #718096;
                    font-size: 14px;
                    cursor: pointer;
                    margin: 0;
                }

                .forgot-link {
                    color: #2ecc71;
                    font-size: 14px;
                    font-weight: 500;
                    text-decoration: none;
                    transition: color 0.3s;
                }

                .forgot-link:hover {
                    color: #27ae60;
                    text-decoration: underline;
                }

                .btn-login {
                    width: 100%;
                    height: 52px;
                    background: linear-gradient(135deg, #2ecc71, #27ae60);
                    border: none;
                    border-radius: 12px;
                    color: white;
                    font-size: 16px;
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    gap: 10px;
                }

                .btn-login:hover {
                    background: linear-gradient(135deg, #27ae60, #219150);
                    transform: translateY(-2px);
                    box-shadow: 0 10px 20px rgba(46, 204, 113, 0.3);
                }

                .btn-login:active {
                    transform: translateY(0);
                }

                .login-footer {
                    padding: 20px 35px;
                    background: #f8fafc;
                    text-align: center;
                    border-top: 1px solid #e2e8f0;
                }

                .login-footer p {
                    color: #718096;
                    font-size: 14px;
                    margin-bottom: 15px;
                }

                .social-login {
                    display: flex;
                    justify-content: center;
                    gap: 15px;
                }

                .social-btn {
                    width: 45px;
                    height: 45px;
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 18px;
                    color: white;
                    text-decoration: none;
                    transition: transform 0.3s, box-shadow 0.3s;
                }

                .social-btn:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
                }

                .social-btn.facebook {
                    background: #3b5998;
                }

                .social-btn.google {
                    background: #db4437;
                }

                .social-btn.twitter {
                    background: #1da1f2;
                }

                /* Responsive */
                @media (max-width: 480px) {
                    .login-container {
                        padding: 15px;
                    }

                    .login-header {
                        padding: 25px 20px;
                    }

                    .login-body {
                        padding: 25px;
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
                            <i class="fa fa-building"></i>
                        </div>
                        <h2>SkyLand</h2>
                        <p>Hệ thống quản lý bất động sản</p>
                    </div>

                    <!-- Body -->
                    <div class="login-body">

                        <!-- Error message -->
                        <c:if test="${param.incorrectAccount != null}">
                            <div class="alert-danger">
                                <i class="fa fa-exclamation-circle"></i>
                                <span>Tên đăng nhập hoặc mật khẩu không đúng</span>
                            </div>
                        </c:if>

                        <c:if test="${param.accessDenied != null}">
                            <div class="alert-danger">
                                <i class="fa fa-ban"></i>
                                <span>Bạn không có quyền truy cập</span>
                            </div>
                        </c:if>

                        <c:if test="${param.sessionTimeout != null}">
                            <div class="alert-danger">
                                <i class="fa fa-clock-o"></i>
                                <span>Phiên đăng nhập đã hết hạn</span>
                            </div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">

                            <div class="form-group">
                                <label>Tên đăng nhập</label>
                                <div class="input-wrapper">
                                    <input type="text" name="j_username" class="form-control"
                                        placeholder="Nhập tên đăng nhập">
                                    <i class="fa fa-user"></i>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Mật khẩu</label>
                                <div class="input-wrapper">
                                    <input type="password" name="j_password" class="form-control"
                                        placeholder="Nhập mật khẩu">
                                    <i class="fa fa-lock"></i>
                                </div>
                            </div>

                            <div class="remember-row">
                                <div class="remember-check">
                                    <input type="checkbox" id="remember" name="remember">
                                    <label for="remember">Ghi nhớ đăng nhập</label>
                                </div>
                                <a href="#" class="forgot-link">Quên mật khẩu?</a>
                            </div>

                            <button type="submit" class="btn-login">
                                <i class="fa fa-sign-in"></i>
                                Đăng nhập
                            </button>

                        </form>
                    </div>

                    <!-- Footer -->
                    <div class="login-footer">
                        <p>Hoặc đăng nhập bằng</p>
                        <div class="social-login">
                            <a href="#" class="social-btn facebook">
                                <i class="fa fa-facebook"></i>
                            </a>
                            <a href="#" class="social-btn google">
                                <i class="fa fa-google"></i>
                            </a>
                            <a href="#" class="social-btn twitter">
                                <i class="fa fa-twitter"></i>
                            </a>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Scripts -->
            <script src="${pageContext.request.contextPath}/admin/js/2.1.4/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>

        </body>

        </html>