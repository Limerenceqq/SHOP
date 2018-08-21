<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/8/16
  Time: 10:32
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
    <title>订单详情</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${path}/style/adminStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i class="order"></i><em>订单编号：${order.oid}</em></span>
    </div>
    <dl class="orderDetail">
        <dt class="order-h">订单详情</dt>
        <dd>
            <ul>
                <li>
                    <span class="h-cont h-right">收件人姓名：</span>
                    <span class="h-cont h-left">${order.name}</span>
                </li>
                <li>
                    <span class="h-cont h-right">联系电话：</span>
                    <span class="h-cont h-left">${order.phone}</span>
                </li>
                <li>
                    <span class="h-cont h-right">送货地址：</span>
                    <span class="h-cont h-left">${order.addr}</span>
                </li>
                <li>
                    <span class="h-cont h-right">付款状态：</span>
                    <c:if test="${order.state == 1}">
                        <span class="h-cont h-left">未付款</span>
                    </c:if>
                    <c:if test="${order.state == 2}">
                        <span class="h-cont h-left">已付款</span>
                    </c:if>
                    <c:if test="${order.state == 3}">
                        <span class="h-cont h-left">已发货</span>
                    </c:if>
                    <c:if test="${order.state == 4}">
                        <span class="h-cont h-left">已收货</span>
                    </c:if>
                </li>
                <li>
                    <span class="h-cont h-right">下单时间：</span>
                    <span class="h-cont h-left">${order.orderTime}</span>
                </li>
                <li>
                    <span class="h-cont h-right">付款时间：</span>
                    <span class="h-cont h-left">2015-04-18 13:35</span>
                </li>
            </ul>
        </dd>
        <dd style="padding:1em 0;">
            <span><b>订单留言：</b></span>
            <span>...这里是用户留言信息，务必***请到****谢谢~</span>
        </dd>
        <dd>
            <table class="list-style">
                <tr>
                    <th>缩略图</th>
                    <th>产品</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>
                <tr>
                    <c:forEach items="${order.orderItems}" var="orderItem">
                        <td>
                            <img src="${path}/${orderItem.product.image}" class="thumbnail"/>
                        </td>
                        <td>
                            ${orderItem.product.pname}
                        </td>
                        <td>
                           <span>
                            <i>￥</i>
                            <em>${orderItem.product.shopPrice}</em>
                           </span>
                        </td>
                        <td>
                            ${orderItem.count}
                        </td>
                        <td>
                           <span>
                               <i>￥</i>
                               <em>${orderItem.subtotal}</em>
                           </span>
                        </td>
                    </c:forEach>
                </tr>
                <tr>
                    <td colspan="5">
                        <div class="fr">
                            <span style="font-size:15px;font-weight:bold;">
                             <i>订单共计金额：￥${order.total}</i>
                             <b>0.00</b>
                            </span>
                        </div>
                    </td>
                </tr>
            </table>
        </dd>
        <dd>
            <table class="noborder">
                <tr>
                    <td width="10%" style="text-align:right;"><b>管理员操作：</b></td>
                    <td>
                        <textarea class="block" style="width:80%;height:35px;outline:none;"></textarea>
                    </td>
                </tr>
            </table>
        </dd>
        <dd>
            <!-- Operation -->
            <div class="BatchOperation">
                <input type="button" value="打印订单" class="btnStyle"/>
                <%--<input type="button" value="配送" class="btnStyle"/>--%>
                <%--<input type="button" value="发货" class="btnStyle"/>--%>
                <c:if test="${order.state <= 2}">
                    <a href="${path}/order/changeState?order=${order}" style="background: #555555;
                                                                border: 1px #666666 solid;
                                                                font-size: 14px;
                                                                color: #fff;
                                                                padding: 5px 15px;
                                                                cursor: pointer;">发货
                    </a>
                </c:if>
                <input type="button" value="取消订单" class="btnStyle"/>
            </div>
        </dd>
    </dl>
</div>
</body>
</html>
