<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  


<!DOCTYPE html>
<html lang="ko">
<head>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
</head>
<body>

    <section class="flexslider">
      <ul class="slides">
        <li style="background-image: url(/ModuHome/style/img/notice.jpg)" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
                <div class="probootstrap-slider-text text-center">
                  <h1 class="probootstrap-heading" style="font-size: 60px;"><span><strong>공지사항</strong></span></h1>
                </div>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </section>	
	
    <section class="probootstrap-section probootstrap-bg-white">
      <div class="container">
        <div class="row">
          <div class="col-md-2 probootstrap-animate"></div>

          <div class="col-md-8 probootstrap-animate">
            <form action="#" method="post" class="probootstrap-form">

              <table width="100%" style="margin-bottom: 30px;">
                <thead style="background-color: #85c8dd; color:#fff;">
                  <tr style="height: 40px" align="center">
                    <td width="10%" style="font-weight: bold">글번호</td>
                    <td width="45%" style="font-weight: bold">제목</td>
                    <td width="10%" style="font-weight: bold">조회수</td>
                    <td width="25%" style="font-weight: bold">작성일</td>                                                            
                  </tr>
                </thead>
                <tbody>
				<c:choose>
					<c:when test="${fn:length(noticeList) > 0 }">
						<c:forEach items="${noticeList }" var="noticeList">   
							<tr style="height: 40px" align="center">
			                    <td width="10%">${noticeList.NOTICE_NUMBER}</td>
			                    <td width="45%">
			                    	<a href="#this" name="NOTICE_TITLE">${noticeList.NOTICE_TITLE }</a>
									<input type="hidden" id="NOTICE_NUMBER" value="${noticeList.NOTICE_NUMBER }">
								</td>
			                    <td width="10%">${noticeList.NOTICE_HITCOUNT}</td> 	
			                    <td width="25%">${noticeList.NOTICE_REGDATE }</td>
	                  		</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" align="center">조회된 결과가 없습니다</td>
						</tr>
					</c:otherwise>			
				</c:choose>		
                </tbody>     
              </table>

              <table align="center">
                <tr>
                <c:if test="${sessionScope.MEMBER_ADMIN eq 1}">
                  <td><input type="button" class="btn btn-primary btn-lg" id="write" name="#this" value="글쓰기"></td>
                </c:if> 
                </tr>
              </table>
            </form>
          </div>

          <div class="col-md-2 probootstrap-animate"></div>

        </div>
      </div>
    </section>  	
	
	
<form id="commonForm" name="commonForm"></form>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#write").on("click", function(e){
				e.preventDefault();
				fn_openBoardWrite();
			});
			
			$("a[name='NOTICE_TITLE']").on("click", function(e){
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});
		
		function fn_openBoardWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/noticeWriteForm'/>");
			comSubmit.submit();
		}
		
		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/noticeDetail'/>");
			comSubmit.addParam("NOTICE_NUMBER", obj.parent().find("#NOTICE_NUMBER").val());
			comSubmit.submit();
		}
	
	</script>
	
</body>
</html>