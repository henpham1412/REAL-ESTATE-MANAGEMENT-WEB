<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="/common/taglib.jsp" %>
        <c:set var="ctx" value="${pageContext.request.contextPath}" scope="request" />
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <title>
                <dec:title default="Đăng nhập" />
            </title>
            <script>
                window.APP_CONFIG = {
                    contextPath: '${pageContext.request.contextPath}',
                    apiBase: '${pageContext.request.contextPath}/api'
                };
            </script>
            <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"
                id="bootstrap-css">
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <link href="<c:url value='/login/style.css' />" rel="stylesheet" type="text/css" media="all" />
        </head>

        <body id="LoginForm" style="background-color: #2c7659">
            <dec:body />
        </body>

        </html>