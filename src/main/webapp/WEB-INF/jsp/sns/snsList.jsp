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

<form name="snsBoard" action="/ModuHome/snsinsert" method="post" enctype="multipart/form-data">
		<!-- <input type="hidden" name="mode" value="login"> 
		<input type="hidden" name="viewName" value="${viewName}"> -->

		<div class="input">
			
			<div class="sns_content">
				<input type="text" id="sns_content" name="SNS_CONTENT" required="" class="xx-control" placeholder="내용">내용
			</div>
			<!-- <div class="member_number"> -->
				<input type="hidden" id="member_number" name="MEMBER_NUMBER" required="" class="xx-control" value="${MEMBER_NUMBER }">회원
			<!-- </div> -->
			<div class="sns_image">
				<input type="file" id="sns_image" name="SNS_IMAGE">메인사진
			</div>
			
		</div>

		<button type="submit" class="button">
			<span class="button-label">글쓰기</span>
		</button>
	</form>
		
		<table>
		<tbody>
				
                   <c:forEach items="${snsList}" var="snsList">
                   
                   
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
                   		   <img src="/ModuHome/images/snsMain/${snsList.SNS_IMAGE}" width="60" height="60" >${snsList.SNS_NUMBER}</td>
                   		</c:if>
                   		</td>
                   		</div>
                        <td>${snsList.SNS_CONTENT}</td>
                        <td><a href="">좋아요</a></td>
                     </tr>
                     </form>
                     </div>
                    </table>
		
					<table>
					<td colspan="3">
   					 <form name="cm" action="snsCommentInsert" method="post">
        				<input type="hidden" id="sns_number" name="SNS_NUMBER" value="${snsList.SNS_NUMBER}">
        				<!-- 세션 아이디 --> 
       					<input type="hidden" id="member_number" name="MEMBER_NUMBER" value="${MEMBER_NUMBER}"> 
        			<input type="text" id="sns_cm_content" name="SNS_CM_CONTENT" >
        			<button type="submit">댓글등록</button>
        			
        				<c:forEach items="${snsCommentList}" var="snsCommentList" >
        					<c:if test="${snsList.SNS_NUMBER eq snsCommentList.SNS_NUMBER}">
                   				<table>
                   					<td>${snsCommentList.MEMBER_NUMBER}</td>
                   					<td>${snsCommentList.SNS_CM_CONTENT}</td>
                   					<td>${snsCommentList.SNS_CM_REGDATE}</td>
                   				</table>
                   			</c:if>
                   		</c:forEach>
   					</form>
   					</td>
					</table>
                  </c:forEach>
                  
               </tbody> 
               </table>
</body>
</html>