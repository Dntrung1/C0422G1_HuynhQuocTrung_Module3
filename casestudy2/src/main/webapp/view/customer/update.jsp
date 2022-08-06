<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/5/2022
  Time: 6:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist\css\bootstrap.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<form action="/Furama?action=updateCustomer" method="post">
    <input type="hidden" name="id" value="${customer.idCustomer}">
    <select name="customerTypeId" >
        <option value="1">Diamond</option>
        <option value="2">Platinium</option>
        <option value="3">Gold</option>
        <option value="4">Silver</option>
        <option value="5">Member</option>
    </select>
    <input value="${customer.name}" type="text" name="name" placeholder="Tên khách hàng" >
    <input  type="date" name="birthday" placeholder="ngày sinh">
    <select name="gender">
        <option value="0">Nữ</option>
        <option value="1">Nam</option>
    </select>
    <input value="${customer.idCard}" type="text" name="idCard" placeholder="Chứng minh nhân dân" >
    <input value="${customer.phone}" type="text" name="phone" placeholder="Số diện thoại">
    <input  value="${customer.email}" type="text" name="email" placeholder="Email" >
    <input  value="${customer.address}" type="text" name="address" placeholder="Địa chỉ" >
    <input  value="${customer.status}" type="hidden" name="status" placeholder="trạng thái" >
    <button type="submit">Save</button>
</form>
</body>
</html>
