<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/29/2022
  Time: 12:49 PM
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
    <nav class="navbar navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand"> <h1>Trang Danh Sách Sản Phẩm</h1></a>
            <form class="d-flex" action="/Product?action=search" method="post">
                <input class="form-control me-2" type="text" name="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </nav>
    <a href="/Product?action=add"><button type="button" class="btn btn-outline-primary">Create</button></a>
    <table class="table table-success table-striped">
        <tr>
            <th>STT</th>
            <th>ID</th>
            <th>Tên Sản Phẩm</th>
            <th>Giá Sản Phâm</th>
            <th>Mô Tả Sản Phẩm</th>
            <th>Nhà Sản Xuất</th>
            <th colspan="2">Update</th>
        </tr>
        <c:forEach var="product" items="${productlist}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.describe}</td>
                <td>${product.producer}</td>
                <td><a href="/Product?action=update&id=${product.id}"><button type="button" class="btn btn-outline-dark">Edit</button></a></td>
                <td><a href="/Product?action=delete&id=${product.id}"><button type="button" class="btn btn-outline-dark">Delete</button></a></td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
