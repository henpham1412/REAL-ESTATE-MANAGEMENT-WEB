<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="/common/taglib.jsp" %>
		<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request" />
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Trang chủ</title>
			<script>
				window.APP_CONFIG = {
					contextPath: '${pageContext.request.contextPath}',
					apiBase: '${pageContext.request.contextPath}/api'
				};
			</script>

			<!-- Bootstrap core CSS -->
			<link href="<c:url value='/web/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet" type="text/css">
			<link href="<c:url value='/web/css/small-business.css' />" rel="stylesheet" type="text/css">
		</head>

		<body>
			<!-- Navigation -->
			<%@ include file="/common/web/header.jsp" %>

				<dec:body />

				<!-- Footer -->
				<%@ include file="/common/web/footer.jsp" %>

					<!-- Bootstrap core JavaScript -->
					<script src="<c:url value='/web/vendor/jquery/jquery.min.js' />"></script>
					<script src="<c:url value='/web/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
		</body>

		</html>