<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/7/31
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<c:set var="path" value="${pageContext.request.contextPath}" ></c:set>
<div class="span24">
    <ul class="mainNav">
        <li>
            <a href="${path}/home/index">首页</a>
            |
        </li>
        <c:forEach items="${categoryList}" var="category">
            <li>
                <a href="${path}/product/findProductByCid?cid=${category.cid}&pageNow=1">${category.cname}</a>
                |
            </li>
        </c:forEach>
    </ul>
</div>