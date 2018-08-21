<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/8/16
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page isELIgnored="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!doctype html>
<head>
    <title>header</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${path}/style/adminStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="header">
    <div class="logo">
        <img src="${path}/images/admin_logo.png" title="在哪儿"/>
    </div>
    <div class="fr top-link">
        <a href="#" target="_blank" title="访问站点">
            <i class="shopLinkIcon"></i>
            <span>访问站点</span>
        </a>
        <a href="admin_list.html" target="mainCont" title="DeathGhost">
            <i class="adminIcon"></i>
            <span>管理员：${sessionScope.user.username}</span>
        </a>
        <a href="#" title="修改密码">
            <i class="clearIcon"></i>
            <span>清除缓存</span>
        </a>
        <a href="revise_password.html" target="mainCont" title="修改密码">
            <i class="revisepwdIcon"></i>
            <span>修改密码</span>
        </a>
        <a href="${path}/login/loginOut" title="安全退出" style="background:rgb(60,60,60);">
            <i class="quitIcon"></i>
            <span>安全退出</span>
        </a>
    </div>
</div>
</body>
</html>
