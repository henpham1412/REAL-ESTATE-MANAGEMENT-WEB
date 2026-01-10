<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title><decorator:title default="Trang chủ"/></title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap 4 (GIỮ NGUYÊN như code cũ) -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.min.css">

    <!-- CSS web -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/web/css/style.css">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>

<jsp:include page="/common/web/header.jsp"/>

<decorator:body/>

<jsp:include page="/common/web/footer.jsp"/>

<!-- JS (CHỈ Bootstrap 4) -->
<script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>

</body>
</html>
