<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/5/2022
  Time: 9:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist\css\bootstrap.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<form action="/Furama?action=add" method="post">
    <select class="form-select" aria-label="Default select example" name="code" id="selectService" onchange="display()">
        <option selected>Loại dịch vụ</option>
        <option value="1">Villa</option>
        <option value="2">Room</option>
        <option value="3">House</option>
    </select>
    <input class="form-control" type="text" aria-label="Disabled input example" name="name" placeholder="tên">
    <input class="form-control" type="number" aria-label="Disabled input example" name="area" placeholder="diện tích">
    <input class="form-control" type="number" aria-label="Disabled input example" name="cost"
           placeholder="chi phí thuê">
    <input class="form-control" type="number" aria-label="Disabled input example" name="maxPeople"
           placeholder="Số người tối đa">
    <input class="form-control" type="text" aria-label="Disabled input example"  name="rentTypId"
           placeholder="kiểu thuê">
    <input class="form-control" type="text" aria-label="Disabled input example" id="standardRoom" style="display: none"
           name="standardRoom" placeholder="tiêu chuẩn phòng">
    <input class="form-control" type="text" aria-label="Disabled input example" id="descriptionOtherConvenience"
           style="display: none" name="descriptionOtherConvenience"
           placeholder="mô tả tiện nghi khác">
    <input class="form-control" type="number" aria-label="Disabled input example" id="poolArea" style="display: none"
           name="poolArea" placeholder="diện tích hồ bơi">
    <input class="form-control" type="number" aria-label="Disabled input example" id="numberOfFloors"
           style="display: none" name="numberOfFloors" placeholder="Số tầng">
    <input class="form-control" type="text" aria-label="Disabled input example" id="facilityFree" style="display: none"
           name="facilityFree" placeholder="dịch vụ miễn phí đi kèm">
    <button type="submit">Save</button>
    <script>
        function display() {
            let value = document.getElementById("selectService").value;
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
                    // document.getElementById("poolArea").value = 0;
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
    <c:if test="${mess!=null}">
        <p>${mess}</p>
    </c:if>
</form>
</body>
</html>
