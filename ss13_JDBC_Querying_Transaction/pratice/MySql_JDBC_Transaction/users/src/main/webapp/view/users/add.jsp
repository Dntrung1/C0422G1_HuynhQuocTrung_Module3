<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/1/2022
  Time: 3:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="color: brown">
    <c:if test="${mess!=null}">
        <p>${mess}</p>
    </c:if>
</div>
<a href="/Users">QL</a>
<form method="post">
<input type="text" name="name" placeholder="Thêm tên">
<input type="text" name="email" placeholder="Thêm email">
<input type="text" name="country" placeholder="Thêm Địa chỉ ">
<button type="submit">save</button>
</form>
</body>
</html>
