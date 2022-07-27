<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/27/2022
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist\css\bootstrap.css">
</head>
<body>
<form action="/caculate" method="post">
    <div class="text-center bg-dark text-white">
        <H3 class="p-2">Trang tính chiết khấu</H3>
    </div>
    <div class="container-fluid m-2">
        <div class="input-group input-group-lg">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-lg">Product Description</span>
            </div>
            <input type="text" name="Description" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm">
        </div>
    </div>
    <div class="container-fluid m-2">
        <div class="input-group input-group-lg">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-lg1">List Price</span>
            </div>
            <input type="number" name="Price" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm">
        </div>
    </div>
    <div class="container-fluid m-2">
        <div class="input-group input-group-lg">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-lg2">Discount Percent</span>
            </div>
            <input type="number" name="Discount" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm">
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-10"></div>
            <div class="col-lg-2">
                <button type="submit" class="btn btn-outline-dark justify-content-end">TÍnh</button>
            </div>
        </div>
    </div>
</form>
<script src="bootstrap-5.0.2-dist\js\bootstrap.js"></script>
</body>
</html>
