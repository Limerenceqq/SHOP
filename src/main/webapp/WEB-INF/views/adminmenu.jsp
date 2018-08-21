<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/8/16
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page isELIgnored="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>左侧导航</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${path}/style/adminStyle.css" rel="stylesheet" type="text/css" />
    <script src="${path}/js/jquery.js"></script>
    <script src="${path}/js/public1.js"></script>
</head>
<body style="background:#313131">
<div class="menu-list">
    <a href="${path}/main.jsp" target="mainCont" class="block menu-list-title center"
       style="border:none;margin-bottom:8px;color:#fff;">起始页</a>
    <ul>
        <li class="menu-list-title">
            <span>订单管理</span>
            <i>◢</i>
        </li>
        <li>
            <ul class="menu-children">
                <li><a href="${path}/order/findOrders?pageNow=1" title="商品列表" target="mainCont">订单列表</a></li>
            </ul>
        </li>

        <li class="menu-list-title">
            <span>商品管理</span>
            <i>◢</i>
        </li>
        <li>
            <ul class="menu-children">
                <li><a href="${path}/product_list.jsp" title="商品列表" target="mainCont">商品列表</a></li>
                <li><a href="${path}/product_category.jsp" title="商品分类" target="mainCont">商品分类</a></li>
                <li><a href="${path}/recycle_bin.jsp" title="商品分类" target="mainCont">商品回收站</a></li>
            </ul>
        </li>

        <li class="menu-list-title">
            <span>会员管理</span>
            <i>◢</i>
        </li>
        <li>
            <ul class="menu-children">
                <li><a href="${path}/user_list.jsp" title="会员列表" target="mainCont">会员列表</a></li>
                <li><a href="${path}/add_user.jsp" title="添加会员" target="mainCont">添加会员</a></li>
                <li><a href="${path}/user_rank.jsp" title="会员等级" target="mainCont">会员等级</a></li>
                <li><a href="${path}/user_message.jsp" title="会员留言" target="mainCont">会员留言</a></li>
            </ul>
        </li>

        <li class="menu-list-title">
            <span>系统设置</span>
            <i>◢</i>
        </li>
        <li>
            <ul class="menu-children">
                <li><a href="${path}/basic_settings.jsp" title="站点基本设置" target="mainCont">站点基本设置</a></li>
                <li><a href="${path}/admin_list.jsp" title="站点基本设置" target="mainCont">站点管理员</a></li>
            </ul>
        </li>

        <li class="menu-list-title">
            <span>广告管理</span>
            <i>◢</i>
        </li>
        <li>
            <ul class="menu-children">
                <li><a href="${path}/advertising_list.jsp" title="站点基本设置" target="mainCont">广告列表</a></li>
            </ul>
        </li>

    </ul>
</div>
<div class="menu-footer">© 版权所有 2015 "DeathGhost"</div>
</body>
</html>