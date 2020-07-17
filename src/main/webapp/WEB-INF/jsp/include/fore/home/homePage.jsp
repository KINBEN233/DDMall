<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<title>DD商城官网</title>

<div class="homepageDiv">
    <!--显示上半部分，也就是分类和轮播图片-->
    <%@include file="categoryAndcarousel.jsp"%>
    <!--显示下半部分，也就是每个分类最多显示五个产品-->
    <%@include file="homepageCategoryProducts.jsp"%>
</div>