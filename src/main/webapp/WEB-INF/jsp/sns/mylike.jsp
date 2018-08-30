<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>first</title>

</head>
<body>

<div style="display:none;" class="Session_mem_id" id="${mem_id}">
</div>
<%-- <div style="display:none;" class="mem_id" id="${sessionScope.MEMBER_NUMBER}">
</div> --%>


    <section class="flexslider">
      <ul class="slides">
        <li style="background-image: url(/ModuHome/style/img/slider_1.jpg)" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
                <div class="probootstrap-slider-text text-center">
                  <h1 class="probootstrap-heading">좋아요테스트</h1>
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
          <div class="col-md-6 col-md-offset-3 text-center section-heading probootstrap-animate">
			
			<tr>
                        <td style='width:25%;vertical-align:middle;align:center;text-align:center;'id='like_img${article_seq}'>
                        <c:if test="${like_exist == 0 }">
                           <center><a class="likebtn" onclick="likeReg(${article_seq},${like_count});" id="like_link">
                              <img src="/ModuHome/style/img/heart_off.png" alt="heart_img" width="20px" id="like_img">
                           </a></center>
                        </c:if>
                        <c:if test="${like_exist != 0 }">
                           <center><a class="likebtn" onclick='likeDel(${article_seq});' id="like_link">
                              <img src='/ModuHome/style/img/heart_on.png' alt='heart_img' width='20px' id="like_img">
                           </a></center>
                        </c:if>
                        </td>
                              
            </tr>
            <div class="col-md-12 probootstrap-animate">
            <h3>가딱님의 게시물</h3>
                <h3>좋아요 수</h3>
                <h3><a href="/ModuHome/MemberdeleteForm">회원탈퇴</a></h3>
                <div id="like_count2">
                <h3 id="like_count">${like_count}</h3>
                </div>
              
              </div>

              <a href="/ModuHome/main" >메인으로</a>
          </div>
        </div>
        <!-- END row -->
        <div class="row mb40">
          <div class="col-md-6 probootstrap-animate">
            <p></p>
          </div>
          <div class="col-md-6 probootstrap-animate">
            <p></p>
          </div>
        </div>
        <!-- END row -->

      </div>
    </section>
  <script>
  
  var article_seqJS = 0;
  function likeReg(article_seq,like_count){
    var mem_id = $(".Session_mem_id").attr("id");
    article_seqJS = article_seq;
    $.ajax({
       type : 'post', 
       url : 'likeSNSReg',
       data: ({MEMBER_NUMBER:mem_id,SNS_NUMBER:article_seq}),
       success : function (data) {  
    	      /* 좋아요 클릭시 좋아요수 증가 */ 
             var html = "<h3 id='like_count'>"+data+"</h3>"  /* 증가된 좋아요 수를 출력 */
             $('#like_count2').html(html);
             
    	   $('#like_img').attr({ /*빨간하트로 바꿔줌  */
    		   'src' : '/ModuHome/style/img/heart_on.png'
    	   });  
    	   
    	   $('#like_link').attr({ /* 링크를 좋아요취소기능으로 바꿈 */
    		   'onclick' : 'likeDel(${article_seq});'
    	   });
       }
    });
  };
        

  function likeDel(article_seq){
    var mem_id = $(".Session_mem_id").attr("id");
    article_seqJS = article_seq;
    $.ajax({
        type : 'post', 
        url : 'likeSNSDel',
        data : ({MEMBER_NUMBER:mem_id, SNS_NUMBER:article_seq}),
        success: function (data){
        	 var html = "<h3 id='like_count'>"+data+"</h3>"  /* 감소된 좋아요 수를 출력 */
             $('#like_count2').html(html);
        	
        	$('#like_img').attr({
        		'src' : '/ModuHome/style/img/heart_off.png'
        	});
        	$('#like_link').attr({
        		'onclick' : 'likeReg(${article_seq});'
        	});
        }
    });
  };

  
  </script>


</html>