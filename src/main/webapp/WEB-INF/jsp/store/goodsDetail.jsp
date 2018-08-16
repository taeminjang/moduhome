<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
var totprice = 0;
var r_optno = [];
function setOption(obj){
 if (!chkSoldout(obj)) return;
 if ($("#option option:selected").attr("disabled")=="disabled"){
    alert("선택한 옵션은 품절된 상태입니다"); 
    $("#option").get(0).selectedIndex = 0;
    return;
 }
 var optno = $("#option option:selected").val();
 console.log(optno);
 if (!optno || in_array(optno,r_optno)) return;
 var li = "<li class='MK_li_1_1'><span class='MK_p-name'>" + $("#option option:selected").attr("optnm") + "</span><input type='hidden' name='optno[]' value='" + optno + "'><input type='hidden' name='kinds[]' value='" + $("option:selected",$(obj)).attr("kinds") + "'><input type='hidden' class='mstock' value='" + $("option:selected",$(obj)).attr("stock") + "'><div class='MK_qty-ctrl' style='height:50px'><input type='text' name='ea[]' value='1' class='input_ea' size='2' maxlength='3'><span class='ea'><a class='MK_btn-up'><img src='/MODA/theme/pshp/img/btn_num_up.gif' alt='' /></a><a class='MK_btn-dw'><img src='/MODA/theme/pshp/img/btn_num_down.gif' alt='' /></a></span></div><span class='MK_price' data-price='"+$("option:selected",$(obj)).attr("price")+"'>" + comma($("option:selected",$(obj)).attr("price")) + "원</span><a href='#' optno='" + optno + "' class='MK_btn-del'><img src='/MODA/theme/pshp/img/btn_close.gif' alt='' /></a></li>";
 $("#MK_innerOpt_01").append(li);
 r_optno.push(optno);
 var thisIdx = $(".input_ea").index(this);
 var inputEa = parseInt($(".input_ea").eq(thisIdx).val());
 change_ea(this,1);
 console.log("inputEa?"+inputEa);
 var price = parseInt($("option:selected",$('#option')).attr("price"));
 price = price*inputEa;
 price = parseInt(price);
 if(totprice != 0){
    totprice = $("#MK_txt-won").data("price");
 }
 totprice = totprice + price;
 console.log(totprice);
 $("#MK_txt-won").data("price",totprice);
 $("#MK_txt-won").html(comma(totprice)+"원");
 
 

 

}
function chkSoldout(obj){ 
 if (obj.options[obj.selectedIndex].stock=="0"){
    alert("선택한 항목은 품절된 옵션입니다"); 
    obj.selectedIndex = 0;
    return false;
 }
 return true;
}


$("#MK_innerOpt_01").on("click", "li a.MK_btn-del", function(){
 var ritem = $(this).attr("optno");
 var thisIdx = $(".MK_btn-del").index(this); 
 console.log("thisIdx"+thisIdx);
 var price = $(".MK_price").eq(thisIdx).data("price");
 console.log("price"+price);
 var totprice = $("#MK_txt-won").data("price");
 totprice = totprice - price;
 $("#MK_txt-won").data("price",totprice);
 $("#MK_txt-won").html(comma(totprice)+"원");
 
 
 r_optno = $.grep(r_optno,function(v){ return v != ritem; });
 $(".MK_li_1_1").eq(thisIdx).remove();
});

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
<title>Insert title here</title>
</head>
<body>

<form name="fmOrder">
<input type="hidden" name="goodsno" value="${goodsBasic.GOODS_NUMBER }">

goodsBasic : ${goodsBasic} <br/>
goodsImage : ${goodsImage}<br/>
goodsDetail : ${goodsDetail}
<div class="thumb">




<!-- 상품정보 -->

     <ul class="multi_image">
     <c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="0" end="1">
     <li>
     <img class="detail_image" id="lens_img" src="/ModuHome/images/goods/${goodsImage.IMAGE}" border="0" width="300" onerror="this.src='/ModuHome/images/noimg_130.gif'">   
     </li>
     </c:forEach>
     
    <%--  <c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="0" end="1">
     <li>
     <img style="float: left; width: 120px" height="120px" src="/ModuHome/images/goods/${goodsImage.IMAGE}" onmouseover="" onerror="this.src='/ModuHome/images/noimg_130.gif'">
     </li>
     </c:forEach> --%>
     </ul>  
     </div>
<div>
상품명 :<h2>${goodsBasic.GOODS_NAME}</h2>
</div>
<div>
<table>
<tr>
<th>
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
</div>
</th>
</tr>
<tr>
<th>
<div>상품옵션${goodsBasic.GOODS_NUMBER}</div>
<select>
<option>-옵션 선택</option>
  <c:forEach var="goodsDetail" items="${goodsDetail}" varStatus="stat">
                                    
                     <c:if test="${goodsDetail.GOODS_AMOUNT ne 0}">
                     <c:if test="${goodsBasic.GOODS_DISPRICE ne goodsBasic.GOODS_PRICE }">
                     <option
                     value="${goodsDetail.GOODS_OPTION1 }-${goodsDetail.GOODS_OPTION2 }"
                     optnm="${goodsDetail.GOODS_OPTION1 }-${goodsDetail.GOODS_OPTION2 }"
                     stock="${goodsDetail.GOODS_AMOUNT }"
                     price="${goodsBasic.GOODS_DISPRICE }"
                     kinds="${goodsDetail.GOODS_KIND_NUMBER }">
                     ${goodsDetail.GOODS_COLOR } - ${goodsDetail.GOODS_OPTION2 }
                     (${goodsDetail.GOODS_AMOUNT }개)</option>
                     </c:if>
                     <c:if test="${goodsBasic.GOODS_DISPRICE eq goodsBasic.GOODS_PRICE }">
                     <option
                     value="${goodsDetail.GOODS_OPTION1 }-${goodsDetail.GOODS_OPTION2 }"
                     optnm="${goodsDetail.GOODS_OPTION1 }-${goodsDetail.GOODS_OPTION2 }"
                     stock="${goodsDetail.GOODS_AMOUNT }"
                     price="${goodsBasic.GOODS_PRICE }"
                     kinds="${goodsDetail.GOODS_KIND_NUMBER }">
                     ${goodsDetail.GOODS_OPTION1 } - ${goodsDetail.GOODS_OPTION2 }
                     (${goodsDetail.GOODS_AMOUNT }개)</option>
                     </c:if>
                     </c:if>
                     <c:if test="${goodsDetail.GOODS_AMOUNT eq 0}">
                     <option
                     value="${goodsDetail.GOODS_OPTION1 }-${goodsDetail.GOODS_OPTION2 }"
                     optnm="${goodsDetail.GOODS_OPTION1 }-${goodsDetail.GOODS_OPTION2 }"
                     stock="0" price="0" disabled="disabled"
                     kinds="${goodsDetail.GOODS_KIND_NUMBER }">
                     ${goodsDetail.GOODS_OPTION1 } - ${goodsDetail.GOODS_SIZE }
                     (품절)</option>
                     </c:if>
               </c:forEach>
               </select>
</table>
</div>
<div>
 <h1><a href="javascript:_exec('buy');" class="buy">구매하기</a></h1>
 <h1><a href="javascript:_exec('cart');" class="cart">장바구나 추가</a></h1>
</div>


<div>
<h2>제품설명</h2>
<c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="2">
      <img style="margin-left:10%;" src="/ModuHome/images/goods/${goodsImage.IMAGE}" width="600"><br>
</c:forEach>

</div>

</form>

</body>
</html>