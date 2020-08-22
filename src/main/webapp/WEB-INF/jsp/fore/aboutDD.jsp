<%--
  关于DD
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html id="aboutWindow">
<style>
    html{
	width:100%;
        height:100%;
    }
    
    @media screen and (min-width:0px) and (max-width: 1200px){
    #frame {
	
	float:left;
	position:relative;  
        border-radius: 10px;
	margin: 0px auto;
	width:1024px;
        height:780px;	
    }
    .container_ { 	  
  	
	width:100%;
        height:100%;
  	border: 0px solid;
  	border-top-color: #856036;
  	border-left-color: #5d4426;
  	border-bottom-color: #856036;
  	border-right-color: #5d4426;
  	position: absolute;
    }    
    
  }
    div#wenzi{
        width:100%;
  	height:100%;
  	text-align:center;  	
  	background-color: rgba(240, 255, 255, 0.5);  	
	position: absolute;
    }
    .bs-footer {
        width: 100%;
        padding: 50px 0;
        height: auto;
    }
    .bs-footer-title-1{
        position:relative;
        width: 100%;
        height: 9px;
	top:780px;        
        background-color: rgba(240, 255, 255, 0);
        text-align: center;
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

    

    .photo {
  	position: absolute;
  	animation: round 16s infinite;
  	opacity: 0;
    }

@keyframes round {
  25% {
    opacity: 1;
  }
  40% {
    opacity: 0;
  }
}
img.photo{
    width:100%;
    height:100%;
}

img:nth-child(1) {
  animation-delay: 52s;
}

img:nth-child(2) {
  animation-delay: 48s;
}

img:nth-child(3) {
  animation-delay: 44s;
}

img:nth-child(4) {
  animation-delay: 40s;
}

img:nth-child(5) {
  animation-delay: 36s;
}

img:nth-child(6) {
  animation-delay: 32s;
}

img:nth-child(7) {
  animation-delay: 28s;
}

img:nth-child(8) {
  animation-delay: 24s;
}

img:nth-child(9) {
  animation-delay: 20s;
}

img:nth-child(10) {
  animation-delay: 16s;
}

img:nth-child(11) {
  animation-delay: 12s;
}

img:nth-child(12) {
  animation-delay: 8s;
}

img:nth-child(13) {
  animation-delay: 4s;
}

img:nth-child(14) {
  animation-delay: 0s;
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

<body>
<%@include file="../include/fore/header.jsp"%>
<%@include file="../include/fore/top.jsp"%>
<div style="height:720px">
<div id="frame">
    <div class="container_">    
	<img class="photo" src="img/productDetail/821.jpg"/>
	<img class="photo" src="img/productDetail/301.jpg"/>
	<img class="photo" src="img/productDetail/300.jpg"/>
	<img class="photo" src="img/productDetail/298.jpg"/>
	<img class="photo" src="img/productDetail/274.jpg"/>
	<img class="photo" src="img/productDetail/583.jpg"/>
	<img class="photo" src="img/productDetail/302.jpg"/>
	<img class="photo" src="img/productDetail/273.jpg"/>
	<img class="photo" src="img/productDetail/299.jpg"/>
	<img class="photo" src="img/productDetail/62.jpg"/>
	<img class="photo" src="img/productDetail/60.jpg"/>
	<img class="photo" src="img/nana.jpg"/>
	<img class="photo" src="img/productDetail/822.jpg"/>
	<img class="photo" src="img/productDetail/823.jpg"/>	
    </div>
    <div id="wenzi">
	<br/>
	<br/>
	<div style="text-align:center">
        	<p id="image_logo"><img src="https://www.kinben233.top/img/ai.png" class="img-circle" height="200px" width="200px"></p>
        </div>
	<div class="bs-footer">
		<div class="bs-footer-title-2"></div>
        </div>
        <div style="line-height: 150%;">
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
         </div>
    </div>
</div>
</div>
<img src="https://www.kinben233.top/img/1.png" style="position:fixed;right:0px;bottom:0px" height="340px" width="144px">

<%@include file="../include/fore/footer.jsp"%>




