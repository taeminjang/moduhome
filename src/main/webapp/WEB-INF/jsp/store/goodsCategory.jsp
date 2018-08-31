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
				<div class="commerce-title">
				${categoryName}
카테고리: ${goodsCategory}<br/>
 <!-- <a href="/furniture/more/c2/?type=hour" style="color: black; float: right; font-weight: 500; font-size: 16px; margin-top: 25px; margin-right: 80px; cursor: pointer;">전체보기></a> -->
				</div>
			</div>
			<div class="row">
			<c:forEach items="${goodsCategoryList}" var="CategoryList" begin="0" varStatus="status" end="2">
				<%-- <c:forEach items="${newItem}" var="newItem" begin="0" varStatus="status" end="2"> --%>
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
			</div>
			<div class="row">
				<c:forEach items="${goodsCategoryList}" var="CategoryList" begin="3" varStatus="status" end="5">
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
			</div>
		</div>
	</section>
	<center>
           <input type="hidden" id="currentPage" value="${currentPage}"/>
               ${pagingHtml}
           
        </center>
	
	
	
<script>
function ajaxList(sort,num){
    var f = document.fmFilter;
    //var searchCheck=f.searchCheck.value;
    var color=document.getElementsByName('color[]');
    var priceRange = document.getElementsByName('priceRange[]');
    var sale = document.getElementsByName('sale');
    var soldOut = document.getElementsByName('soldOut');
    
    var isCategory ='${isCategory}';
    var subCategory ='${subCategory}';
    var searchCheck='ON';
    if(sort == null){
      sort = '${sort}';
    }
    console.log("에이작리스트탐");
    console.log(sort);
   
if(num != null){
    var currentPage = num;
    console.log('currentPage :' +currentPage);   
 }else{
    var currentPage = 1;
    console.log('currentPagezz :' +currentPage);
 }

    
    //색깔 검색
    var myColor = new Array();      
    var j =0;
    
    for(var i=0;i<color.length;i++){
       //console.log("색깔이름 말해라2" + color[i].value );
       if(color[i].checked == true){
          //console.log("색깔이름 말해라" + color[i].value );
          var a = color[i].value;
          myColor[j] = color[i].value;
          //console.log("총 색깔들" + j + myColor[j] );
          j++;
       }
    }
    
    console.log(myColor.length+"길이");
    for(var i=0;i<myColor.length;i++){
       console.log("myColor색깔들" + myColor[i] );
    }
    //색검색끝
    
  //가격 검색
    var myPriceRange = new Array();      
          
    myPriceRange[0]=priceRange[0].value;
    myPriceRange[1]=priceRange[1].value;
    
    console.log("myPriceRange : " +myPriceRange.length);
    console.log("myPriceRange1 : " +myPriceRange[0]);
    console.log("myPriceRange2 : " +myPriceRange[1]);
    //가격검색 끝
    
    //세일상품 검색 시작
    var mySale=sale[0].checked;
    console.log("sale 은?? " +mySale);
    if(mySale==true)
    {
       mySale="on";
       console.log("세일체크"+mySale);
    }
    
    var soldOut=soldOut[0].checked;
    console.log("soldOut 은?? " +soldOut);
    if(soldOut==true)
    {
      soldOut="on";
       console.log("솔드아웃체크"+soldOut);
    } 
    
    
    //세일상품 검색 끝
     $.ajaxSettings.traditional = true;//배열 형태로 서버쪽 전송을 위한 설정
     $.ajax({
          url: "/MODA/goods/goodsCategory",
          type : "post",
          data: {"currentPage":currentPage,"CATEGORY":isCategory,"myColor":myColor,"SUBCATEGORY":subCategory,"priceRange":myPriceRange,"searchCheck":searchCheck,"sale":mySale,"sort":sort, "soldOut":soldOut},
          success:function(data){
             $("#changeList").html(data);
             //console.log("date?"+data);
             //개쩐다
          }
       });  
 }      

//console.log("콘솔내용" + color[0].value );

//if($(color[1]).is(":checked");)
//   console.log("콘솔내용2");

/*  $.ajax({
      url: "/SIRORAGI/goods/goodsCategory",
      type : "post",
      data: {"sort":i,"category":isCategory},
      success:function(data){
         $("#changeSort").html(data);
      }
   }); */
   
/*** ranking 가격bar 마우스를 뗄 경우 이벤트 발생 ***/
$( "#price-range-slider" ).slider({
     stop: function() {
        ajaxList();
      console.log("다다다");
      //솔트(2);
     }
   });


</script>	
	
</body>
</html>