<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <div class="footer">
            <div class="footer-inner">
                <div class="footer-content">
                    <span class="bigger-120">
                        <span class="blue bolder">DEVNGUYEN.com</span>
                    </span>

                    &nbsp; &nbsp;
                    <span class="action-buttons">
                        <a href="#">
                            <i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
                        </a>

                        <a href="#">
                            <i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
                        </a>

                        <a href="https://www.youtube.com/@manhnguyen09" target="_blank">
                            <i class="ace-icon fa fa-rss-square orange bigger-150"></i>
                        </a>
                    </span>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script src="<c:url value='/js/global-notifications.js' />"></script>
        <script type="text/javascript">
            function loadNotifications() {
                $.ajax({
                    url: window.APP_CONFIG.apiBase + '/notifications',
                    type: 'GET',
                    success: function (data) {
                        updateNotificationUI(data.notifications, data.unreadCount);
                    },
                    error: function (err) {
                        console.error("Không thể lấy thông báo", err);
                    }
                });
            }

            function updateNotificationUI(notifications, unreadCount) {
                const badge = $('#notification-badge');
                const headerCount = $('#notification-header-count');

                if (unreadCount > 0) {
                    badge.text(unreadCount).show();
                    headerCount.text(unreadCount);
                } else {
                    badge.hide();
                    headerCount.text(0);
                }

                var html = '';
                if (notifications.length === 0) {
                    html = '<li><a href="#" class="clearfix text-center">Không có thông báo mới</a></li>';
                } else {
                    notifications.forEach(function (item) {
                        var unreadClass = (item.status === 0) ? 'unread-item' : '';
                        // Cộng chuỗi thủ công để tránh xung đột của JSP
                        html += '<li>' +
                            '<a href="javascript:void(0);" class="clearfix ' + unreadClass + '" onclick="handleNotificationClick(' + item.id + ', \'' + item.link + '\')">' +
                            '<div class="msg-body">' +
                            '<span class="msg-title">' +
                            '<span class="blue">' + item.createdBy + ': </span>' +
                            item.content +
                            '</span>' +
                            '<span class="msg-time">' +
                            '<i class="ace-icon fa fa-clock-o"></i> ' +
                            '<span>' + item.createdDate + '</span>' +
                            '</span>' +
                            '</div>' +
                            '</a>' +
                            '</li>';
                    });
                }
                $('#notification-items').html(html);
            }

            function handleNotificationClick(id, link) {
                $.ajax({
                    url: window.APP_CONFIG.apiBase + '/notifications/' + id + '/read',
                    type: 'PUT',
                    success: function () {
                        window.location.href = link;
                    },
                    error: function () {
                        window.location.href = link; // Vẫn chuyển trang kể cả khi lỗi API
                    }
                });
            }

            function markAllAsReadNow() {
                $.ajax({
                    url: window.APP_CONFIG.apiBase + '/notifications/read-all',
                    type: 'PUT',
                    success: function () {
                        loadNotifications(); // Load lại để mất số đỏ và đổi màu nền tin nhắn
                    }
                });
            }

            $(document).ready(function () {
                loadNotifications(); // Load thông báo cũ

                var tokenFromServer = "${token}";
                connectWebSocket(tokenFromServer); // Kết nối real-time
            });
        </script>