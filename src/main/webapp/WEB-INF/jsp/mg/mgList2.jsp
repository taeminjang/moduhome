<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>매거진</title>

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="/ModuHome/search/css/styles-merged.css">
    <link rel="stylesheet" href="/ModuHome/search/css/style.min.css">
    <link rel="stylesheet" href="/ModuHome/search/css/custom.css">
  
</head>
<body>



<section class="flexslider">
      <ul class="slides">
        <li style="background-image: url(/ModuHome/style/img/im07.jpg)" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
              
                <div class="probootstrap-slider-text text-center" style=" margin-top:300px;">
                  <h1 class="probootstrap-heading" style="font-size: 100px;"><span><strong>MAGAZINE</strong></span></h1>
                </div>
         
              </div>
            </div>
          </div>
        </li>
      </ul>
</section> 
    


	  <section class="probootstrap-section probootstrap-section-lighter">
    <div class="container">
      <div class="row">
           	<form name="magazine" action="mgInsertForm" method="post">
        		<button type="submit" class="button">
					<span>매거진등록</span>
				</button>
        	</form>
       
       <c:forEach items="${mgList}" var="mgList">
       
           <c:url var="viewURL" value="mgDetail">
               <c:param name="MG_NUMBER" value="${mgList.MG_NUMBER}" />
               <c:param name="MEMBER_NUMBER" value="${sessionScope.MEMBER_NUMBER}" />
           </c:url>
           <a href="${viewURL}">
       	 <div class="col-md-6  col-sm-6">
        	  <div class="probootstrap-card probootstrap-listing">
            	<div class="probootstrap-card-media">
            	  <img src="/ModuHome/style/img/${mgList.MG_TITLE_IMAGE}" class="img-responsive" style="width:600px; height:400px;">
            	<!--   <a href="#" class="probootstrap-love"><i class="icon-heart"></i></a> -->
            	</div>
           		 <div class="probootstrap-card-text">
           		  <div class="probootstrap-listing-category for-sale"><span>Title</span></div>
            	  <div class="probootstrap-listing-price"><strong>${mgList.MG_TITLE }</strong> </div>
            	  
            	 <%--  <div class="probootstrap-listing-location">
            		 ${mgList.MG_HASHTAG}
            	   </div> --%>
            	   <div class="probootstrap-listing-location">            	   
            		  ${mgList.MG_TYPE}&nbsp; ${mgList.MG_STYLE}&nbsp; ${mgList.MG_SPACE}&nbsp; ${mgList.MG_AVERAGE}
            	   </div>
            	   <h2 class="probootstrap-card-heading">${mgList.MG_CONTENT}</h2>
            	</div>
            	<div class="probootstrap-card-extra">

            	</div>
          	</div>
        	</div>
        	</a>
        </c:forEach>

        
      </div>
    </div>

    
  </section>
  
  
	
		

</body>
</html>