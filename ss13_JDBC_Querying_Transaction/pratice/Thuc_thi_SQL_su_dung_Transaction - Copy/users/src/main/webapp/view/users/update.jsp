<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/1/2022
  Time: 4:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang thay users</h1>
<c:if test="${mess!=null}">
  <p>${mess}</p>
</c:if>
<form method="post">
  <input type="text" disabled name="id" value="${users.id}">
  <input type="text" name="name" value="${users.name}" placeholder="Tên mới">
  <input type="text" name="email" value="${users.email}" placeholder="email mới">
  <input type="text" name="country" value="${users.country}" placeholder="địa chỉ mới">
  <button type="submit">update</button>
</form>
</body>
</html>
