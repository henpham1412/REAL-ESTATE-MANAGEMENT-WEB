<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 06/12/2025
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerAPI" value="/api/customer"/>
<html>
<head>
    <title>Thêm khách hàng</title>
</head>
<body>
<div class="main-content" id="main-container">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->

            </div>

            <div class="page-content">

                <div class="page-header">
                    <h1>
                        THÔNG TIN KHÁCH HÀNG
<%--                        <small>--%>
<%--                            <i class="ace-icon fa fa-angle-double-right"></i>--%>
<%--                            overview &amp; stats--%>
<%--                        </small>--%>
                    </h1>
                </div><!-- /.page-header -->

                <div class = "row">
                    <div class="col-xs-12">
                    </div>
                </div>
                <div class = "row" style="font-family: 'Times New Roman', Times, serif;">
                    <form:form modelAttribute="customerEdit" id="listForm" method="GET">
                         <div class="col-xs-12">
                        <form class="form-horizontal" role="form" >
                            <div class="form-group">
                                <label class="col-xs-3">Tên khách hàng</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="fullName"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Số điện thoại</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="ward" name="ward" >--%>
                                        <form:input class="form-control" path="customerPhone"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Email</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="street" name="street" >--%>
                                    <form:input class="form-control" path="email"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Tên công ty</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="structure" name="structure" >--%>
                                    <form:input class="form-control" path="companyName"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Nhu cầu</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="numberOfBasement" name="numberOfBasement" >--%>
                                    <form:input class="form-control" path="demand"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Tình trạng</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="floorArea" name="floorArea" >--%>
                                    <form:input class="form-control" path="status"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3"></label>
                                <div class="col-xs-9">
                                    <c:if test="${not empty customerEdit.id}">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Cập nhật Khách hàng</button>
                                    <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                    </c:if>
                                    <c:if test="${empty customerEdit.id}">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Thêm mới khách hàng</button>
                                    <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                    </c:if>
                                </div>
                            </div>
                        <form:hidden path="id" id="customerId"/>

                        </form>
                    </div>
                    </form:form>

                </div>
            </div><!-- /.page-content -->

        <c:forEach var="item" items="${transactionType}">
           <div class="col-xs-12">
                <div class="col-xs-12">
                    <h3 class="header smaller lighter blue">${item.value}</h3>
                    <button class="btn btn-lg btn-primary" onclick="transactionType('${item.key}', ${customerEdit.id})">
                        <i class="orange ace icon fa fa-location-arrow bigger-130"></i>Add
                    </button>
                </div>
                <c:if test="${item.key == 'CSKH'}">
                    <div class="row">
                    <div class="col-xs-12">
                        <table id="tableList" style="margin: 3em 0" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>Người tạo</th>
                                <th>Thời gian tạo</th>
                                <th>Người thay đổi</th>
                                <th>Thời gian thay đổi</th>
                                <th>Chi tiết giao dịch</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="item" items="${listCSKH}">
                                <tr>
                                <td>
                                    ${item.createdBy}
                                </td>
                                <td>${item.createdDate}</td>
                                <td>${item.modifiedBy}</td>
                                <td>${item.modifiedDate}</td>
                                <td>${item.note}</td>
                                <td>
                                    <button title="Sửa giao dịch" class="btn btn-xs btn-info" data-toggle="tooltip" onclick="updateTransaction(${item.id})">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                    </button>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div><!-- /.span -->
                </div>
                </c:if>
                <c:if test="${item.key == 'DDX'}">
                    <div class="row">
                    <div class="col-xs-12">
                        <table id="tableList" style="margin: 3em 0" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>Người tạo</th>
                                <th>Thời gian tạo</th>
                                <th>Người thay đổi</th>
                                <th>Thời gian thay đổi</th>
                                <th>Chi tiết giao dịch</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="item" items="${listDDX}">
                                <tr>
                                <td>
                                    ${item.createdBy}
                                </td>
                                <td>${item.createdDate}</td>
                                <td>${item.modifiedBy}</td>
                                <td>${item.modifiedDate}</td>
                                <td>${item.note}</td>
                                <td>
                                    <button title="Sửa giao dịch" class="btn btn-xs btn-info" data-toggle="tooltip" onclick="updateTransaction(${item.id})">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                    </button>

                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div><!-- /.span -->
                </div>
                </c:if>
           </div>
        </c:forEach>
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-container -->

<div class="modal fade" id="editTransaction" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
			<div class="modal-dialog">

			  <!-- Modal content-->
			  <div class="modal-content">
				<div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal">&times;</button>
				  <h4 class="modal-title">Nhập giao dịch</h4>
				</div>
				<div class="modal-body">
					<table style="margin: 3em 0 0;" class="table table-striped table-bordered table-hover" id="stafflist">
						<thead>
							<tr>
							    <div class="form-group">
                                  <label class="col-xs-3 control-label">Chi tiết giao dịch</label>
                                  <div class="col-xs-9">
                                    <input type="text" class="form-control" id="transactionDetail" value="">
                                  </div>
                                </div>


							</tr>
						</thead>

						<tbody>
						</tbody>
					</table>
					<input type="hidden" id="customerId" name="customerId" value="">
					<input type="hidden" id="key" name="key" value="">
					<input type="hidden" id="id" name="id" value="">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="btnAddOrUppdateTransaction">Thêm giao dịch</button>
				  <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
				</div>
			  </div>

			</div>
		  </div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    $('#btnAddOrUpdateCustomer').click(function(){
        var data = {};
        var formData = $('#listForm').serializeArray();
        $.each(formData, function(i, v){
            data["" + v.name + ""] = v.value;
        });

        if (data['fullName'] != "" && data['customerPhone'] != "") {  // validate in front end
            addOrUpdateCustomer(data);
        } else {
            <%--if (data['name'] === "") {--%>
            <%--    window.location.href = "<c:url value='/admin/customer-edit?error=name'/>";--%>
            <%--}--%>
            <%--if (data['customerPhone'] === "") {--%>
            <%--    window.location.href = "<c:url value='/admin/customer-edit?error=phone'/>";--%>
            <%--}--%>
            if (data['fullName'] === "") {
                //alert("Tên khách hàng là bắt buộc!");
                Swal.fire({
                  icon: 'error',
                  title: 'Lỗi',
                  text: 'Tên là bắt buộc!',
                });
            }
            if (data['customerPhone'] === "") {
                //alert("Số điện thoại là bắt buộc!");
                Swal.fire({
                  icon: 'error',
                  title: 'Lỗi',
                  text: 'Số điện thoại là bắt buộc!',
                });

            }

        }
        // call api
    });
    function addOrUpdateCustomer(data) {
        $.ajax({
            type: "POST",
            url: "${customerAPI}",
            data: JSON.stringify(data),
            contentType:"application/json",
            // dataType: "JSON",
            success: function(respond) {
                console.log("success");
                // them status
                window.location.href = "<c:url value="/admin/customer-edit?message=success"/>"; // thay status bang message tranh ghi de vao field status
            },
            error: function(respond) {
                console.log("failed");
                console.log(respond);
                // them status
                window.location.href = "<c:url value="/admin/customer-edit?message=failed"/>";
            }
            });
    };
    $('#btnCancel').click(function (){
        window.location.href = "/admin/customer-list";
    });

    function transactionType(key, customerId) {

        $('#customerId').val(customerId)
        $('#key').val(key);
        $('#id').val("");
        $('#transactionDetail').val("");
        $('#btnAddOrUppdateTransaction').text("Thêm giao dịch");

        $('#editTransaction').modal();
    };

    function updateTransaction(id){
        $('#editTransaction').modal();
        $('#btnAddOrUppdateTransaction').text("Sửa giao dịch");
        $('#id').val(id);
    };

    $('#btnAddOrUppdateTransaction').click(function(){
        var data = {};

        data['note'] = $('#transactionDetail').val();
        data['customerId'] = $('#customerId').val();
        data['code'] = $('#key').val();

        var transactionId = $('#id').val();

        if (transactionId != '') {
            data['id'] = transactionId;
        }

        if (data['note'] != '') {  // validate in front end
            addOrUpdateTransaction(data);
        } else {

                //alert("Tên khách hàng là bắt buộc!");
                Swal.fire({
                  icon: 'error',
                  title: 'Lỗi',
                  text: 'Vui lòng nhập chi tiết giao dịch!',
                });
        }
        // call api
    });

    function addOrUpdateTransaction(data) {
        $.ajax({
            type: "POST",
            url: "/api/transaction",
            data: JSON.stringify(data),
            contentType:"application/json",
            // dataType: "JSON",
            success: function(respond) {
                var customerId = data['customerId'];

                // Chuyển hướng
                alert("Cập nhật giao dịch thành công!");
                window.location.href = "/admin/customer-edit-" + customerId + "?message=success";
            },
            error: function(respond) {
                console.log("Thất bại");
                console.log(respond);
                alert("Có lỗi xảy ra!");
            }
            });
    };

</script>
</body>
</html>
