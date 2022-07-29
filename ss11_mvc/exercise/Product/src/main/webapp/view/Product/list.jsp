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
</head>
<body>
<h1>Trang Danh Sách</h1>
<a style="border: 1px solid; background-color: aqua" href="/Product?action=add">ADD</a>
<table border="1px">
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
            <td><a style="background-color: aqua " href="/Product?action=update&id=${product.id}">Edit</a></td>
            <td><a style="background-color: brown" href="/Product?action=delete&id=${product.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<form action="/Product?action=search" method="post">
    <input type="text" name="search">
    <button type="submit">Tìm</button>
</form>
</body>
</html>
