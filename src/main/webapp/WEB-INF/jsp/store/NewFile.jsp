<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function setOption2(obj){
	 if (!chkSoldout(obj)) return;
	 if ($("#option option:selected").attr("disabled")==""){
	    alert("선택한 옵션은 품절된 상태입니다"); 
	    $("#option").get(0).selectedIndex = 0;
	    return;
	 }
	 var optno = $("#option option:selected").val();
	 console.log(optno);
	 if (!optno || in_array(optno,r_optno)) return;
	 var li = "<li class='MK_li_1_1'><span class='MK_p-name'>" + 
	 $("#option option:selected").attr("optnm") + 
	 "</span><input type='hidden' name='optno[]' value='" + optno + 
	 "'><input type='hidden' name='kinds[]' value='" + 
	 $("option:selected",$(obj)).attr("kinds") + 
	 "'><input type='hidden' class='mstock' value='" + 
	 $("option:selected",$(obj)).attr("stock") + 
	 "'><div class='MK_qty-ctrl' style='height:50px'><input type='text' name='ea[]' value='1' class='input_ea' size='2' maxlength='3'><span class='ea'><a class='MK_btn-up'><img src='/ModuHome/images/btn_num_up.gif' alt='' /></a><a class='MK_btn-dw'><img src='/ModuHome/images/btn_num_down.gif' alt='' /></a></span></div><span class='MK_price' data-price='"
	 +$("option:selected",$(obj)).attr("price")+"'>" + 
	 comma($("option:selected",$(obj)).attr("price")) + 
	 "원</span><a href='#' optno='" + optno + 
	 "' class='MK_btn-del'><img src='/ModuHome/images/btn_close.gif' alt='' /></a></li>";
	 
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


</script>

</head>
<body>

</body>
</html>