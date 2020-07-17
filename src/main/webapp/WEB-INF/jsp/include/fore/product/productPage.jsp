<%--
productPage.jsp 又由3个页面组成
1. imgAndInfo.jsp
单个图片和基本信息
2. productReview.jsp
评价信息
3. productDetail.jsp
详情图片
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<title>DD官网 ${p.name}</title>
<div class="categoryPictureInProductPageDiv">
    <img class="categoryPictureInProductPage" src="img/category/${p.category.id}.jpg" style="left: 50%;right: 50%;max-width:600px;
         width:expression(document.body.clientWidth>600?"600px":"auto");overflow:hidden">
</div>

<div class="productPageDiv">

    <%@include file="imgAndInfo.jsp" %>

    <%@include file="productReview.jsp" %>

    <%@include file="productDetail.jsp" %>
</div>
