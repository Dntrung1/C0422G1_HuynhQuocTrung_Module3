<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/5/2022
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chỉnh sửa dịch vụ</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist\css\bootstrap.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<div>
    <nav class="navbar navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="data:image/jpeg;base64,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"
                     alt="" width="40" height="25" class="d-inline-block align-text-top">
                FURAMA
            </a>
        </div>
    </nav>
</div>
<div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#id1">Giới thiệu</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Ẩm thực</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Sự kiện</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Danh sách
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Danh sách nhân viên</a></li>
                            <li><a href="/Furama?action=listCustomer" class="dropdown-item" href="#">Danh sách khách hàng</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a href="/Furama?action=listService" class="dropdown-item" href="#">Danh sách dịch vụ</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<h2 class="text-center mt-3">UPDATE SERVICE</h2>
<form action="/Furama?action=update" method="post" class="shadow w-50 container-fluid mt-3">
    <input type="hidden" id="code" value="${facility.code}" name="code">
    <input type="hidden" name="id" value="${facility.idService}">
    <input value="${facility.name}" class="form-control" type="text" aria-label="Disabled input example" name="name" placeholder="tên">
    <input value="${facility.area}" class="form-control" type="number" aria-label="Disabled input example" name="area" placeholder="diện tích">
    <input value="${facility.cost}" class="form-control" type="number" aria-label="Disabled input example" name="cost"
           placeholder="chi phí thuê">
    <input value="${facility.maxPeople}" class="form-control" type="number" aria-label="Disabled input example" name="maxPeople"
           placeholder="Số người tối đa">
    <input value="${facility.rentTypId}" class="form-control" type="text" aria-label="Disabled input example"  name="rentTypId"
           placeholder="kiểu thuê">
    <input value="${facility.standardRoom}" class="form-control" type="text" aria-label="Disabled input example" id="standardRoom" style="display: none"
           name="standardRoom" placeholder="tiêu chuẩn phòng">
    <input value="${facility.descriptionOtherConvenience}" class="form-control" type="text" aria-label="Disabled input example" id="descriptionOtherConvenience"
           style="display: none" name="descriptionOtherConvenience"
           placeholder="mô tả tiện nghi khác">
    <input value="${facility.poolArea}" class="form-control" type="number" aria-label="Disabled input example" id="poolArea" style="display: none"
           name="poolArea" placeholder="diện tích hồ bơi">
    <input value="${facility.numberOfFloors}" class="form-control" type="number" aria-label="Disabled input example" id="numberOfFloors"
           style="display: none" name="numberOfFloors" placeholder="Số tầng">
    <input value="${facility.facilityFree}" class="form-control" type="text" aria-label="Disabled input example" id="facilityFree" style="display: none"
           name="facilityFree" placeholder="dịch vụ miễn phí đi kèm">
    <button type="submit">Save</button>
    <script>
        window.onload = function() {
            let code =  document.getElementById("code").value;
            display(code)
        };
        function display() {
            let value = document.getElementById("code").value;
            let standardRoom = document.getElementById("standardRoom");
            let descriptionOtherConvenience = document.getElementById("descriptionOtherConvenience");
            let poolArea = document.getElementById("poolArea");
            let numberOfFloors = document.getElementById("numberOfFloors");
            let facilityFree = document.getElementById("facilityFree");
            switch (value) {
                case "1":
                    standardRoom.style.display = "block"
                    descriptionOtherConvenience.style.display = "block"
                    poolArea.style.display = "block"
                    numberOfFloors.style.display = "block"
                    facilityFree.style.display = "none"
                    document.getElementById("facilityFree").value = "";
                    break;
                case "2":
                    standardRoom.style.display = "none"
                    document.getElementById("standardRoom").value = "";
                    descriptionOtherConvenience.style.display = "none"
                    document.getElementById("descriptionOtherConvenience").value = "";
                    poolArea.style.display = "none"
                    document.getElementById("poolArea").value = 0;
                    numberOfFloors.style.display = "none"
                    document.getElementById("numberOfFloors").value = 0;
                    facilityFree.style.display = "block"
                    break;
                case "3":
                    standardRoom.style.display = "block"
                    descriptionOtherConvenience.style.display = "block"
                    poolArea.style.display = "none"
                    document.getElementById("poolArea").value = 0;
                    numberOfFloors.style.display = "block"
                    facilityFree.style.display = "none"
                    document.getElementById("poolArea").value = "";
                    break;
            }
        }
    </script>
</form>
</body>
</html>
