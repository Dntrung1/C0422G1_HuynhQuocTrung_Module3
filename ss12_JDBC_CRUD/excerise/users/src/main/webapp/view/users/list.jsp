<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/1/2022
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/Users?action=add">thêm mới</a>
<form action="/Users?action=search" method="post">
    <input type="text" name="search">
    <button type="submit">tìm</button>
</form>
<a href="/Users?action=sort">
    <button type="submit">Xắp xếp</button>
</a>
<table border="1px">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>email</th>
        <th>country</th>
        <th>Update</th>
    </tr>
    <c:forEach var="users" items="${users}">
        <tr>
            <td>${users.id}</td>
            <td>${users.name}</td>
            <td>${users.email}</td>
            <td>${users.country}</td>
            <td><a href="/Users?action=update&id=${users.id}">Edit</a></td>
            <td><a href="/Users?action=delete&id=${users.id}">delete</a></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
