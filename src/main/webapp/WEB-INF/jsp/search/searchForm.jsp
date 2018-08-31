<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>통합검색</title>
</head>
<body>

    <section class="flexslider">
      <ul class="slides">
        <li style="background-image: url(/ModuHome/style/img/slider_1.jpg)" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
                <div class="probootstrap-slider-text text-center">
                  <h1 class="probootstrap-heading">검색</h1>
                </div>
              </div>
            </div>
          </div>
        </li>
        
      </ul>
    </section> 
	
	<form name="search" action="totalSearch" method="post" >
		<!-- <input type="hidden" name="mode" value="login"> 
		<input type="hidden" name="viewName" value="${viewName}"> -->
		<input type="hidden" id="member_number" name="MEMBER_NUMBER" value="${MEMBER_NUMBER}">
		
		<input type="text" id="issearch" name="ISSEARCH" required="" class="xx-control" placeholder="검색">

		<button type="submit" class="button">통합검색</button>
	</form>
최근검색어:</br>
	<c:forEach items="${recentSearch}" var="recentSearch" >

		<c:if test="${recentSearch.MEMBER_NUMBER eq MEMBER_NUMBER }">
					${recentSearch.SEARCH_RECENT} <br/>
        </c:if>
</c:forEach>
</body>
</html>