<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/7/31
  Time: 23:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<c:set var="path" value="${pageContext.request.contextPath}" ></c:set>
<div class="span10 last">
    <div class="topNav clearfix">
        <ul>
            <c:if test="${sessionScope.user != null}">
                <li id="headerLogin" class="headerLogin" style="display: list-item;">
                </li>
                <li id="headerRegister" class="headerRegister" style="display: list-item;">
                    <a href="${path}/order/myOrder.do">我的订单</a>|
                </li>
                <li id="headerLogin" class="headerLogin" style="display: list-item;">
                </li>
                <li id="headerRegister" class="headerRegister" style="display: list-item;">
                    <a href="${path}/login/loginOut.do">退出</a>|
                </li>
            </c:if>
            <c:if test="${sessionScope.user == null}">
                <li id="headerLogin" class="headerLogin" style="display: list-item;">
                    <a href="${path}/home/login.do">您好,请登录</a>|
                </li>
                <li id="headerRegister" class="headerRegister" style="display: list-item;">
                    <a href="${path}/home/register.do">注册</a>|
                </li>
            </c:if>
            <li id="headerUsername" class="headerUsername"></li>
            <li id="headerLogout" class="headerLogout">
                <a>[退出]</a>|
            </li>
            <li>
                <a>会员中心</a>
                |
            </li>
            <li>
                <a>购物指南</a>
                |
            </li>
            <li>
                <a>关于我们</a>

            </li>
        </ul>
    </div>
    <div class="cart">
        <a  href="${path}/cart/showCart.do">购物车</a>
    </div>
    <div class="phone">
        客服热线:
        <strong>96008/53277764</strong>
    </div>
</div>