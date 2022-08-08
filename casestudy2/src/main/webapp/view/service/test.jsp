<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/8/2022
  Time: 4:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist\css\bootstrap.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Features</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Pricing</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown link
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<h2 class="text-center mt-3">ADD NEW SERVICE</h2>
<form action="/Furama?action=add" method="post" class="p-5  shadow w-50 container-fluid mt-3">
    <select class="form-select" aria-label="Default select example" name="code" id="selectService"
            onchange="displayInput()">
        <option selected value="none">Loại dịch vụ</option>
        <option value="1">Villa</option>
        <option value="2">Room</option>
        <option value="3">House</option>
    </select>

    <div class="mb-3 mt-3">
        <label for="name" class="form-label">Tên:</label>
        <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
    </div>
    <div style="color: red">
        ${name}
    </div>
    <div class="mb-3 mt-3">
        <label for="area" class="form-label">Diện tích:</label>
        <input type="number" class="form-control" id="area" placeholder="Enter area" name="area">
    </div>
    <div class="mb-3 mt-3">
        <label for="cost" class="form-label">Chi phí thuê:</label>
        <input type="number" class="form-control" id="cost" placeholder="Enter cost" name="cost">
    </div>
    <div class="mb-3 mt-3">
        <label for="maxPeople" class="form-label">Số người tối đa:</label>
        <input type="number" class="form-control" id="maxPeople" placeholder="Enter maxPeople" name="maxPeople">
    </div>
    <div class="mb-3 mt-3">
        <label for="rentTypId" class="form-label">Kiểu thuê:</label>
        <input type="number" class="form-control" id="rentTypId" placeholder="Enter rentTypId" name="rentTypId">
    </div>

    <div class="mb-3 mt-3" style="display: none" id="divStandardRoom">
        <label for="standardRoom" class="form-label">tiêu chuẩn phòng:</label>
        <input type="text" class="form-control" id="standardRoom" placeholder="Enter standardRoom" name="standardRoom">
    </div>
    <div class="mb-3 mt-3" style="display: none" id="divDescriptionOtherConvenience">
        <label for="descriptionOtherConvenience" class="form-label">mô tả tiện nghi khác:</label>
        <input type="text" class="form-control" id="descriptionOtherConvenience"
               placeholder="Enter descriptionOtherConvenience" name="descriptionOtherConvenience">
    </div>
    <div class="mb-3 mt-3" style="display: none" id="divPoolArea">
        <label for="poolArea" class="form-label">Diện tích hồ bơi:</label>
        <input type="number" class="form-control" id="poolArea" placeholder="Enter poolArea" name="poolArea">
    </div>

    <div class="mb-3 mt-3" style="display: none" id="divNumberOfFloors">
        <label for="numberOfFloors" class="form-label">Số tầng:</label>
        <input type="number" class="form-control" id="numberOfFloors" placeholder="Enter numberOfFloors"
               name="numberOfFloors">
    </div>
    <div style="color: red">
        ${numberOfFloors}
    </div>
    <div class="mb-3 mt-3" style="display: none" id="divFacilityFree">
        <label for="facilityFree" class="form-label">Dịch vụ miễn phí đi kem:</label>
        <input type="text" class="form-control" id="facilityFree" placeholder="Enter facilityFree" name="facilityFree">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>

    <c:if test="${mess!=null}">
        <p>${mess}</p>
    </c:if>
</form>
<script src="/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
<script>
    function displayInput() {
        console.log("Abc")
        let value = document.getElementById("selectService").value;
        let standardRoom = document.getElementById("divStandardRoom");
        let descriptionOtherConvenience = document.getElementById("divDescriptionOtherConvenience");
        let poolArea = document.getElementById("divPoolArea");
        let numberOfFloors = document.getElementById("divNumberOfFloors");
        let facilityFree = document.getElementById("divFacilityFree");
        switch (value) {
            case "1":
                standardRoom.style.display = "block"
                descriptionOtherConvenience.style.display = "block"
                poolArea.style.display = "block"
                numberOfFloors.style.display = "block"
                facilityFree.style.display = "none"
                break;
            case "2":
                standardRoom.style.display = "none"
                descriptionOtherConvenience.style.display = "none"
                poolArea.style.display = "none"
                numberOfFloors.style.display = "none"
                facilityFree.style.display = "block"
                break;
            case "3":
                standardRoom.style.display = "block"
                descriptionOtherConvenience.style.display = "block"
                poolArea.style.display = "none"
                numberOfFloors.style.display = "block"
                facilityFree.style.display = "none"
                break;
            case "none":
                standardRoom.style.display = "none"
                descriptionOtherConvenience.style.display = "none"
                poolArea.style.display = "none"
                numberOfFloors.style.display = "none"
                facilityFree.style.display = "none"
                break;
        }
    }
</script>

</body>
</html>
