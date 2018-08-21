<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/8/16
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page isELIgnored="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <frameset rows="76,*" framespacing="0" border="0">
        <frame src="${path}/admin/top" id="header-frame" name="header-frame" frameborder="no" scrolling="no">
        <%--<%@include file="top.jsp"%>--%>
        <frameset cols="180, 10, *" framespacing="0" border="0" id="frame-body">
            <frame src="${path}/admin/adminmenu" frameborder="no" scrolling="yes">
            <frame src="${path}/admin/bar" frameborder="no" scrolling="no">
            <frame src="${path}/admin/main" name="mainCont" frameborder="no" scrolling="yes">
            <%--<%@include file="adminmenu.jsp"%>
            <%@include file="bar.jsp"%>
            <%@include file="main.jsp"%>--%>
        </frameset>
    </frameset>
    <noframes></noframes>
</head>

</html>
