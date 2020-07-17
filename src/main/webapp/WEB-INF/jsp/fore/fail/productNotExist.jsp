<%--
  Created by IntelliJ IDEA.
  User: 84537
  Date: 2020/6/21
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<script>
    function goBack()
    {
        history.back();
    }
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../../include/fore/header.jsp"%>
<%@include file="../../include/fore/top.jsp"%>
<title>出错啦！~DDMall</title>
<div style="text-align: center">
    <img src="img/very_sorry.png" style="left: 50%;right: 50%">
</div>
<br/>
<br/>
<div style="text-align: center">
    <button type="button" class="btn btn-info" onclick="goBack()">返回上一页</button>
</div>
<br/>
<div style="text-align: center">
    <img src="img/showpic.png" style="left: 50%;right: 50%">
</div>
<div style="text-align: center">
    <img src="img/goumaguajian.jpg" style="left: 50%;right: 50%">
</div>
<br/>
<%@include file="../../include/fore/footer.jsp"%>
