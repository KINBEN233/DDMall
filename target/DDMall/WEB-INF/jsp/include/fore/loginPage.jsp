<%--
  Created by IntelliJ IDEA.
  User: 84537
  Date: 2020/6/19
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<script>
    $(function(){

        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.loginErrorMessageDiv").show();
        </c:if>

        $("form.loginForm").submit(function(){
            if(0==$("#name").val().length||0==$("#password").val().length){
                $("span.errorMessage").html("请输入账号密码");
                $("div.loginErrorMessageDiv").show();
                return false;
            }
            return true;
        });

        $("form.loginForm input").keyup(function(){
            $("div.loginErrorMessageDiv").hide();
        });

        var left = window.innerWidth/2+162;
        $("div.loginSmallDiv").css("left",left);
    })
</script>
<title>DD商城_登录</title>
<div id="loginDiv" style="position: relative">

    <div style="padding-left: 200px" class="simpleLogo">
        <a href="${contextPath}"><img src="img/site/simpleLogo.jpg" width="120" height="20"></a>
    </div>
    <div>
    <div style="position:relative;width: 1120px;margin: 0 auto">
        <div style="position: absolute;right:0;bottom:0;width: 108px">
            <a href="https://zh.moegirl.org/%E7%A5%9E%E4%B9%90%E4%B8%83%E5%A5%88" target="_blank">
                <span class="bg-info">かぐらななちゃん<br/>素材来源于萌娘百科</span>
            </a>
        </div>
        <img id="loginBackgroundImg" class="loginBackgroundImg" src="img/nana.jpg" style="z-index: -1" width="1120px" height="630px">
    <form class="loginForm" action="forelogin" method="post">
        <div id="loginSmallDiv" style="background-color: white;	position: absolute;	right: 40px;
	top: 100px;	width: 350px;	height: 400px;	padding: 60px 25px 80px 25px;">
            <div class="loginErrorMessageDiv" style="position: absolute">
                <div class="alert alert-danger" >
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                    <span class="errorMessage"></span>
                </div>
            </div>

            <div class="login_acount_text">账户登录</div>
            <div class="loginInput " >
                <span class="loginInputIcon ">
                    <span class=" glyphicon glyphicon-user"></span>
                </span>
                <input id="name" name="name" placeholder="手机/会员名/邮箱" type="text">
            </div>

            <div class="loginInput " >
                <span class="loginInputIcon ">
                    <span class=" glyphicon glyphicon-lock"></span>
                </span>
                <input id="password" name="password" type="password" placeholder="密码" type="text">
            </div>
            <span class="text-danger">不要输入真实的账号密码</span><br><br>

            <div>
                <a class="notImplementLink" href="#nowhere">忘记登录密码</a>
                <a href="registerPage" class="pull-right">免费注册</a>
            </div>
            <div style="margin-top:20px">
                <button class="btn btn-block redButton" type="submit">登录</button>
            </div>
        </div>
    </form>

    </div>
    </div>
</div>