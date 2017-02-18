<%@ page import="com.ghostNova.product.Product" %>
<%@ page import="com.ghostNova.product.ProductDAO" %>
<%@ page import="com.ghostNova.product.ProductDAOFactory" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ghost Nova - Search</title>
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

        .label {
            color: gray;
        }

        .display-style {
            margin-top: -8px;
        }

        .glyphicon {
            position: relative;
            top: -1px;
        }

        .productImage {
            height: 150px;
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
</head>
<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        hideFooter();
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

            String keywordsYouInput = request.getParameter("keywords").trim();
            String category = request.getParameter("category");
            int currentPage = Integer.parseInt(request.getParameter("currentPage"));
            String view = request.getParameter("view");
        %>
        bodyResize();
    })
    window.onresize = function () {
        hideSomething();
        hideFooter();
        bodyResize();
    }
    function bodyResize() {
        var totalWidth = document.documentElement.clientWidth;
        var search_bar = document.getElementById("search-bar");
        if (totalWidth > 1500) {
            document.getElementById("categories-container").style = "padding-top: 20px;padding-left: 160px;padding-right: 320px;";
            document.getElementById("results-info-container").style = "padding-left: 170px;padding-top: 20px;padding-right: 320px;";
            document.getElementById("results").style = "padding-top: 30px;padding-left: 170px;padding-right: 320px;";
            document.getElementById("page-container").style = "padding-top: 20px;padding-left: 360px;";
            search_bar.size = 60;
        }
        else if (totalWidth > 1300) {
            document.getElementById("categories-container").style = "padding-top: 20px;padding-left: 140px;padding-right: 300px;";
            document.getElementById("results-info-container").style = "padding-left: 150px;padding-top: 20px;padding-right: 300px;";
            document.getElementById("results").style = "padding-top: 30px;padding-left: 150px;padding-right: 300px;";
            document.getElementById("page-container").style = "padding-top: 20px;padding-left: 340px;";
            search_bar.size = 50;
        }
        else if (totalWidth > 1100) {
            document.getElementById("categories-container").style = "padding-top: 20px;padding-left: 120px;padding-right: 280px;";
            document.getElementById("results-info-container").style = "padding-left: 130px;padding-top: 20px;padding-right: 280px;";
            document.getElementById("results").style = "padding-top: 30px;padding-left: 130px;padding-right: 280px;";
            document.getElementById("page-container").style = "padding-top: 20px;padding-left: 320px;";
            search_bar.size = 40;
        }
        else if (totalWidth > 900) {
            document.getElementById("categories-container").style = "padding-top: 20px;padding-left: 100px;padding-right: 250px;";
            document.getElementById("results-info-container").style = "padding-left: 110px;padding-top: 20px;padding-right: 250px;";
            document.getElementById("results").style = "padding-top: 30px;padding-left: 110px;padding-right: 250px;";
            document.getElementById("page-container").style = "padding-top: 20px;padding-left: 290px;";
            search_bar.size = 25;
        }
        else if (totalWidth > 800) {
            document.getElementById("categories-container").style = "padding-top: 20px;padding-left: 90px;padding-right: 230px;";
            document.getElementById("results-info-container").style = "padding-left: 100px;padding-top: 20px;padding-right: 230px;";
            document.getElementById("results").style = "padding-top: 30px;padding-left: 100px;padding-right: 230px;";
            document.getElementById("page-container").style = "padding-top: 20px;padding-left: 270px;";
            search_bar.size = 11;
        }
        else if (totalWidth > 700) {
            document.getElementById("categories-container").style = "padding-top: 20px;padding-left: 80px;padding-right: 210px;";
            document.getElementById("results-info-container").style = "padding-left: 90px;padding-top: 20px;padding-right: 210px;";
            document.getElementById("results").style = "padding-top: 30px;padding-left: 90px;padding-right: 210px;";
            document.getElementById("page-container").style = "padding-top: 20px;padding-left: 250px;";
            search_bar.size = 11;
        }
        else if (totalWidth > 600) {
            document.getElementById("categories-container").style = "padding-top: 20px;padding-left: 60px;padding-right: 170px;";
            document.getElementById("results-info-container").style = "padding-left: 70px;padding-top: 20px;padding-right: 170px;";
            document.getElementById("results").style = "padding-top: 30px;padding-left: 70px;padding-right: 170px;";
            document.getElementById("page-container").style = "padding-top: 20px;padding-left: 210px;";
        }
        else if (totalWidth > 500) {
            document.getElementById("categories-container").style = "padding-top: 20px;padding-left: 40px;padding-right: 130px;";
            document.getElementById("results-info-container").style = "padding-left: 40px;padding-top: 20px;padding-right: 130px;";
            document.getElementById("results").style = "padding-top: 30px;padding-left: 40px;padding-right: 130px;";
            document.getElementById("page-container").style = "padding-top: 20px;padding-left: 170px;";
        }
        else if (totalWidth > 400) {
            document.getElementById("categories-container").style = "padding-top: 20px;padding-left: 20px;padding-right: 90px;";
            document.getElementById("results-info-container").style = "padding-left: 20px;padding-top: 20px;padding-right: 90px;";
            document.getElementById("results").style = "padding-top: 30px;padding-left: 20px;padding-right: 90px;";
            document.getElementById("page-container").style = "padding-top: 20px;padding-left: 140px;";
        }
        else {
            document.getElementById("categories-container").style = "padding-top: 20px;padding-left: 10px;padding-right: 50px;";
            document.getElementById("results-info-container").style = "padding-left: 10px;padding-top: 20px;padding-right: 50px;";
            document.getElementById("results").style = "padding-top: 30px;padding-left: 10px;padding-right: 50px;";
            document.getElementById("page-container").style = "padding-top: 20px;padding-left: 100px;";
        }
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
    function hideFooter() {
        var containerHeight = document.getElementById("container").clientHeight;
        if (containerHeight > 350) {
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
            <input id="search-bar" name="keywords" type="search" class="form-control" size="50px"
                   value="<%= keywordsYouInput %>">
            <span class="search-btn">
                        <button type="submit" class="btn btn-default">搜索</button>
                    </span>
        </div>
        <input name="category" value="All" style="display: none;">
        <input name="currentPage" value="1" style="display: none;">
        <input name="view" value="<%= view %>" style="display: none;">
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
        <a class="sm-label" href="index.jsp">Search</a>&nbsp;|&nbsp;
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
            <input id="sm-search-bar" name="keywords" type="search" class="form-control" size="50px"
                   value="<%= keywordsYouInput %>">
            <input type="submit" style="display: none;">
        </div>
        <input name="category" value="All" style="display: none;">
        <input name="currentPage" value="1" style="display: none;">
        <input name="view" value="<%= view %>" style="display: none;">
    </form>
</nav>
<%
    StringBuffer keywordsYouInputBf = new StringBuffer(keywordsYouInput);
    String regex = ":|,|~|`|!|@|$|%|^|&|/*|(|)|_|/+|-|=|/.|/?|<|>|;|'|[|]|/|。|，|？|！|～|【|】|“|”|；|‘|’|《|》|……|×|（|）|——";
    String regexOfChinese = "[\u4e00-\u9fa5]";
    List<Integer> indexOfChineseCharacter = new ArrayList<Integer>();
    for (int i = 0; i < keywordsYouInputBf.length(); i++) {
        if (("" + keywordsYouInputBf.charAt(i)).matches(regexOfChinese)) {
            indexOfChineseCharacter.add(i);
        }
    }

    int j = 0;
    for (int i = 0; i < indexOfChineseCharacter.size(); i++) {
        keywordsYouInputBf = keywordsYouInputBf.insert(indexOfChineseCharacter.get(i) + j, " ");
        keywordsYouInputBf = keywordsYouInputBf.insert(indexOfChineseCharacter.get(i) + j + 2, " ");
        j = j + 2;
    }

    String[] keywordsYouInputList = keywordsYouInputBf.toString().toLowerCase().replaceAll(regex, "").trim().replaceAll(" {2,}", " ").split(" ");
    Map<String, List<Product>> index = new HashMap<String, List<Product>>();
    ProductDAO dao = ProductDAOFactory.getProductDAOInstance();
    try {
        List<Product> all = dao.queryAll();
        for (Product product : all) {
            StringBuffer productName = new StringBuffer(product.getProductName());
            indexOfChineseCharacter = new ArrayList<Integer>();
            for (int i = 0; i < productName.length(); i++) {
                if (("" + productName.charAt(i)).matches(regexOfChinese)) {
                    indexOfChineseCharacter.add(i);
                }
            }
            j = 0;
            for (int i = 0; i < indexOfChineseCharacter.size(); i++) {
                productName = productName.insert(indexOfChineseCharacter.get(i) + j, " ");
                productName = productName.insert(indexOfChineseCharacter.get(i) + j + 2, " ");
                j = j + 2;
            }
            String[] keywords = productName.toString().toLowerCase().replaceAll(regex, "").trim().replaceAll(" {2,}", " ").split(" ");
            if (category.equals("All")) {
                for (String keyword : keywords) {
                    if (index.containsKey(keyword)) {
                        if (!index.get(keyword).contains(product)) {
                            index.get(keyword).add(product);
                        }
                    } else {
                        List<Product> listWithTheFirstProduct = new ArrayList<Product>();
                        listWithTheFirstProduct.add(product);
                        index.put(keyword.toLowerCase(), listWithTheFirstProduct);
                    }
                }
            } else {
                if (product.getCategory().equals(category)) {
                    for (String keyword : keywords) {
                        if (index.containsKey(keyword)) {
                            if (!index.get(keyword).contains(product)) {
                                index.get(keyword).add(product);
                            }
                        } else {
                            List<Product> firstProduct = new ArrayList<Product>();
                            firstProduct.add(product);
                            index.put(keyword.toLowerCase(), firstProduct);
                        }
                    }
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    List<Product> resultsWithDup = new ArrayList<Product>();
    for (String keywordYouInputElement : keywordsYouInputList) {
        if (index.get(keywordYouInputElement) != null) {
            resultsWithDup.addAll(index.get(keywordYouInputElement));
        }
    }

    List<Product> results = new ArrayList<>(new HashSet<>(resultsWithDup));

    for (int i = 0; i < results.size(); i++) {
        for (j = i + 1; j < results.size(); j++) {
            if (results.get(i).equals(results.get(j))) {
                results.get(i).setLabel(results.get(i).getLabel() + 1);
            }
        }
    }

    Collections.sort(results, new Comparator<Product>() {
        @Override
        public int compare(Product o1, Product o2) {
            return o1.getTradingTimes().compareTo(o2.getTradingTimes());
        }
    });

    Collections.sort(results, new Comparator<Product>() {
        @Override
        public int compare(Product o1, Product o2) {
            return o1.getStars().compareTo(o2.getStars());
        }
    });

    Collections.sort(results, new Comparator<Product>() {
        @Override
        public int compare(Product o1, Product o2) {
            return o1.getLabel().compareTo(o2.getLabel());
        }
    });

    Collections.reverse(results);
%>
<div id="container">
    <div id="categories-container" class="categories-container">
        <ul class="nav nav-tabs" role="tablist">
            <li id="allTab" role="presentation" <% if (category.equals("All")) out.print("class='active'"); %>>
                <a href="search.jsp?&category=All&currentPage=1&view=<%= view %>&keywords=<%= keywordsYouInput.replace("#", "%23") %>">全部</a>
            </li>
            <li id="softwaresTab" role="presentation" <% if (category.equals("Softwares"))
                out.print("class='active'"); %>>
                <a href="search.jsp?keywords=<%=  keywordsYouInput.replace("#", "%23") %>&category=Softwares&currentPage=1&view=<%= view %>">软件</a>
            </li>
            <li id="CodeTab" role="presentation" <% if (category.equals("Code")) out.print("class='active'"); %>>
                <a href="search.jsp?keywords=<%= keywordsYouInput.replace("#", "%23") %>&category=Code&currentPage=1&view=<%= view %>">代码</a>
            </li>
            <li id="booksTab" role="presentation" <% if (category.equals("Books")) out.print("class='active'"); %>>
                <a href="search.jsp?category=Books&currentPage=1&view=<%= view %>&keywords=<%= keywordsYouInput.replace("#","%23") %>">图书</a>
            </li>
            <li id="pagesTab" role="presentation" <% if (category.equals("Pages")) out.print("class='active'"); %>>
                <a href="search.jsp?keywords=<%= keywordsYouInput.replace("#", "%23") %>&category=Pages&currentPage=1&view=<%= view %>">论文</a>
            </li>
            <li id="songsTab" role="presentation" <% if (category.equals("Songs")) out.print("class='active'"); %>>
                <a href="search.jsp?keywords=<%= keywordsYouInput.replace("#", "%23") %>&category=Songs&currentPage=1&view=<%= view %>">音乐</a>
            </li>
            <li id="videosTab" role="presentation" <% if (category.equals("Videos")) out.print("class='active'"); %>>
                <a href="search.jsp?keywords=<%= keywordsYouInput.replace("#", "%23") %>&category=Videos&currentPage=1&view=<%= view %>">视频</a>
            </li>
        </ul>
    </div>

    <div id="results-info-container" class="results-info-container">
        <span class="well well-sm">
            <%
                if (results.size() == 0) {
                    out.print("查找不到结果");
                } else if (results.size() == 1) {
                    out.print("仅有一个结果");
                } else if (results.size() - (currentPage - 1) * 10 == 1) {
                    out.print("显示" + results.size() + "结果中的第" + ((currentPage - 1) * 10 + 1) + "个");
                } else if (results.size() < currentPage * 10) {
                    out.print("显示" + results.size() + "结果中的第" + ((currentPage - 1) * 10 + 1) + "到第" + results.size() + "个");
                } else {
                    out.print("显示" + results.size() + "结果中的第" + ((currentPage - 1) * 10 + 1) + "到第" + currentPage * 10 + "个");
                }
            %>
        </span>
        <span class="pull-right display-style">
            <button class="btn <% if (view.equals("row")) out.print("btn-success");
            else if (view.equals("column")) out.print("btn-default"); %>"
                    onclick="window.location.href='search.jsp?keywords=<%= keywordsYouInput.replace("#", "%23") %>&category=<%= category %>&currentPage=1&view=row'">
                <span class="glyphicon glyphicon-th-list"></span>
            </button>
            <button class="btn <% if (view.equals("column")) out.print("btn-success");
            else if (view.equals("row")) out.print("btn-default"); %>"
                    onclick="window.location.href='search.jsp?keywords=<%= keywordsYouInput.replace("#", "%23") %>&category=<%= category %>&currentPage=1&view=column'">
                <span class="glyphicon glyphicon-th"></span>
            </button>
        </span>
    </div>
    <div id="results" class="results">
        <%
            if (!results.isEmpty() && (view.equals("row"))) {
                for (int i = (currentPage - 1) * 10; i < currentPage * 10 && i < results.size(); i++) {
        %>
        <div class="media">
            <div class="media-left">
                <a href="product.jsp?productId=<%=results.get(i).getProductId() %>">
                    <img class="productImage" src="ProductImages/<%= results.get(i).getImageName() %>"
                         alter="Product Image">
                </a>
            </div>
            <div class="media-body">
                <h4 style="text-overflow:ellipsis; white-space:nowrap; overflow:hidden;">
                    <a href="product.jsp?productId=<%= results.get(i).getProductId() %>" data-toggle="tooltip"
                       data-placement="left"
                       title="<%= results.get(i).getProductName() %>"><%= results.get(i).getProductName() %>
                    </a>
                </h4>
                <p style="font-size: small; color: gray">
                    <% if (results.get(i).getPayment().equals("Free")) { %>
                    Free
                    <% } else { %>
                    Payment: <%= results.get(i).getPayment()%>
                    &nbsp;&nbsp; Price : <%= results.get(i).getPrice()%>
                    <% } %>
                </p>
                <p>
                    <%
                        if (results.get(i).getDescription().length() > 175) {
                            out.print(results.get(i).getDescription().substring(0, 175) + " ...");
                        } else {
                            out.print(results.get(i).getDescription());
                        }
                    %>
                </p>
                        int spaceLocation = date.indexOf(" ");
                        out.print(date.substring(0, spaceLocation)); %> </span></p>
                <span><span class="label">评分: </span><span style="color: gold">
                    <%
                        float stars = results.get(i).getStars();
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
                    <span><span class="label">交易次数: </span><%= results.get(i).getTradingTimes() %></span>
                </span>
            </div>
        </div>
        <br>
        <%
            }
        } else if (view.equals("column")) {
            out.print("<div id='results'>");
            out.print("<div class='row'>");
            for (int i = (currentPage - 1) * 10; i < currentPage * 10 && i < results.size(); i++) {
        %>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="thumbnail">
                <a href="product.jsp?productId=<%= results.get(i).getProductId() %>"><img style="height: 300px"
                                                                                          src="/ProductImages/<%= results.get(i).getImageName() %>"></a>
                <div class="caption">
                    <h4 style="text-overflow:ellipsis; white-space:nowrap; overflow:hidden;">
                        <a href="product.jsp?productId=<%= results.get(i).getProductId() %>" data-toggle="tooltip"
                           data-placement="left"
                           title="<%= results.get(i).getProductName() %>"><%= results.get(i).getProductName() %>
                        </a>
                    </h4>
                    <p style="font-size: small; color: gray">
                        <% if (results.get(i).getPayment().equals("Free")) { %>
                        免费
                        <% } else { %>
                        支付方式: <%= results.get(i).getPayment()%>
                        &nbsp;&nbsp; 价格: <%= results.get(i).getPrice()%>
                        <% } %>
                    </p>
                    <p>
                        <%
                            if (results.get(i).getDescription().length() > 100) {
                                out.print(results.get(i).getDescription().substring(0, 100) + " ...");
                            } else {
                                out.print(results.get(i).getDescription());
                            }
                        %>
                    </p>
                    <p><span><span class="label">剩余: </span><%= results.get(i).getAmount() %></span>
                        <span><span class="label">发布时间: </span><% String date = results.get(i).getPublishDate();
                            int spaceLocation = date.indexOf(" ");
                            out.print(date.substring(0, spaceLocation)); %> </span></p>
                    <span><span class="label">评分: </span><span style="color: gold">
                    <%
                        float stars = results.get(i).getStars();
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
                    <span><span class="label">购买次数 : </span><%= results.get(i).getTradingTimes() %></span>
                </span>
                </div>
            </div>
        </div>
        <%
                }
                out.print("</div>");
                out.print("</div>");
            }
        %>
    </div>
    <% if (results.size() > 0) { %>
    <div id="page-container" class="page-container">
        <nav>
            <ul class="pagination pagination-lg">
                <li <% if (!(currentPage > 1)) { %>class="disabled"><a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span></a> <% } else { %>>
                    <a href="search.jsp?keywords=<%= keywordsYouInput.replace("#", "%23") %>&category=<%= category %>&currentPage=<%= currentPage - 1 %>&view=<%= view %>"
                       aria-label="Previous"><span aria-hidden="true">&laquo;</span></a> <% } %>
                </li>
                <%
                    for (int i = 1; i <= (results.size() - 1) / 10 + 1; i++) {
                        out.print("<li");
                        if (currentPage == i) {
                            out.print(" class='active'");
                        }
                        out.print("><a href='search.jsp?");
                        out.print("keywords=" + keywordsYouInput.replace("#", "%23"));
                        out.print("&category=" + category);
                        out.print("&currentPage=" + i);
                        out.print("&view=" + view);
                        out.print("'>" + i + "</a></li>");
                    }
                %>
                <li <% if (!(currentPage < (results.size() - 1) / 10 + 1)) { %> class="disabled">
                    <a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a> <% } else { %>>
                    <a href="search.jsp?keywords=<%= keywordsYouInput.replace("#", "%23") %>&currentPage=<%= String.valueOf(currentPage + 1) %>&category=<%= category %>&view=<%= view %>"
                       aria-label="Next"><span aria-hidden="true">&raquo;</span></a><% } %>
                </li>
                <% } %>
            </ul>
        </nav>
    </div>
</div>
<div id="myfooter" class="myfooter">
    <p>Discovery anything with Ghost Nova</p>
</div>
</body>
</html>
