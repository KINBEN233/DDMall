<%--
  Created by IntelliJ IDEA.
  User: 84537
  Date: 2020/6/21
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<script>
    alert("该产品不存在，无法编辑！");
    window.location.href="admin_product_list?cid="+${cid};
</script>