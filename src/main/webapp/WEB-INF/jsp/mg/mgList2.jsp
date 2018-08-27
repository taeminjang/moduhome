<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>매거진</title>
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
				
                   <c:forEach items="${mgList}" var="mgList">
                   
                   
                   <table>
                   <form>
                     <c:url var="viewURL" value="mgDetail">
                        <c:param name="MG_NUMBER" value="${mgList.MG_NUMBER}" />
                       
                     </c:url>
                     <tr>
                        <td>${mgList.MG_NUMBER }</td>
                        <td>${mgList.MEMBER_NUMBER }</td>
                     	<td><a href="${viewURL}">${mgList.MG_TITLE }</a></td>
                       	<td>
                           <fmt:formatDate value="${mgList.MG_REGDATE}" pattern="yyyy.MM.dd" />
                        </td>
                   		<td>
                   		<div>
                   		<c:if test="${mgList.MG_TITLE_IMAGE eq null}">
                   		<td>사진없음</td>
                   		</c:if>
                   		<c:if test="${mgList.MG_TITLE_IMAGE ne null}">
                   		   <img src="/ModuHome/images/mgMain/${mgList.MG_TITLE_IMAGE}" width="60" height="60" >${mgList.MG_NUMBER}</td>
                   		</c:if>
                   		</td>
                   		</div>
                        </tr>
                     </form>
                     </div>
                    
                    </table>
                    
                 
		
					<%-- <table>
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
					</table> --%>
                  </c:forEach>
                  
                  
                      <form name="magazine" action="mgInsertForm" method="post">
                     	<button type="submit" class="button">
							<span>매거진등록</span>
						</button>
                     </form>
               </tbody> 
               </table>
</body>
</html>