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
<title>Insert title here</title>
</head>
<body>

<form name="fmOrder">
<input type="hidden" name="goodsno" value="${goodsBasic.GOODS_NUMBER }">

goodsBasic : ${goodsBasic} <br/>
goodsImage : ${goodsImage}<br/>
goodsDetail : ${goodsDetail}
<div class="thumb">



     <ul class="multi_image">
     <c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="0" end="0">
     <li>
     <img class="detail_image" id="lens_img" src="/ModuHome/images/goods/${goodsImage.IMAGE}" border="0" width="300" onerror="this.src='/ModuHome/images/noimg_130.gif'">   
     </li>
     </c:forEach>
     
     <c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="0" end="4">
     <li>
     <img style="float: left; width: 120px" height="120px" src="/ModuHome/images/goods/${goodsImage.IMAGE}" onmouseover="" onerror="this.src='/ModuHome/images/noimg_130.gif'">
     </li>
     </c:forEach>
     </ul>  
     </div>


 <a href="javascript:_exec('buy');" class="buy">구매하기</a>


</form>
굿즈 디테일
</body>
</html>