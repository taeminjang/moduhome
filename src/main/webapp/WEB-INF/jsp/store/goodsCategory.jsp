<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

</style>

<title>Insert title here</title>
</head>
<body>
<h2>${categoryName}</h2>
카테고리: ${goodsCategory}<br/>

<table>
  
<tbody>
<tr><td></td><td></td><td></td></tr>
<tr>
<c:forEach items="${goodsCategoryList}" var="CategoryList" begin="0" varStatus="status" end="${fn:length(goodsCategoryList)}">
<td>
<div class="tb-center">
            <div class="box">
            <div class="thumb salebox">
<img src="/ModuHome/images/goods/${CategoryList.GOODS_THUMBNAIL}" width="150" height="150" alt=""  onerror="this.src='/ModuHome/images/noimg_130.gif'" />

</div>
상품명:<a href="/ModuHome/goods/detail?GOODS_NUMBER=${CategoryList.GOODS_NUMBER}">${CategoryList.GOODS_NAME}</a>
상품번호:${CategoryList.GOODS_NUMBER}

</div>
</div>
</td>
</c:forEach>
</tr>
</tbody>
</table>


</body>
</html>