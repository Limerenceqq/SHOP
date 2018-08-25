<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/8/16
  Time: 10:28
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
    <title>订单列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${path}/style/adminStyle.css" rel="stylesheet" type="text/css" />
    <script src="${path}/js/jquery1.js"></script>
    <script src="${path}/js/public.js"></script>
    <script type="text/javascript" src="${path}/js/WdatePicker.js"></script>
    <link href="${path}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/css/product.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl">
            <i class="order"></i>
            <em>订单列表</em>
        </span>
    </div>
    <div class="operate">
        <form action="${path}/order/findOrders?pageNow=1" method="post">

            <img src="${path}/images/icon_search.gif"/>
            <input type="text" id="oid" name="oid" class="textBox length-long" placeholder="输入订单编号..."
                   style="width: 200px"/>
            <input type="text" id="username" name="username" class="textBox length-long"
                   placeholder="输入下单人姓名..." style="width: 200px"/>
            <input type="text" id="startTime" name="startTime" class="Wdate"
                   onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" placeholder="起始时间..."/>
            <input type="text" id="endTime" name="endTime" class="Wdate"
                   onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" placeholder="最后时间..."/>
            <select class="inline-select" id="state" name="state" placeholder="状态" class="tdBtn">
                <%--<option value="0">状—态</option>--%>
                <option value="1">未付款</option>
                <option value="2">已付款</option>
                <option value="3">已发货</option>
                <option value="4">已收货</option>
            </select>
            <input type="submit" value="查询" class="tdBtn" style="width: 50px"/>
        </form>
    </div>
    <table class="list-style Interlaced">
        <tr>
            <th>订单编号</th>
            <th>下单时间</th>
            <th>收件人</th>
            <th>订单金额</th>
            <th>订单状态</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${pageBean.list}" var="orders">
        <tr>
            <td>
                <input type="checkbox"/>
                <span>${orders.oid}</span>
            </td>
            <td class="center">
                <span class="block">${orders.user.username}</span>
                <span class="block">${orders.orderTime}</span>
            </td>
            <td width="450">
                <span class="block">${orders.name}</span>
                <address>${orders.addr}</address>
            </td>
            <td class="center">
                <span><i>￥</i><b>${orders.total}</b></span>
            </td>
            <td class="center">
                <c:if test="${orders.state == 1}">
                    <span>未付款</span>
                </c:if>
                <c:if test="${orders.state == 2}">
                    <span>已付款</span>
                </c:if>
                <c:if test="${orders.state == 3}">
                    <span>已发货</span>
                </c:if>
                <c:if test="${orders.state == 4}">
                    <span>已收货</span>
                </c:if>
            </td>
            <td class="center">
                <a href="${path}/order/findOrderByOid?oid=${orders.oid}" class="inline-block" title="查看订单">
                    <img src="${path}/images/icon_view.gif"/></a>
                <a href="${path}/order/deleteOrder" class="inline-block" title="删除订单">
                    <img src="${path}/images/icon_trash.gif"/></a>
            </td>
        </tr>
        </c:forEach>

    </table>
    <!-- BatchOperation -->
    <div style="overflow:hidden;">
        <!-- Operation -->
        <div class="BatchOperation fl">
            <input type="checkbox" id="del"/>
            <label for="del" class="btnStyle middle">全选</label>
            <input type="button" value="打印订单" class="btnStyle"/>
            <input type="button" value="配货" class="btnStyle"/>
            <input type="button" value="删除订单" class="btnStyle"/>
        </div>
        <!-- turn page -->
        <div class="pagination">
            第  ${pageBean.pageNow}/${pageBean.totalPage}页
            <c:if test="${ pageBean.pageNow != 1}">
                <a href="${path}/order/findOrders?pageNow=1" class="firstPage">&nbsp;</a>
                <a href="${path}/order/findOrders?pageNow=${pageBean.pageNow-1 }" class="previousPage">&nbsp;</a>
            </c:if>
            <c:forEach var="i" begin="1" end="${pageBean.totalPage}" step="1">
                <c:if test="${pageBean.pageNow==i }">
                    <span class="currentPage">${i}</span>
                </c:if>
                <c:if test="${pageBean.pageNow!=i }">
                    <a href="${ path }/order/findOrders?pageNow=${i}">${i}</a>
                </c:if>
            </c:forEach>
            <c:if test="${pageBean.pageNow != pageBean.totalPage }">
                <a class="nextPage" href="${path}/order/findOrders?pageNow=${pageBean.pageNow+1 }">&nbsp;</a>
                <a class="lastPage" href="${path}/order/findOrders?pageNow=${pageBean.totalPage}">&nbsp;</a>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
