<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>uiCookies:FineOak &mdash; Free Bootstrap Theme, Free Responsive Bootstrap Website Template</title>
    <meta name="description" content="Free Bootstrap Theme by uicookies.com">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
    <link href="https://fonts.googleapis.com/css?family=Bellefair|Open+Sans" rel="stylesheet">
    <link rel="stylesheet" href="/ModuHome/style/css/styles-merged.css">
    <link rel="stylesheet" href="/ModuHome/style/css/style.css">
    <!--[if lt IE 9]>
      <script src="/moduhome/style/js/vendor/html5shiv.min.js"></script>
      <script src="/moduhome/style/js/vendor/respond.min.js"></script>
    <![endif]-->
    
    <!-- css의 경로는 artifact를 따라가게 된다. 프로젝트 ㅇ이름은 moduhome_member이지만 moduhome으로 써줘여함 -->
</head>
<body>
 
    <nav class="navbar navbar-default navbar-fixed-top probootstrap-navbar" >
      <div class="container" style="margin-top:0px;">
         <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/ModuHome/home" title="uiCookies:FineOak">FineOak</a>
        </div>

        <div id="navbar-collapse" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/ModuHome/mglist">매거진</a></li>
            <li><a href="/ModuHome/goods">스토어</a></li>  
            <li><a href="/ModuHome/gllist">사진</a></li>
            <li><a href="/ModuHome/snslist">스토리</a></li>
            <!-- <li><a href="/ModuHome/searchForm">검색</a></li> -->
            <li class="dropdown">
            
            <c:if test="${sessionScope.MEMBER_NUMBER == null }">
				<a href="/ModuHome/loginForm">로그인</a>
				
            </c:if>
            <c:if test="${sessionScope.MEMBER_NUMBER != null }">
				<a href="#" data-toggle="dropdown" class="dropdown-toggle">${sessionScope.MEMBER_NAME}님!</a>
            </c:if>      
              
              <ul class="dropdown-menu">
              <c:if test="${sessionScope.MEMBER_NUMBER == null }">
				<li><a href="/ModuHome/joinForm">회원가입</a></li>
				<li><a href="/ModuHome/noticeList">공지사항</a></li>
				<li><a href="/ModuHome/faqList">FAQ</a></li>
            </c:if>
            <c:if test="${sessionScope.MEMBER_NUMBER != null }">
                <!-- <li><a href="/ModuHome/myalarm">알람확인하기</a></li> -->
            	<c:if test="${sessionScope.MEMBER_ADMIN eq 0 }">      
                <li><a href="/ModuHome/myHome">마이페이지</a></li>            	
                </c:if>
				<c:if test="${sessionScope.MEMBER_ADMIN eq 1 }">
                <li><a href="/ModuHome/admin/adminPage">관리자페이지</a></li> 
				</c:if>
				<li><a href="/ModuHome/noticeList">고객센터</a></li>
				<!-- <li><a href="/ModuHome/faqList">FAQ</a></li> -->
                <li><a href="/ModuHome/logout">로그아웃</a></li>
            </c:if>  
      <%--           <li><a href="/ModuHome/mycollecting?MG_NUMBER=21">마이페이지-보관지우기 테스트</a></li>
                <li><a href="/ModuHome/myalarm">알람확인하기</a></li>

            	<c:if test="${sessionScope.MEMBER_ADMIN eq 0 }">      
                <li><a href="/ModuHome/myHome">마이페이지</a></li>            	
                </c:if>
				<c:if test="${sessionScope.MEMBER_ADMIN eq 1 }">
                <li><a href="/ModuHome/admin/adminPage">관리자페이지</a></li> 
				</c:if>
                <li><a href="/ModuHome/logout">로그아웃</a></li> --%>
              </ul>
            </li>

            <!-- 장바구니 -->
            <li style="margin-left: 150px;">
				<a href="/ModuHome/cart/cartList">
					<span class="my_menu"> 
						<img src="/ModuHome/style/img/i_pc_cart.png" alt="arlam_img" style="width:33px;height:31px;" />
					</span>
				</a>            
            </li>    
            
            <!-- 검색관련 -->
            <li>
				<a href="/ModuHome/searchForm">
					<span class="my_menu">
						<img src="/ModuHome/style/img/i_pc_search.png" alt="arlam_img" style="width:33px;height:31px;" />
					</span>
				</a>            
            </li>         
                        
            <!-- 여기부터 알람관련코드 -->
            <li style="padding-top: 0px;">
							<!-- <div class="btn-group"> -->
							  
							<a href="#" class="#" data-toggle="dropdown" aria-expanded="false">
							  	<span class="my_menu">
							  		<img src="/ModuHome/style/img/ring.png" alt="arlam_img" style="width:33px;height:31px;" class="img-circle" />
							  	</span>
							  	<span class="badge">
								  	<c:if test="${fn:length(sessionScope.session_mem_alarm) > 99}">
								  		99+
								  	</c:if>
								  	<c:if test="${fn:length(sessionScope.session_mem_alarm) <= 99}">
							  			${fn:length(sessionScope.session_mem_alarm)}
								  	</c:if>
							  	</span>
							</a>
							  <ul class="dropdown-menu pull-right " style="position:absolute; top:120%;max-height:200px;width:180px;overflow-y:auto;">
								  <c:forEach items="${sessionScope.session_mem_alarm }" var="alarm">
								    <li>
								    	<table style="width:100%"><tr><td style="padding:5px;border-bottom:solid 1px #e3e3e3;">
								    	
									    	<c:if test="${alarm.alarm_index_no == 1 }">
									    		<a href="alarmRead?alarm_seq=${alarm.alarm_seq }" style="text-decoration:none;color:#555555;font-size:10px;">작성한 스토리에 <strong>${alarm.alarm_reg_id }</strong> 님이 좋아요를 눌렀습니다.</a>
									    	</c:if>
									    	
									    	<c:if test="${alarm.alarm_index_no == 2 }">
									    		<a href="alarmRead?alarm_seq=${alarm.alarm_seq }" style="text-decoration:none;color:#555555;font-size:10px;"><strong>${alarm.alarm_reg_id }</strong> 님이 회원님을 팔로우 했습니다.</a>
									    	</c:if>
									    	
									    	<c:if test="${alarm.alarm_index_no == 3 }">
									    		<a href="alarmRead?alarm_seq=${alarm.alarm_seq }" style="text-decoration:none;color:#555555;font-size:10px;">작성한 스토리에 <strong>${alarm.alarm_reg_id }</strong> 님이 댓글을 달았습니다.</a>
									    	</c:if>
									    	
									    	<c:if test="${alarm.alarm_index_no == 4 }">
									    		<a href="alarmRead?alarm_seq=${alarm.alarm_seq }" style="text-decoration:none;color:#555555;font-size:10px;">내가 팔로우 한 사람이 <strong>${alarm.alarm_reg_id }</strong> 새 스토리를썼다</a>
									    	</c:if>
									    	
								    	</td></tr></table>
								  	</li>
								  </c:forEach> 
							  </ul>
							<!-- </div>  -->           
            </li>
            

            
            
            
          </ul>
        </div>
      </div>
    </nav>

</body>
</html>
