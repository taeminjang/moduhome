<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>매거진내용등록</title>
</head>
<body>
	<form name="mgInsert" action="mgContentInsert" method="post" enctype="multipart/form-data">
		<!-- <input type="hidden" name="mode" value="login"> 
	<input type="hidden" name="viewName" value="${viewName}"> -->
		
	
		
		<div class="input">
			
			<div class="mg_number">
				<input type="hidden" id="mg_number" name="MG_NUMBER" value="${mgNew.MG_NUMBER}">
			</div>

			<div class="mg_image">
				<input type="file" id="mg_image" name="MG_IMAGE">사진
			</div>
			
			<div class="mg_image_content">
				<input type="text" id="mg_image_content" name="MG_IMAGE_CONTENT" required="" class="xx-control" placeholder="회원">내용
			</div>
			
		</div>

		<button type="submit" class="button">
			<span>글쓰기</span>
		</button>
	</form>
	
		 <c:forEach items="${mgContentList}" var="mgContentList" >
        					<c:if test="${mgNew.MG_NUMBER eq mgContentList.MG_NUMBER}">
                   				<table>
                   					<td>${mgContentList.MG_IMAGE_CONTENT}</td>
                   					<td><img src="/ModuHome/images/mgContent/${mgContentList.MG_IMAGE}" width="60" height="60" ></td>
                   			   	</table>
                   			</c:if>
           	</c:forEach>
		
		<table>
		<tbody>
				
                  <%--  <c:forEach items="${snsList}" var="snsList">
                   
                   
                   <table>
                   <form>
                     <tr>
                        <td>${snsList.SNS_NUMBER }</td>
                        <td>${snsList.MEMBER_NUMBER }</td>
                        <td>${snsList.SNS_TITLE }</td>
                       	<td>
                           <fmt:formatDate value="${snsList.SNS_REGDATE}" pattern="yyyy.MM.dd" />
                        </td>
                   		<td>
                   		<div>
                   		<c:if test="${snsList.SNS_IMAGE eq null}">
                   		<td>${snsList.SNS_NUMBER}</td>
                   		</c:if>
                   		<c:if test="${snsList.SNS_IMAGE ne null}">
                   		   <img src="/test/file/snsFile/${snsList.SNS_IMAGE}" width="60" height="60" >${snsList.SNS_NUMBER}</td>
                   		</c:if>
                   		</td>
                   		</div>
                        <td>${snsList.SNS_CONTENT}</td>
                        <td><a href="/MODA/login/findForm">좋아요</a></td>
                     </tr>
                     </form>
                     </div>
                    </table>
		
					<table>
					<td colspan="3">
   					 <form name="cm" action="snsboardCM" method="post">
        				<input type="hidden" id="sns_number" name="SNS_NUMBER" value="${snsList.SNS_NUMBER}">
        				<!-- 세션 아이디 --> 
       					<input type="hidden" id="member_number" name="MEMBER_NUMBER" value="4"> 
        			<input type="text" id="sns_cm_content" name="SNS_CM_CONTENT" >
        			<button type="submit">댓글등록</button>
        			
        				<c:forEach items="${reviewList2}" var="reviewList2" >
        					<c:if test="${snsList.SNS_NUMBER eq reviewList2.SNS_NUMBER}">
                   				<table>
                   					<td>${reviewList2.MEMBER_NUMBER}</td>
                   					<td>${reviewList2.SNS_CM_CONTENT}</td>
                   					<td>${reviewList2.SNS_CM_REGDATE}</td>
                   				</table>
                   			</c:if>
                   		</c:forEach>
   					</form>
   					</td>
					</table>
                  </c:forEach> --%>
                  
               </tbody> 
               </table>
</body>
</html>