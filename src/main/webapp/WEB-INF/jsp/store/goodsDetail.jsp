<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%
	session.setAttribute("MEMBER_ID", "test34");
	session.setAttribute("MEMBER_NUMBER", "71");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/ModuHome/dist/jquery/jquery-1.11.0.min.js"></script>
<script src="/ModuHome/dist/jquery/jquery-ui.js"></script>
<script src="/ModuHome/dist/jquery/jquery-migrate-1.2.1.min.js"></script>
<!-- <script type="text/javascript" src="/ModuHome/js/store/ggumim.stack-1.2.04.min.js"></script> -->
<link type="text/css" rel="stylesheet" href="/ModuHome/css/store/ggumim-1.2.04.min.css"/>
<script>
	function _exec(mode) {
		if (mode == 'restock') {
			document.location.href = "./restock";
		} else if (mode == "buy") {
			if (document.getElementsByName("optno[]").length == 0) {
				alert("옵션을 선택해주세요");
				return;
			}
			var fm = document.fmOrder;
			fm.mode.value = mode;
			fm.target = "_self";
			fm.action = "/ModuHome/order";
			//if (mode=="order") fm.action = "../order";
			fm.submit();
		} else if (mode != "wishlist") {
			if (document.getElementsByName("optno[]").length == 0) {
				alert("옵션을 선택해주세요");
				return;
			}
			var fm = document.fmOrder;
			fm.mode.value = mode;
			fm.target = "_self";
			fm.action = "/ModuHome/cart/cartAdd";
			//if (mode=="wishlist") fm.action = "../mypage/wishlist";
			fm.submit();
		}
	}
</script>

<script>
	//콤마 추가
	function comma(num) {
		var len, point, str;
		num = num + "";
		point = num.length % 3;
		len = num.length;
		str = num.substring(0, point);
		while (point < len) {
			if (str != "")
				str += ",";
			str += num.substring(point, point + 3);
			point += 3;
		}
		return str;
	}
	//콤마 삭제
	function rm_comma(num) {
		var number = num + "";
		return number.replace(",", "");
	}
	//수량 변경 
	function change_ea(obj, idx) {
		var ea = parseInt($("input.input_ea", $(obj).parent().parent()).val(),
				10)
				+ idx;
		if (ea < 1) {
			alert("1개 이상을 주문하셔야 합니다");
			return;
		}
		$("input.input_ea", $(obj).parent().parent()).val(ea);
	}
	function chkSoldout(obj) {
		if (obj.options[obj.selectedIndex].stock == "0") {
			alert("선택한 항목은 품절된 옵션입니다");
			obj.selectedIndex = 0;
			return false;
		}
		return true;
	}
	function setOption2(obj) {
		$(document)
				.ready(
						function() {
							var totprice = 0;
							var r_optno = [];
							if ($("#option option:selected").attr("disabled") == "disabled") {
								alert("선택한 옵션은 품절된 상태입니다");
								$("#option").get(0).selectedIndex = 0;
								return;
							}
							//버튼형식
							/* if ($(".button").attr("stock")==""){
							    alert("선택한 옵션은 품절된 상태입니다"); 
							    return;
							 } */
							/* if($(".MK_p-name").html() == $("#option").attr("value")){
								alert("이미 추가한 상품 입니다.")
							    return;
							} */
							var optno = $("#option option:selected").val();
							//var optno = $("#option").data("optnm1");
							console.log("optno:" + optno);
							if (!optno)
								return;
							//버튼식
							/*  var li = "<li class='MK_li_1_1'><span class='MK_p-name'>" + 
							 $("#option").attr("value") + 
							 "</span><input type='hidden' name='optno[]' value='" + optno + 
	 "'><input type='hidden' name='kinds[]' value='" + 
							 $("#option").attr("kinds") + 
							 "'><input type='hidden' class='mstock' value='" + 
							 $("#option").attr("stock") + 
							 "'><div class='MK_qty-ctrl' style='height:50px'>"+
							 "<input type='text' name='ea[]' value='1' class='input_ea' size='2' maxlength='3'>"+
							 "<span class='ea'><a class='MK_btn-up'><img src='/ModuHome/images/btn_num_up.gif' alt='' />"+
							 "</a><a class='MK_btn-dw'><img src='/ModuHome/images/btn_num_down.gif' alt='' />"+
							 "</a></span></div><span class='MK_price' data-price='"
							 + $("#option").attr("price")+"'>"+ comma($("#option").attr("price")) +
							 "원</span><a href='#' optno='" + optno +"' class='MK_btn-del'><img src='/ModuHome/images/btn_close.gif' alt='' /></a></li>";
							 */
							var li = "<li class='MK_li_1_1'><span class='MK_p-name'>"
									+ $("#option option:selected")
											.attr("value")
									+ "</span><input type='hidden' name='optno[]' value='" + optno + 
		 "'><input type='hidden' name='kinds[]' value='"
									+ $("option:selected", $(obj))
											.attr("kinds")
									+ "'><input type='hidden' class='mstock' value='"
									+ $("option:selected", $(obj))
											.attr("stock")
									+ "'><div class='MK_qty-ctrl' style='height:50px'>"
									+ "<input type='text' name='ea[]' value='1' class='input_ea' size='2' maxlength='3'>"
									+ "<span class='ea'><a class='MK_btn-up'><img src='/ModuHome/images/store/btn_num_up.gif' alt='' />"
									+ "</a><a class='MK_btn-dw'><img src='/ModuHome/images/store/btn_num_down.gif' alt='' />"
									+ "</a></span></div><span class='MK_price' data-price='"
									+ $("option:selected", $(obj))
											.attr("price")
									+ "'>"
									+ comma($("option:selected", $(obj)).attr(
											"price"))
									+ "원</span><a href='#' optno='" + optno +"' class='MK_btn-del'><img src='/ModuHome/images/store/btn_close.gif' alt='' /></a></li>";
							$("#MK_innerOpt_01").append(li);
							console
									.log("태그내용확인:"
											+ $("#MK_innerOpt_01").html());
							r_optno.push(optno);
							var thisIdx = $(".input_ea").attr("value");
							var inputEa = parseInt(thisIdx, 10);
							change_ea(this, 1);
							console.log("inputEa?" + inputEa);
							var price = parseInt(rm_comma($("option:selected",
									$('#option')).attr("price")), 10);
							price = price * inputEa;
							price = parseInt(price, 10);
							totprice = parseInt(rm_comma($("#MK_txt-won")
									.html()), 10);
							if (totprice != 0) {
								console.log("totprice가 0이 아닐경우")
								totprice = parseInt(rm_comma($("#MK_txt-won")
										.data("price")), 10);
							}
							totprice = totprice + price;
							$("#MK_txt-won").data("price", totprice);
							$("#MK_txt-won").html(comma(totprice) + "원");
						});
	}
	//상품옵션 삭제
	$(document).ready(function() {
		var r_optno = $("#option").val();
		$("#MK_innerOpt_01").on("click", ".MK_btn-del", function() {
			var ritem = $(this).attr("optno");
			var thisIdx = $(".MK_btn-del").index(this);
			var price = parseInt($(".MK_price").eq(thisIdx).data("price"), 10);
			var totprice = parseInt($("#MK_txt-won").data("price"), 10);
			totprice = parseInt(totprice - price);
			$("#MK_txt-won").data("price", totprice);
			$("#MK_txt-won").html(comma(totprice) + "원");
			//배열에서 function 필터에 만족하는 값을 찾는다.
			r_optno = $.grep(r_optno, function(v) {
				return v != ritem;
			});
			$(".MK_li_1_1").eq(thisIdx).remove();
		});
	});
	//수량증가
	$(document).ready(
			function() {
				$("#MK_innerOpt_01").on(
						"click",
						"li a.MK_btn-up",
						function(e) {
							var thisIdx = parseInt($(".MK_btn-up").index(this),
									10);
							change_ea(this, 1);
							var inputEa = parseInt($(".input_ea").eq(thisIdx)
									.val(), 10);
							var mStock = parseInt($(".mstock").eq(thisIdx)
									.val(), 10);
							var price = parseInt($("option:selected",
									$('#option')).attr("price"), 10);
							$(".MK_price").eq(thisIdx).data("price",
									(price * inputEa));
							var total = $(".MK_price").eq(thisIdx).html(
									comma(price * inputEa) + "원");
							var totprice = parseInt($("#MK_txt-won").data(
									"price"), 10);
							totprice = totprice + price;
							$("#MK_txt-won").data("price", totprice);
							$("#MK_txt-won").html(comma(totprice) + "원");
							// 재고 수량 이상 주문 체크
							if (inputEa >= mStock) {
								alert(mStock + "개 이상 주문하실 수 없습니다.");
								change_ea(this, -1);
								inputEa = parseInt($(".input_ea").eq(thisIdx)
										.val(), 10);
								var total = $(".MK_price").eq(thisIdx).html(
										comma(price * inputEa) + "원");
								return false;
							}
						});
				//수량 감소
				//$(document).ready(function(){
				$("#MK_innerOpt_01").on(
						"click",
						"li a.MK_btn-dw",
						function(e) {
							var thisIdx = $(".MK_btn-dw").index(this);
							var inputEa = parseInt($(".input_ea").eq(thisIdx)
									.val(), 10);
							if (inputEa == 1) {
								alert("1개 이상 주문하셔야 합니다.");
								$(".input_ea").eq(thisIdx).val() == 1;
								return false;
							}
							change_ea(this, -1);
							inputEa = parseInt(
									$(".input_ea").eq(thisIdx).val(), 10);
							//var price = parseInt($(".MK_price").data("price"), 10);
							var price = parseInt($("option:selected",
									$('#option')).attr("price"), 10);
							$(".MK_price").eq(thisIdx).data("price",
									(price * inputEa));
							var total = $(".MK_price").eq(thisIdx).html(
									comma(price * inputEa) + "원");
							var totprice = parseInt($("#MK_txt-won").data(
									"price"), 10);
							totprice = totprice - price;
							$("#MK_txt-won").data("price", totprice);
							$("#MK_txt-won").html(comma(totprice) + "원");
							return false;
						});
			});
	//$(document).ready(function(){
	//상품 옵션 div 클래스
	/* $("#MK_innerOpt_01").on("keyup", "li input.input_ea", function(e){
	 console.log("start");
	 var thisIdx = $(".input_ea").index(this); 
	 var mStock = parseInt($(".mstock").eq(thisIdx).val(), 10); 
	 var price = parseInt($("option:selected",$('#option')).attr("price"), 10);
	 var totprice = $("#MK_txt-won").data("price");
	
	 $(this).val($(this).val().replace(/[^0-9]/g,""));
	 if($(this).val() == "" || parseInt($(this).val()) <= 0) {
	 $(this).val("1");
	 return false ;
	 }
	 if(parseInt($(this).val()) > mStock) {
	 alert(mStock+"개 이상 주문하실 수 없습니다.");
	 $(this).val(mStock);
	 var total = $(".MK_price").eq(thisIdx).html(comma(price*parseInt($(this).val(), 10))+"원");
	 return false ;
	 } else{
	 var total = $(".MK_price").eq(thisIdx).html(comma(price*parseInt($(this).val(), 10))+"원");
	 totprice = totprice + (price*(parseInt($(this).val(), 10)-1));
	 $("#MK_txt-won").html(comma(totprice)+"원");
	 }
	 });
	 }); */
	 
</script>
<script>
$(function() {
    var time = 500;
    var idx = idx2 = 0;
    var slide_width = $("#slider").width();
    var slide_count = $("#slider li").size();
    $("#slider li:first").css("display", "block");
    if(slide_count > 1)
        $(".btn").css("display", "inline");
    $("#prev_btn").click(function() {
        if(slide_count > 1) {
            idx2 = (idx - 1) % slide_count;
            if(idx2 < 0)
                idx2 = slide_count - 1;
            $("#slider li:hidden").css("left", "-"+slide_width+"px");
            $("#slider li:eq("+idx+")").animate({ left: "+="+slide_width+"px" }, time, function() {
                $(this).css("display", "none").css("left", "-"+slide_width+"px");
            });
            $("#slider li:eq("+idx2+")").css("display", "block").animate({ left: "+="+slide_width+"px" }, time);
            idx = idx2;
        }
    });
    $("#next_btn").click(function() {
        if(slide_count > 1) {
            idx2 = (idx + 1) % slide_count;
            $("#slider li:hidden").css("left", slide_width+"px");
            $("#slider li:eq("+idx+")").animate({ left: "-="+slide_width+"px" }, time, function() {
                $(this).css("display", "none").css("left", slide_width+"px");
            });
            $("#slider li:eq("+idx2+")").css("display", "block").animate({ left: "-="+slide_width+"px" }, time);
            idx = idx2;
        }
    });
});
</script>
<style>
.flexslider .slides img {
  width: 400px;
  display: block;
}

 .flexslider:hover .flex-direction-nav .flex-prev {
  opacity: 0.7;
  left: 5px;
}

.flexslider:hover .flex-direction-nav .flex-next {
  opacity: 0.7;
  right: 5px;
}

.flex-direction-nav .flex-prev {
  opacity: 1;
  left: 5px;
}
.flex-direction-nav .flex-next {
  opacity: 1;
  right: 5px;
} 

/* .flex-direction-nav a:before  { 
    content: " ";
    display: block;
    width: 40px;
    height: 40px;
}
.flex-direction-nav a.flex-next:before  { 
    content: " ";
    display: block;
    width: 40px;
    height: 40px;
} */

.btn-just-buy {
/* 	background-color: #917751;
	color: white;
	font-size: 14px;
	padding: 15px 10px 15px 10px;
	font-weight: bold;
	text-align: center;
	cursor: pointer; */
	
	border: 1px solid #85C8DD;
    background: #85C8DD;
    color: #fff;
}

.btn-cart {
/* 	background-color: gray;
	padding-bottom: env(safe-area-inset-bottom) */
	
	border: 1px solid #b2b2b2;
    background: #b2b2b2;
    color: #fff;
}


</style>

<title>Insert title here</title>
</head>
<body>
	<form name="fmOrder">
			<input type="hidden" name="mode"> <input type="hidden"
				name="goodsno" value="${goodsBasic.GOODS_NUMBER }"> <input
				type="hidden" name="MEMBER_NUMBER" value="71">


			<!-- 상품정보 -->
			<!-- 상단 상품이미지 -->
			<div class="container">
						<div class="furniture-view">
							<div class="row">
							<div>
							<div class="furniture-view-image-wrapper">
						 		<%-- <div class="col-xs-6 furniture-view-image monday-slick">
									<div class="furniture-view-image-wrapper">
									<c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="0" end="1">
									<div class="furniture-image">
									<img src="/ModuHome/images/goods/${goodsImage.IMAGE}" onerror="this.src='/ModuHome/images/noimg_130.gif'" />
									</div>
									</c:forEach>
									</div >	
						
								</div > --%>
								
								<!-- <div class="col-xs-6 furniture-view-image monday-slick">
									<div class="furniture-view-image-wrapper"> -->
									
									<section class="flexslider" style="width:400px; height:400px;">
      								<ul class="slides">
									
									<c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="0" end="1">
									<li style="width:400px;">
									<img src="/ModuHome/images/goods/${goodsImage.IMAGE}" onerror="this.src='/ModuHome/images/noimg_130.gif'" />
									  </li>
									</c:forEach>
									  </ul>
    								</section>
									</div>
									</div >	
						
								
						
						<div class="col-xs-6 furniture-view-infomation">
							<div class="furniture-view-brand">${goodsBasic.GOODS_BRNAME}</div>
							<div class="furniture-view-name">${goodsBasic.GOODS_NAME}</div>
							<div class="furniture-view-cost">
								<c:if test="${goodsBasic.GOODS_PRICE eq goodsBasic.GOODS_DISPRICE}">
								<span class="original slashit">
									<fmt:formatNumber value="${goodsBasic.GOODS_PRICE}" type="number" />원
								</span><br/> 
						        </c:if>
								<c:if test="${goodsBasic.GOODS_PRICE ne goodsBasic.GOODS_DISPRICE}">
										<span class="original slashit"><fmt:formatNumber
												value="${goodsBasic.GOODS_PRICE}" type="number" />원</span><br/> 
										<span class="discount"><fmt:formatNumber
												value="${goodsBasic.GOODS_DISPRICE}" type="number" /></span>원 
												<span class="discount_rate">(<fmt:formatNumber
													value="${(goodsBasic.GOODS_PRICE - goodsBasic.GOODS_DISPRICE)*100 / goodsBasic.GOODS_PRICE}"
													type="number" />%할인)</span>
								</c:if>
							</div>
						<div class="furniture-delivery">
							<div class="row">
								<div class="col-xs-3">배송비</div>
								<div class="col-xs-9">
									<div style="float: left; font-size: 12px;">2,500 원 (
										30,000원 이상 무료 )</div>
									<div style="float: left; font-size: 12px;">(선결제)</div>
									<input type="hidden" name="delivery-payment" value="0">
								</div>
							</div>
						</div>
					<div class="furniture-view-option ">
							<div>상품옵션</div>
						<div class="option-set">
						<select id="option" onchange="setOption2(this)"
							style="width: 225px">
							<option value="">-옵션 선택-</option>
							<c:forEach var="goodsDetail" items="${goodsDetail}"
								varStatus="stat">
								<c:if test="${goodsDetail.GOODS_AMOUNT > 0}">
									<c:if
										test="${goodsBasic.GOODS_DISPRICE ne goodsBasic.GOODS_PRICE }">
										<option
											value="${goodsDetail.GOODS_OPTION1}-${goodsDetail.GOODS_OPTION2 }"
											data-optnm1="${goodsDetail.GOODS_OPTION1 }"
											data-optnm2="${goodsDetail.GOODS_OPTION2 }"
											stock="${goodsDetail.GOODS_AMOUNT }"
											price="${goodsBasic.GOODS_DISPRICE }"
											kinds="${goodsDetail.GOODS_KIND_NUMBER }">${goodsDetail.GOODS_OPTION1}-${goodsDetail.GOODS_OPTION2 }</option>
										<c:if test="${goodsBasic.GOODS_DISPRICE eq goodsBasic.GOODS_PRICE }">
										</c:if>
										<c:if test="${goodsDetail.GOODS_AMOUNT eq 0}">
										</c:if>
									</c:if>
								</c:if>
							</c:forEach>
						</select>
						</div>	
						<div>
							<ul class="MK_inner-opt-cm" id="MK_innerOpt_01"></ul>
						</div>
						<div id="MK_innerOptTotal" class="">
							<p class="totalRight">
								<span class="MK_txt-total">합계</span> <span id="MK_txt-won"
									data-price="">0원</span>
							</p>
						</div>	
					</div> <!-- ## furniture-view-option end ##-->
					
					
					<!-- 	<div class="furniture-view-total-price">
								<div>
									합계 : <span class="price">0</span> 원
								</div>
							</div> -->
						
						
						<div class="row" style="margin-right: -100px; margin-left: -1px;">
								<div class="col-xs-5 btn-cart" id="cartBtn"
									onclick="javascript:_exec('cart');">장바구니</div>
								<div class="col-xs-5 btn-just-buy"
									onclick="javascript:_exec('buy');">바로구매</div>
						</div>
						</div>
						</div>	<!-- ## furniture-view-infomation ## -->
						</div> <!-- ## furniture-view ## -->
						
<div class="container">
		<div class="commerce-title">
			<h2>제품 설명</h2>
		</div>
		<div class="furniture-view-body">

			<c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="2">
			<img src="/ModuHome/images/goods/${goodsImage.IMAGE}" width="600">
			<br>
			</c:forEach>
		</div> 
</div>

<!--/.furniture-view-body-->
		<div class="space15 mt10"></div>
		<a name="review"></a>
		<div class="furniture-review">
			<div class="mt18"></div>
			<div class="furniture-review-title">
				<span class="title">구매 후기</span> <span class="message">후기
					작성하고 추가 적립 받으세요!</span> <span class="review-write-btn"
					onclick="location.href='/login/';">후기 작성하기</span>
			</div>
			<div class="furn_review furniture-view-fix-width">
				<div style="padding: 12px; text-align: center; color: #8F8F8F;">아직
					작성된 후기가 없습니다.</div>
			</div>
			<div class="furniture-together">
				<div class="commerce-title">
					<h2>함께 본 제품</h2>
				</div>
				<div id="furniture-together-list"
					class="row furniture-item-group-3 furniture-related-wrapper">
					<div class="furniture-slick-item">
						<a href="/furniture/view/14656"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20170627141310fjJz4BS1w3.jpg" />
						</a>
						<div class="description">
							<div class="name">[하우스레시피] 모리노키 원목 손잡이 쟁반 4종</div>
							<div class="price_original">
								<s>17,000 원</s>
							</div>
							<div class="price_discount">
								<span>5,800</span> 원 (66%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/14705"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20170302183544WxPtH2nHjd.JPG" />
						</a>
						<div class="description">
							<div class="name">[마켓비] MANTIC 캔들 램프 (할로겐전구 무료증정)</div>
							<div class="price_original">
								<s>39,900 원</s>
							</div>
							<div class="price_discount">
								<span>16,400</span> 원 (59%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/14733"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20170627144915CLgy3ejXwG.jpg" />
						</a>
						<div class="description">
							<div class="name">[마켓비] RUSTA 장스탠드</div>
							<div class="price_original">
								<s>29,900 원</s>
							</div>
							<div class="price_discount">
								<span>17,900</span> 원 (40%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/14835"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20170719171359kwXJSDgIj9.jpg" />
						</a>
						<div class="description">
							<div class="name">[아레테까사] 스칸 식기건조대</div>
							<div class="price_original">
								<s>8,900 원</s>
							</div>
							<div class="price_discount">
								<span>3,500</span> 원 (61%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/24817"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20180605145200lx5fHhQcHW.jpeg" />
						</a>
						<div class="description">
							<div class="name">[아르셰] 메모 패드</div>
							<div class="price_original">
								<s>36,000 원</s>
							</div>
							<div class="price_discount">
								<span>17,900</span> 원 (50%)
							</div>
						</div>
					</div>
				
				
					
				</div>
			</div>
			<!-- -->
			<div class="furniture-qna">
				<div class="commerce-title">
					<h2 style="margin-bottom: 0px;">Q&A</h2>
					<div class="qna-wrapper">
						<div
							onclick="location.href='https://www.ggumim.co.kr/furniture/write_qna/29976';">Q&A
							작성하기</div>
						<div
							onclick="kakao_link('https://lc-api.lunasoft.co.kr/lunachat/api-connect/@%EC%A7%91%EA%BE%B8%EB%AF%B8%EA%B8%B0%EC%A0%9C%EB%B3%B4/main');">
							<img style="height: 35px"
								src="//cdn.ggumim.co.kr/resource/icons/btn_kakao_talk_contact2.png">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">작성된 Q&A가 없습니다.</div>
				</div>
			</div>
		</div>
		<!--/.furniture-view-->
	</div>
	

</form>
</body>
</html>