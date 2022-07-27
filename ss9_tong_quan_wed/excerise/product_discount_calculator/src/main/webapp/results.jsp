<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/27/2022
  Time: 2:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist\css\bootstrap.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 text-center bg-dark text-white">
            <h1>Kết quả</h1>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6">
            <span class="d-block p-2 bg-primary text-white">Lượng chiết khấu: ${discountAmount} </span>
        </div>
        <div class="col-lg-6">
            <span class="d-block p-2 bg-secondary text-white">Giá sau chiết khấu là: ${discountPrice} </span>
        </div>
    </div>
</div>
<script src="bootstrap-5.0.2-dist\js\bootstrap.js"></script>
</body>
</html>
