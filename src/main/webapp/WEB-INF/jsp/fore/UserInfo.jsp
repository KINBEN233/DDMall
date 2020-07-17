<%--
  Created by IntelliJ IDEA.
  User: 84537
  Date: 2020/6/29
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/fore/header.jsp"%>
<style>

    body {
        background-image: url("img/background.png");
        background-size: 100%;
        background-repeat: no-repeat;
    }

    #login_frame {
        width: 400px;
        height: 450px;
        padding: 13px;

        position: absolute;
        left: 50%;
        top: 45%;
        margin-left: -200px;
        margin-top: -200px;

        background-color: rgba(240, 255, 255, 0.5);

        border-radius: 10px;

    }

    #image_logo {
        margin-top: 20px;
    }

    .label_input {
        font-size: 14px;
        font-family: 宋体;

        width: 65px;
        height: 28px;
        line-height: 28px;


        color: white;
        background-color: #3CD8FF;
        left:0px;
    }


</style>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/back/style.css" rel="stylesheet">
    <link rel="SHORTCUT ICON" href="img/DDPic.ico"/>
</head>

<body>
<img src="img/1.png" style="position:fixed;right:0px;bottom:0px" height="340px" width="144px">
<div id="login_frame">

    <p id="image_logo" style="text-align:center"><img src="img/ai.png" class="img-circle"></p>
    <br/>
    <br/>
    <table width="360px">
        <tr>
            <td width="25%" align="right"><button type="button" class="btn btn-success disabled">&nbsp;&nbsp;用&nbsp;户&nbsp;名&nbsp;&nbsp;&nbsp;</button></td>
            <td width="50%" align="center">${username}</td>
            <td width="25%"></td>
        </tr>
        <tr><td colspan="3"><br/></td></tr>
        <tr>
            <td width="25%" align="right"><button type="button" class="btn btn-success disabled">消费总金额</button></td>
            <td width="50%" align="center">￥<fmt:formatNumber type="number" value="${total}" minFractionDigits="2"/></td>
            <td width="25%"></td>
        </tr>
        <tr><td colspan="3"><br/></td></tr>
        <tr><td colspan="3"><br/></td></tr>
    </table>
    <table width="360px">
        <tr>
            <td width="20%"></td>
            <td width="60%"  align="center">
                <button style="left:50%;right:50%" type="button" id="changePassword" class="btn btn-link"
                        onclick="javascrtpt:window.location.href='forechangePasswordPage'">
                    修改密码
                </button>
            </td>
            <td width="20%"></td>
        </tr>
    </table>
</div>

</body>
</html>
