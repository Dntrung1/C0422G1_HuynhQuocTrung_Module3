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
</head>
<body>
<div class="container-fluid">
<nav class="navbar navbar-light bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand text-white">Danh sách dịch vụ</a>
        <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
</nav>
    <div class="m-1">
        <a class="btn btn-primary" href="/Furama?action=add">Thêm mới</a>
    </div>
<table class="table table-dark table-striped">
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
        <th colspan="2">Các chức năng</th>
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
                <a class="btn btn-danger" href="/Furama?action=update&id=${fac.idService}">update
                </a>
            </td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#deleteModal" onclick="getIdToDelete(${fac.idService})">
                    Delete
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
                <h5 class="modal-title" id="exampleModalLabel">Delete Confilm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" >
                <div class="modal-body">
                    Bạn có chắc chắn xóa không?
                    <input id="idDelete" type="hidden" name="idDelete">
                    <input type="hidden" name="action" value="delete">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function getIdToDelete(id){
        document.getElementById("idDelete").value = id;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
