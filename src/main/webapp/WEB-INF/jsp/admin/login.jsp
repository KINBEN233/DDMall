<%--
  Created by IntelliJ IDEA.
  User: 84537
  Date: 2020/6/27
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>

</body><%@ page language="java" contentType="text/html; charset=UTF-8"
                pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

    body {
        background-image: url("img/background.png");
        background-size: 100%;
        background-repeat: no-repeat;
    }

    #login_frame {
        width: 400px;
        height: 400px;
        padding: 13px;

        position: absolute;
        left: 50%;
        top: 50%;
        margin-left: -200px;
        margin-top: -200px;

        background-color: rgba(240, 255, 255, 0.5);

        border-radius: 10px;
        text-align: center;
    }

    form p > * {
        display: inline-block;
        vertical-align: middle;
    }

    #image_logo {
        margin-top: 22px;
    }

    .label_input {
        font-size: 14px;
        font-family: 宋体;

        width: 65px;
        height: 28px;
        line-height: 28px;
        text-align: center;

        color: white;
        background-color: #3CD8FF;
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
    }

    .text_field {
        width: 278px;
        height: 28px;
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
        border: 0;
    }

    #btn_login {
        font-size: 14px;
        font-family: 宋体;

        width: 120px;
        height: 28px;
        line-height: 28px;
        text-align: center;

        color: white;
        background-color: #3BD9FF;
        border-radius: 6px;
        border: 0;

        float: left;
    }

    #forget_pwd {
        font-size: 12px;
        color: white;
        text-decoration: none;
        position: relative;
        float: right;
        top: 5px;

    }

    #forget_pwd:hover {
        color: blue;
        text-decoration: underline;
    }

    #login_control {
        padding: 0 28px;
    }
</style>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/back/style.css" rel="stylesheet">
    <link rel="SHORTCUT ICON" href="img/DDPic.ico"/>
</head>

<body>
<img src="img/1.png" style="position:fixed;right:0px;bottom:0px" height="340px" width="144px">
<div id="login_frame">

    <p id="image_logo"><img src="img/ai.png" class="img-circle"></p>

    <form class="loginForm" method="post" action="/adminLogin">

        <p><label class="label_input">用户名</label><input type="text" id="username" name="username" class="text_field"/></p>
        <p><label class="label_input">密码</label><input type="password" id="password" name="password" class="text_field"/></p>

        <div id="login_control">
            <input type="submit" id="btn_login" value="登录"/>
            <a id="forget_pwd" href="#nowhere">忘记密码？</a>
        </div>
    </form>
</div>

</html>
<script>
    $("form.loginForm").submit(function(){
        if(0==$("#username").val().length||0==$("#password").val().length){
            alert("账号密码不能为空！");
            return false;
        }
        return true;
    });

    $(function(){
        $("a#forget_pwd").click(function(){
            alert("不提供此功能");
        });

        <c:if test="${!empty msg}">
            alert("请输入正确的账号和密码！")
        </c:if>
    });
</script>