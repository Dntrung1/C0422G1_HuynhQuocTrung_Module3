<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/29/2022
  Time: 1:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang thêm mới sản phẩm</h1>
<a href="/Product">Quay lại trang list</a>
<div style="color: brown">
    <c:if test="${mess!=null}">
        <p>${mess}</p>
    </c:if>
</div>

<form action="/Product?action=add" method="post">
    <input type="text" name="id" placeholder="Nhập id">
    <input type="text" name="name" placeholder="Thêm tên sản phẩm">
    <input type="number" name="price" placeholder="Giá sản Phẩm">
    <input type="text" name="describe" placeholder="Mô tả sản phẩm">
    <input type="text" name="producer" placeholder="Nhà sản xuất">
    <button type="submit">Save</button>
</form>
</body>
</html>
