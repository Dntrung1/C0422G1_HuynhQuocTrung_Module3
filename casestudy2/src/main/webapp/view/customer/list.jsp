<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/5/2022
  Time: 6:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Trang danh sách khách hàng</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist\css\bootstrap.css">
</head>
<body>
<div class="container-fluid">
<div class="m-2">
    <a class="btn btn-primary" href="/Furama?action=addCustomer">Thêm mới</a>
</div>

<table class="table table-dark table-striped">
    <tr>
        <th>Mã Khách hàng</th>
        <th>Loại khách</th>
        <th>Họ và tên</th>
        <th>Ngày sinh</th>
        <th>Giới tính</th>
        <th>Số CMND</th>
        <th>Số điện thoại</th>
        <th>Email</th>
        <th>Địa chỉ</th>
        <th>Trạng thái</th>
        <th colspan="2">Chức năng</th>
    </tr>
    <c:forEach var="cus" items="${customerList}">
        <tr>
            <td class="m-auto">${cus.idCustomer}</td>
            <c:forEach var="lk" items="${customerTypeList}">
                <c:if test="${lk.idCustomerType == cus.customerTypeId}">
                    <td>${lk.name}</td>
                </c:if>
            </c:forEach>
            <td>${cus.name}</td>
            <td>${cus.birthday}</td>
            <c:choose>
                <c:when test="${cus.gender == 0}">
                    <td>Nữ</td>
                </c:when>
                <c:when test="${cus.gender == 1}">
                    <td>Nam</td>
                </c:when>
            </c:choose>
            <td>${cus.idCard}</td>
            <td>${cus.phone}</td>
            <td>${cus.email}</td>
            <td>${cus.address}</td>
            <c:if test="${cus.status==1}">
                <td>tồn tại</td>
            </c:if>
            <c:if test="${cus.status==0}">
                <td>Đã xóa</td>
            </c:if>
            <td>
                <a class="btn btn-warning" href="/Furama?action=updateCustomer&id=${cus.idCustomer}">Chỉnh sửa</a>
            </td>
            <td>
                <button onclick="setIdToFormDelete('${cus.idCustomer}','${cus.name}')" class="btn btn-danger"
                        data-bs-toggle="modal"
                        data-bs-target="#deleteModal">
                    Xóa
                </button>
            </td>
        </tr>
    </c:forEach>
</table>
</div>
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span>Bạn có muốn xóa khách hàng: </span>
                <span id="deleteName"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="sumitFormDelete()">Delete</button>
            </div>
        </div>
    </div>
</div>

<form action="/Furama" id="formDelete">
    <input type="hidden" name="action" value="deleteCustomer">
    <input type="hidden" id="idCustomerInput" name="id">
</form>

<script>
    function setIdToFormDelete(id, name) {
        document.getElementById("idCustomerInput").value = id;
        document.getElementById("deleteName").innerText = name;
    }

    function sumitFormDelete() {
        document.getElementById("formDelete").submit();
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
