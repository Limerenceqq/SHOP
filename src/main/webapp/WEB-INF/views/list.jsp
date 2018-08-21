<%--
  Created by IntelliJ IDEA.
  User: asus11
  Date: 2018/7/31
  Time: 23:52
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>一级类目下商品列表</title>
    <link href="${path}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/css/product.css" rel="stylesheet" type="text/css"/>

</head>
<body>

<div class="container header">
    <div class="span5">
        <div class="logo">
            <a href="http://localhost:8080/mango/">
                <img src="${path}/image/logo.gif" alt="amazon"/>
            </a>
        </div>
    </div>
    <div class="span9">
        <div class="headerAd">
            <img src="${path}/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/>
        </div>
    </div>
    <%@ include file="header.jsp" %>
    <%@ include file="menu.jsp" %>
</div>
<div class="container productList">
    <div class="span6">
        <div class="hotProductCategory">
            <!-- 一级分类显示 -->
            <c:forEach items="${categoryList}" var="c">
                <dl>
                    <dt>
                        <a href="${path}/product/productfindByCid?cid=${c.cid}&pageNow=1">${c.cname}</a>
                    </dt>
                    <!-- 显示二级分类 -->
                    <c:forEach items="${c.categorySeconds}" var="cs">
                        <dd>
                            <a href="${path}/product/findProductByCsid?csid=${cs.csid}&pageNow=1">${cs.csname}</a>
                        </dd>
                    </c:forEach>
                </dl>
            </c:forEach>
        </div>
    </div>
    <div class="span18 last">
        <form id="productForm" action="${path}/image/蔬菜 - Powered By Mango Team.htm" method="get">
            <input type="hidden" id="brandId" name="brandId" value="">
            <input type="hidden" id="promotionId" name="promotionId" value="">
            <input type="hidden" id="orderType" name="orderType" value="">
            <input type="hidden" id="pageNumber" name="pageNumber" value="1">
            <input type="hidden" id="pageSize" name="pageSize" value="20">
            <div id="result" class="result table clearfix">
                <ul>
                    <c:forEach items="${pageBean.list}" var="p">
                        <li>
                            <a href="${path}/product/findProductByPid?pid=${p.pid}">
                                <img src="${path}/${p.image}" width="170" height="170"  style="display: inline-block;"/>
                                <span style='color:green'>
                                        ${p.pname}
                                </span>
                                <span class="price">
									商城价： ￥${p.shopPrice }
								</span>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="pagination">
                第  ${pageBean.pageNow}/${pageBean.totalPage}页
                <c:if test="${ pageBean.pageNow != 1}">
                    <a href="${path}/product/findProductByCid?cid=${cid}&pageNow=1" class="firstPage">&nbsp;</a>
                    <a href="${path}/findProductByCid?cid=${cid}&pageNow=${pageBean.pageNow-1 }" class="previousPage">&nbsp;</a>
                </c:if>
                <c:forEach var="i" begin="1" end="${pageBean.totalPage}" step="1">
                    <c:if test="${pageBean.pageNow==i }">
                        <span class="currentPage">${i}</span>
                    </c:if>
                    <c:if test="${pageBean.pageNow!=i }">
                        <a href="${ path }/product/findProductByCid?cid=${cid}&pageNow=${i}">${i}</a>
                    </c:if>
                </c:forEach>
                <c:if test="${pageBean.pageNow != pageBean.totalPage }">
                    <a class="nextPage" href="${path}/product/findProductByCid?cid=${cid}&pageNow=${pageBean.pageNow+1 }">&nbsp;</a>
                    <a class="lastPage" href="${path}/product/findProductByCid?cid=${cid}&pageNow=${pageBean.totalPage}">&nbsp;</a>
                </c:if>
            </div>
        </form>
    </div>
</div>
<div class="container footer">
    <div class="span24">
        <div class="footerAd">
            <img src="${path}/image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势">
        </div>	</div>
    <div class="span24">
        <ul class="bottomNav">
            <li>
                <a >关于我们</a>
                |
            </li>
            <li>
                <a>联系我们</a>
                |
            </li>
            <li>
                <a >诚聘英才</a>
                |
            </li>
            <li>
                <a >法律声明</a>
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
                <a  target="_blank">配送方式</a>
                |
            </li>
            <li>
                <a >SHOP++官网</a>
                |
            </li>
            <li>
                <a >SHOP++论坛</a>

            </li>
        </ul>
    </div>
    <div class="span24">
        <div class="copyright">Copyright © 2005-2013 Mango商城 版权所有</div>
    </div>
</div>
</body></html>
