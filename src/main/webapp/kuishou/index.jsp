<%--
  Created by IntelliJ IDEA.
  User: Machenike
  Date: 2020/12/30
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>OMS客户订单管理系统</title>
</head>
<body>
    <a href="/oms/MyServlet?/username=admin&password=123">get requst</a>
    <form action="/oms/MyServlet" method="post">
        username:<input name="username"/>
        password:<input name="password"/>
        <input type="submit" value="提交">
    </form>
</body>
</html>
