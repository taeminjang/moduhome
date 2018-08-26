<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>uiCookies:FineOak &mdash; Free Bootstrap Theme, Free Responsive Bootstrap Website Template</title>
    <meta name="description" content="Free Bootstrap Theme by uicookies.com">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
    <link href="https://fonts.googleapis.com/css?family=Bellefair|Open+Sans" rel="stylesheet">
    <link rel="stylesheet" href="/ModuHome/style/css/styles-merged.css">
    <link rel="stylesheet" href="/ModuHome/style/css/style.min.css">
    <!--[if lt IE 9]>
      <script src="/moduhome/style/js/vendor/html5shiv.min.js"></script>
      <script src="/moduhome/style/js/vendor/respond.min.js"></script>
    <![endif]-->
    
    <!-- css의 경로는 artifact를 따라가게 된다. 프로젝트 ㅇ이름은 moduhome_member이지만 moduhome으로 써줘여함 -->
</head>
<body>
 
    <nav class="navbar navbar-default navbar-fixed-top probootstrap-navbar">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.html" title="uiCookies:FineOak">FineOak</a>
        </div>

        <div id="navbar-collapse" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/ModuHome/joinForm">회원가입</a></li>
            <li><a href="/ModuHome/loginForm">로그인</a></li>
            <li>
			<a href="/ModuHome/cart/cartList"> 
			장바구니</a>
			</li>
            <li><a href="about.html">About</a></li>
            <li><a href="/ModuHome/like">좋아요테스트</a></li>
            <li class="dropdown">
              <a href="#" data-toggle="dropdown" class="dropdown-toggle">Pages</a>
              <ul class="dropdown-menu">
                <li><a href="about.html">About Us</a></li>
                <li><a href="portfolio.html">Portfolio</a></li>
                <li><a href="portfolio-single.html">Portfolio Single</a></li>
                <li class="dropdown-submenu dropdown">
                  <a href="#" data-toggle="dropdown" class="dropdown-toggle"><span>Sub Menu</span></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">Second Level Menu</a></li>
                    <li><a href="#">Second Level Menu</a></li>
                    <li><a href="#">Second Level Menu</a></li>
                    <li><a href="#">Second Level Menu</a></li>
                  </ul>
                </li>
                <li><a href="services.html">Services</a></li>
              </ul>
            </li>
            <li class="active"><a href="contact.html">Contact</a></li>
          </ul>
        </div>
      </div>
    </nav>

</body>
</html>
