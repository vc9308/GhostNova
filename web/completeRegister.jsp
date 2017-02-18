<%--
  Created by IntelliJ IDEA.
  User: victor
  Date: 6/12/16
  Time: 4:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ghostNova.user.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ghost Nova - 完成注册</title>
    <link rel="icon" href="logo/sm-logo.jpg">
</head>
<body>
<%
    String userId = new String();
    String password = new String();
    String email = new String();

    try {
        userId = request.getParameter("userId");
        password = request.getParameter("password");
        email = request.getParameter("email");

        User user = new User();
        UserDAO dao = UserDAOFactory.getUserDAOInstance();

        user.setUserId(userId);
        user.setPassword(password);
        user.setEmail(email);

        dao.insert(user);
        out.println("<div class='container center-block' style='padding-top: 5%; width: 400px'>");
        out.println("<div class='panel panel-success'>");
        out.println("<div class='panel-body'>");
        out.println("现在和我们在一起了");
        out.println("</div>");
        out.println("</div>");
        out.println("</div>");
        response.setHeader("Refresh", "1;URL=index.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
