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
    fm.action = "/ModuHome/cart/cartAdd";
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
<style>
.furniture-view{background-color:#fff;margin-top:58px}.furniture-view .furniture-view-container{width:800px;margin-left:auto;margin-right:auto;box-sizing:border-box;padding:50px 14px}.furniture-view .furniture-view-container .furniture-image{display:inline-block;font-size:0;vertical-align:top}.furniture-view .furniture-view-container .furniture-image .furniture-image-big{width:380px;height:380px;position:relative}.furniture-view .furniture-view-container .furniture-image .furniture-image-big img{width:380px;height:380px}.furniture-view .furniture-view-container .furniture-image .furniture-image-small{max-width:380px;padding-top:10px}.furniture-view .furniture-view-container .furniture-image .furniture-image-small .image-small-item{display:inline-block}.furniture-view .furniture-view-container .furniture-image .furniture-image-small .image-small-item img{width:70px;height:70px}.furniture-view .furniture-view-container .furniture-detail{display:inline-block;vertical-align:top;max-width:385px;padding-left:30px;padding-top:10px;box-sizing:border-box}.furniture-view .furniture-view-container .furniture-detail .furniture-brand{font-size:14px;font-weight:bold;padding-bottom:6px}.furniture-view .furniture-view-container .furniture-detail .furniture-name{font-size:24px;font-weight:900;text-transform:uppercase}.furniture-view .furniture-view-container .furniture-detail .furniture-size{font-size:14px;margin-top:10px}.furniture-view .furniture-view-container .furniture-detail .furniture-price{width:355px;margin-top:8px;font-size:22px}.furniture-view .furniture-view-container .furniture-detail .furniture-price span{font-size:14px}.furniture-view .furniture-view-container .furniture-detail .furniture-next{display:inline-block;border-radius:4px;background-color:#917751;color:#fff;font-size:14px;box-sizing:border-box;padding:5px 10px;font-weight:bold;text-align:center;cursor:pointer;margin-top:40px}.furniture-view .furniture-view-container .furniture-detail .furniture-parts{padding-top:40px}.furniture-view .furniture-view-container .furniture-detail .furniture-parts .furniture-parts-title{font-size:14px;font-weight:bold;padding-bottom:10px}.furniture-view .furniture-view-container .furniture-detail .furniture-parts .furniture-parts-images{width:354px;font-size:0}.furniture-view .furniture-view-container .furniture-detail .furniture-parts .furniture-parts-images a{display:inline-block;width:100px;height:100px;margin-right:5px;margin-bottom:5px}.furniture-view .furniture-view-container .furniture-detail .furniture-parts .furniture-parts-images a img{width:100px;height:100px;border:1px solid #f0f0f0}.furniture-view .furniture-view-container .furniture-detail .furniture-price .discount-original{text-decoration:line-through;color:#fdbf2d}.furniture-view .furniture-view-container .furniture-detail .furniture-price .discount{font-size:18px;font-weight:bold}.furniture-view .furniture-view-container .furniture-image .furniture-image-big .discount-percent{position:absolute;background-color:#fdbf2d;color:#fff;text-align:center;width:50px;height:50px;border-radius:25px;font-weight:900;line-height:50px;font-size:15px;right:0;top:0}.commerce-menu{width:100%;text-align:center;background-color:#f9f9f9;margin-right:0 !important}.commerce-menu ul li a{padding:0 35px !important;font-weight:500}.home-top-banner{display:block;position:relative;margin-right:auto;margin-left:auto;width:500px;margin-top:60px;padding-left:31px}.btn-move-shop{color:white;height:100%;font-size:17px;font-weight:400;line-height:50px;text-align:center;background-color:#8d7956;cursor:pointer;margin-top:10px;margin-left:13px}.banner-image-2{margin-top:30px}.banner-image-1{margin-top:50px;width:100%;text-align:center}.commerce-title{width:100%}.commerce-title h2{font-size:20px;font-weight:bold;letter-spacing:1px;padding:30px 0 10px;margin-bottom:30px;text-align:left;border-bottom:1px solid #ccc}.commerce-title .product-view-more{position:absolute;bottom:5px;right:160px;font-size:14px}.commerce-title .title{font-size:14px}.furniture-item-group-3{text-align:center;margin-top:10px;margin-bottom:10px}.furniture-item-group-3 .furniture-slick-item{padding-right:3px;padding-left:3px}.furniture-item-group-3 .furniture-slick-item .description{margin-top:10px}.furniture-item-group-3 .item-image{width:100%;height:236px;background-position:center center;background-repeat:no-repeat;background-size:cover;position:relative}.furniture-item-group-3 .item-image .mask{position:absolute;top:0;left:0;background-color:black;opacity:.6;width:100%;height:100%}.furniture-item-group-3 .item-image .mask .prepare{text-align:center;padding-top:43%;color:white;width:100%;font-size:1.2em}.furniture-item-group-3>div{margin-bottom:20px}.furniture-item-group-3>div img{width:300px;height:300px}.furniture-item-group-3>div img:hover{opacity:.5}.furniture-item-group-3 .description{font-size:12px;text-align:left;height:100px;padding-left:3px;margin-top:10px}.furniture-item-group-3 .description .name{font-size:14px;font-weight:700;text-overflow:ellipsis;white-space:nowrap;overflow:hidden}.furniture-item-group-3 .description .price_original{font-weight:400;color:#afafaf;text-decoration:line-through;height:16px}.furniture-item-group-3 .description .price_discount{font-size:15px;color:#917751}.furniture-item-group-3 .description .price_discount .unit{font-size:14px;color:black}.furniture-item-group-3 .description .brand{font-weight:600}.furniture-item-group-3 .description .item-count{font-size:13px;float:left;font-style:italic;color:#afafaf;line-height:2}.furniture-item-group-4{text-align:center;padding-left:10px;padding-right:10px}.furniture-item-group-4 .item-image{width:100%;height:244px;background-position:center center;background-repeat:no-repeat;background-size:cover;position:relative}.furniture-item-group-4 .item-image .mask{position:absolute;top:0;left:0;background-color:black;opacity:.6;width:100%;height:100%}.furniture-item-group-4 .item-image .mask .prepare{text-align:center;padding-top:40%;color:white;width:100%;font-size:1.2em}.furniture-item-group-4 .number{width:40px;height:40px;text-align:center;background-color:#f2f2f2;color:#4d4d4d;line-height:2.8em;font-weight:600;font-style:italic;opacity:.9;position:absolute;top:0;right:0;z-index:3;margin-right:3px}.furniture-item-group-4 img{z-index:2;backface-visibility:hidden;position:relative;width:196px;height:196px}.furniture-item-group-4 img:hover{opacity:.3}.furniture-item-group-4 img:hover .description{z-index:2}.furniture-item-group-4 img.image{width:217px;height:217px}.furniture-item-group-4 .description{position:absolute;z-index:1;top:38%;left:11%;width:80%;line-height:18px;font-weight:500;word-break:break-all}.furniture-item-group-4 .col-xs-6{padding-left:3px;padding-right:3px;height:50%}.furniture-more-title{text-align:center;margin-bottom:30px}.pagination{list-style:none;font-size:0}.pagination li{display:inline-block;font-size:14px}.pagination li a{display:block;box-sizing:border-box;padding:6px 12px;font-size:14px}.pagination .active{font-weight:bold}.furniture-view .furniture-view-image{width:400px;height:400px}.furniture-view .furniture-view-image .furniture-view-image-wrapper{width:400px}.furniture-view .furniture-view-image .furniture-image{height:400px}.furniture-view .furniture-view-image .furniture-image>img{width:400px;height:400px}.furniture-view-infomation{margin-top:0;font-size:15px;padding-left:50px;font-family:'Noto Sans CJK KR'}.furniture-view-infomation .furniture-view-brand{font-size:12px;color:#4d4d4d;font-weight:500}.furniture-view-infomation .furniture-view-name{font-size:22px;color:#1a1a1a;font-weight:bold}.furniture-view-infomation .furniture-view-cost .original{font-size:18px}.furniture-view-infomation .furniture-view-cost span{color:#907754;font-size:16px}.furniture-view-infomation .furniture-view-cost .discount_rate{color:#afafaf;font-size:12px}.furniture-view-infomation .furniture-view-cost .slashit{color:gray;font-size:12px;font-weight:300;text-decoration:line-through}.furniture-delivery{margin-top:15px;border-top:1px solid #e8e8e8;border-bottom:1px solid #e8e8e8;padding-top:25px;padding-bottom:20px}.furniture-view-count{margin-top:15px;margin-bottom:15px;clear:both;padding-right:10px}.furniture-view-count div{display:inline-block}.furniture-view-count .title{float:left;line-height:245%}.furniture-view-count .item-quantity{margin-left:15px;margin-bottom:10px;border:1px solid #dfdfdf;width:40%;height:35px;line-height:31px;text-align:center;font-size:14px}.furniture-view-count .item-quantity div{display:inline-block}.furniture-view-count .item-quantity div.left{float:left;padding-left:0;padding-right:20px;font-size:20px}.furniture-view-count .item-quantity div.right{float:right;padding-left:20px;padding-right:0;font-size:20px}.furniture-view-count .item-quantity div:first-child,.furniture-view-count .item-quantity div:nth-child(3){cursor:pointer}.furniture-view-count .item-quantity select{border:1px solid #dfdfdf;background-color:#fff}.furniture-view-body{text-align:center}.furniture-used-star-wrapper .furniture-used-star-image{width:100%;height:225px}.furniture-related .furniture-related-image{width:100%;height:225px}.btn-cart{background-color:#000;color:white;font-size:14px;padding:15px 10px 15px 10px;font-weight:bold;text-align:center;cursor:pointer}.btn-just-buy{background-color:#917751;color:white;font-size:14px;padding:15px 10px 15px 10px;font-weight:bold;text-align:center;cursor:pointer}.furniture-view-option{padding-top:15px}.furniture-view-option .option-title{font-weight:500;margin-bottom:5px;margin-right:10px;clear:both;line-height:200%}.furniture-view-option .option-item-group{margin-bottom:10px;width:400px}.furniture-view-option .option-item-group .option-item{display:inline-block;border:1px solid #b8b8b8;padding:5px 10px 5px 8px;margin-right:5px;cursor:pointer;margin-bottom:5px}.furniture-view-option .option-item-group .slash{background:url("//cdn.ggumim.co.kr/resource/icons/bg_slash.png");background-size:100% 100%;border:1px solid #d9dadb}.furniture-view-option .option-item-group .is_selected{display:inline-block;border:1px solid black;padding:5px 10px 5px 8px;margin-right:5px;background-color:black;color:white}.furniture-view-option select{border:1px solid black;margin-bottom:10px;width:150px;padding:10px;border-radius:0}.furniture-view-option .option-set{margin-top:50px;margin-bottom:-10px}.furniture-view-option .option-set:first-child{margin-top:0}.btn-move-shop{color:white;height:100%;font-size:17px;font-weight:400;line-height:50px;text-align:center;background-color:#8d7956;cursor:pointer;margin-top:100px;margin-left:30px}.furniture-image-small .smail_img{width:125px}.furniture-qna .qna-item{margin-top:25px;padding-top:15px;padding-bottom:15px;border:1px solid #ddd;background-color:#fafafa;height:110px}.furniture-qna .qna-item .visibility-image{width:23px;margin-bottom:-22px;margin-right:10px}.furniture-qna .qna-item .title{font-size:16px}.furniture-qna .qna-item .author{margin-left:37px}.furniture-qna .qna-item .question-time{margin-left:37px}.furniture-qna .qna-item div{display:inline-block}.furniture-qna .item{font-size:10px;color:#afafaf}.qna-answer{padding-left:53px;padding-right:18px;margin-top:15px;margin-bottom:0;padding:5px 10px 5px .2em}.qna-answer .answer{margin-bottom:20px}.option-item-group select{width:80%;padding:.8em .5em;font-family:inherit;background:url("//cdn.ggumim.co.kr/storage/2016120322244549XcFI8RBj.png") no-repeat 95% 50%;border:1px solid #dfdfdf;border-radius:0;-webkit-appearance:none;-moz-appearance:none;appearance:none}.promotion img{height:500px;width:100%;cursor:pointer}.promotion img:hover{opacity:.5}.promotion .overlap_title{position:relative;font-size:33px;color:white;bottom:75px;left:35px;font-weight:bold}.furniture-related-image-wrapper .slick-arrow{top:60% !important}.furniture-related-image-wrapper .related-item{margin-right:5px;display:inline-block}.furniture-related-image-wrapper .related-item img{width:100%;height:252px;background-position:center center;background-repeat:no-repeat;background-size:cover;margin-bottom:5px}.furniture-more{text-align:center;margin-bottom:30px;font-size:15px;padding:17px 5px 17px 5px;border:1px solid #ccc}.selected-extra-option-desc{clear:both}.furniture-view-total-price{margin-top:15px;margin-bottom:25px}.furniture-view-total-price .price{font-weight:500;font-size:16px;font-family:'Noto Sans CJK KR';color:#907754}.furniture-view-extra-option{margin-top:25px}.furniture-view-extra-option>div{display:inline-block}.furniture-view-extra-option .title{font-weight:500;margin-bottom:5px;margin-right:10px;clear:both;line-height:200%}.furniture-view-extra-option select{width:80%;padding:.8em .5em;font-family:inherit;background:url("//cdn.ggumim.co.kr/storage/2016120322244549XcFI8RBj.png") no-repeat 95% 50%;border:1px solid #dfdfdf;border-radius:0;-webkit-appearance:none;-moz-appearance:none;appearance:none;margin-bottom:10px}.furniture-view-new .slash{background:url("//cdn.ggumim.co.kr/resource/icons/bg_slash.png");background-size:100% 100%;border:1px solid #d9dadb}.btn_wrapper{text-align:center}.btn_more_qna{cursor:pointer;display:inline-block;border:0;padding:0;width:35%;font-weight:500;margin-top:5px;margin-bottom:0}.btn_more_qna.mt20{margin-top:20px}.btn_more_qna.mb20{margin-bottom:20px}.furniture-write-qna input[name=title]{border:1px solid #dfdfdf;width:100%;padding:3px 10px}.furniture-write-qna textarea[name=desc]{border:1px solid #dfdfdf !important;margin-top:10px}.furniture-qna .status{text-align:right;color:#939494;font-style:italic;line-height:38px}.furniture-qna .item{font-size:14px}.furniture-qna .author{font-size:14px;margin-top:15px}.furniture-qna .author b{margin-right:10px}.furniture-qna .question-label{background-color:#777;padding:5px 7px;color:white}.furniture-qna .answer-label{margin-top:10px;margin-bottom:-10px;display:block;width:50px;text-align:center;background-color:#917751;padding:5px 7px;color:white}.furniture-qna .q_description{margin-top:15px}.furniture-qna .qna-toggle-item{cursor:pointer;margin-bottom:-30px}.remove-item{float:right;font-size:20px;color:#917751}.fa-minus,.fa-plus{border-radius:35px;padding:10px;background-color:#fff;border:1px solid #e8e8e8}.furniture-related-wrapper .slick-arrow{position:absolute;top:40%;margin-top:-30px;height:60px;width:25px;z-index:5;font-size:0;border:0}.furniture-related-wrapper .slick-next{right:-40px;background-image:url("//cdn.ggumim.co.kr/storage/20161103132631HowCB2FZho.png")}.furniture-related-wrapper .slick-prev{left:-35px;background-image:url("//cdn.ggumim.co.kr/storage/20161103132631w0dq9meQIZ.png")}.furniture-related-wrapper .slick-dots{font-size:0;position:absolute;bottom:10px;width:100%;text-align:center}.furniture-related-wrapper .slick-dots li{display:inline-block}.furniture-related-wrapper .slick-dots li button{margin-left:3px;margin-right:3px;display:inline-block;width:10px;height:10px;border:1px solid #dfdfdf;border-radius:5px;font-size:0;background-color:rgba(255,255,255,0.5)}.furniture-related-wrapper .slick-dots li.slick-active button{background-color:white}.kc_table{text-align:center;line-height:36px;margin-left:10px;margin-right:10px;font-weight:bold}.kc_table.mb30{margin-bottom:50px}.kc_table_area{position:relative;width:100%;background-color:white}.kc_table_area .container{width:100%;margin-top:0}.kc_table_area .content{border:1px solid #afafaf;margin:15px 10px;font-size:10px}.kc_table_area .content .key{background-color:#f2f2f2;border-top:1px solid #afafaf;border-right:1px solid #afafaf;padding:7px 10px}.kc_table_area .content .value{border-top:1px solid #afafaf;padding:7px 10px}.kc_table_area .content .first{border-top:0}.kc_table_area.mb30{margin-bottom:50px}.rank-wrapper{padding-right:0;text-align:center;margin-top:20px}.rank-wrapper div{width:40px;height:36px;font-size:18px;line-height:24px}.rank-wrapper .rank_1{background-image:url("//cdn.ggumim.co.kr/resource/icons/i_rank_1_s.png");background-position:center center;background-repeat:no-repeat;background-size:cover;color:#f0b835}.rank-wrapper .rank_2{background-image:url("//cdn.ggumim.co.kr/resource/icons/i_rank_2_s.png");background-position:center center;background-repeat:no-repeat;background-size:cover;color:#818383}.rank-wrapper .rank_3{background-image:url("//cdn.ggumim.co.kr/resource/icons/i_rank_3_s.png");background-position:center center;background-repeat:no-repeat;background-size:cover;color:#d98e47}.rank-wrapper .rank_no_n{font-size:24px;background-position-x:center;background-position-y:5px;background-repeat:no-repeat;color:#d98e47;background-size:35px}.rank-wrapper .rank_no_n.top3{background-size:34px;background-position-y:5px}.rank-wrapper .rank_n{font-size:24px;color:#917751}.rank-wrapper .rank-up-down{margin-top:3px;font-size:12px;color:#afafaf}.rank-wrapper .rank-up-down.rank-up{color:red}.rank-wrapper .rank-up-down.rank-down{color:blue}.rank-wrapper .rank-up-down.rank-new{font-size:10px;color:red}.rank-wrapper .rank-up-down img{width:10px;display:inline-block !important}.rank-wrapper.more div{width:21px;height:18px;font-size:11px;line-height:18px}.rank-wrapper.more .rank_n{font-size:16px;color:#afafaf}.rank-furniture-img{height:100px;width:100px;background-size:cover;background-repeat:no-repeat}.home-rank-item{margin-bottom:30px;background-color:#fff;border-radius:4px;border:1px solid;border-color:#e5e6e9 #dfe0e4 #d0d1d5;padding-top:15px}.furniture-item .item-desc{font-family:'Noto Sans CJK KR'}.furniture-item .item-desc .item-name{font-size:17px}.furniture-item .item-desc .item-price{font-weight:400;color:#afafaf;text-decoration:line-through;height:16px;margin-top:5px;margin-bottom:5px}.furniture-item .item-desc .item-price-discount{font-size:15px;color:#917751}.furniture-item .item-desc .item-price-discount span:nth-child(2){color:#000}.furniture-related-wrapper{width:775px;margin-left:-4px}.category-sub-wrapper{width:800px;padding-top:35px;padding-bottom:20px}.category-sub-wrapper .category-sub-title{color:#333;font-size:18px;font-weight:bold}.category-sub-wrapper .category-sub{margin-left:7px}.category-sub-wrapper .category-sub .item{font-size:13px;color:#999;cursor:pointer;line-height:2.5;display:inline-block}.category-sub-wrapper .category-sub .item .separator{margin-right:2.5px;margin-left:2.5px;color:#999}.category-sub-wrapper .category-sub .item .separator:last-child{margin-right:2.5px;margin-left:7px}.category-sub-wrapper .category-sub .selected{color:#333;font-weight:bold}.furniture-more-top{height:85px;display:block}.furniture-more-top div{display:inline-block}.image_circle{width:40px;height:40px;-webkit-border-radius:20px;-moz-border-radius:20px;border-radius:20px;border-color:#f8f8f8}.color_circle{width:35px;height:35px;-webkit-border-radius:25px;-moz-border-radius:25px;border-radius:25px;border:1px solid #d8d8d8;margin-top:0;vertical-align:middle;margin-right:5px}.furniture_content{margin:0;padding:0}.furniture_content .furniture_sale{width:100px;position:absolute;background-color:#fdd022;padding:5px;top:55px;font-weight:bold;text-align:center}.furniture_content .furniture_quantity{width:100px;position:absolute;background-color:red;color:#fff;padding:5px;top:90px;font-weight:bold;text-align:center}.furniture_content .furniture_image{width:100%;height:400px;background-repeat:no-repeat;background-attachment:local;background-position:center;background-size:contain}.furniture_content .furniture_info{margin-top:30px}.furniture_content .furniture_info .furniture_name,.furniture_price{text-align:center;line-height:3.0}.furniture_info .furniture_price .price_em{font-size:15px;color:#faa800;font-weight:bold}.furniture_info .furniture_size{font-size:13px;margin-left:15px;margin-bottom:15px;margin-top:15px}.furniture_info .furniture_price s{color:#8c8c8c;font-size:14px}.furniture-option-wrapper .title{text-align:left;font-size:13px;font-weight:bold;margin-left:20px;line-height:5;margin-right:20px}.furniture-option-wrapper div{display:inline-block}.furniture_details>div{font-size:14px;width:100%;border-top:2px solid #e8e8e8}.furniture_details .product_explanation img{width:100%;margin:0}.product_explanation .product_information{margin-left:15px;margin-right:15px;margin-bottom:10px;line-height:2.3em}.furniture-review .title{text-align:left;font-size:18px}.furniture-review .review_point{color:#917751;font-size:16px;font-weight:600;padding:0 1px;line-height:1.2em;display:inline-block}.furniture-review .rating{text-align:right}.furniture-review .review-count{color:#917751}.furniture-review .desc{font-size:12px}.furniture-review .date{font-size:11px;color:#afafaf}.furniture-review .star_area{margin-bottom:18px;margin-top:40px}.furniture-review .star_area.mt18{margin-top:18px}.furniture-review .star_area .container,.furniture-review .star_area .row,.furniture-review .star_area .col-xs-4,.furniture-review .star_area .col-xs-8,.furniture-review .star_area .col-xs-3,.furniture-review .star_area .col-xs-9{padding:0;margin:0}.furniture-review .star_area .total_star{text-align:center}.furniture-review .star_area .total_star .review_count{color:#afafaf;font-size:12px;margin-top:10px;font-weight:500}.furniture-review .star_area .total_rate{display:inline-block;color:#989898;font-size:5.2em;font-weight:600;line-height:.7em;margin-left:14px}.furniture-review .star_area .total_rate.type1{text-align:center;color:#e8af3e;font-size:2em;font-weight:500;margin-right:5px}.furniture-review .star_area .star_n{display:inline-block;color:#e8af3e;font-size:.3em;line-height:12px;text-align:right;padding-right:12px;margin-left:-5px}.furniture-review .star_area .star_n .star{display:inline-block}.furniture-review .star_area .star_n .progressbar{border-radius:2px;margin-left:5px;margin-bottom:2px;display:inline-block;height:3px;width:100%;background-color:#e6e6e6}.furniture-review .star_area .star_n .progressbar .progress_value{background-color:#eabe5e;height:100%;border-radius:2px}.furniture-review .furniture-review-wrapper{padding-left:10px;padding-right:10px}.furniture-review .btn_wrapper{text-align:center}.furniture-review .btn_more_qna{cursor:pointer;display:inline-block;border:1px solid #afafaf;padding:10px 30px 10px 30px;width:80%;font-weight:500;margin-top:20px;margin-bottom:20px}.furniture-review-write-top{background-color:white;font-size:14px;height:82px;text-align:center}.furniture-review-write-top p{margin-bottom:3px}.furniture-review-write-top .bold{font-weight:500;color:#917751}.furniture_details .furniture_question{text-align:center}.furniture_details_title{padding:0 15px}.furniture_details_title .text{display:inline-block;margin:15px 0}.furniture_details_title .button{float:right;border:1px solid #e8e8e8;margin-top:7px;padding:7px;font-size:12px}.furniture_details_title .button i{width:16px}.price-caret{font-size:25px;color:#8c8c8c;margin-top:7px;margin-left:10px;margin-right:5px;padding-top:5px;vertical-align:top}.grade-star{color:#e8af3e}.furniture_details .furniture_question .question-button-wrapper{margin-bottom:60px}.furniture_details .furniture_question .question-button-wrapper .btn-question{width:90px;padding:7px;border:1px solid #e8e8e8;display:inline-block;font-weight:bold}.furniture_details .furniture_question a>div>i{margin-right:10px}.furniture_details .furniture-bottom-bar{position:fixed;left:0;right:0;bottom:0;background:#ededed}.furniture_details .furniture-bottom-bar .no-shape-button{display:inline-block;width:25%;text-align:center;line-height:45px;font-size:16px}.furniture_details .furniture-bottom-bar .shape-button{display:inline-block;font-size:16px;width:46%;text-align:center;background:wheat;line-height:35px}

</style>

<title>Insert title here</title>
</head>
<body>
<form name="fmOrder">
<section>
<input type="hidden" name="mode"> 
<input type="hidden" name="goodsno" value="${goodsBasic.GOODS_NUMBER }">
<input type="hidden" name="MEMBER_NUMBER" value="71">


<!-- 상품정보 -->
<!-- 상단 상품이미지 -->
	<div class="container">
		<div class="furniture-view">
			<div class="row">
				<div class="col-xs-6 furniture-view-image monday-slick">
					<div class="furniture-view-image-wrapper">
						<div class="furniture-image">
							<img
								src="//cdn.ggumim.co.kr/cache/furniture/600/20180826221408SpDkq0A3Gg.jpg" />
						</div>
						<div class="furniture-image">
							<img
								src="//cdn.ggumim.co.kr/cache/furniture/600/20180826221410HtPpEGkpyq.jpg" />
						</div>
						<div class="furniture-image">
							<img
								src="//cdn.ggumim.co.kr/cache/furniture/600/20180826221414RkVDdVYL4Y.jpg" />
						</div>
						<div class="furniture-image">
							<img
								src="//cdn.ggumim.co.kr/cache/furniture/600/20180826221424LOUxwEnfW0.jpg" />
						</div>
						<div class="furniture-image">
							<img
								src="//cdn.ggumim.co.kr/cache/furniture/600/20180826221429NlI3aCnzgW.jpg" />
						</div>
					</div>
					<!--/.furniture-view-image-wrapper-->
					<div class="discount hide">
						(20%)<span>%</span>
					</div>
					<!--/.discount-->
				</div>
				<!--/.left menu end-->
				<div class="col-xs-6 furniture-view-infomation">
					<div class="furniture-view-brand">까사마루</div>
					<div class="furniture-view-name">오드리 접이식 테이블 세트</div>
					<div class="furniture-view-cost">
						<span class="original slashit">99,000 원</span><br /> <span
							class="discount">79,000</span> 원 <span class="discount_rate">(20%)</span>
					</div>
					<div class="furniture-delivery">
						<div class="row">
							<div class="col-xs-3">배송비</div>
							<div class="col-xs-9">
								<div style="float: left; font-size: 12px;">무료</div>
								<div style="float: left; font-size: 12px;">(선결제)</div>
								<input type="hidden" name="delivery-payment" value="0">
							</div>
						</div>
						<div class="row" style="margin-top: 10px; margin-bottom: 10px;">
							<div class="col-xs-3">구매 후기</div>
							<div class="col-xs-9">
								<div class="review-star-wrapper">
									<i class="fa fa-star grade-star-o" aria-hidden="true"></i> <i
										class="fa fa-star grade-star-o" aria-hidden="true"></i> <i
										class="fa fa-star grade-star-o" aria-hidden="true"></i> <i
										class="fa fa-star grade-star-o" aria-hidden="true"></i> <i
										class="fa fa-star grade-star-o" aria-hidden="true"></i>
								</div>
							</div>
						</div>
					</div>
					<!--/.right top menu end-->
					<div class="furniture-view-option ">
						<div class="option-set">
							<div class="option-title">색상</div>
							<div class="option-item-group" id="optionset0">
								<div class="option-item" data-idx="58913"
									onclick="FurnitureView.clickOption(0,this)">오크</div>
								<div class="option-item" data-idx="58914"
									onclick="FurnitureView.clickOption(0,this)">브라운</div>
							</div>
						</div>
					</div>
					<!--/.furniture-view-option-->
					<div class="row furniture-view-count">
						<div class="col-md-12 title">수량</div>
						<div class="col-md-12 item-quantity">
							<div class="left" onclick="FurnitureView.countDown();">
								<span class="fa fa-angle-down"></span>
							</div>
							<div class="order_count">
								<span>1</span>
							</div>
							<div class="right" onclick="FurnitureView.countUp();">
								<span class="fa fa-angle-up"></span>
							</div>
						</div>
					</div>
					<div class="furniture-view-total-price">
						<div>
							합계 : <span class="price">0</span> 원
						</div>
					</div>
					<div class="row" style="margin-right: -100px; margin-left: -1px;">
						<div class="col-xs-5 btn-cart" id="cartBtn"
							onclick="FurnitureView.addCart();">장바구니</div>
						<div class="col-xs-5 btn-just-buy"
							onclick="FurnitureView.order();">바로구매</div>
					</div>
					<div class="row" style="margin-right: -100px; margin-left: 10px;">
						<div class="col-xs-12">
							<div id="naverPayButton"
								style="margin-top: 10px; margin-bottom: 10px;"></div>
						</div>
					</div>
				</div>
		</div>
		</div>
		</div>













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