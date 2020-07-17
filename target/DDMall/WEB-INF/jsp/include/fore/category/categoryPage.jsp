<%--
  sortBar排序条
  productByCategory产品列表
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<title>DD商城官网-${c.name}</title>
<div id="category">
    <div class="categoryPageDiv">
        <div style="text-align: center">
            <img src="img/category/${c.id}.jpg" style="left: 50%;right: 50%;max-width:600px;
                width:expression(document.body.clientWidth>600?"600px":"auto");overflow:hidden;">
        </div>
        <%@include file="sortBar.jsp"%>
        <%@include file="productsByCategory.jsp"%>
    </div>

</div>