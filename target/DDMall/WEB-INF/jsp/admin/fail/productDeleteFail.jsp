<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<script>
    alert("删除失败！请先删除该产品的图片！");
    window.location.href="admin_product_list?cid="+${cid};
</script>