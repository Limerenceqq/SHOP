<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/8/16
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page isELIgnored="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!doctype html>
<head>
    <title>管理员列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${path}/style/adminStyle.css" rel="stylesheet" type="text/css" />
    <script src="${path}/js/jquery.js"></script>
    <script src="${path}/js/public1.js"></script>
</head>
<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i class="user"></i><em>管理员列表</em></span>
        <span class="modular fr">
            <a href="${path}/revise_password.html" class="pt-link-btn">+添加管理员</a>
        </span>
    </div>
    <table class="list-style Interlaced">
        <tr>
            <th>管理员账号</th>
            <th>电子邮箱地址</th>
            <th>加入时间</th>
            <th>最后登陆时间</th>
            <th>操作</th>
        </tr>
        <tr>
            <td>DeathGhost</td>
            <td>DeathGhost@sina.cn</td>
            <td class="center">2015-04-18 17:38</td>
            <td class="center">2015-04-19 15:38</td>
            <td class="center">
                <a href="${path}/revise_password.html">
                    <img src="${path}/images/icon_edit.gif"/>
                </a>
                <a><img src="${path}/images/icon_drop.gif"/></a>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
