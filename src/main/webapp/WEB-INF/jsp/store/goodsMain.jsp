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
</head>
<body>
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
<div>
<ul> 
<li><a href="/ModuHome/goods/category?CATEGORY=가구">가구</a></li>
</ul>
</div>


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