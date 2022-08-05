<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/5/2022
  Time: 3:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist\css\bootstrap.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<h1>Danh sách dịch vụ</h1>
<a href="/Furama?action=add">THêm mới</a>
<table border="1px">
    <tr>
        <th>Mã dịch vụ</th>
        <th>Tên dịch vụ</th>
        <th>Diện tích</th>
        <th>Chi phí thuê</th>
        <th>Số người tối đa</th>
        <th>mã kiểu thuê</th>
        <th>Mã loại dịch vụ</th>
        <th>Tiêu chuẩn phòng</th>
        <th>Mô tả tiện nghi khác</th>
        <th>Diện tích hồ bơi</th>
        <th>Số tầng</th>
        <th>Dịch vụ miễn phí đi kèm</th>
        <th>Các chứ năng</th>
    </tr>
    <c:forEach var="fac" items="${facilityList}">
        <tr>
            <td>${fac.idService}</td>
            <td>${fac.name}</td>
            <td>${fac.area}</td>
            <td>${fac.cost}</td>
            <td>${fac.maxPeople}</td>
            <td>${fac.rentTypId}</td>
            <td>${fac.code}</td>
            <td>${fac.standardRoom}</td>
            <td>${fac.descriptionOtherConvenience}</td>
            <td>${fac.poolArea}</td>
            <td>${fac.numberOfFloors}</td>
            <td>${fac.facilityFree}</td>
            <td>
                <a class="btn btn-danger" href="/Furama?action=update&id=${fac.idService}&code=${fac.code}">update
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
