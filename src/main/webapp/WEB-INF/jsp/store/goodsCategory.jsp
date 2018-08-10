<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>${categoryName}</h2>
${goodsCategoryList}
<c:forEach items="${goodsCategoryList}" var="CategoryList" begin="0" varStatus="status" end="${fn:length(CategoryList)}">
상품명: ${CategoryList.GOODS_NUMBER}
</c:forEach>


</body>
</html>