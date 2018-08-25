<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/8/22
  Time: 16:28
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
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css" />
    <script src="${path}/js/jquery1.js"></script>
    <script src="${path}/js/public.js"></script>
    <%--<link href="${path}/css/common.css" rel="stylesheet" type="text/css"/>--%>
    <link href="${path}/css/product.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl">
            <em>产品列表</em>
        </span>
        <span class="modular fl">
            <a href="${path}/category/getCategory" class="pt-link-btn">添加商品</a>
        </span>
    </div>
    <div class="operate">
        <form>
            <input type="text" id="productName" name="productName" class="textBox length-long"
                   placeholder="输入产品名称..." style="width: 200px" />
            <input type="submit" value="查询" class="tdBtn"/>
        </form>
    </div>
    <table class="list-style Interlaced" border="8">
        <tr>
            <th>商品编号</th>
            <th>商品图片</th>
            <th>商品名称</th>
            <th>商品描述</th>
            <th>生产日期</th>
            <th>市场价</th>
            <th>商城价</th>
            <th>是否热门</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pageBean.list}" var="product">
        <tr>
            <td>
                 <span>
                 <input type="checkbox" class="middle children-checkbox"/>
                 <i>${product.pid}</i>
                 </span>
            </td>
            <td class="center pic-area">
                <img src="${path}/${product.image}" class="thumbnail" style="width:100px;height:80px" />
            </td>
            <td class="td-name" style="width: 150px">
                <span class="ellipsis td-name block" style="font-size:15px">
                        ${product.pname}
                </span>
            </td>
            <td class="center" style="width:500px">
                 <span style="font-size:10px;">
                  ${product.pdesc}
                 </span>
            </td>
            <td class="center" align="center">
                 <span>
                  ${product.pdate}
                 </span>
            </td>
            <td class="center" align="center">
                 <span>
                  $${product.marketPrice}
                 </span>
            </td>
            <td class="center" align="center">
                <span>
                    $${product.shopPrice}
                </span>
            </td>
            <td class="center" align="center">
                <c:if test="${product.isHot == 1}">
                    <span>
                        <img src="${path}/images/yes.gif"/>
                    </span>
                </c:if>
                <c:if test="${product.isHot != 1}">
                    <span>
                        <img src="${path}/images/no.gif"/>
                    </span>
                </c:if>
            </td>
            <td class="center" align="center">
                <%--<a href="${path}/product/findProductDesc?pid=${product.pid}" title="查看" target="_blank">
                    <img src="${path}/images/icon_view.gif"/>
                </a>--%>
                <a href="${path}/product/editProduct" title="编辑">
                    <img src="${path}/images/icon_edit.gif"/>
                </a>
                <a title="删除">
                    <img src="${path}/images/icon_drop.gif"/>
                </a>
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
            <input type="button" value="批量删除" class="btnStyle"/>
        </div>
        <!-- turn page -->
        <div class="pagination">
            第  ${pageBean.pageNow}/${pageBean.totalPage}页
            <c:if test="${ pageBean.pageNow != 1}">
                <a href="${path}/product/findProducts?pageNow=1" class="firstPage">&nbsp;</a>
                <a href="${path}/product/findProducts?pageNow=${pageBean.pageNow-1 }" class="previousPage">&nbsp;</a>
            </c:if>
            <c:forEach var="i" begin="1" end="${pageBean.totalPage}" step="1">
                <c:if test="${pageBean.pageNow==i }">
                    <span class="currentPage">${i}</span>
                </c:if>
                <c:if test="${pageBean.pageNow!=i }">
                    <a href="${ path }/product/findProducts?pageNow=${i}">${i}</a>
                </c:if>
            </c:forEach>
            <c:if test="${pageBean.pageNow != pageBean.totalPage }">
                <a class="nextPage" href="${path}/product/findProducts?pageNow=${pageBean.pageNow+1 }">&nbsp;</a>
                <a class="lastPage" href="${path}/product/findProducts?pageNow=${pageBean.totalPage}">&nbsp;</a>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>