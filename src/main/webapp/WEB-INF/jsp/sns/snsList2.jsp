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


    <section class="flexslider">
      <ul class="slides">
        <li style="background-image: url(img/slider_1.jpg)" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
                <div class="probootstrap-slider-text text-center">
                  <h1 class="probootstrap-heading">Our Services</h1>
                </div>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </section>

    
    <section class="probootstrap-section probootstrap-bg-white">
      <div class="container">
		
		
        <!-- END row -->
        <div class="row">
		
	
          <div class="col-md-2"></div>
          
          <div class="col-md-8">
			<form name="snsBoard" action="/ModuHome/snsinsert" method="post" enctype="multipart/form-data">          
            <div class="probootstrap-service-2 probootstrap-animate">
              <div class="text">
              	<input type="hidden" name="MEMBER_NUMBER" value="${sessionScope.MEMBER_NUMBER }">
                <div class="sns_content">
                  <textarea cols="80" rows="5" id="SNS_CONTENT" name="SNS_CONTENT" required="" class="xx-control" placeholder="내용을 입력해주세요" style=" border-style: none; border-bottom-style: dashed;"></textarea>
                </div>
              </div>
              <div style="margin-bottom: 20px">
                  <input type="file" id="SNS_IMAGE" name="SNS_IMAGE" value="사진선택"  style="float: left; margin-left: 50px;">
                  <input type="submit" value="글쓰기" style="margin-left: 200px; height: 25px">
              </div>  
            </div>
			</form>
			
            <c:forEach items="${snsList}" var="snsList">

            <div class="probootstrap-service-2 probootstrap-animate">
              <div class="text" style="width:100%;">
                <img src="/ModuHome/style/img/img_sm_1.jpg" width="50px" style="border-radius: 50%; float: left; margin-right: 30px">
                <h6>${snsList.MEMBER_NUMBER }</h6>
                <h6><fmt:formatDate value="${snsList.SNS_REGDATE}" pattern="yyyy.MM.dd" /></h6>
              </div>
              <div class="text" width:100%">  
                <p>${snsList.SNS_CONTENT}</p>
              </div>
<!--               <div style="margin-left: 20px; margin-right: 20px;">  
                <img src="img/img_sm_1.jpg" alt="Free Bootstrap Template by uicookies.com" width="200px">
                <img src="img/img_sm_1.jpg" alt="Free Bootstrap Template by uicookies.com" width="200px">
                <img src="img/img_sm_1.jpg" alt="Free Bootstrap Template by uicookies.com" width="200px">
              </div> -->
              <div class="text" style="width:100%;"> 
				<c:if test="${snsList.SNS_IMAGE ne null}">
					<img src="/ModuHome/images/snsMain/${snsList.SNS_IMAGE}" width="60" height="60" >
				</c:if>
              </div>
              
              <div class="text" style="width:100%;">
                <img src="/ModuHome/style/img/heart_off.png" width="20px">
                <img src="/ModuHome/style/img/police.png" width="40px">
              </div>
            
            
			
            <div class="text" style="width: 100%; background-color: #dedede;">
	            <form name="cm" action="snsCommentInsert" method="post">
	        	<input type="hidden" id="sns_number" name="SNS_NUMBER" value="${snsList.SNS_NUMBER}">
	       		<input type="hidden" id="MEMBER_NUMBER" name="MEMBER_NUMBER" value="${sessionScope.MEMBER_NUMBER }">             
	            
                <input type="text" id="sns_cm_content" name="SNS_CM_CONTENT" style="width:80%;" placeholder="댓글을 입력하세요!">
                <input type="submit" value="댓글등록">
			
        			<c:forEach items="${snsCommentList}" var="snsCommentList" >
        				<c:if test="${snsList.SNS_NUMBER eq snsCommentList.SNS_NUMBER}">
                   			<table>
                   				<tr>
                   					<td width="50">${snsCommentList.MEMBER_NUMBER}</td>
	                   				<td width="250">${snsCommentList.SNS_CM_CONTENT}</td>
	                   				<td>${snsCommentList.SNS_CM_REGDATE}</td>
                   				</tr>
                   			</table>                  			
                   		</c:if>
                   	</c:forEach>   
                </form>    	             
            </div>    
           
           </div> 
            
            </c:forEach>
          </div>

          <div class="col-md-2"></div>
        </div>
      </div>
    </section>

</body>
</html>