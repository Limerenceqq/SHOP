<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/8/2
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>亚马逊购物商城</title>
    <link href="${path}/css/slider.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/css/index.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container header">
        <div class="span5">
            <div class="logo">
                <a href="${path}/home/index.do">
                    <img src="${path}/image/logo.gif" alt="zmazon"/>
                </a>
            </div>
        </div>
        <div class="span9">
            <div class="headerAd">
                <img src="${path}/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/>
            </div>
        </div>
        <%@ include file="header.jsp" %>
        <%@ include file="menu.jsp" %>
    </div>
    </br></br></br></br>
    <table width="60%" border="0" cellspacing="0" style="margin-top:240px" align="center">
        <tr align="center">
            <h3 style="color: #cc0000" align="center">${msg}</h3>
        </tr>
        </br></br></br></br>
        <tr align="center">
            <a href="${path}/home/index.do" style="color: #f08b02"><h3 align="center">回到首页</h3></a>
        </tr></br>
        <tr>
            <a href="${path}/home/register.do" style="color: #cc0000"><h3 align="center">去注册</h3></a>
        </tr></br>
        <tr>
            <a href="${path}/home/login.do" style="color: #66f4df"><h3 align="center">去登录</h3></a>
        </tr>
    </table>
    <h1>&nbsp;</h1>
    <div class="container footer">
        <div class="span24">
            <div class="footerAd">
                <img src="${path}/image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势"/>
            </div>	</div>
        <div class="span24">
            <ul class="bottomNav">
                <li>
                    <a>关于我们</a>
                    |
                </li>
                <li>
                    <a>联系我们</a>
                    |
                </li>
                <li>
                    <a>招贤纳士</a>
                    |
                </li>
                <li>
                    <a>法律声明</a>
                    |
                </li>
                <li>
                    <a>友情链接</a>
                    |
                </li>
                <li>
                    <a target="_blank">支付方式</a>
                    |
                </li>
                <li>
                    <a target="_blank">配送方式</a>
                    |
                </li>
                <li>
                    <a>服务声明</a>
                    |
                </li>
                <li>
                    <a>广告声明</a>

                </li>
            </ul>
        </div>
        <div class="span24">
            <div class="copyright">Copyright © 2005-2013 Mango商城 版权所有</div>
        </div>
    </div>
</body>
</html>
