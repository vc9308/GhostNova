<%@ page import="com.ghostNova.order.OrderDAO" %>
<%@ page import="com.ghostNova.order.OrderDAOFactory" %>
<%@ page import="com.ghostNova.product.Product" %>
<%@ page import="com.ghostNova.order.Order" %>
<%@ page import="com.ghostNova.product.ProductDAO" %>
<%@ page import="com.ghostNova.product.ProductDAOFactory" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ghost Nova - Your Orders</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="icon" href="logo/sm-logo.jpg">
    <style>
        body {
            padding-top: 125px;
            font-family: "Ubuntu"
        }

        .navbar {
            padding-left: 20px;
            padding-right: 25px;
        }

        .container {
            padding-left: 150px;
            padding-right: 150px;
        }

        [class*="col-"] {
            font-size: small;
        }

        .image-thumbnail {
            width: 120px;
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
            hideFooter();
            hideSomething();
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
            hideFooter();
            hideSomething();
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
            if (totalWidth > 1900) {
            }
            else if (totalWidth > 1800) {
            }
            else if (totalWidth > 1700) {
            }
            else if (totalWidth > 1600) {
            }
            else if (totalWidth > 1500) {
            }
            else if (totalWidth > 1400) {
            }
            else if (totalWidth > 1300) {
            }
            else if (totalWidth > 1200) {
            }
            else if (totalWidth > 1100) {
            }
            else if (totalWidth > 1000) {
            }
            else if (totalWidth > 900) {
            }
            else if (totalWidth > 800) {
            }
            else if (totalWidth > 700) {
            }
            else if (totalWidth > 600) {
            }
            else if (totalWidth > 500) {
            }
            else if (totalWidth > 400) {
            }
            else {
            }
            if (totalWidth > 975) {
            }
            else {
            }
        }
        function hideFooter() {
            var containerHeight = document.getElementById("container").clientHeight;
            if (containerHeight > 450) {
                document.getElementById("myfooter").className = "myfooter";
            }
            else {
                document.getElementById("myfooter").className = "navbar navbar-fixed-bottom myfooter";
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
        <a class="sm-label" href="../register.jsp">创建用户</a>&nbsp;|&nbsp;
        <a class="sm-label" href="../sign-in.jsp">登陆</a>
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
        <span><a href="../sign-out.jsp">Sign out</a></span>
    </span>
</nav>
<div id="container" class="container">
    <div class="row">
        <div class="col-lg-3" style="font-size: 25px">
            你的订单
        </div>
        <div class="col-lg-6 col-lg-offset-3 search-form">
            <form class="form-inline" action="">
                <input type="text" class="form-control">
                <button type="submit" class="btn btn-default">搜索你的订单</button>
            </form>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="dropdown col-lg-2">
            <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button" aria-expanded="true">
                1 month
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li role="presentation"><a role="menuitem" href="#">六个月</a></li>
                <li role="presentation"><a role="menuitem" href="#">一年</a></li>
                <li role="presentation"><a role="menuitem" href="#">一直以来的</a></li>
            </ul>
        </div>
        <div class="col-lg-3 col-lg-offset-7">
            <button class="btn btn-default <% if (request.getParameter("who").equals("buyer")) out.print(" active"); %>" <% if (request.getParameter("who").equals("buyer"))
                out.print(" active"); %>><a href="orders.jsp?who=buyer">买入的</a></button>
            <button class="btn btn-default<% if (request.getParameter("who").equals("seller")) out.print(" active"); %>">
                <a href="orders.jsp?who=seller">卖出的</a></button>
        </div>
    </div>
    <br>
    <%
        OrderDAO dao = OrderDAOFactory.getOrderDAOInstance();
        List<Order> orders = new ArrayList<Order>();
        if (request.getParameter("who").equals("seller")) {
            orders = dao.queryBySellerId(userId);
        } else {
            orders = dao.queryByCustomerId(userId);
        }
        Map<String, List<Order>> index = new HashMap<String, List<Order>>();
        for (Order order : orders) {
            if (index.containsKey(order.getTradingId())) {
                index.get(order.getTradingId()).add(order);
            } else {
                List<Order> listWithTheFirstOrder = new ArrayList<Order>();
                listWithTheFirstOrder.add(order);
                index.put(order.getTradingId(), listWithTheFirstOrder);
            }
        }
        List<Order> myOrders = new ArrayList<Order>();
        myOrders = dao.queryBySellerId(userId);
        Collections.reverse(myOrders);
        for (Order order : myOrders) {
    %>
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <div class="col-lg-2">
                    下单时间<br><%= order.getTradingDate() %>
                </div>
                <div class="col-lg-2">
                    总价<br><%= order.getPayment() %> <%= order.getPrice() %>
                </div>
                <div class="col-lg-1">
                    收件人<br><%= order.getCustomerId() %>
                </div>
                <div class="col-lg-3 col-lg-offset-4">
                    编号#<%= order.getTradingId() %><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">订单详情</a>&nbsp;&nbsp; | &nbsp;&nbsp;
                    <a href="#">打印订单详情</a>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-lg-1 col-lg-offset-1 thumbnail">
                    <a href="">
                        <% Product product = new Product();
                            ProductDAO productDAO = ProductDAOFactory.getProductDAOInstance();
                            product = productDAO.queryByProductId(order.getProductId());
                        %>
                        <img class="image-thumbnail" src="../ProductImages/<%= product.getImageName() %>">
                    </a>
                </div>
                <div class="col-lg-6">
                    <h5><%= product.getProductName() %>
                    </h5>
                    <%
                        if (product.getDescription().length() > 100) {
                            out.print(product.getDescription().substring(0, 100) + " ...");
                        } else {
                            out.print(product.getDescription());
                        }
                    %>
                </div>
                <div class="col-lg-3 col-lg-offset-1">
                    <button class="btn btn-default btn-block"><a href="">写下评测</a></button>
                    <br>
                    <button class="btn btn-default btn-block"><a href="">隐藏订单</a></button>
                </div>
            </div>
        </div>
    </div>
    <br>
    <% } %>
</div>
<br><br>
<div id="myfooter" class="myfooter">
    <p>Discovery anything with Ghost Nova</p>
</div>
</body>
</html>
