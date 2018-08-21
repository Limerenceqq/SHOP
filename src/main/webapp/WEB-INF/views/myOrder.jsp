<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/8/7
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<c:set var = "path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <title>我的订单页面</title>
    <link href="${path}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/css/cart.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="container header">
    <div class="span5">
        <div class="logo">
            <a href="${path}/home/index">
                <img src="${path}/image/logo.gif" alt="Amozon"/>
            </a>
        </div>
    </div>
    <div class="span9">
        <div class="headerAd">
            <img src="${path}/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/>
        </div>
    </div>
    <%@ include file="header.jsp" %>

</div>
<c:if test="${orderList == null}">
    <tr align="center">
        <strong style="color: #cc0000">您还没有购物！</strong><br/>
        <a href="${path}/home/index">
            <strong style="color: #f08b02">前去购物>>>></strong>
        </a>
    </tr>
</c:if>

<c:if test="${orderList != null}">
<div class="container cart">

    <div class="span24">
        <div class="step step1">
            <ul>
                <li  class="current"></li>
                <li  >订单</li>
            </ul>
        </div>
        <table>
            <tbody>
            <c:forEach items="${orderList}" var="orderList">
                <tr>
                    <th colspan="5">
                        订单号:${orderList.oid }
                        金额:<font color="red">${orderList.total } </font>
                        状态 :<c:if test="${orderList.state==1}">
                        <a href="${path}/findByOid?oid=${orderList.oid}"><font color="red">付款</font></a>
                    </c:if>
                        <c:if test="${orderList.state==2}">
                            已付款
                        </c:if>
                        <c:if test="${orderList.state==3}">
                            <a href=""><font color="red">确认收货</font></a>
                        </c:if>
                        <c:if test="${orderList.state==4}">
                            订单完成
                        </c:if>
                    </th>
                </tr>
                <tr>
                    <th>图片</th>
                    <th>商品</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>
                <c:forEach items="${orderList.orderItems }" var="orderItem">
                    <tr>
                        <td width="60">
                            <img src="${path}/${orderItem.product.image}"/>
                        </td>
                        <td>
                            <a target="_blank">${orderItem.product.pname }</a>
                        </td>
                        <td>
                                ${orderItem.product.shopPrice }
                        </td>
                        <td class="quantity" width="60">
                                ${orderItem.count }
                        </td>
                        <td width="140">
                            <span class="subtotal">￥${orderItem.subtotal }</span>
                        </td>
                    </tr>
                </c:forEach>
            </c:forEach>
            </tbody>

        </table>


    </div>

</div>
</c:if>
<div class="container footer">
    <div class="span24">
        <div class="footerAd">
            <img src="${path}/image/footer.jpg" alt="我们的优势" title="我们的优势" height="52" width="950"/>
        </div>
    </div>
    <div class="span24">
        <ul class="bottomNav">
            <li>
                <a href="#">关于我们</a>
                |
            </li>
            <li>
                <a href="#">联系我们</a>
                |
            </li>
            <li>
                <a href="#">诚聘英才</a>
                |
            </li>
            <li>
                <a href="#">法律声明</a>
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
                <a >SHOP++官网</a>
                |
            </li>
            <li>
                <a>SHOP++论坛</a>

            </li>
        </ul>
    </div>
    <div class="span24">
        <div class="copyright">Copyright © 2018-2099 Amazon 版权所有</div>
    </div>
</div>
</body>
</html>
