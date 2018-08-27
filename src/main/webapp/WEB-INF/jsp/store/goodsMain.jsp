<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.img-responsive {
	display: block;
	/* max-width: 100%; */
	height: 300px;
	width: 300px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div>
<ul> 
<li><a href="/ModuHome/goods/category?CATEGORY=가구">가구</a></li>
</ul>
</div>
<section class="flexslider">
      <ul class="slides">
        <li style="background-image: url(/ModuHome/images/storeMain/20180827storemain1.jpeg); width:auto; height:600px;" >
        </li>
        <li style="background-image: url(/ModuHome/images/storeMain/20180827storemain2.jpeg); width:auto; height:600px;">
        </li>
        <li style="background-image: url(/ModuHome/images/storeMain/20180827storemain3.jpeg); width:auto; height:600px;">
        </li>
        <li style="background-image: url(/ModuHome/images/storeMain/20180827storemain4.jpeg); width:auto; height:600px;">
        </li>
      </ul>
    </section>
  <!--   <section class="probootstrap-section probootstrap-bg-white">
      <div class="container">
        <div class="row">
          <div class="col-md-6 probootstrap-animate">
            <h2 class="mb0">Welcome To Our Website</h2>
            <p class="lead mt0">Another website template by <a href="https://uicookies.com/">uicookies.com</a></p>
          </div>
          <div class="col-md-6 probootstrap-animate">
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid dolorum saepe magnam natus perferendis corrupti tenetur quidem suscipit eaque blanditiis corporis veniam molestias qui culpa veritatis officiis eum. Doloribus quos minus quas reprehenderit! Ad provident sunt totam culpa tenetur? Libero maxime molestiae cumque excepturi. </p>
            <p>Eveniet tempora a nisi aut debitis! Recusandae dolores vero autem expedita nihil asperiores maxime modi ducimus nemo dicta nulla dolore? Inventore necessitatibus non laboriosam eos quod dignissimos soluta sunt id fugiat debitis nam omnis? A ullam minima excepturi nulla totam necessitatibus illum modi exercitationem blanditiis quaerat at fugit ad eveniet ipsum error quod sit cumque impedit!</p>
          </div>
        </div>
      </div>
    </section> -->
     <section class="probootstrap-section probootstrap-bg-white">
      <div class="container">
         <div class="row">
          <div class="col-md-6 col-md-offset-3 text-center section-heading probootstrap-animate">
            <h2>신상품</h2>
          </div>
        </div>
        <!-- END row -->
<%-- <c:forEach items="${sellBestItem}" var="sellBest" begin="0" varStatus="status" end="${fn:length(sellBestItem)}"> --%>
        <div class="row">
<c:forEach items="${newItem}" var="newItem" begin="0" varStatus="status" end="2">
			<c:url var="goodsUrl" value="/goods/detail?GOODS_NUMBER=${newItem.GOODS_NUMBER}"/>
          <div class="col-md-4 probootstrap-animate">
            <a href="${goodsUrl}"><img src="/ModuHome/images/goods/${newItem.GOODS_THUMBNAIL}" alt="Free Bootstrap Template by uicookies.com" class="img-responsive"></a>
          	<div class="name">
				<a href="${goodsUrl}">상품명 ${newItem.GOODS_NAME}</a>
		  	</div> 
		  	<div><del><span class="price_original"><fmt:formatNumber value="${newItem.GOODS_PRICE}"/></span></del>원
		  	</div>
			<span class="price_discount"><fmt:formatNumber value="${newItem.GOODS_DISPRICE}"/></span> 
			<span class="unit">원</span><span>(<fmt:formatNumber value="${(newItem.GOODS_PRICE - newItem.GOODS_DISPRICE)*100 / newItem.GOODS_PRICE}" type="number" />%)</span>
          </div>
          </c:forEach>
       	</div>
        <div class="row">
       <c:forEach items="${newItem}" var="newItem" begin="3" varStatus="status" end="5">
       <c:url var="goodsUrl" value="/goods/detail?GOODS_NUMBER=${newItem.GOODS_NUMBER}"/>
           <div class="col-md-4 probootstrap-animate">
            <a href="${goodsUrl}"><img src="/ModuHome/images/goods/${newItem.GOODS_THUMBNAIL}" alt="Free Bootstrap Template by uicookies.com" class="img-responsive"></a>
          	<div class="name">
				<a href="${goodsUrl}">상품명 ${newItem.GOODS_NAME}</a>
		  	</div> 
		  	<div><del><span class="price_original"><fmt:formatNumber value="${newItem.GOODS_PRICE}"/></span></del>원
		  	</div>
			<span class="price_discount"><fmt:formatNumber value="${newItem.GOODS_DISPRICE}"/></span> 
			<span class="unit">원</span><span>(<fmt:formatNumber value="${(newItem.GOODS_PRICE - newItem.GOODS_DISPRICE)*100 / newItem.GOODS_PRICE}" type="number" />%)</span>
          </div>
          </c:forEach> 
        </div>
        </div>
    </section>
    
    <section class="probootstrap-section probootstrap-bg-white">
      <div class="container">
         <div class="row">
          <div class="col-md-6 col-md-offset-3 text-center section-heading probootstrap-animate">
            <h2>인기 상품</h2>
          </div>
        </div>
        <!-- END row -->
<%-- <c:forEach items="${sellBestItem}" var="sellBest" begin="0" varStatus="status" end="${fn:length(sellBestItem)}"> --%>
        <div class="row">
<c:forEach items="${sellBestItem}" var="sellBest" begin="0" varStatus="status" end="2">
			<c:url var="goodsUrl" value="/goods/detail?GOODS_NUMBER=${sellBest.GOODS_NUMBER}"/>
            <div class="col-md-4 probootstrap-animate">
            <a href="${goodsUrl}"><img src="/ModuHome/images/goods/${sellBest.GOODS_THUMBNAIL}" alt="Free Bootstrap Template by uicookies.com" class="img-responsive"></a>
          	<div class="name">
				<a href="${goodsUrl}">상품명 ${sellBest.GOODS_NAME}</a>
		  	</div> 
		  	<div><del><span class="price_original"><fmt:formatNumber value="${sellBest.GOODS_PRICE}"/></span></del>원
		  	</div>
			<span class="price_discount"><fmt:formatNumber value="${sellBest.GOODS_DISPRICE}"/></span> 
			<span class="unit">원</span><span>(<fmt:formatNumber value="${(sellBest.GOODS_PRICE - sellBest.GOODS_DISPRICE)*100 / sellBest.GOODS_PRICE}" type="number" />%)</span>
          </div>
          </c:forEach>
       	</div>
        <div class="row">
        <c:forEach items="${sellBestItem}" var="sellBest" begin="3" varStatus="status" end="5">
            <div class="col-md-4 probootstrap-animate">
            <a href="${goodsUrl}"><img src="/ModuHome/images/goods/${sellBest.GOODS_THUMBNAIL}" alt="Free Bootstrap Template by uicookies.com" class="img-responsive"></a>
          	<div class="name">
				<a href="${goodsUrl}">상품명 ${sellBest.GOODS_NAME}</a>
		  	</div> 
		  	<div><del><span class="price_original"><fmt:formatNumber value="${sellBest.GOODS_PRICE}"/></span></del>원
		  	</div>
			<span class="price_discount"><fmt:formatNumber value="${sellBest.GOODS_DISPRICE}"/></span> 
			<span class="unit">원</span><span>(<fmt:formatNumber value="${(sellBest.GOODS_PRICE - sellBest.GOODS_DISPRICE)*100 / sellBest.GOODS_PRICE}" type="number" />%)</span>
          </div>
          </c:forEach>
        </div>
        </div>
    </section>
</html>