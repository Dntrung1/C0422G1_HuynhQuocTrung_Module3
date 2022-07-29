<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/28/2022
  Time: 2:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="bootstrap-5.0.2-dist\css\bootstrap.css">
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form action="/caculate" method="post">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-5">
                <div>
                    <label for="exampleInputEmail1" class="form-label">Số thứ 1</label>
                    <input type="number" name="first" class="form-control" id="exampleInputEmail1"
                           aria-describedby="emailHelp">
                </div>
            </div>
            <div class="col-lg-2">
                <div>
                    <label for="exampleInputEmail1" class="form-label">Chọn dấu</label>
                    <select class="form-select" name="tinh" aria-label="Default select example">
                        <option value="+">+</option>
                        <option value="-">-</option>
                        <option value="*">*</option>
                        <option value="/">/</option>
                    </select>
                </div>
            </div>
            <div class="col-lg-5">
                <div>
                    <label for="exampleInputEmail1" class="form-label">Số thứ 2</label>
                    <input type="number" name="second" class="form-control" id="exampleInputEmail12"
                           aria-describedby="emailHelp">
                </div>
            </div>
            <div class="row m-2">
                <div class="col-lg-12">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </div>
    </div>
</form>
<div>Kết quả là: ${result}</div>
</body>
</html>
