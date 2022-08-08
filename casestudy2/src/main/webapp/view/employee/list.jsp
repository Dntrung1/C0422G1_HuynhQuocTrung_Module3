<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/8/2022
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
        <div class="col-lg-10">
            <div class="row">
                <div class="col-lg-12">
                    <input type="hidden" name="action" value="list-employee">
                    <center>
                        <h1>Danh sách nhan viên</h1>
                    </center>
                    <div align="center">
                            <table border="1" cellpadding="5" style="margin-bottom: 30px">
                                <tr style="text-align: center">
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Day of birth</th>
                                    <th>ID Card</th>
                                    <th>Salary</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Address</th>
                                    <th colspan="2">Action</th>
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

<!-- Modal -->
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirm delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form>
                <input type="hidden" name="action" value="delete-employee">
                <input type="hidden" name="id" value="" id="idEmployeeDelete">
                <div class="modal-body">
                    Bạn có muốn xía? <input id="nameEmployeeDelete" >
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Confirm</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script src="/jquery/jquery-3.5.1.min.js"></script>
<script src="/jquery/popper.min.js"></script>
<script src="/js/bootstrap.js"></script>

<script>
    function onDelete(id, name) {
        document.getElementById("idEmployeeDelete").value = id;
        console.log(name)
        document.getElementById("nameEmployeeDelete").value = name;
    }
</script>
</body>
</html>
