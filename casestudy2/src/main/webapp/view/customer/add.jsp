<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/5/2022
  Time: 6:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist\css\bootstrap.css">
</head>
<body>
<a href="/Furama?action=listCustomer">QL</a>
<form action="/Furama?action=addCustomer" method="post">
    <select name="customerTypeId">
        <option value="1">Diamond</option>
        <option value="2">Platinium</option>
        <option value="3">Gold</option>
        <option value="4">Silver</option>
        <option value="5">Member</option>
    </select>
    <input type="text" name="name" placeholder="Tên khách hàng">
    <input type="date" name="birtday" placeholder="ngay sinh">
    <select name="gender">
        <option value="0">Nữ</option>
        <option value="1">Nam</option>
    </select>
    <input type="text" name="idCard" placeholder="Chứng minh nhân dân">
    <input type="text" name="phone" placeholder="Số diện thoại">
    <input type="text" name="email" placeholder="Email">
    <input type="text" name="address" placeholder="Địa chỉ">
    <button type="submit">Save</button>
</form>
</body>
</html>
