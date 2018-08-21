<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/8/15
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page isELIgnored="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!doctype html>
<head>
    <title>后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="robots" content="nofollow"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css" />
    <style>
        body{width:100%;height:100%;overflow:hidden;background:url(${path}/images/pc_loginBg.jpg) no-repeat;background-size:cover;position:absolute;}
    </style>
    <script src="${path}/js/jquery1.js"></script>
    <script src="${path}/js/Particleground.js"></script>
    <script>
        $(document).ready(function() {
            $('body').particleground({
                dotColor:'green',
                lineColor:'#c9ec6e'
            });
            $('.intro').css({
                'margin-top': -($('.intro').height() /2)
            });
            $(".loginform input[type='button']").click(function(){
                alert("登陆成功，程序对接时将其删除，此处测试！");
                location.href="index.html";
            });
        });
    </script>

</head>
<body>
<section class="loginform">
    <h1>后台管理系统</h1>
    <ul>
        <li>
            <label>账号：</label>
            <input type="text" class="textBox" placeholder="管理员账号"/>
        </li>
        <li>
            <label>密码：</label>
            <input type="password" class="textBox" placeholder="登陆密码"/>
        </li>
        <li>
            <input type="button" value="立即登陆"/>
        </li>
    </ul>
</section>
</body>
</html>
