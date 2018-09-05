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

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="/ModuHome/search/css/styles-merged.css">
    <link rel="stylesheet" href="/ModuHome/search/css/style.min.css">
    <link rel="stylesheet" href="/ModuHome/search/css/custom.css">

 <!--  <script src="/ModuHome/search/js/scripts.min.js"></script>
  <script src="/ModuHome/search/js/main.min.js"></script>
  <script src="/ModuHome/search/js/custom.js"></script> -->

</head>
<body>

<section class="flexslider">
      <ul class="slides">
        <li style="background-image: url(/ModuHome/style/img/im08.jpg)" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
              
                <div class="probootstrap-slider-text text-center" style=" margin-top:300px;">
                  <h1 class="probootstrap-heading" style="font-size: 100px;"><span><strong>SEARCH</strong></span></h1>
                </div>
         
              </div>
            </div>
          </div>
        </li>
      </ul>
</section> 

      
    <section>
         <div class="container" >
        <div class="row" style= "margin-bottom:300px; ">
          <div class="col-md-8 col-md-offset-2">

            <div class="probootstrap-home-search probootstrap-animate" >
              <form name="search" action="totalSearch" method="post">
                <h2 class="heading">Home page all search</h2>
                <div class="probootstrap-field-group">
                  <div class="probootstrap-fields">

                   		<c:if test="${MEMBER_NUMBER ne null }">		
							<input type="hidden" id="member_number" name="MEMBER_NUMBER" value="${MEMBER_NUMBER}">
						</c:if>
                      <input type="text" id="issearch" name="ISSEARCH" class="form-control" placeholder="ID, TITLE, CONTENT, GOODS">
                
                    <div class="search-category">
                      <i class="icon-chevron-down"></i>

                    </div>
                  </div>
                  <button class="btn btn-success" type="submit"><i class="icon-magnifying-glass t2"></i> Start Search</button>
                </div>
              </form>
            
            <c:if test="${MEMBER_ID ne null}">
             <strong>${MEMBER_ID}의 최근 검색어</br></strong>
				<c:if test="${MEMBER_NUMBER eq null }">
					로그인을 해주세요.
				</c:if>
	
				<c:if test="${MEMBER_NUMBER ne null}">

					<c:forEach items="${recentSearch}" var="recentSearch" >

						<c:if test="${recentSearch.MEMBER_NUMBER eq MEMBER_NUMBER }">
							${recentSearch.SEARCH_RECENT} <br/>
        				</c:if>

					</c:forEach>
				</c:if>
			</c:if>
            </div>

          </div>
          
        </div>

      </div>
      
      </section>
      
     
    
    
	

    



</body>
</html>