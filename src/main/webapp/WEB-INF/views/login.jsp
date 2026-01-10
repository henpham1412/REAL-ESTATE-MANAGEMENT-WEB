<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--	pageEncoding="UTF-8"%>--%>
<%--<%@include file="/common/taglib.jsp"%>	--%>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<%--<html>--%>
<%--<head>--%>
<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
<%--<title>Đăng nhập</title>--%>
<%--</head>--%>
<%--&lt;%&ndash;<body>&ndash;%&gt;--%>
<%--&lt;%&ndash;	&ndash;%&gt;--%>
<%--&lt;%&ndash;</body>&ndash;%&gt;--%>
<%--<div class="container">--%>
<%--		<!-- <h1 class="form-heading">login Form</h1> -->--%>
<%--		<div class="login-form">--%>
<%--			<div class="main-div">--%>
<%--				<c:if test="${param.incorrectAccount != null}">--%>
<%--					<div class="alert alert-danger">--%>
<%--							Username or password incorrect--%>
<%--					</div>--%>
<%--				</c:if>--%>
<%--				<c:if test="${param.accessDenied != null}">--%>
<%--					<div class="alert alert-danger">--%>
<%--							You Not authorize--%>
<%--					</div>--%>
<%--				</c:if>--%>
<%--				<c:if test="${param.sessionTimeout != null}">--%>
<%--					<div class="alert alert-danger">--%>
<%--							Session Timeout--%>
<%--					</div>--%>
<%--				</c:if>--%>
<%--				<div class="container-fluid" >--%>
<%--					<section class="gradient-custom">--%>
<%--						<div class="page-wrapper">--%>
<%--							<div class="row d-flex justify-content-center align-items-center">--%>
<%--								<div class="col-12 col-md-8 col-lg-6 col-xl-5">--%>
<%--									<div class="card text-white" style="border-radius: 1rem; background-color: #35bf76;">--%>
<%--										<div class="card-body p-5">--%>
<%--											<div class="mb-md-5 mt-md-4 pb-5 text-center">--%>
<%--												<h2 class="fw-bold mb-2 text-uppercase">Login</h2>--%>
<%--												<p class="text-white-50 mb-5">Please enter your login and password!</p>--%>
<%--												<form action="j_spring_security_check" id="formLogin" method="post">--%>
<%--												<div class="form-outline form-white mb-4">--%>
<%--													<label class="form-label" for="userName">Email</label>--%>
<%--													<input type="text" class="form-control" id="userName" name="j_username" placeholder="Tên đăng nhập">--%>
<%--												</div>--%>

<%--												<div class="form-outline form-white mb-4">--%>
<%--													<label class="form-label" for="password">Password</label>--%>
<%--													<input type="password" class="form-control" id="password" name="j_password" placeholder="Mật khẩu">--%>
<%--												</div>--%>

<%--												<div class="form-check d-flex justify-content-center mb-5">--%>
<%--													<div><input class="form-check-input me-2" type="checkbox" value="" id="form2Example3cg" /></div>--%>
<%--													<div><label class="form-check-label">--%>
<%--                                                        Remember Password--%>
<%--                                                    </label></div>--%>
<%--												</div>--%>

<%--												<p class="small mb-2 pb-lg-2"><a class="text-white-50" href="#!">Forgot password?</a></p>--%>

<%--												<button type="submit" class="btn btn-primary" >Đăng nhập</button>--%>
<%--												</form>--%>
<%--												<div class="d-flex justify-content-center text-center mt-2 pt-1">--%>
<%--													<a href="#!" class="login-extension text-white"><i class="fab fa-facebook-f fa-lg"></i></a>--%>
<%--													<a href="#!" class="login-extension text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>--%>
<%--													<a href="#!" class="login-extension text-white"><i class="fab fa-google fa-lg"></i></a>--%>
<%--												</div>--%>
<%--											</div>--%>
<%--											<div class="text-center">--%>
<%--												<p class="mb-0 tex-center account">Don't have an account? <a href="#!" class="text-white-50 fw-bold">Sign Up</a></p>--%>
<%--											</div>--%>

<%--										</div>--%>
<%--									</div>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</section>--%>
<%--				</div>--%>
<%--				&lt;%&ndash;<script src="./assets/dist/js/boostrap-v5/bootstrap.js"></script>&ndash;%&gt;--%>
<%--				&lt;%&ndash;<script src="./assets/dist/js/fontawsome-v5/all.js"></script>&ndash;%&gt;--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>


<%--</html>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="vi">
<head>

    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Roboto, Arial, sans-serif;
        }

        .login-overlay {
            position: fixed;
            inset: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #2ecc71, #27ae60);
        }

        .login-card {
            width: 100%;
            max-width: 400px;
            border-radius: 14px;
            background: #fff;
            box-shadow: 0 20px 40px rgba(0,0,0,.15);
            overflow: hidden;
            animation: fadeUp .4s ease;
        }

        .login-card .card-header {
            background: #2ecc71;
            padding: 22px;
        }

        .login-card h4 {
            margin-bottom: 4px;
            font-weight: 600;
            letter-spacing: .5px;
        }

        .login-card small {
            opacity: .9;
        }

        .login-card .card-body {
            padding: 28px;
        }

        .login-card label {
            font-weight: 500;
            margin-bottom: 4px;
        }

        .login-card .form-control {
            border-radius: 8px;
            height: 42px;
        }

        .login-card .btn-success {
            border-radius: 8px;
            height: 44px;
            font-weight: 600;
            background: #27ae60;
            border: none;
        }

        .login-card .btn-success:hover {
            background: #219150;
        }

        .login-card .card-footer {
            padding: 14px;
            background: #fafafa;
        }

        @keyframes fadeUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>

    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.min.css">
</head>

<body class="bg-success">

<div class="login-overlay">
    <div class="card shadow-lg login-card">

        <div class="card-header text-center"
             style="background:#35bf76;color:#fff;border-radius:10px 10px 0 0">
            <h4 class="mb-1">LOGIN</h4>
            <small>Please enter your login and password</small>
        </div>

        <div class="card-body p-4">

            <c:if test="${param.incorrectAccount != null}">
                <div class="alert alert-danger text-center">
                    Username or password incorrect
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/j_spring_security_check" method="post">

                <div class="form-group">
                    <label>Email</label>
                    <input type="text" name="j_username"
                           class="form-control" placeholder="Tên đăng nhập">
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="j_password"
                           class="form-control" placeholder="Mật khẩu">
                </div>

                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="remember">
                    <label class="form-check-label" for="remember">
                        Remember password
                    </label>
                </div>

                <button type="submit" class="btn btn-success btn-block">
                    Đăng nhập
                </button>
            </form>
        </div>

        <div class="card-footer text-center bg-transparent">
            <a href="#" class="small text-muted">Forgot password?</a>
        </div>

    </div>
</div>
<script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>

</body>
</html>