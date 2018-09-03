<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link type="text/css" rel="stylesheet" href="/ModuHome/css/store/ggumim-1.2.04.min.css"/> -->
<style>
.img-responsive {
	display: block;
	/* max-width: 100%; */
	height: 300px;
	width: 300px;
}

.storemain-top {
	margin-top: 60px;
}

.commerce-menu {
	width: 100%;
	text-align: center;
	background-color: #f9f9f9;
	margin-right: 0 !important;
}

.commerce-menu ul li a {
	padding: 0 35px !important;
	font-weight: 500;
	color: black;
}

.commerce-menu ul li {
	display: inline;
	float: left;
}

.commerce-menu {
	min-width: 1150px;
}

.commerce-menu ul li.selected {
	border-bottom: 1px solid #85C8DD;
	border-bottom-width: 2px;
}

.commerce-menu ul li.selected a {
	color: #85C8DD;
	font-weight: bold;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<!-- <div>
		<ul>
			<li><a href="/ModuHome/goods/category?CATEGORY=가구">가구</a></li>
		</ul>
	</div> -->
	<div class="storemain-top" style="margin-top: 90px;">
		<section class="flexslider">
			<ul class="slides">
				<li
					style="background-image: url(/ModuHome/images/storeMain/20180827storemain1.jpeg); width: auto; height: 600px;">
				</li>
				<li
					style="background-image: url(/ModuHome/images/storeMain/20180827storemain2.jpeg); width: auto; height: 600px;">
				</li>
				<li
					style="background-image: url(/ModuHome/images/storeMain/20180827storemain3.jpeg); width: auto; height: 600px;">
				</li>
				<li
					style="background-image: url(/ModuHome/images/storeMain/20180827storemain4.jpeg); width: auto; height: 600px;">
				</li>
			</ul>
		</section>
	</div>
	<div class="commerce-menu">
		<ul>
			<li class=""><a href="/ModuHome/goods/category?CATEGORY=전체상품">전체상품</a></li>
			<li class="selected"><a
				href="/ModuHome/goods/category?CATEGORY=가구">가구</a></li>
			<li class=""><a href="/ModuHome/goods/category?CATEGORY=가전">가전</a></li>
			<li class=""><a href="/ModuHome/goods/category?CATEGORY=패브릭">패브릭</a></li>
			<li class=""><a href="/ModuHome/goods/category?CATEGORY=홈데코">홈데코</a></li>
		</ul>
	</div>
	<section class="probootstrap-section probootstrap-bg-white">
		<div class="container">
			<div class="row">
				<!-- <div
					class="col-md-6 col-md-offset-3 text-center section-heading probootstrap-animate">
					<h2>신상품</h2>
				</div>
 -->
				<div class="commerce-title">
				<h2>신상품 <a href="/furniture/more/c2/?type=hour" style="color: black; float: right; font-weight: 500; font-size: 16px; margin-top: 25px; margin-right: 80px; cursor: pointer;">전체보기></a>
					</h2>
				</div>
			</div>
			<!-- END row -->
			<%-- <c:forEach items="${sellBestItem}" var="sellBest" begin="0" varStatus="status" end="${fn:length(sellBestItem)}"> --%>
			<div class="row">
				<c:forEach items="${newItem}" var="newItem" begin="0"
					varStatus="status" end="2">
					<c:url var="goodsUrl"
						value="/goods/detail?GOODS_NUMBER=${newItem.GOODS_NUMBER}" />
					<div class="col-md-4 probootstrap-animate">
						<a href="${goodsUrl}"><img
							src="/ModuHome/images/goods/${newItem.GOODS_THUMBNAIL}"
							alt="Free Bootstrap Template by uicookies.com"
							class="img-responsive"></a>
						<div class="name">
							<a href="${goodsUrl}">상품명 ${newItem.GOODS_NAME}</a>
						</div>
						<div>
							<del>
								<span class="price_original"><fmt:formatNumber
										value="${newItem.GOODS_PRICE}" /></span>
							</del>
							원
						</div>
						<span class="price_discount"><fmt:formatNumber
								value="${newItem.GOODS_DISPRICE}" /></span> <span class="unit">원</span><span>(<fmt:formatNumber
								value="${(newItem.GOODS_PRICE - newItem.GOODS_DISPRICE)*100 / newItem.GOODS_PRICE}"
								type="number" />%)
						</span>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<c:forEach items="${newItem}" var="newItem" begin="3"
					varStatus="status" end="5">
					<c:url var="goodsUrl"
						value="/goods/detail?GOODS_NUMBER=${newItem.GOODS_NUMBER}" />
					<div class="col-md-4 probootstrap-animate">
						<a href="${goodsUrl}"><img
							src="/ModuHome/images/goods/${newItem.GOODS_THUMBNAIL}"
							alt="Free Bootstrap Template by uicookies.com"
							class="img-responsive"></a>
						<div class="name">
							<a href="${goodsUrl}">상품명 ${newItem.GOODS_NAME}</a>
						</div>
						<div>
							<del>
								<span class="price_original"><fmt:formatNumber
										value="${newItem.GOODS_PRICE}" /></span>
							</del>
							원
						</div>
						<span class="price_discount"><fmt:formatNumber
								value="${newItem.GOODS_DISPRICE}" /></span> <span class="unit">원</span><span>(<fmt:formatNumber
								value="${(newItem.GOODS_PRICE - newItem.GOODS_DISPRICE)*100 / newItem.GOODS_PRICE}"
								type="number" />%)
						</span>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<section class="probootstrap-section probootstrap-bg-white">
		<div class="container">
			<div class="row">
				<!-- <div
					class="col-md-6 col-md-offset-3 text-center section-heading probootstrap-animate"
					style="margin-top: -100px;">
					<h2>인기 상품</h2>
				</div> -->
				<div class="commerce-title">
				<h2>인기 상품 <a href="/furniture/more/c2/?type=hour" style="color: black; float: right; font-weight: 500; font-size: 16px; margin-top: 25px; margin-right: 80px; cursor: pointer;">전체보기></a>
					</h2>
				</div>
				
			</div>
			<!-- END row -->
			<%-- <c:forEach items="${sellBestItem}" var="sellBest" begin="0" varStatus="status" end="${fn:length(sellBestItem)}"> --%>
			<div class="row">
				<c:forEach items="${sellBestItem}" var="sellBest" begin="0"
					varStatus="status" end="2">
					<c:url var="goodsUrl"
						value="/goods/detail?GOODS_NUMBER=${sellBest.GOODS_NUMBER}" />
					<div class="col-md-4 probootstrap-animate">
						<a href="${goodsUrl}"><img
							src="/ModuHome/images/goods/${sellBest.GOODS_THUMBNAIL}"
							alt="Free Bootstrap Template by uicookies.com"
							class="img-responsive"></a>
						<div class="name">
							<a href="${goodsUrl}">상품명 ${sellBest.GOODS_NAME}</a>
						</div>
						<div>
							<del>
								<span class="price_original"><fmt:formatNumber
										value="${sellBest.GOODS_PRICE}" /></span>
							</del>
							원
						</div>
						<span class="price_discount"><fmt:formatNumber
								value="${sellBest.GOODS_DISPRICE}" /></span> <span class="unit">원</span><span>(<fmt:formatNumber
								value="${(sellBest.GOODS_PRICE - sellBest.GOODS_DISPRICE)*100 / sellBest.GOODS_PRICE}"
								type="number" />%)
						</span>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<c:forEach items="${sellBestItem}" var="sellBest" begin="3"
					varStatus="status" end="5">
					<div class="col-md-4 probootstrap-animate">
						<a href="${goodsUrl}"><img
							src="/ModuHome/images/goods/${sellBest.GOODS_THUMBNAIL}"
							alt="Free Bootstrap Template by uicookies.com"
							class="img-responsive"></a>
						<div class="name">
							<a href="${goodsUrl}">상품명 ${sellBest.GOODS_NAME}</a>
						</div>
						<div>
							<del>
								<span class="price_original"><fmt:formatNumber
										value="${sellBest.GOODS_PRICE}" /></span>
							</del>
							원
						</div>
						<span class="price_discount"><fmt:formatNumber
								value="${sellBest.GOODS_DISPRICE}" /></span> <span class="unit">원</span><span>(<fmt:formatNumber
								value="${(sellBest.GOODS_PRICE - sellBest.GOODS_DISPRICE)*100 / sellBest.GOODS_PRICE}"
								type="number" />%)
						</span>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	
</html>