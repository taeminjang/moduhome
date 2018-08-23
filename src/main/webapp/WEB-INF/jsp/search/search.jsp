<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
</head>
<body>

검색: <td> ${isSearch} </td> <a href="/test/searchForm">다시검색</a><br/>
<br/>

스토리 검색결과 :<br/>
<c:forEach items="${snsSearch}" var="snsSearch" >

	<c:if test="${fn:contains(snsSearch.SNS_CONTENT, isSearch)}">
	   	결과: <td>${snsSearch.SNS_CONTENT}</td>
	   	넘버: <td>${snsSearch.SNS_NUMBER}</td> <br/>
    </c:if>

</c:forEach>
<br/>


회원 검색결과:<br/>
<c:forEach items="${memberSearch}" var="memberSearch" >

		<c:if test="${fn:contains(memberSearch.MEMBER_ID, isSearch)}">
	    	결과: <td>${memberSearch.MEMBER_ID}</td>
	     	넘버: <td>${memberSearch.MEMBER_NUMBER}</td> <br/>
        </c:if>
		

</c:forEach>
<br/>

매거진 검색결과 :<br/>
<c:forEach items="${mgSearch}" var="mgSearch" >

		<c:if test="${fn:contains(mgSearch.MG_TITLE, isSearch)}">
	    	결과: <td>${mgSearch.MG_TITLE}</td>
	     	넘버: <td>${mgSearch.MG_NUMBER}</td> <br/>
        </c:if>
        
        <c:if test="${fn:contains(mgSearch.MG_CONTENT, isSearch)}">
	    	결과: <td>${mgSearch.MG_CONTENT}</td>
	     	넘버: <td>${mgSearch.MG_NUMBER}</td> <br/>
        </c:if>
	
		<c:if test="${fn:contains(mgSearch.MG_TYPE, isSearch)}">
	    	결과: <td>${mgSearch.MG_TYPE}</td>
	     	넘버: <td>${mgSearch.MG_NUMBER}</td> <br/>
        </c:if>
        
        <c:if test="${fn:contains(mgSearch.MG_STYLE, isSearch)}">
	    	결과: <td>${mgSearch.MG_STYLE}</td>
	     	넘버: <td>${mgSearch.MG_NUMBER}</td> <br/>
        </c:if>
        
        <c:if test="${fn:contains(mgSearch.MG_SPACE, isSearch)}">
	    	결과: <td>${mgSearch.MG_SPACE}</td>
	     	넘버: <td>${mgSearch.MG_NUMBER}</td> <br/>
        </c:if>
        
        <c:if test="${fn:contains(mgSearch.MG_AVERAGE, isSearch)}">
	    	결과: <td>${mgSearch.MG_AVERAGE}</td>
	     	넘버: <td>${mgSearch.MG_NUMBER}</td> <br/>
        </c:if>

</c:forEach>
<br/>

상품 검색결과 :<br/>
<c:forEach items="${goodsSearch}" var="goodsSearch" >

		<c:if test="${fn:contains(goodsSearch.GOODS_NAME, isSearch)}">
	    	결과: <td>${goodsSearch.GOODS_NAME}</td>
	     	넘버: <td>${goodsSearch.GOODS_NUMBER}</td> <br/>
        </c:if>
        
       	<c:if test="${fn:contains(goodsSearch.GOODS_CATEGORY1, isSearch)}">
	    	결과: <td>${goodsSearch.GOODS_CATEGORY1}</td>
	     	넘버: <td>${goodsSearch.GOODS_NUMBER}</td> <br/>
        </c:if>
        
        <c:if test="${fn:contains(goodsSearch.GOODS_CATEGORY2, isSearch)}">
	    	결과: <td>${goodsSearch.GOODS_CATEGORY2}</td>
	     	넘버: <td>${goodsSearch.GOODS_NUMBER}</td> <br/>
        </c:if>
        
        <c:if test="${fn:contains(goodsSearch.GOODS_BRNAME, isSearch)}">
	    	결과: <td>${goodsSearch.GOODS_BRNAME}</td>
	     	넘버: <td>${goodsSearch.GOODS_NUMBER}</td> <br/>
        </c:if>
     
</c:forEach>
<br/>

</body>
</html>