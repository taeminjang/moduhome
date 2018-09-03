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
	<div class="upper-menu" style="margin-top: 100px; background: #fff; width:100%; height:50px;">
		<div class="commerce-menu">
		${categoryName}
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
		<div class="commerce-menu-detailmenu" style="float: left; background: #fff; width:100%; color:black;">
			<div style="float: left; margin-top: 25px;">
			<ul>
				<li><a href="/ModuHome/goods/category?CATEGORY=${categoryName}">전체</a></li>
				|
				<c:forEach items="${subCategory}" var="subCategorys">
				<li><a href="/ModuHome/goods/category?CATEGORY=${categoryName}&SUBCATEGORY=${subCategorys}">${subCategorys}</a></li>
				|
				</c:forEach>
			</ul>
			</div>
			<div class="order-selector" style="float:right; margin-right: 100px;">
			<select id="orderSelector" name="sort" onchange="javascript:ajaxList(${currentPage});">
				<option selected value="1">최신순</option>
				<option value="2">인기순</option>
				<option value="3">낮은 가격 순</option>
				<option value="4">높은 가격 순</option>
				<option value="5">후기 순</option>
			</select>
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
							<a href="${goodsUrl}">상품명 ${CategoryList.GOODS_NAME}</a>
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
			<%-- <div class="row">
				<c:forEach items="${goodsCategoryList}" var="CategoryList" begin="3"
					varStatus="status" end="5">
					<c:url var="goodsUrl"
						value="/goods/detail?GOODS_NUMBER=${CategoryList.GOODS_NUMBER}" />
					<div class="col-md-4 probootstrap-animate">
						<a href="${goodsUrl}"><img
							src="/ModuHome/images/goods/${CategoryList.GOODS_THUMBNAIL}"
							alt="Free Bootstrap Template by uicookies.com"
							class="img-responsive"></a>
						<div class="name">
							<a href="${goodsUrl}">상품명 ${CategoryList.GOODS_NAME}</a>
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
				</c:forEach>
			</div> --%>
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

	

		/*** ranking 가격bar 마우스를 뗄 경우 이벤트 발생 ***/
	/* 	$("#price-range-slider").slider({
			stop : function() {
				ajaxList();
				console.log("다다다");
				//솔트(2);
			}
		}); */
	</script>
</body>
</html>