<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/8/1
  Time: 00:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>用户注册页</title>
    <link href="${path}/css/common.css"
          rel="stylesheet" type="text/css" />
    <link href="${path}/css/register.css"
          rel="stylesheet" type="text/css" />
    <script type="text/javascript"
            src="${path}/js/jquery-2.2.3.min.js"></script>
    <script type="text/javascript">
        $(function() {
            submitForm();
        })

        //校验密码
        function checkPassword(){
            var pwd=$("#password").val();
            $('#span2').html("");
            if(pwd == ''){
                $("#span2").html("<font color='red'>密码不能为空</font>");
            }
        }
        //校验两次密码是否一致
        function reCheckPassword(){
            var pwd=$("#password").val();
            var rePwd=$('#repassword').val();
            $('#span3').html("");
            if(pwd!=rePwd){
                $("#span3").html("<font color='red'>两次密码不一致</font>");
            }
        }
        //校验电话号码不为空
        function checkPhone(){
            var phone = $('#phone').val();
            $("#span4").html("");
            if(phone==''){
                $("#span4").html("<font color='red'>电话号码不能为空</font>");
            }
        }
        //校验邮箱不为空
        function checkEmail(){
            var email = $('#email').val();
            $("#span5").html("");
            if(email==''){
                $("#span5").html("<font color='red'>邮箱不能为空</font>");
            }
        }
       /* // 刷新图形验证码
        function refreshCheckCode() {
            var timestamp = new Date().getTime();
            $("#checkCodeImg").attr("src", "${path}/user/checkCode/" + timestamp)
        }*/
        //ajax验证用户名
        function checkUserName(){
            // ajax
            $.ajax({
                type : "GET",
                url : "${path}/user/CheckUserName",
                dataType : "json",
                contentType : "application/json",
                data :{username:$("#username").val()},
                success : function(result){
                    if(result.msg == "true"){
                        $("#span1").html("<font color='green'>用户名可以使用</font>");
                    }else if(result.msg == "false"){
                        $("#span1").html("<font color='red'>用户名已经存在</font>");
                    }else{
                        $("#span1").html("<font color='red'>用户名不能为空</font>");
                    }
                }
            })
        }
    </script>
</head>
<body>
<div class="container header">
    <div class="span5">
        <div class="logo">
            <a href="${path}/home/index">
                <img src="${path}/image/logo.gif" alt="amazon">
            </a>
        </div>
    </div>
    <div class="span9">
        <div class="headerAd">
            <img src="${path}/image/header.jpg"
                 width="320" height="50" alt="正品保障" title="正品保障"/>
        </div>
    </div>
    <div class="container register">
        <div class="span24">
            <div class="wrap">
                <div class="main clearfix">
                    <div class="title">
                        <strong>会员注册</strong>USER REGISTER

                    </div>
                    <form id="registerForm" action="${path}/user/registerCheck"
                          method="post" novalidate="novalidate">
                        <table>
                            <tbody>
                            <tr>
                                <th><span class="requiredField">*</span>用户名:</th>
                                <td><input type="text" id="username" name="username"
                                           class="text" maxlength="20" onblur="checkUserName()" />
                                    <span id="span1">${msg}</span>
                                </td>
                            </tr>
                            <tr>
                                <th><span class="requiredField">*</span>密&nbsp;&nbsp;码:</th>
                                <td><input type="password" id="password" name="password"
                                           class="text" maxlength="20" autocomplete="off" onblur="checkPassword()"/>
                                    <span id="span2">${msg}</span>
                                </td>
                            </tr>
                            <tr>
                                <th><span class="requiredField">*</span>确认密码:</th>
                                <td><input type="password" id="repassword"
                                           name="repassword" class="text" maxlength="20"
                                           autocomplete="off" onblur="reCheckPassword()"/>
                                    <span id="span3">${msg}</span>
                                </td>
                            </tr>
                            <tr>
                                <th><span class="requiredField">*</span>E-mail:</th>
                                <td><input type="text" id="email" name="email"
                                           class="text" maxlength="200" onblur="checkEmail()"/>
                                    <span id="span5"></span>
                                </td>
                            </tr>
                            <tr>
                                <th><span class="requiredField">*</span>电话:</th>
                                <td><input type="text" id="phone" name="phone"
                                           class="text" maxlength="200" onblur="checkPhone()"/>
                                    <span id="span4"></span>
                                </td>
                            </tr>
                            <tr>
                                <th>姓名:</th>
                                <td><input type="text" name="name" class="text"
                                           maxlength="200">
                                </td>
                            </tr>
                            <tr>
                                <th>性别:</th>
                                <td><span class="fieldSet"> <label> <input
                                        type="radio" name="sex" value="男">男
										</label> <label> <input type="radio" name="sex" value="女">女

										</label> </span></td>
                            </tr>


                            <tr>
                                <th>地址:</th>
                                <td><input type="text" name="addr" class="text"
                                           maxlength="200">
                                </td>
                            </tr>
                            <tr>
                                <th><span class="requiredField">*</span>验证码:</th>
                                <td>
											<span class="fieldSet">
												<input type="text" id="captcha" name="checkCode"
                                                       class="text captcha"maxlength="10" autocomplete="off">&nbsp;&nbsp;&nbsp;
												<img id="checkCodeImg" alt="checkCodeImg"
                                                     src="${path}/user/checkCode/1" onclick=refreshCheckCode();>
											</span>
                                    <span>${err}</span>
                                </td>
                            </tr>
                            <tr>
                                <th>&nbsp;
                                </th>
                                <td>
                                    <input type="submit" class="submit" value="注 册"/>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </form>
                        <div class="login">
                            <dl>
                                <dt>已经拥有账号了？</dt>
                                <dd>
                                    去登陆>>> <a href="${path}/home/login.do" style="color: #cc0000">立即登录</a>
                                </dd>
                            </dl>
                        </div>
                </div>
            </div>
        </div>
    </div>
    <br/><br/><br/>
    <div class="container footer">
        <div class="span24">
            <div class="footerAd">
                <img src="${path}/image/footer.jpg"
                     width="950" height="52" alt="我们的优势" title="我们的优势">
            </div>
        </div>
        <div class="span24">
            <ul class="bottomNav">
                <li><a>关于我们</a> |</li>
                <li><a>联系我们</a> |</li>
                <li><a>招贤纳士</a> |</li>
                <li><a>法律声明</a> |</li>
                <li><a>友情链接</a> |</li>
                <li><a target="_blank">支付方式</a> |</li>
                <li><a target="_blank">配送方式</a> |</li>
                <li><a>服务声明</a> |</li>
                <li><a>广告声明</a></li>
            </ul>
        </div>
        <div class="span24">
            <div class="copyright">Copyright © 2018-2099 Amazon商城 版权所有</div>
        </div>
    </div>
    <div id="_my97DP"
         style="position: absolute; top: -1970px; left: -1970px;">
        <iframe style="width: 190px; height: 191px;"
                src="./会员注册 - Powered By Mango Team_files/My97DatePicker.htm"
                frameborder="0" border="0" scrolling="no"></iframe>
    </div>
</body>
</html>