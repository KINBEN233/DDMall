<%--
  关于DD
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html id="aboutWindow">
<style>
    html{
        height:100%;
    }
    .a{
        background-image: url(https://www.kinben233.top/img/productDetail/821.jpg);
        background-size: 100%;
        background-position:0%,0%;
        background-repeat: repeat;
    }
    #frame {
        background-color: rgba(240, 255, 255, 0.4);
        border-radius: 10px;
        height:100%;
    }
    .bs-footer {
        width: 100%;
        padding: 50px 0;
        height: auto;
    }
    .bs-footer-title-2 {
        position: relative;
        width: 100%;
        height: 9px;
        border-bottom: 1px solid #ccc;
        border-bottom-width: 1px;
        border-bottom-style: solid;
        border-bottom-color: rgb(17,17,17);
        text-align: center;
    }

    div {
        display: block;
    }

    p.about{
        font-family: 楷体;
        font-size: 28px;
    }
</style>
    <head>
        <script src="js/jquery/2.0.0/jquery.min.js"></script>
        <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
        <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
        <link href="css/fore/style.css" rel="stylesheet">
        <link rel="SHORTCUT ICON" href="img/DDPic.ico"/>
    </head>
    <title>关于DD商城</title>

<body class="bgimage">
<div class="a">
<%@include file="../include/fore/header.jsp"%>
<%@include file="../include/fore/top.jsp"%>
<div id="frame" width="100%">
    <br/>
    <br/>
    <div style="text-align:center">
        <p id="image_logo"><img src="https://www.kinben233.top/img/ai.png" class="img-circle" height="200px" width="200px"></p>
    </div>
    <div class="bs-footer">
        <div class="bs-footer-title-2">
        </div>
    </div>
    <div>
        <div style="position:relative;left:25%;width:50%;text-align: center;line-height: 150%">
            <h1 style="font-family: 楷体">关于DD</h1>
            <br/>
            <p class="about">这是一个假的购物网站</p>
            <br/>
            <p class="about">网站上的信息都不是真实的</p>
            <br/>
            <p class="about">这是一个课程设计</p>
            <br/>
            <p class="about">该网站仅做学习用途 </p>
            <br/>
            <p class="about">无其他任何作用</p>
            <br/>
            <p class="about">© 2020 www.kinben233.top 版权所有</p>
            <br/>
            <div id="time"></div>
        </div>
    </div>
    <br/>
    <br/>
</div>
<img src="https://www.kinben233.top/img/1.png" style="position:fixed;right:0px;bottom:0px" height="340px" width="144px">
</div>
<%@include file="../include/fore/footer.jsp"%>

<script>
    var attrimg = [
        'img/productDetail/821.jpg',
        'img/productDetail/301.jpg',
        'img/productDetail/300.jpg',
        'img/productDetail/298.jpg',
        'img/productDetail/273.jpg',
        'img/productDetail/274.jpg',
        'img/productDetail/583.jpg',
        'img/productDetail/302.jpg',
        'img/productDetail/299.jpg',
        'img/productDetail/62.jpg',
        'img/productDetail/60.jpg',
        'img/nana.jpg',
        'img/background.png',
        'img/productDetail/822.jpg',
        'img/productDetail/823.jpg'];
    x = new Array(0.4,0.5,0.6);
    y=new Array(100,110,120);
    z=new Array(0,20,40);
    var next = 0;
    var current = 0;
    var _next=0;
    var _current=0;
    function rgbaTime(){
        var _value1=new String("rgba(240,255,255,"+x[_next]+")");
        var _value2=new String(y[_next]+"%");
        var _value3=new String(z[_next]+"%,"+z[_next]+"%");
        $("#frame").css("background-color",_value1);
        $("div.a").css("background-size",_value2);
        $("div.a").css("background-position",_value3);
        _current=_next;
        _next = _current + 1;
        if (_next >= x.length) {
            _next = 0;
        }
    }
    function imageTime(){

        var value=new String("url("+attrimg[next]+")");
        $("div.a").css("background-image",value);
        current=next;
        rgbaTime();
        setTimeout(rgbaTime,1000);
        setTimeout(rgbaTime,2000);
        next = current + 1;
        if (next >= attrimg.length) {
            next = 0;
        }
    }
    imageTime();
    var t = setInterval(imageTime,3000);

</script>



