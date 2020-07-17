<%--
  Created by IntelliJ IDEA.
  User: 84537
  Date: 2020/6/29
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>结算失败</title>
<script>
    var msg=new String('\n');
    <c:forEach items="${xiajia}" var="xj">
        msg+='${xj.name}';
        msg+="已下架\n";
    </c:forEach>
    <c:forEach items="${kucunbuzu}" var="kcbz">
        msg+='${kcbz.name}';
        msg+="库存不足\n";
    </c:forEach>
    alert(msg);
    window.location.href="forecart";
</script>