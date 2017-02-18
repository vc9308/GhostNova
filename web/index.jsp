<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ghost Nova</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" href="logo/sm-logo.jpg">
    <style>
        body {
            padding-top: 50px;
            font-family: Ubuntu;
        }

        a:link, a:hover, a:visited {
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

        .moile_navbar {
            padding-left: 5px;
            padding-right: 5px;
        }

        .index-hero {
            background-image: url("images/bg-index-hero.jpg");
            background-repeat: repeat;
            background-position: center;
        }

        .start {
            padding: 50px 50px;
            text-align: center;
            color: white;
        }
    </style>
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            checkInput();
            hideSomething();
            changeDivHeight();
            <%
                String userId = "";
                boolean hasSigned = false;
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
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
                    out.println("document.getElementById(\"publishWithoutAccount\").style.display=\"none\";");
                }
                else {
                    out.println("document.getElementById(\"whoami\").style.display=\"none\";");
                    out.println("document.getElementById(\"sm-whoami\").style.display=\"none\";");
                    out.println("document.getElementById(\"publishWithAccount\").style.display=\"none\";");
                }
            %>
        });
        window.onresize = function () {
            changeDivHeight();
            hideSomething();
        }
        function changeDivHeight() {
            var totalHeight = document.documentElement.clientHeight;
            $(".index-hero").css({'height': totalHeight - 50 + 'px'});
        }
        function hideSomething() {
            var logo_image = document.getElementById("logo_img");
            var userAgent = navigator.userAgent.toLowerCase();
            var isIpad = userAgent.match(/ipad/i) == "ipad";
            var isIphoneOs = userAgent.match(/iphone os/i) == "iphone os";
            var isMidp = userAgent.match(/midp/i) == "midp";
            var isUc7 = userAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
            var isUc = userAgent.match(/ucweb/i) == "ucweb";
            var isAndroid = userAgent.match(/android/i) == "android";
            var isCE = userAgent.match(/windows ce/i) == "windows ce";
            var isWM = userAgent.match(/windows moile/i) == "windows moile";
            if ((isIphoneOs || isMidp || isUc7 || isUc || isAndroid || isCE || isWM)){
                document.getElementById("sm-navbar").style = "display: block;";
                document.getElementById("bg-navbar").style = "display: none;";
                logo_image.style.width = 300 + "px";
                if (totalWidth <= 450) {
                    document.getElementById("sm-navbar").style = "padding-left: 1px; padding-right: 1px;";
                    logo_image.style.width = 300 + "px";
                }
            }
            else {
                var totalWidth = document.documentElement.clientWidth;
                if (totalWidth >= 768) {
                    document.getElementById("sm-navbar").style = "display: none;";
                    document.getElementById("bg-navbar").style = "display: block;";
                    logo_image.style.width = 400 + "px";
                }
                else {
                    document.getElementById("sm-navbar").style = "display: block;";
                    document.getElementById("bg-navbar").style = "display: none;";
                    logo_image.style.width = 300 + "px";
                    if (totalWidth <= 450) {
                        document.getElementById("sm-navbar").style = "padding-left: 1px; padding-right: 1px;";
                        logo_image.style.width = 300 + "px";
                    }
                }
            }
        }
        function checkInput() {
            var keywordsInput = document.getElementById("keywords").value;
            if (keywordsInput == "") {
                document.getElementById("submit").disabled = true;
            }
            else {
                document.getElementById("submit").disabled = false;
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
        <a href="index.jsp">Search</a>&nbsp;|&nbsp;
        <a id="about" href="about.jsp">关于</a>&nbsp;|&nbsp;
        <a id="help" href="help.jsp">帮助</a>&nbsp;|&nbsp;
    </span>
    <span id="sm-sign-bar" style="position: relative; top: 15px">
        <a href="register.jsp">创建用户</a>&nbsp;|&nbsp;
        <a href="sign-in.jsp">登陆</a>
    </span>
    <span id="sm-whoami" style="position: relative; top: 15px">
        <span class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%= userId %>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="account/cart.jsp">购物车</a></li>
                <li><a href="account/orders.jsp?who=seller">订单</a></li>
                <li><a href="account/wishlist.jsp">许愿单</a></li>
                <li><a href="account/myProduct.jsp">商品</a></li>
            </ul>
        </span>&nbsp;|&nbsp;
        <span><a href="sign-out.jsp">退出登陆</a></span>
    </span>
</nav>
<section class="index-hero">
    <div class="container">
        <div class="start">
            <div class="logo"><img id="logo_img" src="logo/White-Logo-Large.png"></div>
            <br>
            <form id="search-form" action="search.jsp?">
                <div class="row" role="search">
                    <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1">
                        <input id="keywords" type="search" name="keywords" class="form-control col-md-1 input-lg"
                               placeholder="在这里进入奇幻世界" autofocus="autofocus" oninput="checkInput()">
                    </div>
                </div>
                <br><br>
                <div class="row">
                    <button id="submit" type="submit"
                            class="submit btn btn-success btn-lg col-lg-1 col-lg-offset-4 col-md-2 col-md-offset-3">搜索
                    </button>
                    <div class="col-md-1" style="font-size: 30px">or</div>
                    <button id="publishWithoutAccount" type="button" class="btn btn-warning btn-lg col-lg-2 col-md-3"
                            onclick="location='sign-in.jsp'" style="color: white">分享给大家
                    </button>
                    <button id="publishWithAccount" type="button" class="btn btn-warning btn-lg col-lg-2 col-md-3"
                            onclick="location='account/publish.jsp'" style="color: white">分享给大家
                    </button>
                </div>
                <input name="category" value="All" style="display: none;">
                <input name="currentPage" value="1" style="display: none">
                <input name="view" value="row" style="display: none">
            </form>
        </div>
    </div>
</section>
</body>
</html>
