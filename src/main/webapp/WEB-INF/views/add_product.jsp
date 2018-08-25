<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/8/22
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page isELIgnored="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>产品列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${path}/style/adminStyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="JavaScript" src="js/xmlHttpRequest.js"></script>
    <%--//ajax--%>
    <script type="text/javascript" language="JavaScript">
        window.onload = function () {
            var category = document.getElementById("category");
            var categorySecond = document.getElementById("categorySecond");

            category.onchange = function () {
                var categoryId = category.value;
                categorySecond.option.length = 0;
                //清除原内容
                if(category.value == 0){
                    //添加option
                    categorySecond.add(new Option('请选择二级目录','0'));
                    return;
                }
                //创建xmlHttpRequest对象
                var req = xmlHttpRequest()
                //处理响应结果，设置回调函数
                req.onstatechange = function () {
                    if(req.status == 200 &amp;&amp; req.readyState == 4){
                        var data = req.responseText;
                        var categorySeconds = data.split(",");
                        for(var i=0;i &lt; categorySeconds.length;i++){
                            categorySecond.add(new Option(categorySeconds[i],categorySeconds[i]));
                        }
                    }
                }
                //2.发送请求
                req.open("get","${path}/home/getCategorySeconds?category="+categoryId);
                //3.发送请求
                req.send(null);

            };
        };
    </script>
</head>
<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i class="add"></i><em>编辑/添加产品</em></span>
        <span class="modular fr"><a href="${path}/product/findProducts?pageNow=1" class="pt-link-btn">产品列表</a></span>
    </div>
    <form action="${path}/product/addProduct" method="post">
        <table class="list-style">
            <tr>
                <td style="text-align:right;width:15%;">产品名称：</td>
                <td><input type="text" class="textBox length-long" name="pname"/></td>
            </tr>
            <tr>
                <td style="text-align:right;">产品分类：</td>
                <td>
                    <select class="textBox" id="category" name="category">
                        <option value="0">选择一级目录</option>
                        <c:forEach items="${categoryList}" var="category">
                            <option value="${category.cid}">${category.cname}</option>
                        </c:forEach>
                    </select>
                    <select class="textBox" id="categorySecond" name="categorySecond">
                        <option value="0">选择二级目录</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">市场价：</td>
                <td>
                    <input type="text" name="marketPrice" class="textBox length-short"/>
                    <span>元</span>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">商城价：</td>
                <td>
                    <input type="text" name="shopPrice" class="textBox length-short"/>
                    <span>元</span>
                </td>
            </tr>
            <%--<tr>
                <td style="text-align:right;">库存：</td>
                <td>
                    <input type="text" class="textBox length-short"/>
                    <span>盘</span>
                </td>
            </tr>--%>
            <%--<tr>
                <td style="text-align:right;">产品关键词：</td>
                <td><input type="text" class="textBox length-long"/></td>
            </tr>--%>
            <tr>
                <td style="text-align:right;">产品描述：</td>
                <td><input type="text" class="textBox length-long" name="pdesc"/></td>
            </tr>
            <tr>
                <td style="text-align:right;">是否热门：</td>
                <td>
                    <%--<input type="checkbox" name="tuijian" id="jingpin"/>
                    <label for="jingpin">精品</label>
                    <input type="checkbox" name="tuijian" id="xinpin"/>
                    <label for="xinpin">新品</label>--%>
                    <input type="checkbox" name="isHot" id="rexiao" />
                    <label for="rexiao">热门</label>
                </td>
            </tr>
            <%--<tr>
                <td style="text-align:right;">产品缩图片：</td>
                <td>
                    <input type="file" name="image" id="suoluetu" class="hide"/>
                    <label for="suoluetu" class="labelBtnAdd">+</label>
                    &lt;%&ndash;<img src="#" width="60" height="60" class="mlr5"/>&ndash;%&gt;
                </td>
            </tr>--%>
            <tr>
                <td style="text-align:right;">产品主图：</td>
                <td>
                    <input type="file"  multiple="multiple" id="chanpinzhutu" class="hide"/>
                    <label for="chanpinzhutu" class="labelBtn2">本地上传(最多选择3张)</label>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;"></td>
                <td>
                    <input type="file" name="image" id="suoluetu" class="hide"/>
                    <label for="suoluetu" class="labelBtnAdd">+</label>
                    <input type="file" name="image" id="suoluetu1" class="hide"/>
                    <label for="suoluetu" class="labelBtnAdd">+</label>
                    <%--<img src="#" width="60" height="60" class="mlr5"/>--%>
                </td>
            </tr>

            <tr>
                <td style="text-align:right;">产品详情：</td>
                <td><textarea class="textarea"></textarea></td>
            </tr>
            <tr>
                <td style="text-align:right;"></td>
                <td><input type="submit" value="发布新商品" class="tdBtn"/></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
