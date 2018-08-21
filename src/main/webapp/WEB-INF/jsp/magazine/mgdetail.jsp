<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>매거진상세보기</title>
</head>
<body>

<!-- <form name="snsBoard" action="/test/snsboardinsert" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mode" value="login"> 
		<input type="hidden" name="viewName" value="${viewName}">

		<div class="input">
			
			<div class="sns_content">
				<input type="text" id="sns_content" name="SNS_CONTENT" required="" class="xx-control" placeholder="내용">내용
			</div>
			<div class="member_number">
				<input type="text" id="member_number" name="MEMBER_NUMBER" required="" class="xx-control" placeholder="회원">회원
			</div>
			<div class="sns_image">
				<input type="file" id="sns_image" name="SNS_IMAGE">메인사진
			</div>
			
		</div>

		<button type="submit" class="button">
			<span class="button-label">글쓰기</span>
		</button>
	</form> -->
		
		<table>
		<tbody>
              
                   <table>
             
                    
                     <tr>
                    	 <td>
                           <fmt:formatDate value="${mgDetail.MG_REGDATE}" pattern="yyyy.MM.dd" />
                        </td>
                     </tr>
                     <tr>
                        <td>제목 : ${mgDetail.MG_TITLE}</td>
                     </tr>
                     
                     <tr>
                        <td>해쉬태그 : ${mgDetail.MG_HASHTAG}</td>
                     </tr>
                     
                     <tr>
                        <td>보관하기 : ${mgDetail.MG_COLLECTING}</td>
                     </tr>
                     
                     <tr>
                        <td>조회수 : ${mgDetail.MG_HITCOUNT}</td>
                     </tr>
                     
                     <tr>
                        <td>서브내용 : ${mgDetail.MG_CONTENT}</td>
                     </tr>
                    
                 </table>
                 
                 <table>
                     
                     <c:forEach items="${mgContentList}" var="mgContentList"  >
                     <c:if test="${mgDetail.MG_NUMBER eq mgContentList.MG_NUMBER}">
                     
                     <tr>${mgContentList.MG_IMAGE_CONTENT}</tr>
                     <tr><img src="/test/file/mgConFile/${mgContentList.MG_IMAGE}" width="60" height="60" ></tr>
                    
                     </c:if>
                     </c:forEach>
                        
    
                   		<%-- <div>
                   		<c:if test="${mgList.MG_TITLE_IMAGE eq null}">
                   		<td>사진없음</td>
                   		</c:if>
                   		<c:if test="${mgList.MG_TITLE_IMAGE ne null}">
                   		   <img src="/test/file/mgFile/${mgList.MG_TITLE_IMAGE}" width="60" height="60" >${mgList.MG_NUMBER}</td>
                   		</c:if>
                   		</td>
                   		</div> --%>
                   
                   
                   
                    </table>
		
					<table>
					<td colspan="3">
   					 <form name="magazinecm" action="magazineCM" method="post">
        				<input type="hidden" id="mg_number" name="MG_NUMBER" value="${mgDetail.MG_NUMBER}">
        				<!-- 세션 아이디 --> 
       					<input type="hidden" id="member_number" name="MEMBER_NUMBER" value="4"> 
        			<input type="text" id="mg_cm_content" name="MG_CM_CONTENT" >
        			<button type="submit">댓글등록</button>
        				<c:forEach items="${magazineCmList}" var="magazineCmList" >
        					<c:if test="${mgDetail.MG_NUMBER eq magazineCmList.MG_NUMBER}">
                   				<table>
                   					<td>${magazineCmList.MEMBER_NUMBER}</td>
                   					<td>${magazineCmList.MG_CM_CONTENT}</td>
                   					<td>${magazineCmList.MG_CM_REGDATE}</td>
                   				</table>
                   			</c:if>
                   		</c:forEach>
   					</form>
   					</td>
					</table>
                 
                  
               </tbody> 
               </table>
</body>
</html>