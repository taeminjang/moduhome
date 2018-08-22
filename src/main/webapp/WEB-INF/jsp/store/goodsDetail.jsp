<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/ModuHome/dist/jquery/jquery-1.11.0.min.js"></script>
<script src="/ModuHome/dist/jquery/jquery-ui.js"></script>
<script src="/ModuHome/dist/jquery/jquery-migrate-1.2.1.min.js"></script>


<script>
function _exec(mode){
 
 if(mode == 'restock'){

    document.location.href="./restock";

 }
 else if (mode=="buy"){
    if (document.getElementsByName("optno[]").length==0){ alert("옵션을 선택해주세요"); return; }
    
    var fm = document.fmOrder;
    fm.mode.value = mode;
    fm.target = "_self";
    fm.action = "/ModuHome/order";
    //if (mode=="order") fm.action = "../order";
    fm.submit();
 }
 else if (mode!="wishlist"){
    if (document.getElementsByName("optno[]").length==0){ alert("옵션을 선택해주세요"); return; }

    var fm = document.fmOrder;
    fm.mode.value = mode;
    fm.target = "_self";
    fm.action = "/ModuHome/cart/cartIn";
    //if (mode=="wishlist") fm.action = "../mypage/wishlist";
    fm.submit();
 }
}

</script>

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
//수량 변경 
function change_ea(obj,idx){
	var ea = parseInt($("input.input_ea",$(obj).parent().parent()).val(), 10) + idx;
	if (ea<1){ alert("1개 이상을 주문하셔야 합니다"); return; }
	$("input.input_ea",$(obj).parent().parent()).val(ea);	
}

function chkSoldout(obj){ 
	 if (obj.options[obj.selectedIndex].stock=="0"){
	    alert("선택한 항목은 품절된 옵션입니다"); 
	    obj.selectedIndex = 0;
	    return false;
	 }
	 return true;
	}

	function setOption2(obj){
		$(document).ready(function(){

		var totprice = 0;
		var r_optno = [];
		 if ($("#option option:selected").attr("disabled")=="disabled"){
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
	 console.log("optno:"+optno);
	 if (!optno) return;
	 
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
	  
	  var li = "<li class='MK_li_1_1'><span class='MK_p-name'>" + 
		 $("#option option:selected").attr("value") + 
		 "</span><input type='hidden' name='optno[]' value='" + optno + 
		 "'><input type='hidden' name='kinds[]' value='" + 
		 $("option:selected",$(obj)).attr("kinds") + 
		 "'><input type='hidden' class='mstock' value='" + 
		 $("option:selected",$(obj)).attr("stock") + 
		 "'><div class='MK_qty-ctrl' style='height:50px'>"+
		 "<input type='text' name='ea[]' value='1' class='input_ea' size='2' maxlength='3'>"+
		 "<span class='ea'><a class='MK_btn-up'><img src='/ModuHome/images/btn_num_up.gif' alt='' />"+
		 "</a><a class='MK_btn-dw'><img src='/ModuHome/images/btn_num_down.gif' alt='' />"+
		 "</a></span></div><span class='MK_price' data-price='"
		 + $("option:selected",$(obj)).attr("price")+"'>"+ comma($("option:selected",$(obj)).attr("price")) +
		 "원</span><a href='#' optno='" + optno +"' class='MK_btn-del'><img src='/ModuHome/images/btn_close.gif' alt='' /></a></li>";
		 
	 $("#MK_innerOpt_01").append(li);
	 console.log("태그내용확인:"+$("#MK_innerOpt_01").html());
	 
	 r_optno.push(optno);
	 var thisIdx = $(".input_ea").attr("value");
	 var inputEa = parseInt(thisIdx, 10);
	 change_ea(this,1);
	 console.log("inputEa?"+inputEa);
	 var price = parseInt(rm_comma($("option:selected",$('#option')).attr("price")), 10);
	 price = price*inputEa;
	 price = parseInt(price, 10);
	 
	 totprice = parseInt(rm_comma($("#MK_txt-won").html()), 10);

	 if(totprice != 0){
		 console.log("totprice가 0이 아닐경우")
	    totprice = parseInt(rm_comma($("#MK_txt-won").data("price")), 10);
	 } 
	 totprice = totprice + price;
	 $("#MK_txt-won").data("price",totprice);
	 $("#MK_txt-won").html(comma(totprice)+"원");
	 
	});
	}

//상품옵션 삭제
$(document).ready(function(){
var r_optno = $("#option").val();
$("#MK_innerOpt_01").on("click", ".MK_btn-del", function(){
 var ritem = $(this).attr("optno");
 var thisIdx = $(".MK_btn-del").index(this); 
 var price = parseInt($(".MK_price").eq(thisIdx).data("price"), 10);
 var totprice = parseInt($("#MK_txt-won").data("price"), 10);
totprice = parseInt(totprice - price);
 $("#MK_txt-won").data("price",totprice);
 $("#MK_txt-won").html(comma(totprice)+"원");
 //배열에서 function 필터에 만족하는 값을 찾는다.
 r_optno = $.grep(r_optno,function(v){ return v != ritem; });
 $(".MK_li_1_1").eq(thisIdx).remove();
});
});
 
//수량증가
$(document).ready(function(){
$("#MK_innerOpt_01").on("click", "li a.MK_btn-up", function(e) {
 var thisIdx = parseInt($(".MK_btn-up").index(this), 10);
 change_ea(this,1); 
 var inputEa = parseInt($(".input_ea").eq(thisIdx).val(), 10);
 var mStock = parseInt($(".mstock").eq(thisIdx).val(), 10);
 var price = parseInt($("option:selected",$('#option')).attr("price"), 10);
 
 $(".MK_price").eq(thisIdx).data("price",(price*inputEa));
 var total = $(".MK_price").eq(thisIdx).html(comma(price*inputEa)+"원");
 var totprice = parseInt($("#MK_txt-won").data("price"), 10);
 totprice = totprice + price;
 
 $("#MK_txt-won").data("price",totprice);
 $("#MK_txt-won").html(comma(totprice)+"원");
 
 // 재고 수량 이상 주문 체크
 if(inputEa >= mStock) {
     alert(mStock+"개 이상 주문하실 수 없습니다.");
     change_ea(this,-1);
       inputEa = parseInt($(".input_ea").eq(thisIdx).val(), 10);
       var total = $(".MK_price").eq(thisIdx).html(comma(price*inputEa)+"원");
  
       
     return false ;
  } 

});

//수량 감소
//$(document).ready(function(){
$("#MK_innerOpt_01").on("click", "li a.MK_btn-dw", function(e) {
 var thisIdx = $(".MK_btn-dw").index(this); 
 var inputEa = parseInt($(".input_ea").eq(thisIdx).val(), 10);
 
 if(inputEa == 1){
    alert("1개 이상 주문하셔야 합니다.");
    $(".input_ea").eq(thisIdx).val() == 1;   
    return false;
 } 
  change_ea(this,-1); 
  inputEa = parseInt($(".input_ea").eq(thisIdx).val(), 10);
  //var price = parseInt($(".MK_price").data("price"), 10);
  var price = parseInt($("option:selected",$('#option')).attr("price"), 10);
  $(".MK_price").eq(thisIdx).data("price",(price*inputEa));
  var total = $(".MK_price").eq(thisIdx).html(comma(price*inputEa)+"원");
  var totprice = parseInt($("#MK_txt-won").data("price"), 10);
  totprice = totprice - price;
  $("#MK_txt-won").data("price",totprice);
  $("#MK_txt-won").html(comma(totprice)+"원");
 return false ;
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


<title>Insert title here</title>
</head>
<body>
<form name="fmOrder">
<section>
<input type="hidden" name="mode"> 
<input type="hidden" name="goodsno" value="${goodsBasic.GOODS_NUMBER }">
<input type="hidden" name="MEMBER_NUMBER" value="71">


<!-- 상품정보 -->
<div>
     <ul class="multi_image">
     <c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="0" end="1">
     <li>
     <img class="detail_image" id="lens_img" src="/ModuHome/images/goods/${goodsImage.IMAGE}" border="0" width="300" onerror="this.src='/ModuHome/images/noimg_130.gif'">   
     </li>
     </c:forEach>
     </ul>  
</div>     
  
<div>
	상품명 :<h2>${goodsBasic.GOODS_NAME}</h2>
</div>
<div>
	판매가격: <c:if test="${goodsBasic.GOODS_PRICE eq goodsBasic.GOODS_DISPRICE}">
	               
	                  <fmt:formatNumber value="${goodsBasic.GOODS_PRICE}" type="number" />원
	                  
	               </c:if>
	<c:if test="${goodsBasic.GOODS_PRICE ne goodsBasic.GOODS_DISPRICE}">
	                  
	                  <strike style="">
	                  <fmt:formatNumber value="${goodsBasic.GOODS_PRICE}" type="number" />원
	                  </strike>
	                  &nbsp;
	                  <span class="item_prc">
	                  <fmt:formatNumber value="${goodsBasic.GOODS_DISPRICE}" type="number" />원
	                  </span>&nbsp;
	                  <font color="red">(<span id="discount_percent_span" style="font-color:red"><fmt:formatNumber value="${(goodsBasic.GOODS_PRICE - goodsBasic.GOODS_DISPRICE)*100 / goodsBasic.GOODS_PRICE}" type="number" /></span>%할인)</font>
	                  
	               </c:if>
  
  
 <div>상품옵션</div>
  <select id="option" onchange="setOption2(this)" style="width:225px">
                     <option value="">-옵션 선택-</option>
   <c:forEach var="goodsDetail" items="${goodsDetail}" varStatus="stat">
                     <c:if test="${goodsDetail.GOODS_AMOUNT > 0}">
                     <c:if test="${goodsBasic.GOODS_DISPRICE ne goodsBasic.GOODS_PRICE }">
         <%-- <input type="button" id="option" onclick="setOption2(this);" 
                  value="${goodsDetail.GOODS_OPTION1}-${goodsDetail.GOODS_OPTION2 }"  
                  data-optnm1="${goodsDetail.GOODS_OPTION1 }"
                  data-optnm2="${goodsDetail.GOODS_OPTION2 }"
                     stock="${goodsDetail.GOODS_AMOUNT }"
                     price="${goodsBasic.GOODS_DISPRICE }"
                     kinds="${goodsDetail.GOODS_KIND_NUMBER }">  --%>
                     
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
                              <span class="MK_txt-total">TOTAL</span> 
                               <span id="MK_txt-won" data-price="">0원</span>
                              </p>
                           </div>


<div>
 <h1><a href="javascript:_exec('buy');" class="buy">구매하기</a></h1>
 <h1><a href="javascript:_exec('cart');" class="cart">장바구니 담기</a></h1>
</div>
</section>
<div><h2>제품설명</h2></div>
<div>
<c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="2">
      <img  src="/ModuHome/images/goods/${goodsImage.IMAGE}" width="600"><br>
</c:forEach>
</div>
</form>
</body>
</html>