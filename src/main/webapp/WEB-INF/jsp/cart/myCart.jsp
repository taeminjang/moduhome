<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


<c:set var="TOTALPRICE" value="0" />
<c:set var="TOTALDISPRICE" value="0" />

<script>

/* $("#optionbox").on("click", "li a.btn-ea-up", function(e) {
	   var thisIdx = $(".btn-ea-up").index(this); 
	   change_ea(this,1); 
	   var inputEa = parseInt($(".input_ea").eq(thisIdx).val());
	   console.log('inputEa:' +inputEa);
	   var mStock = parseInt($(".mstock").eq(thisIdx).val()); 
	   var price = parseInt($("option:selected",$('#option')).attr("price"));
	   var total = $(".price2").eq(thisIdx).html(comma(price*inputEa)+"원"); 
	   


	   // 재고 수량 이상 주문 체크
	   if(inputEa > mStock) {
	      alert(mStock+"개 이상 주문하실 수 없습니다.");
	      change_ea(this,-1);
	      inputEa = parseInt($(".input_ea").eq(thisIdx).val());
	      var total = $(".price2").eq(thisIdx).html(comma(price*inputEa)+"원"); 
	      return false ;
	   } 
});
 */
 


 var sum = 0;
 var disSum= 0;
 var totSum = 0;
 
 function checkedRows(index){
	    var index = index;
	    var tagName = "#checkbox"+index;
	    var price = $(".price").eq(index).attr("value");
	    var disprice = $(".disprice").eq(index).attr("value");
	    var totprice = $(".totprice").eq(index).attr("value");
	    
	    price = parseInt(price);
	    disprice = parseInt(disprice);
	    totprice = parseInt(totprice);
       		if($(tagName).is(":checked")){
       			   sum = sum + price;
       			   disSum = disSum + disprice;
       			   totSum = totSum + totprice;
	        	   $("#realtotalPrice").html(comma(sum)+"원");
	        	   $("#disCountPirce").html("-"+comma(disSum)+"원");
	        	   $("#totalPrice").html(comma(totSum)+"원");
	        	}else{
	        	    sum = sum-price;
	        	    disSum = disSum - disprice;
	        	    totSum = totSum - totprice;
	        		$("#realtotalPrice").html(comma(sum)+"원");
	        		$("#disCountPirce").html("-"+comma(disSum)+"원");
	        		$("#totalPrice").html(comma(totSum)+"원");
	        }  
	};
</script>

<style>
.label1 {
	display: inline;
	padding: .2em .6em .3em;
	font-size: 11px;
	font-weight: bold;
	line-height: 1;
	color: #fff;
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	border-radius: .25em;
}

.label-danger1 {
	background-color: #d9534f;
}

.table > tfoot > tr > td {
  padding: 8px;
  line-height: 1.42857143;
  vertical-align: top;
  border-top: 1px solid #dddddd;
  background: #f6f6f6;	
  } 
  
  .page-title h2 {
	background-color: #ffc000;
	-webkit-border-radius: 0 0 5px 5px;
	-moz-border-radius: 0 0 5px 5px;
	-ms-border-radius: 0 0 5px 5px;
	border-radius: 0 0 5px 5px;
	overflow: hidden;
	padding: 0 5px
}   5482 - 5490






.my-account .my-info .point, .my-account .my-info .coupon {
	background-color: #c0c0c0
}	12335

.account-nav ul li {
	position: relative;
	display: inline-block;
	padding: 0;
	background-color: #fff;
	border-top: 1px solid #000000;
	border-right: 1px solid #000000;
	border-bottom: 1px solid #000000
}	12134

.account-nav ul li.selected a {
	color: #000000
}	12195

.badge {
	-webkit-border-radius: 7px;
	-moz-border-radius: 7px;
	-ms-border-radius: 7px;
	border-radius: 7px;
	color: #ffffff!important;
	font-size: 9px;
	vertical-align: middle;
	background-color: #000000
}	4645


.section-head.border h3, .section-head.border h5 {
	border-bottom: 2px solid #000000
}	4864



.order-list .table th {
	font-family: "crn-md", "NanumBarunGothicBold", Dotum, sans-serif;
	color: #000000;
	white-space: nowrap;
	border-top: 1px solid #c8c8c8 !important;
	border-bottom: 1px solid #c8c8c8;
	background: #c0c0c0;
	padding-top: 12px;
	padding-bottom: 10px
}	12565


.step-panels ol li.selected {
	display: block;
	background-color: #000000;
	border-right: none
}	7974


.sum-calculator .button-group .button {
	width: 100%;
	border-radius: 12px;
}	7462

.button {
	display: inline-block;
	position: relative;
	-webkit-font-smoothing: antialiased;
	cursor: pointer;
	text-align: center;
	white-space: nowrap;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	border-radius: 12px;
	user-select: none;
	background-color: #000000;
	margin-bottom: 0;
	vertical-align: middle;
	padding-top: 2px;
	padding-left: 12px;
	padding-right: 12px;
	font-size: 11px;
	line-height: 1.9090909091;
	color: #fff;
	border-width: 1px;
	border-style: solid;
	border-color: #000000
}	2468

.product-thumbnail .thumbnail-list>div .caption .option em, .order-list .table td.info-caption .option em,
	.account-individual-list .table td.info-caption .option em,
	.account-qna-list .table td.info-caption .option em, .account-review .review-list .table td.info-caption .option em,
	.login-visitor .member-signup .tip .table td.info-caption .option em,
	.modal .caption .option em, .modal .table td.info-caption .option em {
	float: left;
	border: 1px solid #c8c8c8;
	line-height: 2.1;
	font-family: "crn-md", "NanumBarunGothicBold", Dotum, sans-serif;
	font-size: 10px;
	text-align: center;
	padding: 2px 8px 0;
	border-radius: 12px;
}	
</style>
<br>
<br>
<br>

<div class="viewport">
	<div class="container">
		<section class="page-category">
			<div class="selectboxWrap">
				<strong>쇼핑백</strong>
				<!--<a href="#" class="comment">
				<span class="icon icon-speaker-white"></span>
				<span class="text">배송관련 공지사항 안내 드립니다.</span>
			</a>-->
			</div>
		</section>

		<section class="step-panels">
			<ol style="width: 1220px;">
				<li class="c01 col-xs-24 col-sm-9 selected">
					<div>SHOPPING BAG</div>
				</li>
				<li class="c02 col-xs-5">
					<div>ORDER</div>
				</li>
				<li class="c03 col-xs-5">
					<div>PAYMENT</div>
				</li>
				<li class="c04 col-xs-5" style="w">
					<div>THANKYOU</div>
				</li>
			</ol>
		</section>
		<!-- step-panels//end -->
		<div class="order-shoppingBag row" style="width:1300px">
			<section class="product-thumbnail section col-lg-18" style="width:70%; border:1px solid #c8c8c8;padding-bottom: 10px;padding-top: 10px;" >
				
					<div class="section-head left border" style="height:15px;">
						<h3>쇼핑백에 담긴 상품</h3>
					</div>
					<div class="section-body">

						<form name="fmCart" action="/MODA/cartDelete">
							<input type="hidden" name="mode" value="del">


							<div class="table-responsive order-list">
								<table class="table" style="witdh:100%;">
								<colgroup>
                                  
                                    <col width="5%">
                                    <col width="12%">
                                    <col width="45%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="9%">
                 			   </colgroup>
                   
									<thead>
										<tr>
											<th scope="col" ></th>
											<th scope="col" class="info-img">상품 정보</th>
											<th scope="col" class="info-caption">&nbsp;</th>
											
											<th scope="col" class="payment">상품 금액</th>
											<th scope="col" class="sale">할인 금액</th>
											<th scope="col" class="delivery">배송비</th>
											<th scope="col" class="delete">삭제</th>
										</tr>
									</thead>
							<tbody>
										
										<c:if test="${!empty cartList}">
										
										<c:forEach var="cartList" items="${cartList}" varStatus="stat">
																			
										<tr>
											<td>
											<c:if test="${!empty sessionScope.MEMBER_ID}">
											<input type="checkbox" id="checkbox${stat.index}" name="GOODS_KIND_NUMBER" value="${cartList.GOODS_KIND_NUMBER}" onclick="javascript:checkedRows(${stat.index});">
																																	
											</c:if>
											<c:if test="${empty sessionScope.MEMBER_ID}">
											<input type="checkbox" id="checkbox${stat.index}" name="GOODS_KIND_NUMBER" value="${cartList.GOODS_KIND_NUMBER},${cartList.CART_AMOUNT}" onclick="javascript:checkedRows(${stat.index});">
											</c:if>
											</td>
											<td class="info-img"><a href="/MODA/goodsDetail?GOODS_NUMBER=${cartList.GOODS_NUMBER }"><img
													img_layer="/MODA/file/goodsFile/${cartList.GOODS_THUMBNAIL}"
													goodsno="${cartList.GOODS_NUMBER }"
													src="/MODA/file/goodsFile/${cartList.GOODS_THUMBNAIL}"
													width="167" class="img-responsive"></a></td>
											<td class="info-caption"><strong class="brand">MODA</strong>
												<em class="name">${cartList.GOODS_NAME}/${cartList.GOODS_KIND_NUMBER}</em>
												<div class="option">
													<em>색상:${cartList.GOODS_COLOR} / 사이즈:${cartList.GOODS_SIZE} / ${cartList.CART_AMOUNT}개</em> <!-- <em>사이즈:XS / 1개</em> -->
													<c:choose>
													<c:when test="${!empty sessionScope.MEMBER_ID}">
													<a
														href="cart/cartOptionForm?CART_NUMBER=${cartList.CART_NUMBER }&CART_AMOUNT=${cartList.CART_AMOUNT}"
														class="button button-dimmed" target="modal" data-size="sm"
														data-label="선택사항 추가/변경"> <span class="button-label">수량변경</span>
													</a>
													</c:when>
													<c:otherwise>
													<a
														href="cart/cartOptionForm?GOODS_KIND_NUMBER=${cartList.GOODS_KIND_NUMBER }&CART_AMOUNT=${cartList.CART_AMOUNT}"
														class="button button-dimmed" target="modal" data-size="sm"
														data-label="선택사항 추가/변경"> <span class="button-label">옵션변경</span>
													</a>
													</c:otherwise>
													</c:choose>
													
												</div></td>
											<!-- 쿠폰다운로드 부분은 payment페이지에서  -->
											
											<c:if test="${cartList.GOODS_DISPRICE eq cartList.GOODS_PRICE}">
												<td class="payment"><span class="price" value="${cartList.GOODS_PRICE * cartList.CART_AMOUNT}">${cartList.GOODS_PRICE * cartList.CART_AMOUNT}원</span></td>
												 <span class="disprice" value="0"></span>
												 <span class="totprice" value="${cartList.GOODS_PRICE * cartList.CART_AMOUNT}"></span>
												<c:set var="TOTALPRICE" value="${TOTALPRICE+cartList.GOODS_PRICE * cartList.CART_AMOUNT}" />
												
											</c:if>
											<c:if test="${cartList.GOODS_DISPRICE ne cartList.GOODS_PRICE}">
												<td class="payment"><span class="price" value="${cartList.GOODS_DISPRICE * cartList.CART_AMOUNT}"> <del>${cartList.GOODS_PRICE * cartList.CART_AMOUNT}원</del>
												<br/>${cartList.GOODS_DISPRICE * cartList.CART_AMOUNT}원 <span class="disprice" value="${cartList.GOODS_PRICE* cartList.CART_AMOUNT-cartList.GOODS_DISPRICE* cartList.CART_AMOUNT}"></span>
												<span class="totprice" value="${cartList.GOODS_PRICE * cartList.CART_AMOUNT}"></span>
												<c:set var="TOTALPRICE" value="${TOTALPRICE+cartList.GOODS_PRICE * cartList.CART_AMOUNT}" />
												<c:set var="TOTALDISPRICE" value="${TOTALDISPRICE+cartList.GOODS_PRICE* cartList.CART_AMOUNT-cartList.GOODS_DISPRICE* cartList.CART_AMOUNT }" />
												</span></td>
												
											</c:if>
											<td class="sale">
											<c:if test="${cartList.GOODS_DISPRICE ne cartList.GOODS_PRICE}">
											${cartList.GOODS_PRICE* cartList.CART_AMOUNT-cartList.GOODS_DISPRICE* cartList.CART_AMOUNT}원</c:if></td>
											<td class="delivery"><span>0원</span> <!-- 배송비없을때 <span>무료</span>-->
											</td>
											<td class="delete">
											<c:if test="${!empty sessionScope.MEMBER_ID}">
											<a href="/MODA/cartDelete?GOODS_KIND_NUMBER=${cartList.GOODS_KIND_NUMBER}"
												class="button button-dimmed" onClick='return confirm("정말로 장바구니를 삭제하시겠습니까?");'> <span class="button-label">삭제</span>
											</a>
											</c:if>
											<c:if test="${empty sessionScope.MEMBER_ID}">
											<a href="/MODA/cartDelete?GOODS_KIND_NUMBER=${cartList.GOODS_KIND_NUMBER}"
												class="button button-dimmed"> <span class="button-label">삭제</span>
											</a>
											</c:if>
											</td>
										</tr>
										
										</c:forEach>
										</c:if>
										
										
										<c:set var="doneLoop" value="false"/>
										<c:set var="index" value="1" /> 
										
										<%-- <c:if test="${!empty sessionScope.cartList}">
											<c:forEach var="cartSession" items="${cartList}" varStatus="stat">
										
										<tr>
											<td><input type="checkbox" name="no[]" value="${cartList.CART_NUMBER}">
											</td>
											<td class="info-img"><a href="/MODA/goodsDetail?GOODS_NUMBER=${cartList.GOODS_NUMBER }"><img
													img_layer="/MODA/file/goodsFile/${cartList.GOODS_THUMBNAIL}"
													goodsno="${cartList.GOODS_NUMBER }"
													src="/MODA/file/goodsFile/${cartList.GOODS_THUMBNAIL}"
													width="167" class="img-responsive"></a></td>
											<td class="info-caption"><strong class="brand">팬콧</strong>
												<em class="name">${cartList.GOODS_NAME}</em>
												<div class="option">
													<em>색상:${cartList.GOODS_COLOR} / 사이즈:${cartList.GOODS_SIZE} / ${cartList.CART_AMOUNT}개</em> <!-- <em>사이즈:XS / 1개</em> --> 
													<a
														href="cart/cartOptionForm?kindsNo=${cartList.GOODS_KIND_NUMBER }"
														class="button button-dimmed" target="modal" data-size="sm"
														data-label="선택사항 추가/변경"> <span class="button-label">옵션변경</span>
													</a>
												</div></td>
											<!-- 쿠폰다운로드 부분은 payment페이지에서 삭제 -->
											
											<c:if test="${cartList.GOODS_DISPRICE eq null}">
												<td class="payment"><span>${cartList.GOODS_PRICE }원</span></td>
												<c:set var="TOTALPRICE" value="${TOTALPRICE+cartList.GOODS_PRICE }" />
												
											</c:if>
											<c:if test="${cartList.GOODS_DISPRICE ne null}">
												<td class="payment"><span> <del>${cartList.GOODS_PRICE }원</del>
												<br/>${cartList.GOODS_DISPRICE }원
												<c:set var="TOTALPRICE" value="${TOTALPRICE+cartList.GOODS_PRICE }" />
												<c:set var="TOTALDISPRICE" value="${TOTALDISPRICE+cartList.GOODS_PRICE-cartList.GOODS_DISPRICE }" />
												</span></td>
											</c:if>
											<td class="sale">
											<c:if test="${cartList.GOODS_DISPRICE ne null}">
											${cartList.GOODS_PRICE-cartList.GOODS_DISPRICE}원</c:if></td>
											<td class="delivery"><span>0원</span> <!-- 배송비없을때 <span>무료</span>-->
											</td>
											<td class="delete"><a href="?mode=del&amp;no=${cartList.CART_NUMBER }"
												class="button button-dimmed"> <span class="button-label">삭제</span>
											</a></td>
										</tr>
										
										</c:forEach>
										</c:if> --%>
										
										
										
										<c:if test="${empty cartList }">
											<c:if test="${empty sessionScope.CartSession}">
												<tr>
													<td colspan="7" style="padding:30px 0;">
														장바구니에 주문하실 상품을 담아주세요<br>
													</td>
												</tr>
											</c:if>
										</c:if>	
										
									</tbody>
									
								</table>
							</div>

							

						<c:if test="${!empty cartList}">
						
							<div class="button-wrap">
								<a class="button  btn-checked-all"> <span
									class="button-label">전체 선택</span>
								</a> <a class="button  btn-unchecked-all"> <span
									class="button-label">전체 해제</span>
								</a>
								<button class="button">
									<span class="button-label">선택 삭제</span>
								</button>
								<!--
						<button class="button" onclick="location.href='cart?mode=reset'">
							<span class="button-label btn-clear-all">장바구니 비우기</span>
						</button>
						-->
							</div>
							
						</c:if>

					<c:if test="${empty cartList }">
					<c:if test="${empty sessionScope.cartKinds0}">
						<div class="button-wrap">
						<a class="button disabled btn-checked-all">
							<span class="button-label">전체 선택</span>
						</a>
						<a class="button disabled btn-unchecked-all">
							<span class="button-label">전체 해제</span>
						</a>
						<button class="button disabled">
							<span class="button-label">선택 삭제</span>
						</button>
						<!--
						<button class="button" onclick="location.href='cart?mode=reset'">
							<span class="button-label btn-clear-all">장바구니 비우기</span>
						</button>
						-->
					</div>
					</c:if>
					</c:if>
						</form>
					</div>
				
			</section>
			<!-- product-thumbnail//end -->

			<section class="sum-calculator section col-lg-6" style="margin-left : 8px; width:25%; border:1px solid #c8c8c8; padding-bottom: 10px;padding-top: 10px;">
				
					<div class="section-head left border" style="height:15px; ">
						<h3>주문 요약</h3>
					</div>
					<!-- heading-title//end -->
					<div class="section-body calculator">
						<div class="price col-sm-8 col-lg-24">
							<div class="sum">
								<em>주문 금액 합계</em> <strong id="totalPrice"><fmt:formatNumber value="${TOTALPRICE}" type="number"/>원</strong>
							</div>
							<div class="detail">
								<div class="item col-xs-12">
									<div class="item-label">
										<strong>상품 금액</strong>
									</div>
									<div>
										<em><fmt:formatNumber value="${TOTALPRICE}" type="number"/>원</em>
									</div>
								</div>
								<div class="item col-xs-12">
									<div class="item-label">
										<strong>배송비</strong>
									</div>
									<div>
										<em><c:if test="${TOTALPRICE>=30000 }">무료
											<c:set var="DELIVERY" value="0"/></c:if>
											<c:if test="${TOTALPRICE<30000 }">2,500원
											<c:set var="DELIVERY" value="2500"/></c:if>
										</em>
									</div>
								</div>
							</div>
							<!--<span class="icon"></span>-->
						</div>
						<div class="discount col-sm-8 col-lg-24">
							<div class="sum">
								<em>할인 금액 합계</em> <strong id="disCountPirce">-<fmt:formatNumber value="${TOTALDISPRICE }" type="number"/>원</strong>
							</div>
							
						</div>
						<div class="total col-sm-8 col-lg-24">
							<div class="sum">
								<em>최종 결제 금액</em> <strong id="realtotalPrice"><fmt:formatNumber value="${TOTALPRICE-TOTALDISPRICE+DELIVERY }" type="number"/>원</strong>
							</div>
							<div class="detail">
								<p>
									카드사 제휴 할인 및 제휴 포인트 사용,<br>무이자 혜택등은 결제 단계에서 적용됩니다.
								</p>
							</div>
						</div>
					</div>
					<!-- calculator//end -->
				
				<div class="button-group">
					<div class="col-xs-12 col-lg-24">
						<a href="#" onclick="cartBuy();" class="button large"> <span
							class="button-label">다음 단계</span>
						</a>
					</div>
					<div class="col-xs-12 col-lg-24">
						<a href="/MODA/main" class="button button-dimmed large"> <span
							class="button-label">쇼핑 계속</span>
						</a>
					</div>
				</div>
			</section>
			<!-- sum-calculator//end -->
			<section class="storeCatalog section collapse">
				<div class="section-head">
					<h3>장바구니 상품과 함께하면 좋은 상품</h3>
				</div>
				<!-- title//end -->
				<div class="section-body">
					<ul class="catalog">

					</ul>
				</div>
			</section>
		</div>
		<!-- order-shoppingBag//end -->

		<!-- page-action//end -->
	</div>
</div>

		<script>
function cartBuy(){
		
		var fm = document.fmCart;
		
		if($("input:checkbox[name='GOODS_KIND_NUMBER']").is(":checked") == false) {
			alert("상품을 선택해 주세요");
			return false;
		};
		
		fm.mode.value = "cart";
		fm.target = "_self";
		fm.action = "/MODA/cartOrder";
		//if (mode=="order") fm.action = "../order";
		fm.submit();
	}
</script>
<script>
$(".btn-checked-all").click(function(){
	$(".order-shoppingBag input[name='GOODS_KIND_NUMBER']").not(":checked").trigger("click");
});

$(".btn-unchecked-all").click(function(){
	$(".order-shoppingBag input[name='GOODS_KIND_NUMBER']:checked").trigger("click");
});

$("form[name=fmCart]").submit(function(){
	if (!$(".order-shoppingBag input[name='GOODS_KIND_NUMBER']").is(":checked")){
		alert("삭제하실 상품을 선택해주세요");
		return false;
	}
	return confirm("정말로 장바구니를 삭제하시겠습니까?");	
});

</script>