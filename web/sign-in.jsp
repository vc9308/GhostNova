<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no"/>
    <title>Ghost Nova - Sign In</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" href="logo/sm-logo.jpg">
    <style>
        body {
            padding-top: 125px;
            font-family: "Ubuntu"
        }

        a.sm-label:link, a.sm-label:active, a.sm-label:visited {
            text-decoration: none;
            color: darkgray;
        }

        a.sm-label:hover {
            color: white
        }

        .navbar {
            padding-left: 20px;
            padding-right: 25px;
        }

        .welcome {
            font-size: xx-large;
        }

        .container {
            width: 450px;
            line-height: 120%;
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
            var totalWidth = document.documentElement.clientWidth;
            hideSomething();
            formResize();
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
        });
        window.onresize = function () {
            hideSomething();
            formResize();
        };
        function hideSomething() {
            var totalWidth = document.documentElement.clientWidth;
            if (totalWidth >= 768) {
                document.getElementById("sm-navbar").style = "display: none;";
                document.getElementById("bg-navbar").style = "display: block;";
            }
            else {
                document.getElementById("sm-navbar").style = "display: block;";
                document.getElementById("bg-navbar").style = "display: none;";
            }
        }
        function formResize() {
            var totalHeight = document.documentElement.clientHeight;
            if (totalHeight < 600) {
                document.body.style = "padding-top : 100px";
                document.getElementById("footer").style = "display : none;"
            }
            else {
                document.body.style = "padding-top : 125px";
                document.getElementById("footer").style = "display : block;"
            }
            if (totalHeight < 600) {
                document.body.style = "padding-top : 100px";
                document.getElementById("footer").style = "display : none;"
            }
            else {
                document.body.style = "padding-top : 125px";
                document.getElementById("footer").style = "display : block;"
            }
        }
    </script>
</head>
<body>
<nav id="bg-navbar" class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="navbar-header">
        <a href="index.jsp" class="navbar-brand">Ghost Nova</a>
    </div>
    <ul class="nav navbar-nav">
        <li class="active"><a href="index.jsp">搜索</a></li>
        <li><a href="about.jsp">关于</a></li>
        <li><a href="help.jsp">帮助</a></li>
    </ul>
    <ul id="sign-bar" class="nav navbar-nav navbar-right">
        <li><a href="register.jsp">创建用户</a>
        <li><a href="sign-in.jsp">登陆</a>
    </ul>
    <ul id="whoami" class="nav navbar-nav navbar-right">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%= userId %>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="account/cart.jsp">购物车</a></li>
                <li><a href="account/orders.jsp?who=seller">订单</a></li>
                <li><a href="account/wishlist.jsp">许愿单</a></li>
                <li><a href="account/myProduct.jsp">商品</a></li>
            </ul>
        </li>
        <li><a href="sign-out.jsp">退出登陆</a></li>
    </ul>
</nav>
<nav id="sm-navbar" class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <a href="index.jsp" class="navbar-brand">Ghost Nova</a>
    <span style="position: relative; top: 15px;">
        <a class="sm-label" href="index.jsp">搜索</a>&nbsp;|&nbsp;
        <a class="sm-label" id="about" href="about.jsp">关于</a>&nbsp;|&nbsp;
        <a class="sm-label" id="help" href="help.jsp">帮助</a>&nbsp;|&nbsp;
    </span>
    <span id="sm-sign-bar" style="position: relative; top: 15px">
        <a class="sm-label" href="register.jsp">创建用户</a>&nbsp;|&nbsp;
        <a class="sm-label" href="sign-in.jsp">登陆</a>
    </span>
    <span id="sm-whoami" style="position: relative; top: 15px">
        <span class="dropdown">
            <a class="sm-label" class="dropdown-toggle" data-toggle="dropdown" href="#"><%= userId %>
                <span class="caret"></span>
            </a>
            <ul class="sm-label" class="dropdown-menu">
                <li><a href="account/cart.jsp">购物车</a></li>
                <li><a href="account/orders.jsp?who=seller">订单</a></li>
                <li><a href="account/wishlist.jsp">许愿单</a></li>
                <li><a href="account/myProduct.jsp">商品</a></li>
            </ul>
        </span>&nbsp;|&nbsp;
        <span><a class="sm-label" href="sign-out.jsp">Sign out</a></span>
    </span>
</nav>
<div class="container">
    <form class="center-block" action="confirm.jsp" method="post">
        <input name="referrer" type="hidden" value="<%= request.getHeader("referer") %>">
        <div class="welcome">登陆</div>
        <br><br><br>
        <input id="userId" name="userId" type="text" class="form-control input-lg" placeholder="ID"
               autofocus="autofocus"/><br><br>
        <input id="password" name="password" type="password" class="form-control input-lg" placeholder="Password"/><br>
        <div style="text-align: center" class="checkbox">
            <label>
                <input name="beRemember" type="checkbox"><span style="font-size: 20px">记住用户名和密码</span>
            </label>
        </div>
        <div style="text-align: center">
            <a style="font-size: 14px" href="look4psw.html">忘记了密码</a>
        </div>
        <br><br>
        <button type="submit" class="btn btn-success btn-lg btn-block">登陆</button>
    </form>
</div>
<div id="footer" class="myfooter navbar navbar-fixed-bottom">
    <p>Discovery anything with Ghost Nova</p>
</div>
</body>
</html>