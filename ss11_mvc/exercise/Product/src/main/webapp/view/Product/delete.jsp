<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/29/2022
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/Product">Quay lại trang list</a>
<form method="post">
    <table border="1px">
        <tr>
            <th>Id</th>
            <th>name</th>
            <th>price</th>
            <th>describe</th>
            <th>producer</th>
        </tr>
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.describe}</td>
            <td>${product.producer}</td>
        </tr>
    </table>
    <h3>Bạn có muốn xóa k?</h3>
    <button type="submit"> Xóa </button>
</form>
</body>
</html>
