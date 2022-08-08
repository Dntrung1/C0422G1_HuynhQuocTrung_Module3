<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/8/2022
  Time: 6:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="bootstrap-5.0.2-dist\css\bootstrap.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top" style="margin: 5px">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item mx-3 hover-item">
          <a class="nav-link" href="/" style="font-size: 30px; margin-left: 80px">Home</a>
        </li>
        <li class="nav-item hover-item">
          <a class="nav-link " href="/Furama?action=listEmployee" style="font-size: 30px; padding-left: 30px">Employee</a>
        </li>
        <li class="nav-item hover-item" >
          <a class="nav-link " href="/Furama?action=listCustomer" style="font-size: 30px; padding-left: 30px">Customer</a>
        </li>
        <li class="nav-item hover-item" >
          <a class="nav-link " href="/Furama?action=listService" style="font-size: 30px; padding-left: 30px">Service</a>
        </li>
      </ul>
      <form class="d-flex" style="position: relative" action="#" method="post">
        <input class="form-control rounded-pill" name="employeeName" id="demo-2" type="search" placeholder="Search employee name" aria-label="Search" style="width: 300px; height: 30px; margin-left: 100px; margin-top: 15px">
      </form>
    </div>
  </div>
</nav>
<div class="container-fluid">
  <div class="row">
    <div class="col-lg-12" style="background-image: url('https://trungtaminan.com.vn/wp-content/uploads/2020/06/background-in-an-2-1536x1152.jpg'); height: 400px">
      <div class="row">
        <div class="col-lg-12">
          <input type="hidden" name="action" value="list-contract">
          <center>
            <h1>Danh sách hợp đồng</h1>
            <h2>
              <a class="btn bg-primary" href="#">Thêm mới hợp đồng</a>
              <caption><h2>List of Contract</h2></caption>
            </h2>
          </center>
          <div align="center">
              <table class="table table-striped">
                <tr style="text-align: center">
                  <th>ID</th>
                  <th>Start day</th>
                  <th>End day</th>
                  <th>Deposit</th>
                  <th>Total</th>
                  <th>Employee name</th>
                  <th>Customer name</th>
                  <th>Service name</th>
                </tr>
              <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
              </tr>
              </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <footer class="bg-light text-center text-lg-start">

    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
      © 2022 Copyright:
      <a class="text-dark" href="https://mdbootstrap.com/">103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District, Danang City, Vietnam</a>
    </div>
  </footer>
</div>
</body>
</html>
