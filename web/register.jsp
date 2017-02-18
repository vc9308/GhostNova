<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no"/>
    <title>Ghost Nova - Register</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="icon" href="logo/sm-logo.jpg">
    <style>
        body {
            font-family: "Ubuntu"
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

        .welcome {
            font-size: xx-large;
        }

        .optional-container {
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
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-2.2.4.min.js"></script>
    <script>
        var idIsCorrect = "false";
        var pswIsCorrect = "false";
        var confirmIsCorrect = "false";
        var emailIsCorrect = "false";
        var correct = "<span class=\"glyphicon glyphicon-ok\" style='color: green'></span>";
        var wrong = " " + "<span class='glyphicon glyphicon-remove' style='color:red'></span>" + " &nbsp;";
        $(document).ready(function () {
            document.getElementById("submit").disabled = true;
            var totalWidth = document.documentElement.clientWidth;
            formResize();
            hideSomething();
            changeWelcomeFont();
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
            var $input = $('#refresh');
            $input.val() == 'yes' ? location.reload(true) : $input.val('yes');
        });
        window.onresize = function () {
            formResize();
            hideSomething();
            changeWelcomeFont();
        };

        function formResize() {
            var totalWidth = document.documentElement.clientWidth;
            var totalHeight = document.documentElement.clientHeight;
            var formContainer = document.getElementById("optional-container");
            var idWarning = document.getElementById("idWarning");
            var pswWarning = document.getElementById("pswWarning");
            var confirmWarning = document.getElementById("confirmWarning");
            var emailWarning = document.getElementById("emailWarning");
            if (totalWidth > 1900) {
                formContainer.style = "position : relative; left : 680px; width : 32%";
            }
            else if (totalWidth > 1800) {
                formContainer.style = "position : relative; left : 640px; width : 34%";
            }
            else if (totalWidth > 1700) {
                formContainer.style = "position : relative; left : 600px; width : 37%";
            }
            else if (totalWidth > 1600) {
                formContainer.style = "position : relative; left : 560px; width : 40%";
            }
            else if (totalWidth > 1500) {
                formContainer.style = "position : relative; left : 520px; width : 43%";
            }
            else if (totalWidth > 1400) {
                formContainer.style = "position : relative; left : 480px; width : 46%";
            }
            else if (totalWidth > 1300) {
                formContainer.style = "position : relative; left : 440px; width : 50%";
            }
            else if (totalWidth > 1200) {
                formContainer.style = "position : relative; left : 400px; width : 54%";
            }
            else if (totalWidth > 1100) {
                formContainer.style = "position : relative; left : 360px; width : 58%";
            }
            else if (totalWidth > 1000) {
                formContainer.style = "position : relative; left : 320px; width : 62%";
            }
            else if (totalWidth > 900) {
                formContainer.style = "position : relative; left : 275px; width : 66%";
            }
            else if (totalWidth > 800) {
                formContainer.style = "position : relative; left : 228px; width : 70%";
            }
            else if (totalWidth > 700) {
                formContainer.style = "position : relative; left : 183px; width : 74%";
            }
            else if (totalWidth > 600) {
                formContainer.style = "position : relative; left : 132px; width : 78%";

            }
            else if (totalWidth > 500) {
                formContainer.style = "position : relative; left : 103px; width : 82%";
            }
            else if (totalWidth > 400) {
                formContainer.style = "position : relative; left : 35px; width : 86%";
            }
            else {
                formContainer.style = "position : relative; left : 5px; width : 90%";
            }

            if (totalWidth < 790) {
                if (idWarning.innerText.length > 12) {
                    idWarning.style = "position : relative; top : 8px;";
                }
                if (pswWarning.innerText.length > 12) {
                    pswWarning.style = "position : relative; top : 8px;"
                }
                if (confirmWarning.innerText.length > 12) {
                    confirmWarning.style = "position : relative; top : 8px;"
                }
                if (emailWarning.innerText.length > 12) {
                    emailWarning.style = "position : relative; top : 8px;"
                }
            }
            else {
                idWarning.style = "position : relative; top : 13px;";
                pswWarning.style = "position : relative; top : 13px;";
                confirmWarning.style = "position : relative; top : 13px;";
                emailWarning.style = "position : relative; top : 13px;"
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
        function hideSomething() {
            var totalWidth = document.documentElement.clientWidth;
            if (totalWidth >= 768) {
                document.getElementById("sm-navbar").style = "display: none;";
                document.getElementById("bg-navbar").style = "display: block;";
            }
            else if (totalWidth >= 474) {
                document.getElementById("sm-navbar").style = "display: block;";
                document.getElementById("bg-navbar").style = "display: none;";
            }
            else {
                document.getElementById("sm-navbar").style = "display: block;";
                document.getElementById("bg-navbar").style = "display: none;";
                document.getElementById("sm-sign-bar").style = "display: none";
                document.getElementById("sm-whoami").style = "display: none";
            }
        }
        function changeWelcomeFont() {
            var totalWidth = document.documentElement.clientWidth;
            if (totalWidth < 492) {
                document.getElementById("welcome").innerHTML = "加入我们。";
                document.getElementById("welcome").style = "font-size : large";
            }
            else if (totalWidth < 580) {
                document.getElementById("welcome").innerHTML = "一起加入我们。";
                document.getElementById("welcome").style = "font-size : x-large";
            }
            else if (totalWidth < 807) {
                document.getElementById("welcome").innerHTML = "现在一起加入我们。";
                document.getElementById("welcome").style = "font-size : xx-large";
            }
            else {
                document.getElementById("welcome").innerHTML = "现在一起加入我们。";
                document.getElementById("welcome").style = "font-size : xx-large";
            }
        }
        function checkIdExists() {
            var id = document.getElementById("id").value;
            var xhr = createxhr();
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var result = xhr.responseText;
                    if (result.indexOf("True") != "-1") {
                        document.getElementById("idWarning").innerHTML = correct;
                        idIsCorrect = "true";
                        if (pswIsCorrect == "true" && confirmIsCorrect == "true" && emailIsCorrect == "true") {
                            document.getElementById("submit").disabled = false;
                        }
                    }
                    else document.getElementById("idWarning").innerHTML = wrong + "用户名已存在";
                }
            };
            xhr.open('get', '/ServletCheckingIdExists?id=' + id, true);
            xhr.send(null);
        }
        function createxhr() {
            if (window.XMLHttpRequest) {
                var xhr = new XMLHttpRequest();
            } else {
                var version = ["Msxml2.XMLHttp.6.0", "Msxml2.XMLHttp.5.0", "Msxml2.XMLHTTP.4.0", "Msxml2.XMLHTTP.3.0", "Msxml2.XMLHTTP", "Microsoft.XMLHTTP"];
                for (var i = 0, len = version.length; i < len; i++) {
                    var xhr = new ActiveXObject(version[i]);
                    if (xhr) {
                        break;
                    }
                }
            }
            return xhr;
        }
        function checkEmailExists() {
            var email = document.getElementById("email").value;
            var xhr = createxhr();
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var result = xhr.responseText;
                    if (result.indexOf("True") != "-1") {
                        document.getElementById("emailWarning").innerHTML = correct;
                        emailIsCorrect = "true";
                        //alert(emailIsCorrect + idIsCorrect + pswIsCorrect + confirmIsCorrect);
                        if (idIsCorrect == "true" && pswIsCorrect == "true" && confirmIsCorrect == "true") {
                            document.getElementById("submit").disabled = false;
                        }
                    }
                    else document.getElementById("emailWarning").innerHTML = wrong + "这个邮箱用过了哟";
                }
            };
            xhr.open('get', '/ServletCheckingEmailExists?email=' + email, true);
            xhr.send(null);
        }
        function checkId() {
            idIsCorrect = "false";
            document.getElementById("submit").disabled = true;
            var id = document.getElementById("id").value;
            var idWarning = document.getElementById('idWarning');
            if (id == "") idWarning.innerHTML = wrong + "取一个用户名吧";
            else {
                checkIdExists();
            }
        }
        function checkPsw() {
            pswIsCorrect = "false";
            document.getElementById("submit").disabled = true;
            var psw = document.getElementById("password").value;
            var pswLen = psw.length;
            var pswWarning = document.getElementById("pswWarning");
            var reg = /^(?![0-9a-z]+$)(?![0-9A-Z]+$)(?![0-9\W]+$)(?![a-z\W]+$)(?![a-zA-Z]+$)(?![A-Z\W]+$)[a-zA-Z0-9\W_]+$/;
            if (pswLen == 0) pswWarning.innerHTML = wrong + "请输入一个密码";
            else if (pswLen < 6) pswWarning.innerHTML = wrong + "最起码也要六个字符";
            else if (psw == (document.getElementById("id").value) || !psw.match(reg)) pswWarning.innerHTML = wrong + "这密码也太容易猜到了吧";
            else {
                pswWarning.innerHTML = correct;
                pswIsCorrect = "true";
                if (idIsCorrect == "true" && confirmIsCorrect == "true" && emailIsCorrect == "true") document.getElementById("submit").disabled = false;
            }
        }

        function checkConfirm() {
            confirmIsCorrect = "false";
            document.getElementById("submit").disabled = true;
            var confirm = document.getElementById("confirm").value;
            var confirmWarning = document.getElementById("confirmWarning");
            if (confirm != (document.getElementById("password").value)) confirmWarning.innerHTML = wrong + "跟刚才的不一样哦";
            else {
                confirmWarning.innerHTML = correct;
                confirmIsCorrect = "true";
                if (idconfirmIsCorrect == "true" && pswIsCorrect == "true" && emailIsCorrect == "true") document.getElementById("submit").disabled = false;
            }
        }

        function checkEmail() {
            emailIsCorrect = "false";
            document.getElementById("submit").disabled = true;
            var email = document.getElementById("email").value;
            var emailWarning = document.getElementById("emailWarning");
            var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/;
            if (email == "") emailWarning.innerHTML = wrong + "你的邮箱是什么";
            else if (!email.match(reg)) emailWarning.innerHTML = wrong + "这不是邮箱吧";
            else {
                checkEmailExists();
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
        <li><a href="#">关于</a></li>
        <li><a href="#">帮助</a></li>
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
<div class="optional-container" id="optional-container">
    <form action="completeRegister.jsp" method="post">
        <div id="welcome" class="welcome">现在一起加入我们。</div>
        <br><br>
        <div class="row">
            <span class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                <input id="id" name="userId" type="text"
                       class="form-control input-lg"
                       placeholder="ID*"
                       oninput="checkId()" autofocus="autofocus"/>
            </span><span id="idWarning" class="warning"></span>
        </div>
        <br>
        <div class="row">
            <span class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                <input id="password" name="password" type="password" class="form-control input-lg col-lg-2"
                       placeholder="密码*" oninput="checkPsw()">
            </span><span id="pswWarning" class="warning"></span>
        </div>
        <br>
        <div class="row">
            <span class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                <input id="confirm" name="confirm" type="password" class="form-control input-lg col-lg-2"
                       placeholder="再输入一次密码*" oninput="checkConfirm()"/>
            </span><span id="confirmWarning" class="warning"></span>
        </div>
        <br>
        <div class="row">
            <span class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                <input id="email" name="email" type="email" class="form-control input-lg col-lg-2"
                       placeholder="E-mail*" oninput="checkEmail()"/>
            </span><span id="emailWarning" class="warning"></span>
        </div>
        <br><br>
        <div class="row">
            <span class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                <button id="submit" type="submit" class="btn btn-primary btn-lg btn-block">注册</button>
            </span>
        </div>
        <br><br>
    </form>
</div>
<input type="hidden" id="refresh" value="no">
<div id="footer" class="navbar navbar-fixed-bottom myfooter">
    <p>Discovery anything with Ghost Nova</p>
</div>
</body>
</html>