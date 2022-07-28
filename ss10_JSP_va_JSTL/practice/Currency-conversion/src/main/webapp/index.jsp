<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/28/2022
  Time: 9:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/curency-conversion" method="post">
    Rate: <input type="number" name="rate">
    USD: <input type="number" name="amount">
    <button type="submit">Converter</button>
  </form>
  </body>
</html>
