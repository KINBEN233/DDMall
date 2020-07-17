<%--
  Created by IntelliJ IDEA.
  User: 84537
  Date: 2020/6/29
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

    body {
        background-image: url("http://www.kinben233.top/img/background.png");
        background-size: 100%;
        background-repeat: no-repeat;
    }

    #login_frame {
        width: 400px;
        height: 450px;
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
    <title>修改密码</title>
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
    <span class="text-success">${user.name}</span><br/>
    <br/>
    <form class="loginForm" method="post">

        <p><label class="label_input">新密码</label><input type="password" id="password1" name="password1" placeholder="请输入新密码" class="text_field"/></p>
        <p><label class="label_input">新密码</label><input type="password" id="password" name="password" placeholder="重复输入新密码" class="text_field"/></p>
        <br/>
        <table width="374px">
            <tr>
                <td align="center" width="100%"><input type="submit" id="btn_login" value="确认修改"/></td>
            </tr>
        </table>
    </form>
</div>

<script>
    $(function () {
    $("form.loginForm").submit(function(){
        if($("#password1").val()==""){
            $("#password1").attr("placeholder","密码不能为空");
            return false;
        }
        if($("#password1").val()!=$("#password").val()){
            alert("两次输入的密码不一致！");
            return false;
        }
        else {
            var page="foreChangePassword";
            var id=${user.id};
            var password=$("#password").val();
            $.post(
                page,
                {"id":id,"password":password},
                    function (result) {
                        if("success"==result){
                            alert("修改成功！");
                            window.location.href="forelogout";
                        }
                            else{
                                alert("修改失败!");
                        }
                    }
            );
            return true;
        }
    });
    });
</script>