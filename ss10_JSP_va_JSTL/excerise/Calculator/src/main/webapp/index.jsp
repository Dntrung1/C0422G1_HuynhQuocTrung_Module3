<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/28/2022
  Time: 2:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form action="/caculate" method="post">
    <div>
        <h1>Số thứ 1</h1>
        <input type="number" name="first">
    </div>
    <div>
        <select name="tinh">
            <option value="+">+</option>
            <option value="-">-</option>
            <option value="*">*</option>
            <option value="/">/</option>
        </select>
    </div>
    <div>
        <h1>Số thứ 2</h1>
        <input type="number" name="second">
    </div>
    <div>
        <button type="submit">Tính</button>
    </div>
</form>
</body>
</html>
