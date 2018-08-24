<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
session.setAttribute("MEMBER_ID", "test34");

%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/ModuHome/dist/jquery/jquery-1.11.0.min.js"></script>
<script src="/ModuHome/dist/jquery/jquery-ui.js"></script>
<script src="/ModuHome/dist/jquery/jquery-migrate-1.2.1.min.js"></script>
<script>
var sum = 0;
var disSum= 0;
var totSum = 0;
//주문요약 금액계산
function checkedRows(index){
	    var index = index;
	    var tagName = "#checkbox"+index;
	    var price = $(".price").eq(index).attr("value"); //상품 가격
	    var disprice = $(".disprice").eq(index).html(); //할인 금액
	    var totprice = $(".totalprice").eq(index).attr("value"); //상품 합계가격
	    
	    price = parseInt(price, 10);
	    disprice = parseInt(disprice, 10);
	    totprice = parseInt(totprice, 10);
      		if($(tagName).is(":checked")){
      			   sum = sum + price; 
      			   disSum = disSum + disprice;	//할인 금액합계
      			   totSum = totSum + totprice;  //최종 결제 금액
      	   
      			if(totSum < 30000){
      				 delfee= 2500;
      				 $("#delfee").html(comma(delfee));
      			   } else {
      				 delfee= 0;
      				$("#delfee").html(comma(delfee));
      			   } 
      			   
	        	   $("#realtotalPrice").html(comma(totSum));
	        	   $("#disCountPirce").html(comma(disSum));
	        	   $("#totalPrice").html(comma(sum));
	        	}else{
	        	    sum = sum-price;
	        	    disSum = disSum - disprice;
	        	    totSum = totSum - totprice;
	        		$("#realtotalPrice").html(comma(totSum));
	        		$("#disCountPirce").html(comma(disSum));
	        		$("#totalPrice").html(comma(sum));
	        		
	        		if(totSum >= 30000 || totSum == 0){
	        			 delfee= 0;
	       				$("#delfee").html(comma(delfee));
	        		} else {
	        			delfee= 2500;
	      				 $("#delfee").html(comma(delfee));
	        		}
	        }
	};
</script>
</head>
<body>
<div class="order-shoppingBag row" >
<section class="product-thumbnail section col-lg-18" >
	
		<div class="section-head left border">
			<h3>쇼핑백에 담긴 상품</h3>
		</div>
		<div class="section-body">
			<form name="fmCart" action="/ModuHome/cart/cartDelete">
				<input type="hidden" name="mode" value="del">
				<div class="table-responsive order-list">
					<table class="table">
				<%-- 	<colgroup>
                            <col width="5%">
                            <col width="12%">
                            <col width="35%">
                            <col width="40%">
                            <col width="12%">
                            <col width="5%">
                            <col width="5%">
         			   </colgroup> --%>
	<thead>
		<tr>
			<th scope="col" ></th>
			<th scope="col" class="info-img">상품 정보</th>
			<th scope="col" class="info-caption">&nbsp;</th>
			<th scope="col" class="payment">상품 가격</th>
			<th scope="col" class="sale">할인 금액</th>
			<th scope="col" class="delivery">배송비</th>
			<th scope="col" class="delivery">합계</th>
			<th scope="col" class="delete">비고</th>
		</tr>
	</thead>
	<tbody>
			<c:if test="${!empty cartList}">
			<c:forEach var="cartList" items="${cartList}" varStatus="stat">
			<tr>
			<td>
			&nbsp;&nbsp;<c:if test="${!empty sessionScope.MEMBER_ID}">
			<input type="checkbox" id="checkbox${stat.index}" name="GOODS_KIND_NUMBER" value="${cartList.GOODS_KIND_NUMBER}" onclick="javascript:checkedRows(${stat.index});">
																									
			</c:if>
			&nbsp;&nbsp;<c:if test="${empty sessionScope.MEMBER_ID}">
			<input type="checkbox" id="checkbox${stat.index}" name="GOODS_KIND_NUMBER" value="${cartList.GOODS_KIND_NUMBER},${cartList.CART_AMOUNT}" onclick="javascript:checkedRows(${stat.index});">
			</c:if>
			</td>
			<td class="info-img">
			<a href="/ModuHome/goodsDetail?GOODS_NUMBER=${cartList.GOODS_NUMBER }">
			<img img_layer="/ModuHome/images/goods/${cartList.GOODS_THUMBNAIL}" goodsno="${cartList.GOODS_NUMBER }"
					src="/ModuHome/images/goods/${cartList.GOODS_THUMBNAIL}"
					width="167" class="img-responsive"></a></td>
			<td class="info-caption">
				<em class="name">${cartList.GOODS_NAME}/${cartList.GOODS_KIND_NUMBER}</em>
				<div class="option">
				
			<%-- <c:choose>
			<c:when test="${!empty sessionScope.MEMBER_ID}"> --%>
				<%-- 	<a
						href="cart/cartOptionForm?CART_NUMBER=${cartList.CART_NUMBER }&CART_AMOUNT=${cartList.CART_AMOUNT}"
						class="button button-dimmed" target="modal" data-size="sm"
						data-label="선택사항 추가/변경"> <span class="button-label">수량변경</span>
					</a> --%>
					
			<!-- 옵션박스 -->
			
			<div class="optionbox col-xs-24">
				<ul id="optionbox">
					<li id="oplist">
						<b>${cartList.GOODS_OPTION1} / ${cartList.GOODS_OPTION2}</b>
						<input type="hidden" name="cart" value="${cartList.CART_NUMBER }">
						<input type="hidden" name="kinds" value="${cartList.GOODS_KIND_NUMBER }">
						<input type="hidden" class="mstock" value="${cartList.GOODS_AMOUNT }">
						<input type="text" name="ea" value="${cartList.CART_AMOUNT }" class="input_ea${stat.index}" size="2">
						
						<span class="ea">
							<a class="btn-ea-up${stat.index}" onclick="javascript:eaUpDown(${stat.index});">
								<img src="/MODA/theme/pshp/img/btn_num_up.gif" alt="">
							</a>
							<a class="btn-ea-dn${stat.index}" onclick="javascript:eaUpDown(${stat.index});">
								<img src="/MODA/theme/pshp/img/btn_num_down.gif" alt="">
							</a>
						</span>
					</li>
				</ul>
				<!-- <div id="totprice"></div> -->
			</div>
		<%-- 	</c:when>
			<c:otherwise>
			<a
				href="cart/cartOptionForm?GOODS_KIND_NUMBER=${cartList.GOODS_KIND_NUMBER }&CART_AMOUNT=${cartList.CART_AMOUNT}"
				class="button button-dimmed" target="modal" data-size="sm"
				data-label="선택사항 추가/변경"> <span class="button-label">옵션변경</span>
			</a>
			</c:otherwise>
			</c:choose> --%>
			</div></td>
			
			<!-- 상품가격 -->
			<!-- 기본 가격 -->
			<c:if test="${cartList.GOODS_DISPRICE eq cartList.GOODS_PRICE}">
			<td class="payment">
			<span class="price" id="priceid" value="${cartList.GOODS_PRICE}">${cartList.GOODS_PRICE * cartList.CART_AMOUNT}</span>원</td>
			<c:set var="TOTALPRICE" value="${cartList.GOODS_PRICE * cartList.CART_AMOUNT}" />
			<span class="totalprice" value="${TOTALPRICE}"></span>
			</c:if>
			
			<!-- 할인 가격 -->
			<c:if test="${cartList.GOODS_DISPRICE ne cartList.GOODS_PRICE}">
			<td class="payment">
			<del>${cartList.GOODS_PRICE * cartList.CART_AMOUNT}원</del>
			<br/>
			<span  class="price" id="priceid" value="${cartList.GOODS_DISPRICE}">${cartList.GOODS_DISPRICE * cartList.CART_AMOUNT}</span>원
			<c:set var="TOTALPRICE" value="${cartList.GOODS_DISPRICE* cartList.CART_AMOUNT}" />
			<span class="totalprice" value="${TOTALPRICE}"></span>
			</td> 
			</c:if>
			
			<c:if test="${TOTALPRICE >= 30000 }">
			<c:set var="DELIVERYFEE" value="0"/>
			</c:if>
			<c:if test="${TOTALPRICE < 30000 }">
			<c:set var="DELIVERYFEE" value="2500"/>
			</c:if> 
			<!-- 할인금액 -->
			<c:if test="${cartList.GOODS_DISPRICE ne cartList.GOODS_PRICE}">
	 		<td>
	 		<span class="disprice" id="disprice" value="${cartList.GOODS_PRICE-cartList.GOODS_DISPRICE}">
			${cartList.GOODS_PRICE* cartList.CART_AMOUNT-cartList.GOODS_DISPRICE* cartList.CART_AMOUNT}
	 		</span>
			원</td> 
			</c:if>
			
			<!--배송비  -->
			<td class="delivery"><span>${DELIVERYFEE}원</span> 
			</td> 
			
			<!-- 합계 -->
			<td><div id="pricesum">
			${TOTALPRICE+DELIVERYFEE}
			</div>
			원
			</td>
			
			<!-- 삭제버튼 -->
			<td class="delete">
			<c:if test="${!empty sessionScope.MEMBER_ID}">
			<a href="/ModuHome/cart/cartDelete?GOODS_KIND_NUMBER=${cartList.GOODS_KIND_NUMBER}"
				class="button button-dimmed" onClick='return confirm("정말로 장바구니를 삭제하시겠습니까?");'> <span class="button-label">삭제</span>
			</a>
			</c:if>
			<c:if test="${empty sessionScope.MEMBER_ID}">
			<a href="/ModuHome/cart/cartDelete?GOODS_KIND_NUMBER=${cartList.GOODS_KIND_NUMBER}"
				class="button button-dimmed"> <span class="button-label">삭제</span>
			</a>
			</c:if>
			</td> 
		</tr>
		
		</c:forEach>
		</c:if>
		
		<c:set var="doneLoop" value="false"/>
		<c:set var="index" value="1" /> 
		
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
<button class="button" id="btn-checked-all">
<span class="button-label">전체 선택</span>
</button>
<button class="button" id="btn-unchecked-all"> <span
		class="button-label">전체 해제</span>
</button>
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
<button class="button" id="btn-checked-all">
	<span class="button-label">전체 선택</span>
	</button>
	<button class="button" id="btn-unchecked-all"> <span
			class="button-label">전체 해제</span>
	</button>
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

<section class="sum-calculator section col-lg-6" style="border:1px solid #c8c8c8;" >

<div class="section-head left border">

</div>
<!-- heading-title//end -->
<div class="section-body calculator">
	<div class="price col-sm-8 col-lg-24">
		<div class="sum">
			주문금액<strong id="totalPrice"><%-- <fmt:formatNumber value="${TOTALPRICE}" type="number"/> --%>0</strong>원
</div>
<div class="detail">
	<div class="item col-xs-12">

	</div>
	<div class="item col-xs-12">
		
	</div>
</div>
<!--<span class="icon"></span>-->
</div>
<div class="discount col-sm-8 col-lg-24">
	<div class="sum">
		- 할인 금액 <strong id="disCountPirce"><%-- <fmt:formatNumber value="${TOTALDISPRICE }" type="number"/> --%>0</strong>원
	</div>
	<div class="sum">
		총 금액 합계<strong id="realtotalPrice">0</strong>원
		</div>
		
	</div>
</div>
<div class="total col-sm-8 col-lg-24">
	<div class="item-label">
					배송비<strong id="delfee">
					0</strong>원
				</div>
	</div>
</div> 
<!-- calculator//end -->

<div class="button-group">
	<div class="col-xs-12 col-lg-24">
		<a href="#" onclick="cartBuy();" class="button large"> <span
					class="button-label">구매하기</span>
				</a>
			</div>
			<div class="col-xs-12 col-lg-24">
				<a href="/ModuHome/goods" class="button button-dimmed large"> <span
					class="button-label">쇼핑 계속</span>
				</a>
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
		fm.action = "/ModuHome/cart/cartOrder";
		//if (mode=="order") fm.action = "../order";
		fm.submit();
	}
</script>
<script>
$(document).ready(function(){
$("#btn-checked-all").click(function(){
	$(".order-shoppingBag input[name='GOODS_KIND_NUMBER']").not(":checked").trigger("click");
	return false;
});

$("#btn-unchecked-all").click(function(){
	$(".order-shoppingBag input[name='GOODS_KIND_NUMBER']:checked").trigger("click");
	return false;
});

$("form[name=fmCart]").submit(function(){
	if (!$(".order-shoppingBag input[name='GOODS_KIND_NUMBER']").is(":checked")){
		alert("삭제하실 상품을 선택해주세요");
		return false;
	}
	return confirm("정말로 상품을 삭제하시겠습니까?");	
});
});

</script>
<!-- <script>
function ajaxEaChange(){
	var 
	
	$.ajax({
		url: "ModuHome/cartModify",
		type: "post",
		data: {"CART_NUMBER": , "CART_AMOUNT":},
		success:function(data){
			$("").html(data);
		}
	
	})
	
}
</script> -->
<script>
//콤마 추가
function comma(num){
    var len, point, str; 
       
    num = num + ""; 
    point = num.length % 3 ;
    len = num.length; 
   
    str = num.substring(0, point); 
    while (point < len) { 
        if (str != "") str += ","; 
        str += num.substring(point, point + 3); 
        point += 3; 
    } 
    return str;
 
} 
//콤마 삭제
function rm_comma(num){
   var number = num + "";
   return number.replace(",","");
}
function change_ea(obj,idx){
	var ea = parseInt($("input.input_ea",$(obj).parent().parent()).val(), 10) + idx;
	if (ea<1){ alert("1개 이상을 주문하셔야 합니다"); return; }
	$("input.input_ea",$(obj).parent().parent()).val(ea);	
}

function eaUpDown(index){
var index = index;
console.log("index:"+index);
//수량 증가
//$("#optionbox").on("click", ".btn-ea-up", function(e) {
$(document).ready(function(e) {
	var eaup = ".input_ea"+index;
	var ea = parseInt($(eaup).val());
	console.log("ea:"+ea);
    //change_ea(this,1); 
    change_ea(ea,1); 
    var inputEa = parseInt($(".input_ea").eq(index).val(), 10);
    console.log('inputEa:' +inputEa);
    
    var mStock = parseInt($(".mstock").eq(index).val(), 10); 
    console.log('mStock(상품 총수량):' +mStock);
    
    var price = parseInt($("#priceid").eq(index).attr("value"), 10); //상품 단가
    console.log("price상품 단가:"+price);
    
    var disprice = parseInt(rm_comma($("#disprice").eq(index).attr("value")), 10); //할인금액
    console.log("disprice할인금액:"+disprice);
    
    var total = parseInt(rm_comma($("#pricesum").eq(index).html()), 10); //합계
    console.log("total:"+total);
    
    total = price + total;
    console.log("total합계:"+total);
    
    $("#disprice").html(comma(inputEa*disprice)); //할인금액
    $("#priceid").html(comma(inputEa*price)); //상품 가격
    $("#pricesum").html(comma(total)); //합계

    // 재고 수량 이상 주문 체크
    if(inputEa > mStock) {
       alert(mStock+"개 이상 주문하실 수 없습니다.");
       change_ea(this,-1);
       inputEa = parseInt($(".input_ea").val(), 10);
       console.log("inputEa:"+inputEa);
       var total = $(".price").html(comma(price*inputEa)+"원"); 
       return false ;
    } 
});

$("#optionbox").on("keyup", "li input.input_ea", function(e){
	var mStock = parseInt($(".mstock").val());  
	var price = parseInt($('#price').attr("price2"));
    
    $(this).val($(this).val().replace(/[^0-9]/g,""));

    if($(this).val() == "" || parseInt($(this).val()) <= 0) {
       $(this).val("1");
       return false ;   
    }

    if(parseInt($(this).val()) > mStock) {
       alert(mStock+"개 이상 주문하실 수 없습니다.");
       $(this).val(mStock);
       var total = $("#price").html(comma(price*parseInt($(this).val())));
       return false ;
    }
    else{
       var total = $("#price").html(comma(price*parseInt($(this).val())));
    }
 });

//수량감소
$("#optionbox").on("click", "li a.btn-ea-dn", function(e) {
	   change_ea(this,-1); 
	    var inputEa = parseInt($(".input_ea").val());
	    console.log('inputEa:' +inputEa);
	    var mStock = parseInt($(".mstock").val()); 
	    console.log('mStock(상품 총수량):' +mStock);
	    
	    var price = parseInt($("#priceid").attr("value"), 10); //상품 단가
	    console.log("price상품 단가:"+price);
	    
	    var disprice = parseInt(rm_comma($("#disprice").attr("value")), 10); //할인금액
	    console.log("disprice할인금액:"+disprice);
	    
	    var total = parseInt(rm_comma($("#pricesum").html()), 10); //합계
	    console.log("total:"+total);
	    
	    total = total - price;
	    console.log("total합계:"+total);
	    
	    $("#disprice").html(comma(inputEa*disprice)); 
	    $("#priceid").html(comma(inputEa*price)); 
	    $("#pricesum").html(comma(total)); 
	});
	
}
</script>
</body>
</html>