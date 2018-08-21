<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/7/31
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link href="${path}/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="divcontent">
    <table width="850px" border="0" cellspacing="0">
        <tr>
            <td style="padding:30px; text-align:center">
                <table width="60%" border="0" cellspacing="0" style="margin-top:70px">
                    <tr>
                        <td style="width:98px">
                            <img src="${path}/images/IconTexto_WebDev_009.jpg" width="128" height="128" />
                        </td>
                        <td style="padding-top:30px"><font style="font-weight:bold; color:#FF0000">${message}</font><br/>
                            <br/>
                            <a href="${path}/home/index.do">首页</a>
                            <a href="${path}/home/register.do">注册</a>
                            <a href="${path}/home/login.do">登录</a>
                        </td>
                    </tr>
                </table>
                <h1>&nbsp;</h1>
            </td>
        </tr>
    </table>
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
            <div class="copyright">Copyright © 2018-2099 Amazon 版权所有</div>
        </div>
    </div>
</div>
</body>
</html>