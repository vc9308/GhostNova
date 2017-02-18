<%@ page import="com.ghostNova.product.ProductDAO" %>
<%@ page import="com.ghostNova.product.ProductDAOFactory" %>
<%@ page import="com.ghostNova.product.Product" %>
<%--
  Created by IntelliJ IDEA.
  User: victor
  Date: 6/13/16
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ghost Nova - 商品</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" href="logo/sm-logo.jpg">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<style>
    body {
        font-family: Ubuntu;
    }

    .glyphicon {
        position: relative;
        top: -1px;
    }

    a.sm-label:link, a.sm-label:active, a.sm-label:visited {
        text-decoration: none;
        color: darkgray;
    }

    a.sm-label:hover {
        color: white
    }

    .search-btn {
        margin-left: -8px;
    }

    .navbar {
        padding-left: 20px;
        padding-right: 25px;
    }

    .label {
        color: gray;
    }

    .myfooter {
        background-color: black;
        color: darkgray;
        padding-top: 20px;
        padding-bottom: 10px;
        margin-top: 20px;
        text-align: center;
    }

    .productImage {
        width: 200px;
    }
</style>
<script>
    $(document).ready(function () {
        hideFooter();
        bodyResize();
        hideSomething();
        <%
            String productId = request.getParameter("productId");
            Product product = new Product();
            product.setProductId(productId);
            ProductDAO dao = ProductDAOFactory.getProductDAOInstance();
            product = dao.queryByProductId(productId);

            String userId = "";
            boolean hasSigned = false;
            Cookie[] cookies = request.getCookies();
            if (cookies !=  null) {
                for (Cookie cookie: cookies) {
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
    function bodyResize() {
        var totalWidth = document.documentElement.clientWidth;
        var search_bar = document.getElementById("search-bar");
        if (totalWidth > 1500) {
            document.body.style = "padding-top: 100px;padding-left: 125px;padding-right: 190px";
            search_bar.size = 60;
        }
        else if (totalWidth > 1300) {
            document.body.style = "padding-top: 100px;padding-left: 105px;padding-right: 165px";
            search_bar.size = 50;
        }
        else if (totalWidth > 1100) {
            document.body.style = "padding-top: 100px;padding-left: 95px;padding-right: 145px";
            search_bar.size = 40;
        }
        else if (totalWidth > 900) {
            document.body.style = "padding-top: 100px;padding-left: 85px; padding-right: 115px";
            search_bar.size = 25;
        }
        else if (totalWidth > 800) {
            document.body.style = "padding-top: 100px;padding-left: 65px; padding-right: 95px";
            search_bar.size = 11;
        }
        else if (totalWidth > 700) {
            document.body.style = "padding-top: 150px;padding-left: 55px; padding-right: 75px";
            search_bar.size = 11;
        }
        else if (totalWidth > 600) {
            document.body.style = "padding-top: 150px;padding-left: 45px; padding-right: 60px";
        }
        else if (totalWidth > 500) {
            document.body.style = "padding-top: 150px;padding-left: 35px; padding-right: 40px";
        }
        else if (totalWidth > 400) {
            document.body.style = "padding-top: 150px;padding-left: 25px; padding-right: 20px";
        }
        else {
            document.body.style = "padding-top: 150px;padding-left: 10px; padding-right: 5px";
        }
    }
    window.onresize = function () {
        hideFooter();
        hideSomething();
        bodyResize();
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
    function hideFooter() {
        var containerHeight = document.getElementById("product-container").clientHeight;
        if (containerHeight > 420) {
            document.getElementById("myfooter").className = "myfooter";
        }
        else {
            document.getElementById("myfooter").className = "navbar navbar-fixed-bottom myfooter";
        }
    }
</script>
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
    <form class="navbar-form navbar-left" role="search" action="search.jsp">
        <div class="form-group">
            <input id="search-bar" name="keywords" type="text" class="form-control" size="50px">
            <span class="search-btn">
                        <button type="submit" class="btn btn-default">搜索</button>
                    </span>
        </div>
        <input name="category" value="All" style="display: none;">
        <input name="currentPage" value="1" style="display: none;">
        <input name="view" value="row" style="display: none;">
    </form>
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
            <a class="dropdown-toggle sm-label" data-toggle="dropdown" href="#"><%= userId %>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="account/cart.jsp">购物车</a></li>
                <li><a href="account/orders.jsp?who=seller">订单</a></li>
                <li><a href="account/wishlist.jsp">许愿单</a></li>
                <li><a href="account/myProduct.jsp">商品</a></li>
            </ul>
        </span>&nbsp;|&nbsp;
        <span><a class="sm-label" href="sign-out.jsp">退出登陆</a></span>
    </span>
    <form class="navbar-form navbar-left" role="search" action="search.jsp">
        <div class="form-group">
            <input id="sm-search-bar" name="keywords" type="text" class="form-control" size="50px">
        </div>
        <input name="category" value="All" style="display: none;">
        <input name="currentPage" value="1" style="display: none;">
        <input name="view" value="row" style="display: none;">
    </form>
</nav>
<div id="product-container" class="product-container">
    <div class="media">
        <div class="media-left">
            <img class="productImage" src="/ProductImages/<%= product.getImageName() %>">
        </div>
        <div class="media-body">
            <div style="font-size: x-large;">&nbsp;<%= product.getProductName() %>
            </div>
            <span class="label">&nbsp; by </span><a
                href="shop.jsp?userId=<%= product.getUserId() %>"><%= product.getUserId() %>
        </a>
            <p><span>
                    &nbsp;&nbsp; <span style="color: gold">
                    <%
                        float stars = product.getStars();
                        if (stars < 0.5) {
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location: relative; top: 2px'></span>");
                        } else if (stars >= 0.5 && stars < 1.5) {
                            out.print("<span class='glyphicon glyphicon-star' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location: relative; top: 2px'></span>");
                        } else if (stars >= 1.5 && stars < 2.5) {
                            out.print("<span class='glyphicon glyphicon-star' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location: relative; top: 2px'></span>");
                        } else if (stars >= 2.5 && stars < 3.5) {
                            out.print("<span class='glyphicon glyphicon-star' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location: relative; top: 2px'></span>");
                        } else if (stars >= 3.5 && stars < 4.5) {
                            out.print("<span class='glyphicon glyphicon-star' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location: relative; top: 2px'></span>");
                        } else {
                            out.print("<span class='glyphicon glyphicon-star' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location: relative; top: 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location: relative; top: 2px'></span>");
                        }
                    %>
                    &nbsp;&nbsp; <span class="label">已购买次数: </span><%= product.getTradingTimes() %>
                    </span>
                </span>
            </p>
            <p>
                &nbsp;&nbsp; <span
                    style="color: gray"><%= product.getPayment() %> &nbsp;&nbsp; <%= product.getPrice() %>
                    </span>
            </p>
            <form class="form-inline" action="buy.jsp">
                <input name="customerId" value="<%= userId %>" style="display: none">
                <input name="productId" value="<%= product.getProductId() %>" style="display: none">
                <p>
                    &nbsp; <span class="label">数目: </span>
                    <input name="tradingQuantity" class="form-control" type="number" value="0" min="1"> <span
                        class="label" max="<%= product.getAmount() %>"
                        style="width: 10px">of <%= product.getAmount() %></span>
                </p>
                <p style="position: relative; left: 10px">
                    <button type="button" class="btn btn-warning">放进购物车</button>
                    &nbsp;
                    <button type="submit" class="btn btn-success">现在下单</button>
                </p>
            </form>
        </div>
    </div>
    <br>
    <p class="well">Publish Date: <% String date = product.getPublishDate();
        int spaceLocation = date.indexOf(" ");
        out.print(date.substring(0, spaceLocation)); %> &nbsp;&nbsp; 分类: <%= product.getCategory() %>
    </p>
    <p><%= product.getDescription() %>
    </p>
</div>
<div>
    <br><br><br><br><br>
</div>
<div id="myfooter" class="navbar navbar-fixed-bottom myfooter">
    <p>Discovery anything with Ghost Nova</p>
</div>
</body>
</html>
