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
    <title>Title</title>
</head>
<body>
<form action="/Furama?action=update" method="post">
    <input type="text" disabled value="${code}" name="code">
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
        function display() {
            let value = document.getElementById("selectService").value;
            let standardRoom = document.getElementById("standardRoom");
            let descriptionOtherConvenience = document.getElementById("descriptionOtherConvenience");
            let poolArea = document.getElementById("poolArea");
            let numberOfFloors = document.getElementById("numberOfFloors");
            let facilityFree = document.getElementById("facilityFree");
            switch () {
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
