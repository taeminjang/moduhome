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



<div>
<h2>판매 인기순</h2>
<table>
 <c:forEach items="${sellBestItem}" var="sellBest" begin="0" varStatus="status" end="${fn:length(sellBestItem)}">
<tr>
<td>
상품명 ${sellBest.GOODS_NUMBER}
<img src="/ModuHome/images/goods/${sellBest.GOODS_THUMBNAIL}" width="60" height="60" alt=""  onerror="this.src='/ModuHome/images/noimg_130.gif'" />
</td>
</tr>
</c:forEach>
</table>
</div>

<!-- <div style="min-width:0px;text-align:center;"> 
<ul style=""> <li class="home-menu "><a href="/">홈</a></li> <li class="home-menu "><a href="/star/">매거진</a></li> 
<li class="home-menu selected"><a href="/furniture/">스토어</a></li> <li class="home-menu "><a href="/picture/">사진</a></li> 
<li class="home-menu "><a href="/story/">스토리</a></li> </ul> </div> </div> </div> </div> 
<div class="main-menu"> <ul> <li class=""><a href="/">
<img src="//cdn.ggumim.co.kr/resource/icons/btn_home_nor.png" alt="" class="home-menu-icon">홈</a></li> <li class="">
<a href="/star/"><img src="//cdn.ggumim.co.kr/resource/icons/btn_star_nor.png" alt="" class="home-menu-icon">매거진</a></li> 
<li class=""><a href="/furniture/"><img src="//cdn.ggumim.co.kr/resource/icons/btn_furniture_sel.png" alt="" class="home-menu-icon">스토어</a></li> 
<li class=""><a href="/story/"><img src="//cdn.ggumim.co.kr/resource/icons/btn_story_nor.png" alt="" class="home-menu-icon">스토리</a></li> 
<li class=""><a href="/picture/"><img src="//cdn.ggumim.co.kr/resource/icons/btn_picture_nor.png" alt="" class="home-menu-icon">사진</a></li> </ul> </div>
<div class="navigation commerce-menu" style="margin-top: 60px;"> <ul> <li class=""><a href="/furniture/more/">전체상품</a></li> 
<li class=""><a href="/furniture/more/c2?type=hour">베스트</a></li> <li class=""><a href="/furniture/more/c3">집꾸리뷰</a></li> <li class="">
<a href="/furniture/more/17/">가구</a></li> <li class=""><a href="/furniture/more/18/">가전</a></li> <li class=""><a href="/furniture/more/19/">패브릭</a></li> 
<li class=""><a href="/furniture/more/20/">주방</a></li> <li class=""><a href="/furniture/more/21/">생활·수납</a></li> <li class=""><a href="/furniture/more/22/">홈데코</a></li> 
<li class=""><a href="/furniture/more/23/">반려동식물</a></li> </div>
</body> -->
</html>