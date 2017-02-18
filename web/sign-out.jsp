<%--
  Created by IntelliJ IDEA.
  User: victor
  Date: 6/5/16
  Time: 9:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ghost Nova - Sign Out</title>
    <link rel="icon" href="logo/sm-logo.jpg">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script>
        $(document).ready(function () {
            location.replace(document.referrer);
        })
    </script>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies !=  null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userId")) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                return;
            }
        }
    }
%>
</body>
</html>
