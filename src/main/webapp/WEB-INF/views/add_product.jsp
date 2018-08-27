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
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>产品列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${path}/style/adminStyle.css" rel="stylesheet" type="text/css" />
    <script src="${path}/js/jquery-1.6.1.js"></script>
    <script type="text/javascript" language="JavaScript">
        function changed() {
            $.ajax({
                type:"get",
                url:"${path}/category/getCategorySecond",
                data:{
                    cid:$("#cid").val()
                },
                dataType:"text",
                success:function (data) {
                    var str = data.split("&")
                    $("#csid").empty();
                    for(var i=0;i<str.length;i++){
                        var strs = str[i].split("?");
                        $("#csid").append("<option value='"+strs[1]+"'>"+strs[0]+"</option>");
                    }
                }
            });
        }
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
                    <select class="textBox" id="cid" name="cid" onchange="changed()">
                        <c:forEach items="${categoryList}" var="category">
                            <option value="${category.cid}">${category.cname}</option>
                        </c:forEach>
                    </select>
                    <select class="textBox" id="csid" name="csid" style="width: 100px" >
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
            <tr>
                <td style="text-align:right;">日期：</td>
                <td>
                    <input type="text" id="pdate" name="pdate" class="Wdate"
                           onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" placeholder="生产日期..."/>
                </td>
            </tr>
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
                    <input type="file" name="image" id="suoluetu2" class="hide"/>
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
