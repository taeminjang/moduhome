<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<%
session.setAttribute("MEMBER_ID", "test5");
session.setAttribute("MEMBER_NUMBER", "4");
%>  
<c:set var="checkBuy" value="183" />

<!-- CSS Offset -->
<link type="text/css" rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" />
<!-- <link type="text/css" rel="stylesheet"
	href="//cdn.ggumim.co.kr/resource/house_interior_web/ggumim-1.2.05.min.css" /> -->
<script type="text/javascript"
	src="//cdn.ggumim.co.kr/resource/house_interior_web/ggumim.stack-1.2.05.min.js"></script>
	
<link type="text/css" rel="stylesheet" href="/ModuHome/css/store/ggumim-1.2.04.min.css"/>
<script src="/ModuHome/dist/jquery/jquery-1.11.0.min.js"></script>
<script src="/ModuHome/dist/jquery/jquery-ui.js"></script>
<script src="/ModuHome/dist/jquery/jquery-migrate-1.2.1.min.js"></script>	
	
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
			$("option:eq(0)").prop("selected", true);
			
			
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

<style>
.btn-just-buy {
	border: 1px solid #85C8DD;
    background: #85C8DD;
    color: #fff;
}
.btn-cart {
	border: 1px solid #b2b2b2;
    background: #b2b2b2;
    color: #fff;
}
.container {
	width: 1000px;
}
.furniture-view{
	margin-top: 100px;
	width: 1000px;
}

.furniture-view .row .furniture-view-infomation {
	float:right;
	margin-right: 80px;
	padding-top: 50px;
	padding-bottom: 50px;
}
.furniture-view-infomation div {
	margin-left: 50px;
}
.furniture-delivery div {
	margin-left: 1px;
}
.furniture-view-option div {
	margin-left: 1px;
}
.furniture-view-option .option-set select {
	margin-top: -30px;
}

.furniture-view .furniture-view-image .furniture-view-image-wrapper {
	width: 400px;
	margin-left: 50px;
	padding-top: 50px;
}

</style>
</head>
<body>
	<form name="fmOrder">
			<input type="hidden" name="mode"> <input type="hidden"
				name="goodsno" value="${goodsBasic.GOODS_NUMBER }"> <input
				type="hidden" name="MEMBER_NUMBER" value="71">
	<div class="container">
		<div class="furniture-view">
			<div class="row">
				<div class="col-xs-6 furniture-view-image monday-slick">
						<div class="furniture-view-image-wrapper">
									<c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="0" end="1">
									<div class="furniture-image">
									<img src="/ModuHome/images/goods/${goodsImage.IMAGE}" onerror="this.src='/ModuHome/images/noimg_130.gif'" />
									</div>
									</c:forEach>
							</div > 
				
				</div>
				<!--/.left menu end-->
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
								<div>배송비</div>
								<div>
									<div style="float: left; font-size: 12px;">2,500 원 (
										30,000원 이상 무료 )</div>
									<div style="float: left; font-size: 12px;">(선결제)</div>
									<input type="hidden" name="delivery-payment" value="0">
								</div>
							</div>
						</div>
					<!--/.right top menu end-->
					<div class="furniture-view-option ">
						<div>상품옵션</div>
						<div class="option-set">
						<select id="option" onchange="setOption2(this)"
							style="width: 225px">
							<option selected value="">-옵션 선택-</option>
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
					</div>
					<!--/.furniture-view-option-->
					<div class="row" style="margin-right: -100px; margin-left: -1px;">
							<div class="col-xs-5 btn-cart" id="cartBtn"
								onclick="javascript:_exec('cart');" style="width:230px; height:40px; text-align: center;">장바구니</div>
							<div class="col-xs-5 btn-just-buy"
								onclick="javascript:_exec('buy');" style="margin-left:0px; width:230px; height:40px; ">바로구매</div>
					</div>
				</div>
				<!--/.right bottom menu-->
			</div>
			<!--/right menu-->
		</div>
		</div>
		<div class="container">
			<div class="commerce-title">
				<h2>제품 설명</h2>
			</div>
		<div class="furniture-view-body" style="width: 1000px;">
			<c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="2">
			<img src="/ModuHome/images/goods/${goodsImage.IMAGE}" width="1000">
			<br>
			</c:forEach>
		</div> 
		<!--/.furniture-view-body-->
		
		<!-- jg -->
		
		<div class="cboth p_review" id="changeReviewList"> 
                        <div id="powerReview">
                           <div class="hd-t">
                              <c:if test="${sessionScope.MEMBER_ID eq null}">
                                 <a href="#"  data-size="md" data-label="구매 후기 작성"
                                    onClick="alert('로그인을 해주세요.'); return false;">
                                       <div class="hd-t"><h2>POWER REVIEW 작성하기</h2></div>
                                 </a>
                              </c:if> 
            				<c:if test="${sessionScope.MEMBER_ID ne null and checkBuy ne goodsBasic.GOODS_NUMBER}">
            					 <a href="#"  data-size="md" data-label="구매 후기 작성"
                                    onClick="alert('구매후 작성 가능합니다..'); return false;">
                                       <div class="hd-t"><h2>POWER REVIEW 작성하기</h2></div>
                                 </a>
            				</c:if> 
                              <c:if test="${sessionScope.MEMBER_ID ne null and checkBuy eq goodsBasic.GOODS_NUMBER}">
                                 <a href="/ModuHome/review/reviewForm?GOODS_NUMBER=${goodsBasic.GOODS_NUMBER}"
                                    target="modal" data-size="md" data-label="구매 후기 작성">
                                       <div class="hd-t"><h2>POWER REVIEW 작성하기</h2></div>
                                       </a>
                              </c:if>  
                           </div>     
                           
                           <div class="PR15N01-hd">
                              <h2>
                                 프리미엄 상품평 <span></span>
                              </h2>
                           </div>
                           
                           <div id="listPowerReview" class="MS_power_review_list">
                           <c:forEach var="goodsReview" items="${goodsReview}" varStatus="stat">
                           <c:if test="${reviewEndPagingNum >= stat.count}">
                           <c:if test="${reviewStartPagingNum < stat.count}">
                           <ul class="PR15N01-review-wrap">
                                 <li id="power_review_block20180711112229"
                                    class="power-review-list-box">
                                 <div class="hd-box">
                                    <ul class="desc">
                                    <li class="pr-list-writer">작성자 : ${goodsReview.MEMBER_NAME}</li><br>
                                    <li class="pr-list-writer"><fmt:formatDate value="${goodsReview.REVIEW_REGDATE}" pattern="YYYY-MM-dd HH:mm" /></li>
                                    </ul>
                                    <div class="star-icon">
                                    <span class="star">
                                   	<c:if test="${goodsReview.REVIEW_SCORE == 20 }">
									<font color="#FFBF00" size="5">★</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 40 }">
									<font color="#FFBF00" size="5">★★</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 60 }">
									<font color="#FFBF00" size="5">★★★</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 80 }">
									<font color="#FFBF00" size="5">★★★★</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 100 }">
									<font color="#FFBF00" size="5">★★★★★</font>
									</c:if>
                                    </span>
                                    <span class="icon">
                                    <img src="/ModuHome/theme/ico_new_h38.png">
                                    </span>
                                    </div>
                                 </div><!-- hd-box -->
                           <span class="pr-options" style="display: none;">${goodsReview.REVIEW_CONTENT}</span>   
                           <div class="PR15N01-hd">
                           <h2>제목 : ${goodsReview.REVIEW_TITLE }</h2>
                           </div>
                           <div class="content">
                              <p class="content_p"><a class="more-options">내용 : ${goodsReview.REVIEW_CONTENT }</a></p>
                           <div class="ctr">
                           <div class="photo-list">
                                 <ul>
                                    <li>
                                       <div><span></span>
                                       <c:if test="${goodsReview.REVIEW_IMAGE ne null }">
                                       <img src="/ModuHome/images/review/${goodsReview.REVIEW_IMAGE}">
                                       </c:if>
                                       </div>
                                    <div class="attach-preview"></div></li>                                    
                                 </ul>
                           </div>   
                                                   
                             <c:if test="${goodsReview.MEMBER_NUMBER eq sessionScope.MEMBER_NUMBER }">
												<c:url var="viewURL" value="/reviewDelete">
													<c:param name="REVIEW_NUMBER" value="${goodsReview.REVIEW_NUMBER}" />
													<c:param name="DETAIL" value="1" />
													<c:param name="GOODS_NUMBER" value="${goodsBasic.GOODS_NUMBER}" />
													<%-- <c:param name="REVIEW_IMAGE" value="${review.REVIEW_IMAGE }" /> --%>
							  </c:url>
							 <a href="${viewURL}" class="delete" onclick="return delchk()">[삭제]</a>
							  </c:if> 
                              
                           </div><!-- ctr -->
                           </div><!-- content -->

                                 </li><!-- power-review-list-box -->
                           </ul><!-- PR15N01-review-wrap -->
                           </c:if>
                           </c:if>
                           </c:forEach>
                           <c:if test="${reviewSize gt 5 }">
                           <div style="text-align:center;">
                           <c:if test="${reviewNowPage ne 1 }">
                           <a class="pg_prev" style="margin-top: -8px;" href="javascript:ajaxReviewPaging(1,${reviewEndPagingNum},${reviewStartPagingNum},${reviewNowPage});"></a>
                           </c:if>
                              <span class="pg_current">${reviewNowPage}</span>
                              <c:if test="${reviewNowPage ne 1 }">
                              <span class="pg_page">
                              ${reviewTotalPage}</span>   
                              </c:if>
                           <c:if test="${reviewNowPage ne reviewTotalPage }">
                           <a class="pg_next" style="margin-top: -8px;" href="javascript:ajaxReviewPaging(2,${reviewEndPagingNum},${reviewStartPagingNum},${reviewNowPage});"></a>
                           </c:if>
                           </div>
                           </c:if>
                           
                           </div><!-- listPowerReview -->
                           
                           
                           </div><!-- powerReview -->    

         </div><!-- cboth p_review -->

		<!-- qna -->
		<div class="cboth"></div>
                     <h3 class="cboth tit-detail">
                        <span class="btns">
                        <a href="/ModuHome/qna/modal_qnaForm?GOODS_NUMBER=${goodsBasic.GOODS_NUMBER}" target="modal" data-size="md" data-label="1:1상품 문의">Q&amp;A &nbsp;WRITE</a>
                        </span>
                     </h3>
                     <br>
                     <br>
               
                     
                     
         <section class="product-view-qna-list section box-shadow" id="changeQnaList">
         <div class="PR15N01-hd" id="qna">
            <h2>상품문의</h2>
         </div>
         <div>
         
            <!-- ajax_review_list 감싸는 div 삭제 불가 -->
            <div id="ajax_qna_list">
               <div class="section-body">
                  <ul class="list-dropdown">
               
                     <c:forEach var="goodsQna" items="${goodsQna}" varStatus="stat">
                     <c:if test="${qnaEndPagingNum >= stat.count}">
                     <li>
                        <div class="brief">
                        <!-- 질문자 제목 -->
                           <strong class="title">${goodsQna.QNA_TITLE}</strong>
                           <div class="info">
                              <p class="author">${goodsQna.MEMBER_NAME}</p>
                              <p class="date">/ ${goodsQna.QNA_REGDATE}</p>
                           </div>
                        </div>
                        <div class="detail">
                        <!-- 질문자내용 -->
                           <div class="contents">
                              <div class="description">
                                 <p>${goodsQna.QNA_CONTENT} 
                                  <c:if test="${goodsQna.MEMBER_NUMBER eq sessionScope.MEMBER_NUMBER }">
												<c:url var="viewURL" value="/qnaDelete">
													<c:param name="QNA_NUMBER" value="${goodsQna.QNA_NUMBER}" />
													<c:param name="DETAIL" value="1" />
													<c:param name="GOODS_NUMBER" value="${goodsBasic.GOODS_NUMBER}" />
								</c:url>
							    <a href="${viewURL}" style="float:right;" class="delete" onclick="return delchk()">[삭제]</a>
							  </c:if> 
                                 </p>
                                 <c:if test="${goodsQna.QNA_IMAGE ne null }">
                                    <div class="picture">
                                       <img
                                          src="/ModuHome/images/qna/${goodsQna.QNA_IMAGE}">
                                    </div>
                                 </c:if>
                                 <c:if test="${goodsQna.IMAGE2 ne null }">
                                    <div class="picture">
                                       <img
                                          src="/ModuHome/images/qna/${goodsQna.IMAGE2}">
                                    </div>
                                 </c:if>
                                                              
                              
                              </div>
                           </div>
                        <!-- 답변내용 -->
                        <c:if test="${goodsQna.QNA_REPCONTENT ne null}">
                           <div class="answer">
                              <img src="/ModuHome/theme/admin.png" style="width: 100px;height: 50px;">
                              <p>${goodsQna.QNA_REPCONTENT}</p>
                              
                              <div class="info">
                                 <p class="author">admin</p>
                                 <p class="date">/ ${goodsQna.QNA_REPDATE}</p>
                              </div>
                           </div> 
                        </c:if>
                  
                        </div>
                     </li>
                     </c:if>
                     </c:forEach> 
                     <!-- 반복끝 -->
                  </ul>

				<c:if test ="${qnaSize gt 5}">
                  <div style="text-align:center;">
                     <c:if test="${qnaNowPage ne 1 }">
                     <a class="pg_prev" style="margin-top: -8px;" href="javascript:ajaxQnaPaging(1,${qnaEndPagingNum},${qnaStartPagingNum},${qnaNowPage});">-</a>
                     </c:if>   
                        <span class="pg_current">${qnaNowPage}</span>
                        <c:if test="${qnaNowPage ne 1 }">
                        <span class="pg_page">
                        ${qnaTotalPage}   
                        </span>
                        </c:if>   
                     <c:if test="${qnaNowPage ne qnaTotalPage}">   
                     <a class="pg_next" style="margin-top: -8px;" href="javascript:ajaxQnaPaging(2,${qnaEndPagingNum},${qnaStartPagingNum},${qnaNowPage});" >-</a>
                        
                     </c:if>
                     </div>
                  </c:if>           
               </div>
            </div>
         </div>
         
         </section>
         
         <!-- jg -->
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
			<div class="furniture-qna">
				<div class="commerce-title">
					<h2 style="margin-bottom: 0px;">Q&A</h2>
					<div class="qna-wrapper">
						<div
							onclick="location.href='https://www.ggumim.co.kr/furniture/write_qna/29976';" style="float:right;">Q&A
							작성하기</div>
						<!-- <div
							onclick="kakao_link('https://lc-api.lunasoft.co.kr/lunachat/api-connect/@%EC%A7%91%EA%BE%B8%EB%AF%B8%EA%B8%B0%EC%A0%9C%EB%B3%B4/main');">
							<img style="height: 35px"
								src="//cdn.ggumim.co.kr/resource/icons/btn_kakao_talk_contact2.png">
						</div> -->
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">작성된 Q&A가 없습니다.</div>
				</div>
			</div>
			<div class="furniture-together">
				<div class="commerce-title">
					<h2>추천 상품</h2>
				</div>
				<div id="furniture-together-list"
					class="row furniture-item-group-3 furniture-related-wrapper" style="width: 1000px;">
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
						<a href="/furniture/view/14760"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20180828160502d83EXW2fde.jpg" />
						</a>
						<div class="description">
							<div class="name">[데코뷰] 호텔식 화이트 시폰 커튼</div>
							<div class="price_original">
								<s>116,000 원</s>
							</div>
							<div class="price_discount">
								<span>76,000</span> 원 (34%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/14834"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20170726145723wxjmopqdQM.jpg" />
						</a>
						<div class="description">
							<div class="name">[마켓비] BELY 해초 바구니</div>
							<div class="price_original">
								<s>22,900 원</s>
							</div>
							<div class="price_discount">
								<span>12,400</span> 원 (46%)
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
						<a href="/furniture/view/14846"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/2017071012472893pO7bsY0M.jpg" />
						</a>
						<div class="description">
							<div class="name">[요리즐] 매그넛 블랙라벨 키친툴 세트</div>
							<div class="price_original">
								<s>34,800 원</s>
							</div>
							<div class="price_discount">
								<span>31,300</span> 원 (11%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/14875"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20170823133905TqOAFdngMA.png" />
						</a>
						<div class="description">
							<div class="name">[노바리빙] 다용도 문걸이 수납선반</div>
							<div class="price_original">
								<s>21,900 원</s>
							</div>
							<div class="price_discount">
								<span>17,500</span> 원 (20%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/19115"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20180329192905tvGVzuXVNZ.jpeg" />
						</a>
						<div class="description">
							<div class="name">[데코뷰] 키친 소프트 주방매트 (택1)</div>
							<div class="price_original">
								<s>42,000 원</s>
							</div>
							<div class="price_discount">
								<span>29,400</span> 원 (30%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/19212"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/201803291931345fRPT4qEVn.jpeg" />
						</a>
						<div class="description">
							<div class="name">[룸앤홈] 네온LED무드등</div>
							<div class="price_original">
								<s>19,900 원</s>
							</div>
							<div class="price_discount">
								<span>15,900</span> 원 (20%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/23257"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/2018052407452418UY1KmXnd.jpg" />
						</a>
						<div class="description">
							<div class="name">[블루밍앤미] 롱 스탬 유칼립투스</div>
							<div class="price_original">
								<s>5,000 원</s>
							</div>
							<div class="price_discount">
								<span>4,000</span> 원 (20%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/23915"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/201805291359551JticBMaTH.jpg" />
						</a>
						<div class="description">
							<div class="name">[프랑코] 스탠드 분리수거함</div>
							<div class="price_original">
								<s>68,000 원</s>
							</div>
							<div class="price_discount">
								<span>46,900</span> 원 (31%)
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
					<div class="furniture-slick-item">
						<a href="/furniture/view/26897"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20180627172107cm2c8quOUe.jpg" />
						</a>
						<div class="description">
							<div class="name">[더홈스] 접이식 에코백</div>
							<div class="price_original">
								<s>12,900 원</s>
							</div>
							<div class="price_discount">
								<span>10,300</span> 원 (20%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/27203"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/201807111755448by7pSCxAb.jpg" />
						</a>
						<div class="description">
							<div class="name">[웰림] 못없이 설치하는 디자이너 벽걸이 화분</div>
							<div class="price_original">
								<s>20,000 원</s>
							</div>
							<div class="price_discount">
								<span>16,900</span> 원 (16%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/29149"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20180810150706E2kHojUNUg.jpg" />
						</a>
						<div class="description">
							<div class="name">[라이크하우스] [1+1]비닐봉투 보관함/비닐봉지정리함 비닐정리함
								비닐봉지보관함 [HY]</div>
							<div class="price_original">
								<s>9,200 원</s>
							</div>
							<div class="price_discount">
								<span>4,600</span> 원 (50%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/29751"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/2018081616502591u1IKm1US.jpg" />
						</a>
						<div class="description">
							<div class="name">[블루밍앤미] 블루밍앤미 리스&갈란드</div>
							<div class="price_original">
								<s>11,000 원</s>
							</div>
							<div class="price_discount">
								<span>8,800</span> 원 (20%)
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- -->
	
		</div>
		<!--/.furniture-view-->
	</div>
	<br />
	<br />
	<div class="comment-list" id="comment">
		<div class="comment-container"></div>
		<!--/.comment-container-->
	</div>

	<script>
		Stack
				.add(function() {
					FurnitureView.init("29976");
					FurnitureView
							.setUnit('{"56885-":{"unitIdx":219575,"price":20800,"name":"\ub9c8\ud638\uac00\ub2c8","count":241,"count_type":0,"status":1,"sold":1},"56886-":{"unitIdx":219576,"price":20800,"name":"\uc5d0\ubcf4\ub2c8","count":241,"count_type":0,"status":1,"sold":1}}');
					FurnitureView.setExtraUnit('[]');
					FurnitureView.setOptionStatus('{"56886-":1,"56885-":1}');
					FurnitureView
							.setOption('{"56885":{"idx":56885,"parent_idx":56884,"type":2,"name":"\ub9c8\ud638\uac00\ub2c8","price":0,"url":"","map":"","color":"#FFFFFF","parent_name":"\uceec\ub7ec"},"56886":{"idx":56886,"parent_idx":56884,"type":2,"name":"\uc5d0\ubcf4\ub2c8","price":0,"url":"","map":"","color":"#FFFFFF","parent_name":"\uceec\ub7ec"}}');
					FurnitureView.setOptionSet('[[56885,56886]]');
					FurnitureView.vars.dept = 1;
					FurnitureView.vars.outsideLink = '';
					var option_count = $(".option-item").length;

					if (option_count > 4) {
						$(".furniture-view-extra-option").css("margin-top",
								"100px");
					}
					FurnitureView.visibility = '1';
					FurnitureView.naverPay.stock = "Y";
				});

	</script>
	
	<script type="text/javascript" async
		src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
	<script type="text/javascript"
		src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript"
		src="https://pay.naver.com/customer/js/naverPayButton.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="//cdn.ggumim.co.kr/resource/house_interior_web/ggumim-1.2.05.min.js"></script>
	<script>
		var api_url = "https://api.ggumim.co.kr";
		//  쌍였던 애들 처리
		Stack.process();

		// 너무 많이 페이지 내러가면, 업 버튼 생기기
		Scrolltop.begin();

		// 갤러리!
		Naruto.begin();
	</script>
</form>
</body>
</html>
