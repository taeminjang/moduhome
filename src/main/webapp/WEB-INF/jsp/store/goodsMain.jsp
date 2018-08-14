<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="/ModuHome/css/store/ggumim-1.1.86.min.css"/>
<script type="text/javascript" src="/ModuHome/js/ggumim.stack-1.1.87.min.js">
</script>
</head>
<body>
<div>
<h2>메뉴</h2>
<ul>
	<li><a href="/ModuHome/goods/category?CATEGORY=가구">가구</a></li>
</ul>
</div>

<%-- <div class="boxlist">
<table>
  
<tbody>
<tr><td></td><td></td><td></td></tr>
<tr>
<c:forEach items="${sellBestItem}" var="sellBest" begin="0" varStatus="status" end="${fn:length(sellBestItem)}">
<td>
<div class="goodsboxlist">
            <div class="box">
            <div class="thumb salebox">
<img src="/ModuHome/images/goods/${sellBest.GOODS_THUMBNAIL}" alt=""  onerror="this.src='/ModuHome/images/noimg_130.gif'" />
<div class="desc">
<a href="/ModuHome/goods/detail?GOODS_NUMBER=${sellBest.GOODS_NUMBER}">상품명 ${sellBest.GOODS_NAME}</a>
</div>
</div>

</div>
</div>
</td>
</c:forEach>
</tr>
</tbody>
</table>
</div> --%>

<div class="navigation commerce-menu" style="margin-top: 60px;"> 
<ul> <li class=""><a href="/furniture/more/">전체상품</a></li> 
<li class=""><a href="/furniture/more/c2?type=hour">베스트</a></li> 
<li class=""><a href="/furniture/more/c3">집꾸리뷰</a></li> 
<li class=""><a href="/furniture/more/17/">가구</a></li> 
<li class=""><a href="/furniture/more/18/">가전</a></li> 
<li class=""><a href="/furniture/more/19/">패브릭</a></li> 
<li class=""><a href="/furniture/more/20/">주방</a></li> 
<li class=""><a href="/furniture/more/21/">생활·수납</a></li> 
<li class=""><a href="/furniture/more/22/">홈데코</a></li> 
<li class=""><a href="/furniture/more/23/">반려동식물</a></li> 
</ul>
</div>
<div class="home-promotion" > <div class="star-monday-list hide monday-slick"> 
<a href="https://api.ggumim.co.kr/monday/item_click.php?idx=4156"> 
<img src="//cdn.ggumim.co.kr/original/20180813143944XvS6J7Qd7W.jpeg" style="width: 100%;"/> </a> 
<a href="https://api.ggumim.co.kr/monday/item_click.php?idx=4157"> 
<img src="//cdn.ggumim.co.kr/original/20180813144005ttyyh0itfE.jpeg" style="width: 100%;"/> </a> 
<a href="https://api.ggumim.co.kr/monday/item_click.php?idx=4158"> 
<img src="//cdn.ggumim.co.kr/original/20180813144015P4gwuvccu3.jpeg" style="width: 100%;"/> </a> </div> </div> 
<div class="container store" style="margin-top:0px;"> 

<div class="commerce-title"> 
<h2>판매 인기순</h2> </div> 
<div class="row furniture-item-group-3"> 
<c:forEach items="${sellBestItem}" var="sellBest" begin="0" varStatus="status" end="${fn:length(sellBestItem)}">
<div class="col-xs-6 col-md-4"> 
<a href=""> 
<img src="/ModuHome/images/goods/${sellBest.GOODS_THUMBNAIL}" alt=""  onerror="this.src='/ModuHome/images/noimg_130.gif'" />
</a> 

<div class="description"> 
<div class="name">
<a href="/ModuHome/goods/detail?GOODS_NUMBER=${sellBest.GOODS_NUMBER}">상품명 ${sellBest.GOODS_NAME}</a>
</div> 
<div class="price_original"> 원가격 </div> 
<div class="price_discount"> <span>할인가격 </span> 
<span class="unit">원</span> <span>(31%)</span>
</div> 
</div> 
</div> 

<div class="col-xs-6 col-md-4"> 
</div>

</c:forEach>
</div>
</div>
</html>