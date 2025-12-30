<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ page import="com.javaweb.security.utils.SecurityUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
    /* Màu nền xanh nhạt cho thông báo CHƯA ĐỌC */
    #notification-items li a.unread-item {
        background-color: #f0f7ff !important;
    }

    /* Chữ đậm cho thông báo CHƯA ĐỌC */
    #notification-items li a.unread-item .msg-title {
        font-weight: bold !important;
        color: #2b7dbc !important;
    }

    /* Khi di chuột qua (Hover) */
    #notification-items li a:hover {
        background-color: #f5f5f5 !important;
    }

    /* Tinh chỉnh thanh cuộn cho chuyên nghiệp */
    .dropdown-content {
        max-height: 300px !important;
        overflow-y: auto !important;
        scrollbar-width: thin; /* Cho Firefox */
    }

    /* Thanh cuộn cho Chrome/Safari/Edge */
    .dropdown-content::-webkit-scrollbar {
        width: 6px;
    }
    .dropdown-content::-webkit-scrollbar-track {
        background: #f1f1f1;
    }
    .dropdown-content::-webkit-scrollbar-thumb {
        background: #888;
        border-radius: 10px;
    }
    .dropdown-content::-webkit-scrollbar-thumb:hover {
        background: #555;
    }

    /* Đảm bảo nội dung không bị tràn ngang */
    #notification-items li a {
        white-space: normal;
        word-wrap: break-word;
    }
</style>

<div id="navbar" class="navbar navbar-default ace-save-state" style="background-color:#35bf76">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    Trang quản trị
                </small>
            </a>
        </div>
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">

                <li class="purple dropdown-modal">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="ace-icon fa fa-bell icon-animated-bell"></i>
                        <span class="badge badge-important" id="notification-badge" style="display: none;">0</span>
                    </a>

                    <ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
                        <li class="dropdown-header">
                            <i class="ace-icon fa fa-exclamation-triangle"></i>
                            <span id="notification-header-count">0</span> Thông báo mới
                        </li>

                        <li class="dropdown-content">
                            <ul class="dropdown-menu dropdown-navbar" id="notification-items">
                            </ul>
                        </li>
<%--                        <a href="javascript:void(0);" onclick="markAllAsReadNow()" class="pull-right" style="font-weight: normal; font-size: 11px;">Đọc tất cả</a>--%>
                        <li class="dropdown-footer">
                            <a href="javascript:void(0);" onclick="markAllAsReadNow()"  style="font-weight: normal; font-size: 11px;" >
                                Đọc tất cả thông báo
                                <i class="ace-icon fa fa-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="light-10">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        Xin chào, <%=SecurityUtils.getPrincipal().getFullName()%>
                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="/admin/profile-<%=SecurityUtils.getPrincipal().getUsername()%>">
                                <i class="ace-icon fa fa-user"></i>
                                <%--<spring:message code="label.account.information"/>--%>
                                Thông tin tài khoản
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value="/admin/profile-password"/>">
                                <i class="ace-icon fa fa-key"></i>
                                <%--<spring:message code="label.password.change"/>--%>
                                Đổi mật khẩu
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="<c:url value='/logout'/>">
                                <i class="ace-icon fa fa-power-off"></i>
                                Thoát
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>