<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>스토리</title>
</head>
<body>
	
	<form name="search" action="totalSearch" method="post" >
		<!-- <input type="hidden" name="mode" value="login"> 
		<input type="hidden" name="viewName" value="${viewName}"> -->
		<input type="hidden" id="member_number" name="MEMBER_NUMBER" value="4">
		
		<input type="text" id="issearch" name="ISSEARCH" required="" class="xx-control" placeholder="검색">

		<button type="submit" class="button">통합검색</button>
	</form>
최근검색어:</br>
	<c:forEach items="${recentSearch}" var="recentSearch" >

		<c:if test="${recentSearch.MEMBER_NUMBER eq 4 }">
					${recentSearch.SEARCH_RECENT} <br/>
        </c:if>
</c:forEach>
</body>
</html>