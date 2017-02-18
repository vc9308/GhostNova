<%@ page import="com.ghostNova.product.Product" %>
<%@ page import="com.ghostNova.product.ProductDAO" %>
<%@ page import="com.ghostNova.product.ProductDAOFactory" %>
<%@ page import="com.ghostNova.user.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.ghostNova.order.Order" %>
<%@ page import="com.ghostNova.order.OrderDAO" %>
<%@ page import="com.ghostNova.order.OrderDAOFactory" %>
<%@ page import="java.net.InetAddress" %>
<%--
Created by IntelliJ IDEA.
  User: victor
  Date: 6/17/16
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ghost Nova - 购买</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" href="logo/sm-logo.jpg">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-2.2.4.min.js"></script>
</head>
<body>
<%
    String productId = request.getParameter("productId");
    String customerId = request.getParameter("customerId");
    if (customerId.equals("")) {
%>
<div class="container center-block" style="padding-top: 5%; width: 400px">
    <div class="panel panel-danger">
        <div class="panel-heading">Error</div>
        <div class="panel-body">
            Log in or create an account in the first please.
        </div>
    </div>
</div>
<script>setTimeout("window.history.back()", 1000);</script>
<%
        return;
    } else {
    }
    int tradingQuantity = Integer.parseInt(request.getParameter("tradingQuantity"));
    Date date = new Date();
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    String tradingDate = dateFormat.format(date);
    String currentTimeMillis = String.valueOf(System.currentTimeMillis());
    String ip = InetAddress.getLocalHost().getHostAddress();
    String tradingId = ip.replace(".", "") + currentTimeMillis;

    Product product = new Product();
    ProductDAO productDAO = ProductDAOFactory.getProductDAOInstance();
    product = productDAO.queryByProductId(productId);

    User customer = new User();
    User seller = new User();
    UserDAO customerDAO = UserDAOFactory.getUserDAOInstance();
    customer = customerDAO.queryById(customerId);
    UserDAO sellerDAO = UserDAOFactory.getUserDAOInstance();
    seller = sellerDAO.queryById(product.getUserId());

    Order order = new Order();
    order.setTradingId(tradingId);
    order.setProductId(productId);
    order.setCustomerId(customerId);
    order.setSellerId(product.getUserId());
    order.setCustomerEmail(customer.getEmail());
    order.setTradingDate(tradingDate);
    order.setPayment(product.getPayment());
    order.setPrice(product.getPrice());
    order.setTradingQuantity(tradingQuantity);
    order.setHasBeenDelivered(false);
    order.setHasBeenAppliedForReturn(false);
    order.setHasBeenCancelled(false);

    OrderDAO orderDAO = OrderDAOFactory.getOrderDAOInstance();
    orderDAO.insert(order);

    product.setTradingTimes(product.getTradingTimes() + 1);
    product.setAmount(product.getAmount() - tradingQuantity);
    productDAO.update(product);

    out.print("<link rel=\"stylesheet\" href=\"/css/bootstrap.min.css\">");
    out.println("<div class='container center-block' style='padding-top: 5%; width: 400px'>");
    out.println("<div class='panel panel-success'>");
    out.println("<div class='panel-body'>");
    out.println("交易成功");
    out.println("</div>");
    out.println("</div>");
    out.println("</div>");
    out.println("<script>setTimeout(\"window.location.href='account/orders.jsp?who=buyer'\", 1000)</script>");
%>
</body>
</html>
