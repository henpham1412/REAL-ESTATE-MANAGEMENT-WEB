<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <c:set var="ctx" value="${pageContext.request.contextPath}" scope="request" />
    <script>
        window.APP_CONFIG = {
            contextPath: '${pageContext.request.contextPath}',
            apiBase: '${pageContext.request.contextPath}/api'
        };
    </script>