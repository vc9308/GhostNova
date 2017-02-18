<%--
  Created by IntelliJ IDEA.
  User: victor
  Date: 6/5/16
  Time: 4:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="com.ghostNova.user.*" %>
<%@ page import="com.sun.org.apache.bcel.internal.generic.DDIV" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ghost Nova - 身份验证</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" href="logo/sm-logo.jpg">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-2.2.4.min.js"></script>
</head>
<body>
<%
    String userId = null;
    String password = null;
    String referrer = null;

    userId = request.getParameter("userId");
    password = request.getParameter("password");
    referrer = request.getParameter("referrer");

    if (userId == "") {
        out.print("Input your ID.");
        response.setHeader("Refresh", "2;URL=sign-in.jsp");
    } else if (password == "") {
        out.print("Input the password.");
        response.setHeader("Refresh", "2;URL=sign-in.jsp");
    } else {
        User user = new User();
        user.setUserId(userId);
        user.setPassword(password);
        UserDAO dao = UserDAOFactory.getUserDAOInstance();
        boolean is_Pass = dao.confirm(user.getUserId(), user.getPassword());
        if (is_Pass) {
            Cookie cookie = new Cookie("userId", userId);
            if (request.getParameter("beRemember") == null) {
                cookie.setMaxAge(60 * 60);
            } else {
                cookie.setMaxAge(24 * 60 * 60);
            }
            response.addCookie(cookie);
            out.println("<div class='container center-block' style='padding-top: 5%; width: 400px'>");
            out.println("<div class='panel panel-success'>");
            out.println("<div class='panel-body'>");
            out.println("登陆成功");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");
%>
<script>setTimeout("location.replace('<%= referrer %>')", 1000)</script>
<%
        } else {
            out.println("<div class='container center-block' style='padding-top: 5%; width: 400px'>");
            out.println("<div class='panel panel-danger'>");
            out.println("<div class='panel-heading'>Error</div>");
            out.println("<div class='panel-body'>");
            out.println("你的用户名或密码有误，请重新输入");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");
            response.setHeader("Refresh", "1;URL=sign-in.jsp");
        }
    }
%>
</body>
</html>
