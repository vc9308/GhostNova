<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ghost Nova - 帮助</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" href="logo/sm-logo.jpg">
    <style>
        body {
            padding-top: 50px;
            font-family: Ubuntu;
        }

        .navbar {
            padding-left: 20px;
            padding-right: 20px;
        }

        a.sm-label:link, a.sm-label:active, a.sm-label:visited {
            color: darkgray;
        }

        a.sm-label:hover {
            color: white;
        }

        .search-btn {
            margin-left: -8px;
        }

        .myfooter {
            background-color: black;
            color: darkgray;
            padding-top: 20px;
            padding-bottom: 10px;
            margin-top: 20px;
            text-align: center;
        }
    </style>
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            hideSomething();
            <%
                String userId = "";
                boolean hasSigned = false;
                Cookie[] cookies = request.getCookies();
                if (cookies !=  null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("userId")) {
                            userId = cookie.getValue();
                            hasSigned = true;
                        }
                    }
                }
                if (hasSigned) {
                    out.println("document.getElementById(\"sign-bar\").style.display=\"none\";");
                    out.println("document.getElementById(\"sm-sign-bar\").style.display=\"none\";");
                }
                else {
                    out.println("document.getElementById(\"whoami\").style.display=\"none\";");
                    out.println("document.getElementById(\"sm-whoami\").style.display=\"none\";");
                }
            %>
        })
        window.onresize = function () {
            hideSomething();
        }
        function hideSomething() {
            var totalWidth = document.documentElement.clientWidth;
            if (totalWidth >= 768) {
                document.getElementById("sm-navbar").style = "display: none;";
                document.getElementById("bg-navbar").style = "display: block;";
                document.body.style = "padding-top : 50px";
            }
            else if (totalWidth >= 474) {
                document.getElementById("sm-navbar").style = "display: block;";
                document.getElementById("bg-navbar").style = "display: none;";
                document.body.style = "padding-top : 100px"
            }
            else {
                document.getElementById("sm-navbar").style = "display: block;";
                document.getElementById("bg-navbar").style = "display: none;";
                document.getElementById("sm-sign-bar").style = "display: none";
                document.getElementById("sm-whoami").style = "display: none";
            }
        }
    </script>
</head>
<body>
<nav id="bg-navbar" class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="navbar-header">
        <a href="../index.jsp" class="navbar-brand">Ghost Nova</a>
    </div>
    <ul class="nav navbar-nav">
        <li class="active"><a href="../index.jsp">搜索</a></li>
        <li><a href="../about.jsp">关于</a></li>
        <li><a href="../help.jsp">帮助</a></li>
    </ul>
    <ul id="sign-bar" class="nav navbar-nav navbar-right">
        <li><a href="../register.jsp">创建用户</a>
        <li><a href="../sign-in.jsp">登陆</a>
    </ul>
    <ul id="whoami" class="nav navbar-nav navbar-right">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%= userId %>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="cart.jsp">购物车</a></li>
                <li><a href="orders.jsp?who=seller">订单</a></li>
                <li><a href="wishlist.jsp">许愿单</a></li>
                <li><a href="myProduct.jsp">商品</a></li>
            </ul>
        </li>
        <li><a href="../sign-out.jsp">退出登陆</a></li>
    </ul>
</nav>
<nav id="sm-navbar" class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <a href="index.jsp" class="navbar-brand">Ghost Nova</a>
    <span style="position: relative; top: 15px;">
        <a class="sm-label" href="../index.jsp">搜索</a>&nbsp;|&nbsp;
        <a class="sm-label" id="about" href="../about.jsp">关于</a>&nbsp;|&nbsp;
        <a class="sm-label" id="help" href="../help.jsp">帮助</a>&nbsp;|&nbsp;
    </span>
    <span id="sm-sign-bar" style="position: relative; top: 15px">
        <a class="sm-label" href="../register.jsp">创建用户</a>&nbsp;|&nbsp;
        <a class="sm-label" href="../sign-in.jsp">登陆</a>
    </span>
    <span id="sm-whoami" style="position: relative; top: 15px">
        <span class="dropdown">
            <a class="dropdown-toggle sm-label" data-toggle="dropdown" href="#"><%= userId %>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="cart.jsp">购物车</a></li>
                <li><a href="orders.jsp?who=seller">订单</a></li>
                <li><a href="wishlist.jsp">许愿单</a></li>
                <li><a href="myProduct.jsp">商品</a></li>
            </ul>
        </span>&nbsp;|&nbsp;
        <span><a class="sm-label" href="sign-out.jsp">退出用户</a></span>
    </span>
</nav>
<h2 style="padding-left: 15%; padding-right: 15%; padding-top: 10%">请联络我：<a>vc93@icloud.com</a></h2>
<div id="myfooter" class="navbar navbar-fixed-bottom myfooter">
    <p>Discovery anything with Ghost Nova</p>
</div>
</body>
</html>