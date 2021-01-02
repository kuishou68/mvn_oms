<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">

    <title>OMS客户订单管理系统-登录</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=2.2.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>

            <h5 class="logo-name">OMS</h5>

        </div>
        <h3>欢迎使用 OMS</h3>

        <form class="m-t" role="form" action="user" method="post" onsubmit="return validate();">
            <div class="form-group">
                <input type="email" name="email" class="form-control" placeholder="邮箱" required="">
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control" placeholder="密码" required="">
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>


            <p class="text-muted text-center"> <a href="login.jsp#"><small>忘记密码了？</small></a> | <a href="register.jsp">注册一个新账号</a>
            </p>

        </form>
    </div>
</div>

<!-- Mainly scripts -->
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap.min.js?v=3.4.0"></script>
<script type="text/javascript">
    function validate() {
        var email = document.getElementById("email");
        var password = document.getElementById("password");
        if (email.value == "") {
            alert("邮箱不能为空！");
            email.focus();
            return false;
        }
        if (password.value == "") {
            alert("密码不能为空！");
            password.focus();
            return false;
        }
        return true;
    }
</script>

</body>

</html>
