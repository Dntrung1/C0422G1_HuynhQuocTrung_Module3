<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/29/2022
  Time: 3:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang thay đổi sản phẩm</h1>
<c:if test="${mess!=null}">
    <p>${mess}</p>
</c:if>
<form method="post">
    <input type="text" name="name" value="${product.name}" placeholder="Tên mới">
    <input type="number" name="price" value="${product.price}" placeholder="Giá sản Phẩm">
    <input type="text" name="describe" value="${product.describe}" placeholder="Mô tả sản phẩm">
    <input type="text" name="producer" value="${product.producer}" placeholder="Nhà sản xuất">
    <button type="submit">update</button>
</form>
</body>
</html>
