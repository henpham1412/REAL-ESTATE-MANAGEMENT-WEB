<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--<footer class="py-0 bg-dark">--%>
	<%--<div class="container">--%>
		<%--<p class="m-0 text-center text-black-50">Copyright &copy</p>--%>
	<%--</div>--%>
	<%--<!-- /.container -->--%>
<%--</footer>--%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="<c:url value='/js/global-notifications.js' />"></script>
<script type="text/javascript">
    // gọi hàm khi load trang xong
    $(document).ready(function() {
        var tokenFromServer = "${token}";
        connectWebSocket(tokenFromServer);
    });
</script>