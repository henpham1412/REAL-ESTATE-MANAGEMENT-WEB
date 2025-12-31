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
    <meta charset="UTF-8">
    <title>Đăng nhập</title>

    <link rel="stylesheet" href="<c:url value='/admin/assets/css/bootstrap.min.css'/>">

    <script src="<c:url value='/admin/assets/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/admin/assets/js/popper.min.js'/>"></script>
    <script src="<c:url value='/admin/assets/js/bootstrap.min.js'/>"></script>
</head>

<body>

<div class="container">
    <div class="row justify-content-center align-items-center" style="min-height:100vh">
        <div class="col-md-6 col-lg-5">

            <c:if test="${param.incorrectAccount != null}">
                <div class="alert alert-danger">Username or password incorrect</div>
            </c:if>
            <c:if test="${param.accessDenied != null}">
                <div class="alert alert-danger">You are not authorized</div>
            </c:if>
            <c:if test="${param.sessionTimeout != null}">
                <div class="alert alert-danger">Session Timeout</div>
            </c:if>

            <div class="card text-white" style="border-radius:1rem; background:#35bf76">
                <div class="card-body p-5 text-center">

                    <h2 class="fw-bold mb-3 text-uppercase">Login</h2>
                    <p class="text-white-50 mb-4">Please enter your login and password!</p>

                    <form action="j_spring_security_check" method="post">

                        <div class="mb-3 text-start">
                            <label class="form-label">Email</label>
                            <input type="text" name="j_username" class="form-control" placeholder="Tên đăng nhập">
                        </div>

                        <div class="mb-3 text-start">
                            <label class="form-label">Password</label>
                            <input type="password" name="j_password" class="form-control" placeholder="Mật khẩu">
                        </div>

                        <div class="form-check mb-3 text-start">
                            <input class="form-check-input" type="checkbox" id="remember">
                            <label class="form-check-label" for="remember">Remember password</label>
                        </div>

                        <button class="btn btn-primary w-100" type="submit">
                            Đăng nhập
                        </button>

                    </form>

                    <p class="small mt-3">
                        <a class="text-white-50" href="#">Forgot password?</a>
                    </p>

                </div>
            </div>

        </div>
    </div>
</div>

<!-- JS -->
</body>
</html>
