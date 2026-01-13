<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="/common/taglib.jsp" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Đăng nhập</title>
            <style>
                .login-card {
                    background: white;
                    border-radius: 12px;
                    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
                    width: 100%;
                    max-width: 380px;
                    overflow: hidden;
                }

                .login-header {
                    background: linear-gradient(135deg, #667eea, #764ba2);
                    color: white;
                    padding: 30px;
                    text-align: center;
                }

                .login-header h2 {
                    margin: 0 0 8px 0;
                    font-size: 24px;
                }

                .login-header p {
                    margin: 0;
                    opacity: 0.9;
                    font-size: 14px;
                }

                .login-body {
                    padding: 30px;
                }

                .form-group {
                    margin-bottom: 20px;
                }

                .form-group label {
                    display: block;
                    margin-bottom: 8px;
                    font-weight: 500;
                    color: #333;
                }

                .form-group input {
                    width: 100%;
                    padding: 12px 15px;
                    border: 1px solid #ddd;
                    border-radius: 8px;
                    font-size: 15px;
                }

                .form-group input:focus {
                    outline: none;
                    border-color: #667eea;
                    box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
                }

                .btn-login {
                    width: 100%;
                    padding: 14px;
                    background: linear-gradient(135deg, #667eea, #764ba2);
                    color: white;
                    border: none;
                    border-radius: 8px;
                    font-size: 16px;
                    font-weight: 600;
                    cursor: pointer;
                }

                .btn-login:hover {
                    opacity: 0.9;
                }

                .alert-error {
                    background: #fee;
                    border: 1px solid #fcc;
                    color: #c00;
                    padding: 12px;
                    border-radius: 8px;
                    margin-bottom: 20px;
                    font-size: 14px;
                }

                .remember-row {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 20px;
                    font-size: 14px;
                }

                .remember-row a {
                    color: #667eea;
                    text-decoration: none;
                }
            </style>
        </head>

        <body>
            <div class="login-card">
                <div class="login-header">
                    <h2>SkyLand</h2>
                    <p>Hệ thống quản lý bất động sản</p>
                </div>
                <div class="login-body">
                    <c:if test="${param.incorrectAccount != null}">
                        <div class="alert-error">Tên đăng nhập hoặc mật khẩu không đúng</div>
                    </c:if>
                    <c:if test="${param.accessDenied != null}">
                        <div class="alert-error">Bạn không có quyền truy cập</div>
                    </c:if>
                    <form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
                        <div class="form-group">
                            <label>Tên đăng nhập</label>
                            <input type="text" name="j_username" placeholder="Nhập tên đăng nhập" required>
                        </div>
                        <div class="form-group">
                            <label>Mật khẩu</label>
                            <input type="password" name="j_password" placeholder="Nhập mật khẩu" required>
                        </div>
                        <div class="remember-row">
                            <label><input type="checkbox" name="remember"> Ghi nhớ</label>
                            <a href="#">Quên mật khẩu?</a>
                        </div>
                        <button type="submit" class="btn-login">Đăng nhập</button>
                    </form>
                </div>
            </div>
        </body>

        </html>