<%@ page import="com.ghostNova.product.Product" %>
<%@ page import="com.ghostNova.product.ProductDAO" %>
<%@ page import="com.ghostNova.product.ProductDAOFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%--
  Created by IntelliJ IDEA.
  User: victor
  Date: 6/17/16
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="icon" href="logo/sm-logo.jpg">
    <script src="../js/jquery-2.2.4.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <title>Ghost Nova - My Products</title>
    <style>
        body {
            font-family: Ubuntu;
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

        .myfooter {
            background-color: black;
            color: darkgray;
            padding-top: 20px;
            padding-bottom: 10px;
            margin-top: 20px;
            text-align: center;
        }

        .productImage {
            height: 150px;
        }
    </style>
    <script>
        $(document).ready(function () {
            hideFooter();
            bodyResize();
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
            List<Product> products = new ArrayList<Product>();
            Product product = new Product();
            ProductDAO dao = ProductDAOFactory.getProductDAOInstance();
            products = dao.queryByUserId(userId);
            Collections.sort(products, new Comparator<Product>() {
                @Override
                public int compare(Product o1, Product o2) {
                    return o1.getTradingTimes().compareTo(o2.getTradingTimes());
                }
            });
            Collections.sort(products, new Comparator<Product>() {
                @Override
                public int compare(Product o1, Product o2) {
                    return o1.getStars().compareTo(o2.getStars());
                }
            });
            Collections.reverse(products);

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
                search_bar.size = 60;
            }
            else if (totalWidth > 1300) {
                document.body.style = "padding-top : 100px;padding-left : 105px;padding-right : 155px";
                search_bar.size = 50;
            }
            else if (totalWidth > 1100) {
                document.body.style = "padding-top : 100px;padding-left : 90px;padding-right : 135px";
                search_bar.size = 40;
            }
            else if (totalWidth > 900) {
                document.body.style = "padding-top : 100px;padding-left : 80px; padding-right : 110px";
                search_bar.size = 25;
            }
            else if (totalWidth > 800) {
                document.body.style = "padding-top : 100px;padding-left : 65px; padding-right : 90px";
                search_bar.size = 11;
            }
            else if (totalWidth > 700) {
                document.body.style = "padding-top : 150px;padding-left : 55px; padding-right : 75px";
                search_bar.size = 11;
            }
            else if (totalWidth > 600) {
                document.body.style = "padding-top : 150px;padding-left : 45px; padding-right : 60px";
            }
            else if (totalWidth > 500) {
                document.body.style = "padding-top : 150px;padding-left : 35px; padding-right : 45px";
            }
            else if (totalWidth > 400) {
                document.body.style = "padding-top : 150px;padding-left : 25px; padding-right : 30px";
            }
            else {
                document.body.style = "padding-top : 150px;padding-left : 10px; padding-right : 10px";
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
            var containerHeight = document.getElementById("shop-container").clientHeight;
            if (containerHeight > 420) {
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
<div id="shop-container" class="shop-container">
    <div style="font-size: 25px">我的商品</div>
    <br>
    <% for (int i = 0; i < products.size(); i++) { %>
    <div class="media">
        <div class="media-left">
            <a href="../product.jsp?productId=<%=products.get(i).getProductId() %>">
                <img class="productImage" src="../ProductImages/<%= products.get(i).getImageName() %>"
                     alter="Product Image">
            </a>
        </div>
        <div class="media-body" style="position: relative; left: 8px">
            <h3 class="media-heading">
                <a href="../product.jsp?productId=<%= products.get(i).getProductId() %>">
                    <%= products.get(i).getProductName() %>
                </a>
            </h3>
            <p style="font-size: small; color: gray;">
                <% if (products.get(i).getPayment().equals("Free")) { %>
                &nbsp;免费
                <% } else { %>
                &nbsp;支付方式: <%= products.get(i).getPayment()%>
                &nbsp;&nbsp; 价格 : <%= products.get(i).getPrice()%>
                <% } %>
            </p>
            <p>
                <%
                    if (products.get(i).getDescription().length() > 100) {
                        out.print(products.get(i).getDescription().substring(0, 100) + " ...");
                    } else {
                        out.print(products.get(i).getDescription());
                    }
                %>
            </p>
            <p><span>剩余: <%= products.get(i).getAmount() %></span> &nbsp;&nbsp;
                <span>发布时间: <% String date = products.get(i).getPublishDate();
                    int spaceLocation = date.indexOf(" ");
                    out.print(date.substring(0, spaceLocation)); %> </span></p>
            <span>评分: <span style="color: gold">
                    <%
                        float stars = products.get(i).getStars();
                        if (stars < 0.5) {
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location : relative; top : 2px'></span>");
                        } else if (stars >= 0.5 && stars < 1.5) {
                            out.print("<span class='glyphicon glyphicon-star' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location : relative; top : 2px'></span>");
                        } else if (stars >= 1.5 && stars < 2.5) {
                            out.print("<span class='glyphicon glyphicon-star' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location : relative; top : 2px'></span>");
                        } else if (stars >= 2.5 && stars < 3.5) {
                            out.print("<span class='glyphicon glyphicon-star' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location : relative; top : 2px'></span>");
                        } else if (stars >= 3.5 && stars < 4.5) {
                            out.print("<span class='glyphicon glyphicon-star' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star-empty' style='location : relative; top : 2px'></span>");
                        } else {
                            out.print("<span class='glyphicon glyphicon-star' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location : relative; top : 2px'></span>");
                            out.print("<span class='glyphicon glyphicon-star' style='location : relative; top : 2px'></span>");
                        }
                    %>
                </span>
                    <span>购买次数: <%= products.get(i).getTradingTimes() %></span>
                </span>
            <div style="position: relative; top: 5px">
                <button class="btn btn-default"><a
                        href="editProduct.jsp?productId=<%= products.get(i).getProductId() %>">修改商品信息</a></button>
            </div>
            <br>
        </div>
        <% } %>
    </div>
</div>
</body>
<div id="myfooter" class="navbar navbar-fixed-bottom myfooter">
    <p>Discovery anything with Ghost Nova</p>
</div>
</html>
