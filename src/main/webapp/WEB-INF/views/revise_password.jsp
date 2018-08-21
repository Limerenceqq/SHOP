<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/8/16
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page isELIgnored="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!doctype html>
<head>
    <title>修改密码</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${path}/style/adminStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i class="user"></i><em>修改密码</em></span>
    </div>
    <table class="noborder">
        <tr>
            <td width="15%" style="text-align:right;">账号：</td>
            <td><input type="text" class="textBox length-middle"/></td>
        </tr>
        <tr>
            <td style="text-align:right;">邮箱：</td>
            <td><input type="text" class="textBox length-middle"/></td>
        </tr>
        <tr>
            <td style="text-align:right;">旧密码：</td>
            <td><input type="password" class="textBox length-middle"/></td>
        </tr>
        <tr>
            <td style="text-align:right;">新密码：</td>
            <td><input type="password" class="textBox length-middle"/></td>
        </tr>
        <tr>
            <td style="text-align:right;">再次确认密码：</td>
            <td><input type="password" class="textBox length-middle"/></td>
        </tr>
        <tr>
            <td style="text-align:right;"></td>
            <td><input type="submit" class="tdBtn" value="保存"/></td>
        </tr>
    </table>
</div>
</body>
</html>
