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




	function setOption2(obj){
		console.log("obj:"+obj)
		var totprice = 0;
		var r_optno = [];
	
	if ($(".button").attr("stock")==""){
	    alert("선택한 옵션은 품절된 상태입니다"); 
	    return;
	 } 
	
	 var optno = $("#option").val();
	 console.log("optno:"+optno);
	 if (!optno) return;
	 var li = "<li class='MK_li_1_1'><span class='MK_p-name'>" + 
	 $("#option").attr("optnm") + 
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
	 + comma($("#option").attr("price"))+"'>" + 
	 + comma($("#option").attr("price"))+
	 "원</span><a href='#' optno='" + optno + 
	 "' class='MK_btn-del'><img src='/ModuHome/images/btn_close.gif' alt='' /></a></li>";
	 
	 $("#MK_innerOpt_01").append(li);
	 console.log(li);
	 r_optno.push(optno);
	 var thisIdx = $(".input_ea").attr("value");
	 var inputEa = parseInt(thisIdx);
	 //change_ea(this,1);
	 console.log("inputEa?"+inputEa);
	 var price = parseInt($("#option").attr("price"));
	 console.log("price"+price);
	 price = price*inputEa;
	 price = parseInt(price);
	 console.log("ea*price:"+price);
	 console.log("totprice:"+totprice);
	 
	 if(totprice != 0){
	    totprice = $("#MK_txt-won").data("price");
	 }
	 totprice = totprice + price;
	 console.log("totprice:"+totprice);
	 $("#MK_txt-won").data("price",totprice);
	 $("#MK_txt-won").html(comma(totprice)+"원");
	}


//상품옵션 삭제
$("#MK_innerOpt_01").on("click", "li a.MK_btn-del", function(){
 console.log("삭제시도");
 var ritem = $(this).attr("optno");
 console.log("삭제시도"+ritem);
 var thisIdx = $(".MK_btn-del").index(this); 
 console.log("음"+thisIdx);
 var price = $(".MK_price").eq(thisIdx).data("price");
 console.log("zz"+price);
 var totprice = $("#MK_txt-won").data("price");
 totprice = totprice - price;
 $("#MK_txt-won").data("price",totprice);
 $("#MK_txt-won").html(comma(totprice)+"원");
 r_optno = $.grep(r_optno,function(v){ return v != ritem; });
 $(".MK_li_1_1").eq(thisIdx).remove();
});
 
 
 
//수량증가
$("#MK_innerOpt_01").on("click", "li a.MK_btn-up", function(e) {
 var thisIdx = $(".MK_btn-up").index(this);    
 change_ea(this,1); 
 var inputEa = parseInt($(".input_ea").eq(thisIdx).val());
 var mStock = parseInt($(".mstock").eq(thisIdx).val()); 
 var price = parseInt($("option:selected",$('#option')).attr("price"));
 $(".MK_price").eq(thisIdx).data("price",(price*inputEa));
 var total = $(".MK_price").eq(thisIdx).html(comma(price*inputEa)+"원");
 console.log("total"+total);
 var totprice = $("#MK_txt-won").data("price");
 console.log(totprice);
 totprice = totprice + price;
 $("#MK_txt-won").data("price",totprice);
 $("#MK_txt-won").html(comma(totprice)+"원");


 // 재고 수량 이상 주문 체크
 if(inputEa >= mStock) {
    alert(mStock+"개 이상 주문하실 수 없습니다.");
    change_ea(this,-1);
      inputEa = parseInt($(".input_ea").eq(thisIdx).val());
      var total = $(".MK_price").eq(thisIdx).html(comma(price*inputEa)+"원");
 
      
    return false ;
 } 
});

//상품 옵션 div 클래스
$("#MK_innerOpt_01").on("keyup", "li input.input_ea", function(e){
 var thisIdx = $(".input_ea").index(this); 
 var mStock = parseInt($(".mstock").eq(thisIdx).val()); 
 var price = parseInt($("option:selected",$('#option')).attr("price"));
 var totprice = $("#MK_txt-won").data("price");

 
 $(this).val($(this).val().replace(/[^0-9]/g,""));

 if($(this).val() == "" || parseInt($(this).val()) <= 0) {
    $(this).val("1");
    return false ;
 }

 if(parseInt($(this).val()) > mStock) {
    alert(mStock+"개 이상 주문하실 수 없습니다.");
    $(this).val(mStock);
    var total = $(".MK_price").eq(thisIdx).html(comma(price*parseInt($(this).val()))+"원");

    return false ;
 } else{
      var total = $(".MK_price").eq(thisIdx).html(comma(price*parseInt($(this).val()))+"원");
      totprice = totprice + (price*(parseInt($(this).val())-1));
      $("#MK_txt-won").html(comma(totprice)+"원");
  }
});


//수량 감소
$("#MK_innerOpt_01").on("click", "li a.MK_btn-dw", function(e) {
 var thisIdx = $(".MK_btn-dw").index(this); 
 var inputEa = parseInt($(".input_ea").eq(thisIdx).val());
 
 if(inputEa == 1){
    alert("1개 이상 주문하셔야 합니다.");
    $(".input_ea").eq(thisIdx).val() == 1;   
    return false;
 } 
  change_ea(this,-1); 
  inputEa = parseInt($(".input_ea").eq(thisIdx).val());
  var price = parseInt($("option:selected",$('#option')).attr("price"));
  $(".MK_price").eq(thisIdx).data("price",(price*inputEa));
  var total = $(".MK_price").eq(thisIdx).html(comma(price*inputEa)+"원");
  var totprice = $("#MK_txt-won").data("price");
  totprice = totprice - price;
  $("#MK_txt-won").data("price",totprice);
  $("#MK_txt-won").html(comma(totprice)+"원");
 return false ;
}); 


</script>

<style type="text/css"> 

/* .option-item-group .option-item{display:inline-block;border:1px solid #b8b8b8;padding:5px 10px 5px 8px;margin-right:5px;cursor:pointer;margin-bottom:5px}
.furniture-view-option .option-item-group .slash{background:url("//cdn.ggumim.co.kr/resource/icons/bg_slash.png");background-size:100% 100%;border:1px solid #d9dadb}
.furniture-view-option .option-item-group .is_selected{display:inline-block;border:1px solid black;padding:5px 10px 5px 8px;margin-right:5px;background-color:black;color:white}
.furniture-view-option select{border:1px solid black;margin-bottom:10px;width:150px;padding:10px;border-radius:0}
 */
#option {
   background-color: white;
    color: black;
    border: 1px solid e7e7e7;
        padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
</style>

<title>Insert title here</title>
</head>
<body>

<form name="fmOrder">
<input type="hidden" name="goodsno" value="${goodsBasic.GOODS_NUMBER }">
<div>


<!-- 상품정보 -->
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
	<table>
	<tr>
	<th>
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
	</th>
	</tr>
	<tr>
	<th>
  
  
 <div>상품옵션</div>
   <c:forEach var="goodsDetail" items="${goodsDetail}" varStatus="stat">
                     <c:if test="${goodsDetail.GOODS_AMOUNT ne 0}">
                     <c:if test="${goodsBasic.GOODS_DISPRICE ne goodsBasic.GOODS_PRICE }">
                  
                  <input type="button" id="option" onclick="setOption2(this);" 
                  value="${goodsDetail.GOODS_OPTION1}"  
                  optnm="${goodsDetail.GOODS_OPTION2 }"
                     stock="${goodsDetail.GOODS_AMOUNT }"
                     price="${goodsBasic.GOODS_DISPRICE }"
                     kinds="${goodsDetail.GOODS_KIND_NUMBER }">
                     
              
                     
                  <c:if test="${goodsBasic.GOODS_DISPRICE eq goodsBasic.GOODS_PRICE }">
                     
                  </c:if>
                     
                      <c:if test="${goodsDetail.GOODS_AMOUNT eq 0}">
 </c:if>
 </c:if>
 </c:if>
 </c:forEach>
</th>
</tr>
</table>
</div>
<div>
 <ul class="MK_inner-opt-cm" id="MK_innerOpt_01"></ul>
</div>
<div>
 <h1><a href="javascript:_exec('buy');" class="buy">구매하기</a></h1>
 <h1><a href="javascript:_exec('cart');" class="cart">장바구나 추가</a></h1>

</div>
<div>
<h2>제품설명</h2></div>
<div>

<c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="2">
      <img  src="/ModuHome/images/goods/${goodsImage.IMAGE}" width="600"><br>
</c:forEach>

</div>
</form>
</body>
</html>