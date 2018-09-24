<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="/ModuHome/dist/jquery/jquery-1.11.0.min.js"></script>
<script src="/ModuHome/dist/jquery/jquery-ui.js"></script>
<script src="/ModuHome/dist/jquery/jquery-migrate-1.2.1.min.js"></script>	
	

<meta charset="UTF-8">
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
	background: #fff;
	margin-right: 0 !important;
	min-width: 1150px;
	display: inline-block;
	background: #fff;
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

.commerce-menu-detailmenu{
	display: inline;
	background: #fff;
}
.commerce-menu-detailmenu ul li{
	display: inline;
}

.commerce-menu ul li a:hover{
	color: #85C8DD;
	font-weight: bold;
	border-bottom: 1px solid #85C8DD;
	border-bottom-width: 2px;
}
</style>
<script>
$("li").on("click", function(){
		$("li").removeClass("selected");
			$(this).addClass("selected");
})
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="storemain-top" style="margin-top: 0px;">
		<section class="flexslider">
			<ul class="slides">
				<!-- <li class="overlay"
					style="background-image: url(/ModuHome/images/storeMain/20180827storemain1.jpeg); width: auto; height: 600px;">
				</li> -->
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

<section id="category-section" style="background: #fff">

	<div class="upper-menu" style=" background: #fff; width:100%; height:50px;">
		<!-- <div class="commerce-menu" style="margin-left: 160px;">
			<ul>
				<li class=""><a href="/ModuHome/goods/category?CATEGORY=전체">전체상품</a></li>
				<li class=""><a
					href="/ModuHome/goods/category?CATEGORY=가구">가구</a></li>
				<li class=""><a href="/ModuHome/goods/category?CATEGORY=가전">가전</a></li>
				<li class=""><a href="/ModuHome/goods/category?CATEGORY=패브릭">패브릭</a></li>
				<li class=""><a href="/ModuHome/goods/category?CATEGORY=주방">주방</a></li>
				<li class=""><a href="/ModuHome/goods/category?CATEGORY=생활·수납">생활·수납</a></li>
			</ul>
		</div>
	</div> -->
	
	<div class="container">
			<div class="row">
	<div class="commerce-menu" >
		
	
			<div class="col-md-8 col-md-offset-2" style="margin-bottom:80px;">
				<div class="col-md-2" ><a href="/ModuHome/goods/category?CATEGORY=전체" style="color: black;">전체상품</a></div>
				<div class="col-md-2"><a href="/ModuHome/goods/category?CATEGORY=가구" style="color: black;">가구</a></div>
				<div class="col-md-2"><a href="/ModuHome/goods/category?CATEGORY=가전" style="color: black;">가전</a></div>	
				<div class="col-md-2"><a href="/ModuHome/goods/category?CATEGORY=패브릭" style="color: black;">패브릭</a></div>
				<div class="col-md-2"><a href="/ModuHome/goods/category?CATEGORY=주방" style="color: black;">주방</a></div>
				<div class="col-md-2"><a href="/ModuHome/goods/category?CATEGORY=생활·수납" style="color: black;">생활·수납</a></div>
			</div>
	
		</div>
		</div>
		</div>
	</section>
	
		<div class="container">
			<div class="row">
	<div class="commerce-menu-detailmenu" style="float: left; background: #fff; width:100%; color:black;">
			<!-- <div style="float: left; margin-top: 25px; height: 50px; margin-left: 190px;"> -->
			<c:if test="${not empty subCategory}">
			<div class="col-md-12 ">
				<div class="col-md-8 " style="margin-top: 50px;">
					<div class="col-md-3" >
					<a href="/ModuHome/goods/category?CATEGORY=${categoryName}" style="color: black;">전체</a>
					</div>
					<c:forEach items="${subCategory}" var="subCategorys">
					<div class="col-md-3" >
						<a href="/ModuHome/goods/category?CATEGORY=${categoryName}&SUBCATEGORY=${subCategorys}" style="color: black;">${subCategorys}</a>
					</div>
					</c:forEach>
				
				</div>
				</div>
<%-- 			<ul>
				<li><a href="/ModuHome/goods/category?CATEGORY=${categoryName}">전체</a></li>
				|
				<c:forEach items="${subCategory}" var="subCategorys">
				<li><a href="/ModuHome/goods/category?CATEGORY=${categoryName}&SUBCATEGORY=${subCategorys}">${subCategorys}</a></li>
				|
				</c:forEach>
			</ul> --%>
			</c:if>
						<!-- <div class="order-selector" style="float:right; margin-right: 200px;"> -->
			<div class="col-md-8 col-md-offset-3">
			<div class="col-md-12 col-md-offset-10" style="margin-bottom:20px;">
			<select id="orderSelector" name="sort" onchange="javascript:ajaxList(${currentPage});">
				<option selected value="1">최신순</option>
				<option value="2">인기순</option>
				<option value="3">낮은 가격 순</option>
				<option value="4">높은 가격 순</option>
				<!-- <option value="5">후기 순</option> -->
			</select>
			</div>
		</div>
			</div>
			</div>
			</div>

	<!-- upper-menu end -->
	
	<section id="changeList">
		<div class="container">
			<div>
			</div>
			<div>
				<c:forEach items="${goodsCategoryList}" var="CategoryList">
					<%-- <c:forEach items="${newItem}" var="newItem" begin="0" varStatus="status" end="2"> --%>
					<c:url var="goodsUrl"
						value="/goods/detail?GOODS_NUMBER=${CategoryList.GOODS_NUMBER}" />
					<div class="col-md-4 probootstrap-animate">
						<a href="${goodsUrl}"><img
							src="/ModuHome/images/goods/${CategoryList.GOODS_THUMBNAIL}"
							alt="Free Bootstrap Template by uicookies.com"
							class="img-responsive"></a>
					<div class="goods-textinfo" style="background:fff3;">
						<div class="name" style="width:300px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; color:#85C8DD;">
							<a href="${goodsUrl}">${CategoryList.GOODS_NAME}</a>
						</div>
						<div>
							<del>
								<span class="price_original"><fmt:formatNumber
										value="${CategoryList.GOODS_PRICE}" /></span>
							</del>
							원
						</div>
						<span class="price_discount"><fmt:formatNumber
								value="${CategoryList.GOODS_DISPRICE}" /></span> <span class="unit">원</span><span>(<fmt:formatNumber
								value="${(CategoryList.GOODS_PRICE - CategoryList.GOODS_DISPRICE)*100 / CategoryList.GOODS_PRICE}"
								type="number" />%)
						</span>
					</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<c:if test="${empty goodsCategoryList}">
		<center>
		상품 준비중 입니다.
		</center>
		<br>
		<br>
		<br>
		<br>
		</c:if>
		<c:if test="${not empty goodsCategoryList}">
       <center>
           <input type="hidden" id="currentPage" value="${currentPage}"/>
               ${pagingHtml}
        </center>
        </c:if>

	</section>
	
	<script>
		function ajaxList(pageNum) {
			var isCategory = '${categoryName}';
			var subCategory = '${subCategoryOne}';
			
			console.log("ajaxSub:"+subCategory);
			console.log("isCategory:"+isCategory);
			
			var sort = $("#orderSelector option:selected").val()
			
			if (sort == null) {
				sort = '${sort}';
			console.log("sort:"+sort);
			}
			console.log("ajaxList");

			if (pageNum != null) {
				var currentPage = pageNum;
				console.log('currentPage :' + currentPage);
			} else {
				var currentPage = 1;
				console.log('currentPagezz :' + currentPage);
			}
	
			$.ajaxSettings.traditional = true;//배열 형태로 서버쪽 전송을 위한 설정
			$.ajax({
				url : "/ModuHome/goods/category",
				type : "post",
				data : {
					"currentPage" : currentPage,
					"CATEGORY" : isCategory,
					"SUBCATEGORY" : subCategory,
					"sort" : sort
				},
				success : function(data) {
					$("#changeList").html(data);
					console.log("date?"+data);
				}
			});
		}
	</script>
</body>
</html>