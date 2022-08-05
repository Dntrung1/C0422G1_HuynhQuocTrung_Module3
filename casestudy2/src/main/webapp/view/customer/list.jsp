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
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist\css\bootstrap.css">
</head>
<body>
<a href="/Furama?action=addCustomer">THêm mới</a>
<table border="1px">
    <tr>
        <th>Mã Khách hàng</th>
        <th>loại khách</th>
        <th>Họ và tên</th>
        <th>Ngày sinh</th>
        <th>Giới tính</th>
        <th>Số chứng minh nhân dân</th>
        <th>Số điện thoại</th>
        <th>email</th>
        <th>địa chỉ</th>
        <th>Chức năng</th>
    </tr>
    <c:forEach var="cus" items="${customerList}">
        <tr>
            <td>${cus.idCustomer}</td>
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
            <td>
                <a class="btn btn-danger" href="/Furama?action=updateCustomer&id=${cus.idCustomer}">Update</a>
            </td>
        </tr>
    </c:forEach>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
