<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>first</title>
</head>
<body>

    <section class="probootstrap-section probootstrap-bg-white">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-md-offset-3 text-center section-heading probootstrap-animate" data-animate-effect="fadeIn">
            <h2>내가 보관한 매거진</h2>
          </div>
        </div>

        <!-- END row -->

        <div class="row">

		 	<c:forEach items="${mgMycollectList}" var="mgMycollectList">         
				<form>
				<c:url var="viewURL" value="mgDetail">
					<c:param name="MG_NUMBER" value="${mgMycollectList.MG_NUMBER}" />           
				</c:url>
		
		          <div class="col-md-4">
		            <div class="probootstrap-service-2 probootstrap-animate">
		              <div class="image" style="width: 100%">
		                  <img src="/ModuHome/images/mgMain/${mgMycollectList.MG_TITLE_IMAGE}" style="width: 100%;" height="350px">
		              </div>
		              <div class="text" style="width: 100%">
		                <a href="${viewURL}">${mgMycollectList.MG_TITLE }</a>
		                <!-- <span onClick="star.dehashtag(this);">아이구</sapn> -->
		                <h6>#아이구</h6>
		              </div>
		            </div> 		          
		          </div>
				</form>
		 	</c:forEach>        
        </div>
      </div>
    </section>

</body>
</html>