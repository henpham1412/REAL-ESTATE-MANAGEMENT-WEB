var stompClient = null;

function connectWebSocket(token) {
    if (!token) return;

    var socket = new SockJS('/websocket');
    stompClient = Stomp.over(socket);

    stompClient.connect({'Authorization': 'Bearer ' + token}, function (frame) {
        // Đăng ký nhận thông báo cá nhân
        stompClient.subscribe('/user/queue/notifications', function (message) {
            showNotification(message.body);
        });
    }, function (error) {
        console.log("WebSocket Error: " + error);
        // Tùy chọn: Thử kết nối lại sau 5 giây nếu mất kết nối
        setTimeout(function() { connectWebSocket(token); }, 5000);
    });
}

function showNotification(msg) {
    toastr.success(msg, "Thông báo mới");
}