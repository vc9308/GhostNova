<%--
  Created by IntelliJ IDEA.
  User: victor
  Date: 6/9/16
  Time: 11:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ghost Nova - Publish</title>
    <link rel="icon" href="logo/sm-logo.jpg">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <style>
        body {
            font-family: Ubuntu;
        }

        a, a:link, a:hover, a:visited {
            text-decoration: none;
            color: darkgray;
        }

        a:hover {
            color: white
        }

        .navbar {
            padding-left: 20px;
            padding-right: 25px;
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
    <script src="../js/jquery-2.2.4.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            hideSomething();
            formResize();
            <%
                String userId = "";
                boolean hasSigned = false;
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("userId")) {
                        userId = cookie.getValue();
                        hasSigned = true;
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
        }
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
            var totalWidth = document.documentElement.clientWidth;
            var totalHeight = document.documentElement.clientHeight;
            var formContainer = document.getElementById("optional-container");
            if (totalWidth > 1900) {
                formContainer.style = "width : 25%";
            }
            else if (totalWidth > 1800) {
                formContainer.style = "width : 27%";
            }
            else if (totalWidth > 1700) {
                formContainer.style = "width : 29%";
            }
            else if (totalWidth > 1600) {
                formContainer.style = "width : 32%";
            }
            else if (totalWidth > 1500) {
                formContainer.style = "width : 36%";
            }
            else if (totalWidth > 1400) {
                formContainer.style = "width : 40%";
            }
            else if (totalWidth > 1300) {
                formContainer.style = "width : 45%";
            }
            else if (totalWidth > 1200) {
                formContainer.style = "width : 50%";
            }
            else if (totalWidth > 1100) {
                formContainer.style = "width : 55%";
            }
            else if (totalWidth > 1000) {
                formContainer.style = "width : 60%";
            }
            else if (totalWidth > 900) {
                formContainer.style = "width : 65%";
            }
            else if (totalWidth > 800) {
                formContainer.style = "width : 70%";
            }
            else if (totalWidth > 700) {
                formContainer.style = "width : 75%";
            }
            else if (totalWidth > 600) {
                formContainer.style = "width : 80%";
            }
            else if (totalWidth > 500) {
                formContainer.style = "width : 85%";
            }
            else if (totalWidth > 400) {
                formContainer.style = "width : 90%";
            }
            else {
                formContainer.style = "width : 95%";
            }
            if (totalWidth > 975) {
                document.getElementById("magicalBreak").style = "display : none;";
            }
            else {
                document.getElementById("magicalBreak").style = "display : block;";
            }
            if (totalHeight < 600) {
                document.body.style = "padding-top : 60px";
                document.getElementById("footer").style = "display : none;"
            }
            else {
                document.body.style = "padding-top : 75px";
                document.getElementById("footer").style = "display : block;"
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
    <a href="../index.jsp" class="navbar-brand">Ghost Nova</a>
    <span style="position: relative; top: 15px;">
        <a class="sm-label" href="../index.jsp">搜索</a>&nbsp;|&nbsp;
        <a class="sm-label" id="about" href="../about.jsp">关于</a>&nbsp;|&nbsp;
        <a class="sm-label" id="help" href="../help.jsp">帮助</a>&nbsp;|&nbsp;
    </span>
    <span id="sm-sign-bar" style="position: relative; top: 15px">
        <a class="sm-label" href="register.jsp">创建用户</a>&nbsp;|&nbsp;
        <a class="sm-label" href="sign-in.jsp">登陆</a>
    </span>
    <span id="sm-whoami" style="position: relative; top: 15px">
        <span class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%= userId %>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="cart.jsp">购物车</a></li>
                <li><a href="orders.jsp?who=seller">订单</a></li>
                <li><a href="wishlist.jsp">许愿单</a></li>
                <li><a href="myProduct.jsp">商品</a></li>
            </ul>
        </span>&nbsp;|&nbsp;
        <span><a href="../sign-out.jsp">退出登陆</a></span>
    </span>
</nav>
<div id="optional-container" class="center-block">
    <form class="form" action="/publishProduct" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <div class="col-lg-9 col-md-9">
                <label for="name">商品名 </label>
                <input id="name" name="name" class="form-control" type="text">
            </div>
            <div id="magicalBreak">&nbsp;</div>
            <div class="col-lg-3 col-md-3">
                <label for="categories">分类 </label>
                <select id="categories" name="categories" class="form-control">
                    <option>Softwares</option>
                    <option>Code</option>
                    <option>Books</option>
                    <option>Pages</option>
                    <option>Songs</option>
                    <option>Videos</option>
                </select>
            </div>
        </div>
        <div>&nbsp;</div>
        <div class="form-group">
            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-8">
                <label for="price" class="control-label">价格 </label>
                <div class="input-group">
                    <span class="input-group-addon">$</span>
                    <input id="price" name="price" class="form-control" size="100px" value="0.00">
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-4">
                <label for="payment">支付方式 </label>
                <select id="payment" name="payment" class="form-control">
                    <option>Free</option>
                    <option>Bit Coin</option>
                    <option>US Dollar</option>
                    <option>RMB</option>
                </select>
            </div>
        </div>
        <div>&nbsp;</div>
        <div class="form-group">
            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-8">
                <label for="upload">用图片展示你的商品 </label>
                <input id="upload" name="upload" class="btn btn-default form-control" type="file">
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-4">
                <label for="amount" class="control-label">数目</label>
                <input id="amount" name="amount" class="form-control" type="number" value="0">
            </div>
        </div>
        <div>&nbsp;</div>
        <div class="form-group" style="padding-left: 15px; padding-right: 15px">
            <label for="description">描述 </label>
            <textarea id="description" class="form-control" name="description" rows="30" cols="20"></textarea>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <button type="submit" class="btn btn-block btn-default">上架</button>
        </div>
    </form>
</div>
<div><p>&nbsp;</p></div>
<div id="footer" class="myfooter">
    <p>Discovery anything with Ghost Nova</p>
</div>
</body>
</html>
