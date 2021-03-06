<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>OMS客户订单管理系统 - 修改客户</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="css/my-ui.css?v=2.1" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=2.2.0" rel="stylesheet">

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
                                <span class="clear"> <span class="block m-t-xs"> <strong
                                        class="font-bold">admin</strong>
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
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="index.html"><i class="fa fa-user-secret"></i> <span class="nav-label">客户管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="search_results.html">客户基本信息</a>
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
                    <a href="user"><i class="fa fa-user"></i> <span class="nav-label">用户管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="user">用户基本信息</a>
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
                                class="fa fa-home"></i></a>欢迎使用OMS后台管理系统</span>
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
                <h2>订单管理</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="index.html">主页</a>
                    </li>
                    <li>
                        <a href="user.html"><strong>订单管理</strong></a>
                    </li>
                    <li>
                        <strong>修改订单信息</strong>
                    </li>
                </ol>
            </div>
        </div>



        <div class="main-content">
            <form id="form-user-add" class="form-horizontal" novalidate="novalidate" action="CustomerUpdateServlet" method="post">
                <input name="cid" value="${user.cid}" type="hidden" id="treeId">
                <h4 class="form-header h4">基本信息</h4>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label is-required">交易金额：</label>
                            <div class="col-sm-8">
                                <input name="cnam" placeholder="请输入交易金额" value="${user.cnam}" class="form-control"  type="text" maxlength="30" required="" aria-required="true">
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label is-required">交易数量：</label>
                            <div class="col-sm-8">
                                <input name="cadd"  placeholder="请输入交易数量" type="text" value="${user.cadd}"  class="form-control email"  maxlength="20"required="" aria-required="true">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label is-required">交易状态：</label>
                            <div class="col-sm-8">
                                <input name="cpeo" placeholder="请输入交易状态" value="${user.cpeo}" class="form-control" type="text" maxlength="30" required="" aria-required="true">
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label is-required">下单手机号：</label>
                            <div class="col-sm-8">
                                <input id="ctel" name="ctel" placeholder="请输入手机号码" value="${user.ctel}" class="form-control" type="text" maxlength="11" required="" aria-required="true">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label is-required">交易时间：</label>
                            <div class="col-sm-8">
                                <input  name="cmai" placeholder="请输入交易时间" value="${user.cmai}" class="form-control email" type="text" maxlength="20"  required="" aria-required="true">
                            </div>
                        </div>
                    </div>
                </div>

                <h4 class="form-header h4">其他信息</h4>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label class="col-xs-2 control-label">备注：</label>
                            <div class="col-xs-10">
                                <textarea name="remark" maxlength="500" class="form-control" rows="3"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-offset-5 col-sm-10">
                        <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-check"></i>保 存</button>&nbsp;
                        <button type="button" class="btn btn-sm btn-danger" onclick="closeItem()"><i class="fa fa-reply-all"></i>关 闭 </button>
                    </div>
                </div>

            </form>
        </div>
        <div class="footer">
            <div class="pull-right">
                By：<a href="http://www.zi-han.net" target="_blank"></a>
            </div>
            <div>
                <strong></strong>
            </div>
        </div>

    </div>
</div>
</div>

<!-- Mainly scripts -->
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap.min.js?v=3.4.0"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="js/hplus.js?v=2.2.0"></script>
<script src="js/plugins/pace/pace.min.js"></script>


</body>

</html>
