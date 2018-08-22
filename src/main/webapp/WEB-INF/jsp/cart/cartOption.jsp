<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<link rel="stylesheet" href="/MODA/css/memberDelete.css">
<div class="modal-body">
<form method="post" action="/MODA/optionModify" name="fmOrder" onsubmit="return chkOption()">
<c:if test="${!empty sessionScope.MEMBER_ID}">
<input type="hidden" name="CART_NUMBER" value="${cartOption.CART_NUMBER }">
</c:if>
<input type="hidden" name="GOODS_KIND_NUMBER" value="${cartOption.GOODS_KIND_NUMBER }">
<input type="hidden" name="GOODS_NUMBER" value="${cartOption.GOODS_NUMBER }">


<div class="modal-change-option">
	<section class="product-info box-shadow">
		<div class="section-head left">
			<h5>현재 상품 정보</h5>
			<span class="border"></span>
		</div>
		<!-- section-head//end -->
		<div class="section-body table-shell-xs">
			<div class="thumbnail col-xs-8 col-sm-6 cell">
				<img img_layer="/MODA/file/goodsFile/${cartOption.GOODS_THUMBNAIL}" goodsno="${cartOption.GOODS_NUMBER }" src="/MODA/file/goodsFile/${cartOption.GOODS_THUMBNAIL}" width="200" class="img-responsive">
			</div>
			<div class="caption col-xs-16 col-sm-18 cell">
				<strong class="brand"></strong>
				<em class="name">${cartOption.GOODS_NAME}</em>
	</section>

	<section class="product-option box-shadow">
		<div class="section-head left">
			<h5>수량을 변경하세요</h5>
			<span class="border"></span>
		</div>
		<!-- section-head//end -->
		<div class="section-body list-horizontal">
			<div class="list-item">


<!-- 옵션박스 --> 
<div class="optionbox col-xs-24">
	<ul id="optionbox">
		<li>
			<b>${cartOption.GOODS_COLOR } / ${cartOption.GOODS_SIZE }</b>
			<input type="hidden" name="cart" value="${cartOption.CART_NUMBER }">
			<input type="hidden" name="kinds" value="${cartOption.GOODS_KIND_NUMBER }">
			<input type="hidden" class="mstock" value="${cartOption.GOODS_AMOUNT }">

			<input type="text" name="ea" value="${cartOption.CART_AMOUNT }" class="input_ea" size="2">


			<span class="ea">
				<a class="btn-ea-up">
					<img src="/MODA/theme/pshp/img/btn_num_up.gif" alt="">
				</a>
				<a class="btn-ea-dn">
					<img src="/MODA/theme/pshp/img/btn_num_down.gif" alt="">
				</a>
			</span>
	
			<c:if test="${cartOption.GOODS_DISPRICE eq cartOption.GOODS_PRICE}">
			<span id="price" price2="${cartOption.GOODS_PRICE * cartOption.CART_AMOUNT}"><fmt:formatNumber value="${cartOption.GOODS_PRICE * cartOption.CART_AMOUNT}" /></span>원
			</c:if>
			<c:if test="${cartOption.GOODS_DISPRICE ne cartOption.GOODS_PRICE}">
			<span id="price" price2="${cartOption.GOODS_DISPRICE * cartOption.CART_AMOUNT}"><fmt:formatNumber value="${cartOption.GOODS_DISPRICE * cartOption.CART_AMOUNT}" /></span>원
			</c:if>
			
		</li>
	</ul>
	<div id="totprice"></div>
</div>

<script>
var totprice = 0;
var r_kinds = [15921176];

$("#optionbox").on("click", ".btn-ea-up", function(e) {
    
    change_ea(this,1); 
    var inputEa = parseInt($(".input_ea").val());
    console.log('inputEa:' +inputEa);
    var mStock = parseInt($(".mstock").val()); 
    console.log('mStock(상품 총수량):' +mStock);
    var price = parseInt($('#price').attr("price2"));
    console.log(price); 
    var total = $("#price").html(comma(price*inputEa)); 
    console.log('total :' +total); 
    


    // 재고 수량 이상 주문 체크
    if(inputEa > mStock) {
       alert(mStock+"개 이상 주문하실 수 없습니다.");
       change_ea(this,-1);
       inputEa = parseInt($(".input_ea").val());
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

$("#optionbox").on("click", "li a.btn-ea-dn", function(e) {
	  
	   change_ea(this,-1); 
	    var inputEa = parseInt($(".input_ea").val());
	    console.log('inputEa:' +inputEa);
	    var mStock = parseInt($(".mstock").val()); 
	    console.log('mStock(상품 총수량):' +mStock);
	    var price = parseInt($('#price').attr("price2"));
	    console.log(price); 
	    var total = $("#price").html(comma(price*inputEa)); 
	    console.log('total :' +total); 
	});
</script>
			</div>
		</div>
	</section>

</div>
<div class="modal-button">
	<div class="button-group">
		<button type="submit" class="button">
			<span class="button-label">확인</span>
		</button>
	</div>
</div>


</form>
</div>