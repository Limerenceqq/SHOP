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
<c:if test="${pageBean.list == null}">
    <tr align="center">
        <strong style="color: #cc0000">您还没有购物！</strong><br/>
        <a href="${path}/home/index">
            <strong style="color: #f08b02">前去购物>>>></strong>
        </a>
    </tr>
</c:if>

<c:if test="${pageBean.list != null}">
<div class="container cart">
    <div class="span24">
        <div class="step step1">
            <ul>
                <li  class="current"></li>
                <li style="color: #cc0000; font-size: 25px">订单管理</li>
            </ul>
        </div>
        <ul class="mainNav">
            <li>
                <a href="${path}/order/findMyOrders">所有订单</a>
                |
            </li>
            <li>
                <a href="${path}/order/findMyOrders?state=1&pageNow=1">待付款</a>
                |
            </li>
            <li>
                <a href="${path}/order/findMyOrders?state=2&pageNow=1">待发货</a>
                |
            </li>
            <li>
                <a href="${path}/order/findMyOrders?state=3&pageNow=1">待收货</a>
                |
            </li>
            <li>
                <a href="${path}/order/findMyOrders?state=4&pageNow=1">已完成</a>
                |
            </li>
        </ul>
        <table><%--❁ s̫☏ѧѦ ѧ︵ ̢ ̱ ̱ι̊ι̱s̫ ̱Ѧѧ ѧ ̊o̖ Ѧ--%>
            <tbody>
            <tr>
                <th  width="100px" valign="top">
                    <font size="5px" color="#d2691e">图片</font>
                </th>
                <th align="center" width="200px">
                    <font size="5px" color="#d2691e">商品</font>
                </th>
                <th align="center" width="100px">
                    <font size="5px" color="#d2691e">价格</font>
                </th>
                <th align="center" width="90px">
                    <font size="5px" color="#d2691e">数量</font>
                </th>
                <th align="center" width="90px">
                    <font size="5px" color="#d2691e">小计</font>
                </th>
                <th align="center" width="100px">
                    <font size="5px" color="#d2691e">合计</font>
                </th>
                <th align="center" width="200px">
                    <font size="5px" color="#d2691e">交易状态</font>
                </th>
                <th align="center" width="200px">
                    <font size="5px" color="#d2691e">交易操作</font>
                </th>
            </tr>
            <c:forEach items="${pageBean.list}" var="order">
            <tr>
                <th colspan="5">
                    <font style="color: black" size="3px">订单编号:${order.oid}</font>
                </th>
                <th colspan="3">
                    <font style="color: black" size="3px">成交时间:${order.orderTime}</font>
                </th>
            </tr>
                <c:set var="i" value="1"/>
                <c:forEach items="${order.orderItems}" var="oi">
                <tr>
                    <td width="60">
                        <img src="${path}/${oi.product.image}"/>
                    </td>
                    <td align="center">
                        <a target="_blank">${oi.product.pname}</a>
                    </td>
                    <td align="center">
                        ${oi.product.shopPrice }
                    </td>
                    <td class="quantity" width="60" align="center">
                        x${oi.count}
                    </td>
                    <td width="140" align="center">
                        <span class="subtotal">$${oi.subtotal }</span>
                    </td>
                    <%--<c:if test="${order.orderItems.size()%2==1}">--%>
                        <%--<c:if test="${i==(order.orderItems.size()+1)/2}">--%>
                    <c:if test="${i==1}">
                            <td rowspan="${order.orderItems.size()}" align="center">
                                $${order.total}
                            </td>
                            <td rowspan="${order.orderItems.size()}" align="center">
                                <c:if test="${order.state==1}">
                                    未付款
                                </c:if>
                                <c:if test="${order.state==2}">
                                    已付款
                                </c:if>
                                <c:if test="${order.state==3}">
                                    已发货
                                </c:if>
                                <c:if test="${order.state==4}">
                                    订单完成
                                </c:if>
                            </td>
                            <td rowspan="${order.orderItems.size()}" align="center">
                                <c:if test="${order.state==1}">
                                    <a href="#"><font color="red" size="3px">去付款</font></a>
                                </c:if>
                                <c:if test="${order.state==2}">
                                    <a href="#"><font color="red" size="3px">提醒发货</font></a>
                                </c:if>
                                <c:if test="${order.state==3}">
                                    <a href="#"><font color="red" size="3px">确认收货</font></a>
                                </c:if>
                                <c:if test="${order.state==4}">
                                    <a href="#"><font color="red" size="3px">再次购买</font></a>
                                </c:if>
                            </td>
                    </c:if>
                </tr>
                <c:set var="i" value="${i+1}"/>
                </c:forEach>
            </c:forEach>
            </tbody>
        </table>
        <div class="pagination">
            第  ${pageBean.pageNow}/${pageBean.totalPage}页
            <c:if test="${ pageBean.pageNow != 1}">
                <a href="${path}/order/findMyOrders?state=${pageBean.state}&pageNow=1" class="firstPage">&nbsp;</a>
                <a href="${path}/order/findMyOrders?state=${pageBean.state}&pageNow=${pageBean.pageNow-1 }" class="previousPage">&nbsp;</a>
            </c:if>
            <c:forEach var="i" begin="1" end="${pageBean.totalPage}" step="1">
                <c:if test="${pageBean.pageNow==i }">
                    <span class="currentPage">${i}</span>
                </c:if>
                <c:if test="${pageBean.pageNow!=i }">
                    <a href="${ path }/order/findMyOrders?state=${pageBean.state}&pageNow=${i}">${i}</a>
                </c:if>
            </c:forEach>
            <c:if test="${pageBean.pageNow != pageBean.totalPage }">
                <a class="nextPage" href="${path}/order/findMyOrders?state=${pageBean.state}&pageNow=${pageBean.pageNow+1 }">&nbsp;</a>
                <a class="lastPage" href="${path}/order/findMyOrders?state=${pageBean.state}&pageNow=${pageBean.totalPage}">&nbsp;</a>
            </c:if>
        </div>
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
