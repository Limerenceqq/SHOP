<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/8/19
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page isELIgnored="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="robots" content="nofollow"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css" />
    <style>
        body{width:100%;height:100%;overflow:hidden;background:url(${path}/images/pc_loginBg.jpg) no-repeat;
            background-size:cover;position:absolute;}
    </style>
    <script src="${path}/js/jquery1.js"></script>
    <script src="${path}/js/Particleground.js"></script>
    <script type="text/javascript">
        // 刷新图形验证码
        function refreshCheckCode() {
            var timestamp = new Date().getTime();
            $("#checkCodeImg").attr("src", "${path}/user/checkCode/" + timestamp)
        }
        /*   js实现记住密码功能 */
        // 得到cookie
        function getCookie(c_name) {
            if (document.cookie.length > 0) {
                c_start = document.cookie.indexOf(c_name + "=");
                if (c_start != -1) {
                    c_start = c_start + c_name.length + 1;
                    c_end = document.cookie.indexOf(";", c_start);
                    if (c_end == -1)
                        c_end = document.cookie.length;
                    return unescape(document.cookie.substring(c_start, c_end));
                }
            }
            return "";
        }

        // 删除cookie
        function delCookie(name) {
            var exp = new Date();
            exp.setTime(exp.getTime() - 1);
            var cval = getCookie(name);
            if (cval != null)
                document.cookie = name + "=" + cval + ";expires="
                    + exp.toGMTString();
        }
        // 设置cookie
        function setCookie(c_name, value, expiredays) {
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + expiredays);
            document.cookie = c_name
                + "="
                + escape(value)
                + ((expiredays == null) ? "" : ";expires="
                    + exdate.toGMTString());
        }

        // 判断复选框是否选中
        function isChecked(bool) {
            if (bool) {
                var adminPassword = $("#adminPassword").val();
                var adminName = $("#adminName").val();
                setCookie("adminPassword", adminPassword, 10);
                setCookie("adminName", adminName, 10);
            } else {
                delCookie("adminPassword");
            }
        }
        $(function() {
            // 设置复选框点击事件
            $("#remember-me").click(function() {
                var bool = $("#remember-me").prop("checked");
                isChecked(bool);
            });

            <!--Map<String(Cookie名称),Cookie(Cookie本身)-->
            // 获取cookie中的用户名
            var adminName = window.decodeURI("${cookie.adminName.value}");
            if ("${sessionScope.user.adminName}") {
                adminName = "${sessionScope.user.adminName}";
            }
            $("#adminName").val(adminName);

            // 获取cookie中的密码
            var adminPassword = getCookie("adminPassword");
            if ("${sessionScope.user.adminPassword}") {
                adminPassword = "${sessionScope.user.adminPassword}";
            }
            $("#adminPassword").val(adminPassword);

            // 密码框加载完毕就要判断复选框
            var bool = $("#remember-me").prop("checked");
            isChecked(bool);
        });

    </script>

</head>
<body>

    <h1 align="center" >后台管理系统</h1>
    <form action="${path}/login/loginCheck" method="post" >
        <table align="center">
            <tr align="">
                <label>账号：</label>
                <input type="text" name="adminName" id="adminName"  placeholder="管理员账号" align="bottom"/>
            </tr>
            <tr align="center">
                <label >密码：</label>
                <input type="password" name="adminPassword" id="adminPassword"   placeholder="登陆密码" align="bottom"/>
            </tr>
            <tr align="center">
                <input type="submit" value="立即登陆" align="bottom"/>
            </tr>
            <tr>
                <th>
                    验证码:
                </th>
                <td>
                    <span class="fieldSet">
                        <input type="text" id="checkCode" name="checkCode"
                             class="text captcha" maxlength="4"/>&nbsp;&nbsp;&nbsp;
                             <img id="checkCodeImg" alt="checkCodeImg" src="${path}/user/checkCode/1"
                             onclick="refreshCheckCode()"/>
                    </span>
                </td>
                <td>
                    <span style="font-size:12px;color:#ff0000;">${msg}</span></td>
            </tr>
            <tr>
                <th>
                    &nbsp;
                </th>
                <td>
                    <label>
                        <input type="checkbox" id="remember-me" name="remember-me"
                               value="true" checked="checked"/>记住密码
                    </label>
                    <label>
                        &nbsp;&nbsp;<a >找回密码</a>
                    </label>
                </td>
            </tr>
        </table>
    </form>

</body>
</html>
