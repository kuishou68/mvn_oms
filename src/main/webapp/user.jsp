<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>OMS客户订单管理系统 - 用户管理</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <%--    <link href="font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">--%>
    <link href="css/my-ui.css?v=2.1" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=2.2.0" rel="stylesheet">
    <!-- bootstrap-table 表格插件样式 -->
    <link href="css/bootstrap-table.min.css" rel="stylesheet"/>
    <link href="css/animate.css" rel="stylesheet"/>
    <link href="css/style.css" rel="stylesheet"/>
    <link href="css/my-ui.css" rel="stylesheet"/>

    <link href="css/jquery.layout-latest.css" rel="stylesheet"/>

    <link href="css/zTreeStyle.css" rel="stylesheet"/>

</head>

<body>
<div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">

                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="img/kuishou.jpg"/>
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                            <span class="clear"> <span class="block m-t-xs"> <strong id="font-bold" class="font-bold">admin</strong>
                                <input id="user_id" type="hidden" value="${sessionScope.get("userLogin").user_id}">
<%--                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><c:out value="${user.user_name}"></c:out></strong>--%>
                             </span>  <span class="text-muted text-xs block">管理员 <b class="caret"></b></span> </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="form_avatar.html">修改头像</a>
                            </li>
                            <li><a href="profile.html">个人资料</a>
                            </li>
                            <li><a href="contacts.html">联系我们</a>
                            </li>
                            <li><a href="mailbox.html">信箱</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="login.html">安全退出</a>
                            </li>
                        </ul>
                    </div>
                    <div class="logo-element">

                    </div>

                </li>
                <li class="active">
                    <a href="index.html"><i class="fa fa-th-large"></i> <span class="nav-label">首页</span> <span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        </li>
                        <li class="active"><a href="index.html">销售量统计</a>
                        </li>
                        </li>
                    </ul>
                </li>


                <li>
                    <a href="Customer"><i class="fa fa-edit"></i> <span class="nav-label">订单管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="Customer">交易订单</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href=""><i class="fa fa-user-secret"></i> <span class="nav-label">客户管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="">客户基本信息</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="index.html#"><i class="fa fa-files-o"></i> <span class="nav-label">产品管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="search_results.html">产品基本信息</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="user.jsp"><i class="fa fa-user"></i> <span class="nav-label">用户管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="user.html">用户基本信息</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">信箱 </span><span
                            class="label label-warning pull-right">16</span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="mailbox.html">收件箱</a>
                        </li>
                        <li><a href="mail_detail.html">查看邮件</a>
                        </li>
                        <li><a href="mail_compose.html">写信</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="webim.html"><i class="fa fa-comments"></i> <span class="nav-label">客户通讯</span><span
                            class="label label-danger pull-right">New</span></a>
                </li>

            </ul>

        </div>
    </nav>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="empty_page.html#"><i
                            class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search"
                                   id="top-search">
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message"><a href="index.html" title="返回首页"><i
                                class="fa fa-home"></i></a></span>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
                            <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a7.jpg">
                                    </a>
                                    <div class="media-body">
                                        <small class="pull-right">46小时前</small>
                                        <strong>小四</strong> 项目已处理完结
                                        <br>
                                        <small class="text-muted">3天前 2014.11.8</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a4.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right text-navy">25小时前</small>
                                        <strong>国民岳父</strong> 这是一条测试信息
                                        <br>
                                        <small class="text-muted">昨天</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="mailbox.html">
                                        <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
                            <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="mailbox.html">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                        <span class="pull-right text-muted small">4分钟前</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="profile.html">
                                    <div>
                                        <i class="fa fa-qq fa-fw"></i> 3条新回复
                                        <span class="pull-right text-muted small">12分钟钱</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="notifications.html">
                                        <strong>查看所有 </strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>


                    <li>
                        <a href="login.html">
                            <i class="fa fa-sign-out"></i> 退出
                        </a>
                    </li>
                </ul>

            </nav>
        </div>

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-4">
                <h2>用户管理</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="index.html">主页</a>
                    </li>
                    <li>
                        <strong>用户管理</strong>
                    </li>
                </ol>
            </div>
        </div>

        <div class="col-sm-12 search-collapse">
            <form id="user-form">
                <input type="hidden" id="deptId" name="deptId">
                <input type="hidden" id="parentId" name="parentId">
                <div class="select-list">
                    <ul>
                        <li>
                            登录名称：<input type="text" name="emaail" placeholder="默认为邮箱登录">
                        </li>
                        <li>
                            手机号码：<input type="text" name="phonenumber">
                        </li>
                        <li>
                            用户状态：<select name="status">
                            <option value="">所有</option>
                            <option value="0">正常</option>
                            <option value="1">停用</option>
                        </select>
                        </li>
                        <li class="select-time">
                            <label>创建时间： </label>
                            <input type="text" class="time-input" id="startTime" placeholder="开始时间"
                                   name="params[beginTime]" lay-key="1">
                        </li>
                        <li>
                            <a class="btn btn-primary btn-rounded btn-sm" onclick="$.table.search()"><i
                                    class="fa fa-search"></i>&nbsp;搜索</a>
                            <a class="btn btn-warning btn-rounded btn-sm" onclick="$.form.reset()"><i
                                    class="fa fa-refresh"></i>&nbsp;重置</a>
                        </li>
                    </ul>
                </div>
            </form>
        </div>

        <div class="col-sm-12 select-table table-striped">
            <div class="bootstrap-table">
                <div class="fixed-table-toolbar">
                    <div class="bs-bars pull-left">
                        <div class="btn-group-sm" id="toolbar" role="group">
                            <a class="btn btn-success" href="user_add.jsp" onclick="$.operate.addTab()">
                                <i class="fa fa-plus"></i> 新增
                            </a>
                            <a class="btn btn-primary single disabled" href="user_update.html.html"
                               onclick="$.operate.editTab()">
                                <i class="fa fa-edit"></i> 修改
                            </a>
                            <a class="btn btn-danger multiple disabled" onclick="$.operate.removeAll()">
                                <i class="fa fa-remove"></i> 删除
                            </a>
                            <a class="btn btn-info" onclick="$.table.importExcel()">
                                <i class="fa fa-upload"></i> 导入
                            </a>
                            <a class="btn btn-warning" onclick="$.table.exportExcel()">
                                <i class="fa fa-download"></i> 导出
                            </a>
                        </div>
                    </div>
                    <div class="columns columns-right btn-group pull-right">
                        <button class="btn btn-default btn-outline" type="button" name="showSearch" title="搜索"><i
                                class="glyphicon glyphicon-search"></i></button>
                        <button class="btn btn-default btn-outline" type="button" name="refresh" title="刷新"><i
                                class="glyphicon glyphicon-refresh icon-refresh"></i></button>
                        <button class="btn btn-default btn-outline" type="button" name="toggle" title="切换"><i
                                class="glyphicon glyphicon-list-alt icon-list-alt"></i></button>
                        <div class="keep-open btn-group" title="列">
                            <button type="button" class="btn btn-default btn-outline dropdown-toggle"
                                    data-toggle="dropdown"><i class="glyphicon glyphicon-th icon-th"></i> <span
                                    class="caret"></span></button>
                            <ul class="dropdown-menu" role="menu">
                                <li><label><input type="checkbox" data-field="userId" value="1" checked="checked">
                                    用户ID</label></li>
                                <li><label><input type="checkbox" data-field="loginName" value="2" checked="checked">
                                    登录名称</label></li>
                                <li><label><input type="checkbox" data-field="userName" value="3" checked="checked">
                                    用户名称</label></li>
                                <li><label><input type="checkbox" data-field="dept.deptName" value="4"
                                                  checked="checked"> 部门</label>
                                </li>
                                <li><label><input type="checkbox" data-field="email" value="5"> 邮箱</label></li>
                                <li><label><input type="checkbox" data-field="phonenumber" value="6" checked="checked">
                                    手机</label></li>
                                <li><label><input type="checkbox" data-field="7" value="7" checked="checked">
                                    用户状态</label>
                                </li>
                                <li><label><input type="checkbox" data-field="createTime" value="8" checked="checked">
                                    创建时间</label>
                                </li>
                                <li><label><input type="checkbox" data-field="9" value="9" checked="checked"> 操作</label>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="fixed-table-container" style="padding-bottom: 0px;">
                    <div class="fixed-table-header" style="display: none;">
                        <table></table>
                    </div>
                    <div class="fixed-table-body">
                        <div class="fixed-table-loading" style="top: 42px; display: none;">正在努力地加载数据中，请稍候……</div>
                        <table id="bootstrap-table" class="table table-hover">
                            <thead>
                            <tr>
                                <th class="bs-checkbox " style="width: 36px; " data-field="0" tabindex="0">
                                    <div class="th-inner "><input id='checkall' class='checkAll' name="btSelectAll"
                                                                  type="checkbox"></div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="" data-field="userId" name="user_id" tabindex="0">
                                    <div class="th-inner ">用户ID</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="" data-field="userName" name="user_name" tabindex="0">
                                    <div class="th-inner ">用户名称</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="" data-field="nick_name" name="user_type" tabindex="0">
                                    <div class="th-inner ">用户类型</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="" data-field="dept.deptName" name="email" tabindex="0">
                                    <div class="th-inner ">邮箱</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="" data-field="phoneNumber" name="phoneNumber" tabindex="0">
                                    <div class="th-inner ">手机</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="text-align: center; " data-field="7" name="status" tabindex="0">
                                    <div class="th-inner ">用户状态</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="" data-field="createTime" name="create_time" tabindex="0">
                                    <div class="th-inner sortable both desc">创建时间</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="text-align: center; " data-field="9" tabindex="0">
                                    <div class="th-inner ">操作</div>
                                    <div class="fht-cell"></div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${users}" var="user">
                            <div>
                                <tr data-index="${user.user_id}">
                                    <td class="bs-checkbox" style="width: 36px; " data-field="0" tabindex="0">
                                        <div class="th-inner"><input id="checkbox" class='checkSingle' name="btSelect"
                                                                     type="checkbox"></div>
                                        <div class="fht-cell"></div>
                                    </td>
                                    <td style="" data-field="userId" name="user_id" tabindex="0">
                                            ${user.user_id}
                                        <div class="fht-cell"></div>
                                    </td>
                                    <td style="" data-field="userName" name="user_name" tabindex="0">
                                            ${user.user_name}
                                        <div class="fht-cell"></div>
                                    </td>
                                    <td style="" data-field="nick_name" name="user_type" tabindex="0">
                                            ${user.user_type}
                                        <div class="fht-cell"></div>
                                    </td>
                                    <td style="" data-field="dept.deptName" name="email" tabindex="0">
                                            ${user.email}
                                        <div class="fht-cell"></div>
                                    </td>
                                    <td style="" data-field="phoneNumber" name="phoneNumber" tabindex="0">
                                            ${user.phoneNumber}
                                        <div class="fht-cell"></div>
                                    </td>
                                    <td style="text-align: center; " data-field="7" name="status" tabindex="0">
                                            ${user.status}
                                        <div class="fht-cell"></div>
                                    </td>
                                    <td style="" data-field="createTime" name="create_time" tabindex="0">
                                            ${user.create_time}
                                        <div class="fht-cell"></div>
                                    </td>
                                    <td style="" data-field="createTime" name="create_time" tabindex="0">
                                        <a class="btn btn-success btn-xs "
                                           href="ApplicantUserSelectServlet?id=${user.user_id}" id="modify"
                                           onclick="$.operate.editTab('7')"><i
                                                class="fa fa-edit"></i>编辑</a> <a class="btn btn-danger btn-xs "
                                                                                 href="ApplicantUserDeleteServlet?id=${user.user_id}"
                                                                                 onclick="$.operate.remove('7')"><i
                                            class="fa fa-remove"></i>删除</a>
                                        <div class="fht-cell"></div>
                                    </td>
                                </tr>
                            </div>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="fixed-table-footer" style="display: none;">
                        <table>
                            <tbody>
                            <tr></tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="fixed-table-pagination" style="display: block;">
                        <div class="pull-right pagination" style="display: none;">
                            <ul class="pagination pagination-outline">
                                <li class="page-pre"><a href="javascript:void(0)">‹</a></li>
                                <li class="page-number active"><a href="javascript:void(0)">1</a></li>
                                <li class="page-next"><a href="javascript:void(0)">›</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>

        <div class="footer">

            <div>
                <strong></strong>
            </div>
        </div>

    </div>
</div>
</div>

<!-- Mainly scripts -->
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<%--<!-- jquery-validate 表单验证插件 -->--%>
<script src="js/jquery.validate.min.js"></script>
<script src="js/messages_zh.min.js"></script>
<script src="js/jquery.validate.extend.js"></script>
<%--<!-- jquery-validate 表单树插件 -->--%>
<script src="js/bootstrap-treetable.js"></script>
<!-- jquery-export 表格导出插件 -->
<script src="js/bootstrap-table-export.js"></script>
<script src="js/tableExport.js"></script>
<%--<!-- 遮罩层 -->--%>
<script src="js/jquery.blockUI.js"></script>
<script src="js/icheck.min.js"></script>
<script src="js/layer.min.js"></script>
<script src="js/layui.js"></script>
<script src="js/common.js?v=2.0"></script>
<script src="js/my-ui.js"></script>
<%----%>
<script src="js/index.js"></script>


<!--复选框勾选-->
<script>
    //全选
    $(".checkAll").click(function () {
        if ($(this).is(":checked") == true) {
            $("input[class=checkSingle]").each(function (h) {
                $(this).prop("checked", true);
                $(this).parent().parent().css("background-color", "#E3EFFA"); //选中状态高亮
            });
        } else {
            $("input[class=checkSingle]").each(function (h) {
                $(this).prop("checked", false);
                $(this).parent().parent().css("background-color", "#ffffff");
            });
        }
    });

    //选中一行
    var checknum = $("input[class=checkSingle]").size();

    $(".checkSingle").click(function () {
        if ($(this).is(":checked") == true) {
            if ($(".checkSingle:checked").length == checknum) {
                $(".checkAll").prop("checked", true);
            } else {
                $(".checkAll").prop("checked", false);
            }
            $(this).parent().parent().css("background-color", "#E3EFFA"); //选中状态高亮

        } else {
            if ($(".checkSingle:checked").length == checknum) {
                $(".checkAll").prop("checked", true);
            } else {
                $(".checkAll").prop("checked", false);
            }
            $(this).parent().parent().css("background-color", "#ffffff");
        }
    });
</script>
<!--获取点击之后td里面的值-->
<script>
    $('#modify').on('click', function () {
        var user_id = $(this).parents("tr").find("td:nth-child(2)").text();  //参考实体编码
        //$(this)代表修改的td,  parents("tr")表示td的上一个节点tr，find表示在tr下寻找
        var user_name = $(this).parents("tr").find("td:nth-child(3)").text();  //参考实体名称
        var user_type = $(this).parents("tr").find("td:nth-child(4)").text();  //地域
        var email = $(this).parents("tr").find("td:nth-child(5)").text();  //地域
        var phoneNumber = $(this).parents("tr").find("td:nth-child(6)").text();  //地域
        var status = $(this).parents("tr").find("td:nth-child(7)").text();  //地域
        var create_time = $(this).parents("tr").find("td:nth-child(8)").text();  //地域
    });

</script>
<script>
    let xmlHttpRequest = new XMLHttpRequest();
    let userId = document.getElementById("user_id").value
    xmlHttpRequest.open("GET", "select/one/user?userId=" + userId);
    xmlHttpRequest.onreadystatechange = function () {
        if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
            document.getElementById("font-bold").innerText = xmlHttpRequest.responseText;
        }
    }
    xmlHttpRequest.send();
</script>
</body>
</html>
