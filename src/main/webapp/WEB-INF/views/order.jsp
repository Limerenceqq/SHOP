<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/8/7
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>订单页面</title>
    <link href="${path}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/css/cart.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="container header">
    <div class="span5">
        <div class="logo">
            <a href="${path}/home/index">
                <img src="${path}/image/logo.gif" alt="Amazon"/>
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

<div class="container cart">

    <div class="span24">

        <div class="step step1">
            <ul>
                <li  class="current"></li>
                <li>生成订单成功</li>
                <li>订单号:${orders.oid}</li>
            </ul>
        </div>

        <table>
            <tbody>
            <tr>
                <th>图片</th>
                <th>商品名</th>
                <th>价格</th>
                <th>数量</th>
                <th>小计</th>
            </tr>
            <c:forEach items="${orders.orderItems}" var="orderItem">
                <tr>
                    <td width="60">
                        <img src="${path}/${orderItem.product.image}"/>
                    </td>
                    <td align="center">
                        <a target="_blank">${orderItem.product.pname}</a>
                    </td>
                    <td align="center">
                            ${orderItem.product.shopPrice}
                    </td>
                    <td class="quantity" width="60" align="center">
                            ${orderItem.count}
                    </td>
                    <td width="140" align="center">
                        <span class="subtotal">￥${orderItem.subtotal}</span>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <dl id="giftItems" class="hidden" style="display: none;">
        </dl>
        <div class="total">
            <em id="promotion"></em>
            商品金额: <strong id="effectivePrice">￥${orders.total}元</strong>
        </div>
        <form id="orderForm" action="${path}/order/payOrder" method="post">
            <input type="hidden" name="orderId" value="${orders.oid }"/>
            <div class="span24">
                <p>
                    收货地址：<input name="orderAddr" type="text" value="${orders.user.addr }" style="width:350px" />
                    <br />
                    收货人&nbsp;&nbsp;&nbsp;：<input name="name" type="text" value="${orders.user.username}"  style="width:150px" />
                    <br />
                    联系方式：<input name="orderPhone" type="text" value="${orders.user.phone }" style="width:150px" />

                </p>
                <br/>
                <p>
                    选择银行：<br/>
                    <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
                    <img src="${path}/bankImage/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
                    <img src="${path}/bankImage/bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
                    <img src="${path}/bankImage/abc.bmp" align="middle"/>
                    <br/>
                    <input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
                    <img src="${path}/bankImage/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
                    <img src="${path}/bankImage/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
                    <img src="${path}/bankImage/ccb.bmp" align="middle"/>
                    <br/>
                    <input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
                    <img src="${path}/bankImage/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
                    <img src="${path}/bankImage/cmb.bmp" align="middle"/>
                </p>
                <hr />
                <p style="text-align:right">
                    <a href="${path}/order/payOrder">
                        <%--<img src="${path}/images/finalbutton.gif" width="204" height="51" border="0" />--%>
                            <input type="submit" value="付款" style="display: block;
                                                                width: 110px;
                                                                height: 50px;
                                                                color: white;
                                                                background: #d80000;
                                                                font-size: 30px;
                                                                letter-spacing: 5px;
                                                                text-decoration: none;
                                                                line-height: 50px;
                                                                text-align: center;
                                                                border-radius: 2px;">
                    </a>
                </p>
            </div>
        </form>
    </div>

</div>
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