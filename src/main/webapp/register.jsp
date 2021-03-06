<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">

    <title>OMS客户订单管理系统-注册</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=2.2.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen   animated fadeInDown">
    <div>
        <div>

            <h5 class="logo-name">OMS</h5>

        </div>
        <h3>欢迎注册 OMS</h3>
        <p>创建一个OMS新账户</p>
        <form class="m-t" role="form" action="ApplicantRegisterServlet" method="post" onsubmit="return validate()">
            <div class="form-group">
                <input type="text" name="user_name" class="form-control" placeholder="请输入用户名" required="">
            </div>
            <div class="form-group">
                <input type="email" name="email" class="form-control" placeholder="邮箱" required="">
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control" placeholder="请输入密码" required="">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="请再次输入密码" required="">
            </div>
            <div class="form-group text-left">
                <div class="checkbox i-checks"><label class="no-padding">
                    <input type="checkbox"><i></i> 我同意注册协议</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">注 册</button>

            <p class="text-muted text-center"><small>已经有账户了？</small><a href="login.jsp">点此登录</a>
            </p>

        </form>
    </div>
</div>

<!-- Mainly scripts -->
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap.min.js?v=3.4.0"></script>
<!-- iCheck -->
<script src="js/plugins/iCheck/icheck.min.js"></script>
<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
</script>
<script type="text/javascript">
    function validate() {
        var email = document.getElementById("email");
        var password = document.getElementById("password");
        var agree = document.getElementById("agree");
        var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;

        if (email.value == "") {
            alert("邮箱不能为空！");
            email.focus();
            return false;
        } else if (!pattern.test(email.value)) {
            alert("请输入正确的邮箱格式！");
            email.focus();
            return false;
        }
        if (password.value == "") {
            alert("密码不能为空！");
            password.focus();
            return false;
        } else if (password.length<6 || password.length>12) {
            alert("密码长度不符合要求，请输入6-12位密码!");
            password.focus();
            return false;
        }
        if (!agree.checked) {
            alert("请先同意本站服务条款！");
            return false;
        }
        return true;
    }
    //服务条款的显示跟隐藏
    function showdiv() {
        document.getElementById("bg").style.display = "block";
        document.getElementById("show").style.display = "block";
    }
    function hidediv() {
        document.getElementById("bg").style.display = "none";
        document.getElementById("show").style.display = "none";
    }
</script>

</body>

</html>
