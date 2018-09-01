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

<!-- jQuery -->
<!-- <script src="js/snslist/jquery-1.9.1.min.js"></script>
Bootstrap Core JavaScript
<script src="js/snslist/bootstrap.min.js"></script>
Bootstrap Core CSS   
<link href="css/snslist/bootstrap.css" rel="stylesheet"> -->
<!-- BootsWatch Lumen CSS -->
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {   
	var mem_id = $(".mem_id").attr("id");
	var url = window.location.href;  /* 현재 url */
	$('#police').on('hide.bs.modal', function (e) {  /* 신고 모달페이지에서 취소나 x눌렀을 경우 돌아가는 페이지  */
		
		/* var trueLove = "사랑입니다.."; */
	});
	 $('#url').value = url;
});
  /* 모달에 각 sns_number를 전달해주는 매소드 */
function modal_view(sns_number) {
    $('#police').on('show.bs.modal', function (event) {
        $(".col-xs-12 #SNS_NUMBER").val(sns_number);
    });
  };
  
var article_seqJS = 0;
/* 좋아요 */
function likeReg(article_seq,like_count){ 
      var mem_id = $(".mem_id").attr("id");
      var likeCount = like_count+1;
      article_seqJS = article_seq;
      if(mem_id != "0"){
      $.ajax({
         type : 'post', 
         url : 'likeSNSReg',
         data: ({MEMBER_NUMBER:mem_id,SNS_NUMBER:article_seq}),
         success : function (data) {  
      	      /* 좋아요 클릭시 좋아요수 증가 */ 
      	      
      	    	 var html = likeCount+"명이 좋아합니다."  /* 증가된 좋아요 수를 출력 */
                 $('#likeCount'+article_seqJS).html(html);
      	      
      	   $('#like_img'+article_seqJS).attr({ /*빨간하트로 바꿔줌  */
      		   'src' : '/ModuHome/style/img/heart_on.png'
      	   });  
      	   
      	   $('#like_link'+article_seqJS).attr({ /* 링크를 좋아요취소기능으로 바꿈 */
      		   'onclick' : 'likeDel('+article_seqJS+','+likeCount+');'
      	     });
            }//success끝
        });//ajax끝
      }else{
    	  alert("로그인을 한 후 좋아요를 눌러주세요!");
      }
    };//likeReg끝
          
/* 좋아요취소 */
function likeDel(article_seq,like_count){
    var mem_id = $(".mem_id").attr("id");
    var likeCount = like_count-1;
      article_seqJS = article_seq;
      $.ajax({
          type : 'post', 
          url : 'likeSNSDel',
          data : ({MEMBER_NUMBER:mem_id, SNS_NUMBER:article_seq}),
          success: function (data){
        	  if(likeCount == 0){
        		  var html = "제일 먼저 좋아요를 눌러주세요!"  
                  $('#likeCount'+article_seqJS).html(html);
        	  }else{
        		  var html = likeCount+"명이 좋아합니다."  /* 감소된 좋아요 수를 출력 */
                  $('#likeCount'+article_seqJS).html(html);
        	  }
          	
          	$('#like_img'+article_seqJS).attr({
          		'src' : '/ModuHome/style/img/heart_off.png'
          	});
          	$('#like_link'+article_seqJS).attr({
          		'onclick' : 'likeReg('+article_seqJS+','+likeCount+');'
          	});
          }
      });
    };

function comment_Enroll(sns_number) {
    	var snsnumber = sns_number;
    	var member_number = $(".mem_id").attr("id");
    	var comment_content=document.getElementById("sns_cm_content"+snsnumber).value; 
    	var html="";
    	$.ajax({
    		type : 'post',
    	    url : 'snsCommentInsert',
    	    data : ({MEMBER_NUMBER:member_number,
    	    	     SNS_CM_CONTENT:comment_content,
    	    	     SNS_NUMBER:snsnumber
    	    	     }),
    	    success:function(data){
    	    	var cm_tb=$('#cm_table'+snsnumber);
    	    	 html += "<tr>"
    	    	     +   "<td><img src='/ModuHome/images/member/"+data.STORED_FILE_NAME+"' width='50px' style='border-radius: 50%; float: left; margin-right: 30px'></td>"
    	    	     +   "<td width='50'>"+data.MEMBER_ID+"</td>"
    	    	     +   "<td width='250'>"+comment_content+"</td>"
    	    	     +   "<tr>";
    	    	     cm_tb.prepend(html); 
    	    }
    	});
    };

</script>


</head>
<body>

<div style="display:none;" class="url" id="${url}">
</div>    
 
<div style="display:none;" class="mem_id" id="${MEMBER_NUMBER}">
</div> 

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
                <img src="/ModuHome/images/member/${snsList.STORED_FILE_NAME}" width="50px" style="border-radius: 50%; float: left; margin-right: 30px">
                <h6>${snsList.MEMBER_ID}</h6>
                <h6><fmt:formatDate value="${snsList.SNS_REGDATE}" pattern="yyyy.MM.dd" /></h6>
              </div>
              <!-- 내용 -->
              <div class="text" style="width:100%;">  
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
              
              <div class="text" style="width:100%; margin:0em 0;  margin-bottom: 0px;">
                
 
				<!-- 좋아요 하트   -->     
				<c:if test="${snsList.LIKER eq null }">
					<a class="likebtn" onclick="likeReg(${snsList.SNS_NUMBER},${snsList.SNS_LIKE});" id='like_link${snsList.SNS_NUMBER}'>
						<img src="/ModuHome/style/img/heart_off.png" alt="heart_img" width="20px" id='like_img${snsList.SNS_NUMBER}'>
					</a>
				</c:if>
                        
				<c:if test="${snsList.LIKER != null}">
					<a class="likebtn" onclick='likeDel(${snsList.SNS_NUMBER},${snsList.SNS_LIKE});' id="like_link${snsList.SNS_NUMBER}">
						<img src='/ModuHome/style/img/heart_on.png' alt='heart_img' width='20px' id="like_img${snsList.SNS_NUMBER}">
					</a>
				</c:if> 
							
				<!-- 좋아요수 출력 -->
				<c:if test="${snsList.SNS_LIKE eq 0}">
					<span id="likeCount${snsList.SNS_NUMBER}">제일 먼저 좋아요를 눌러주세요!</span>
				</c:if>
				<c:if test="${snsList.SNS_LIKE != 0}">
					<span id="likeCount${snsList.SNS_NUMBER}">${snsList.SNS_LIKE}명이 좋아합니다.</span>  
				</c:if>                 
                
                <!-- 신고하기 회원이 아닐경우 신고하기 버튼이 사라짐-->
                
                	<a href="#" class="btn btn-link" data-toggle="modal" data-target="#police" style="align:left; text-align:left; color:#5a5a5a;" onclick="modal_view('${snsList.SNS_NUMBER}');">
					<img src="/ModuHome/style/img/police.png" alt="article_police" style="width:25px;height:25px;" class="img-circle" />
				    </a>
                
						
                
              
              </div>
			
            <div class="text" style="width: 100%; background-color: #dedede;">
	            <form name="cm" method="post">
	        	<input type="hidden" id="sns_number" name="SNS_NUMBER" value="${snsList.SNS_NUMBER}">
	       		<input type="hidden" id="MEMBER_NUMBER" name="MEMBER_NUMBER" value="${sessionScope.MEMBER_NUMBER }">             
	            
                <input type="text" id="sns_cm_content${snsList.SNS_NUMBER}" name="SNS_CM_CONTENT" style="width:80%;" placeholder="댓글을 입력하세요!" class="cm_content${snsList.SNS_NUMBER}">
                <input type="button" value="댓글등록" id="comment_Enroll${snsList.SNS_NUMBER}" onclick="javascript:comment_Enroll(${snsList.SNS_NUMBER})">
			    </form> 
			    <table id="cm_table${snsList.SNS_NUMBER}">
        			<c:forEach items="${snsCommentList}" var="snsCommentList" >
        				<c:if test="${snsList.SNS_NUMBER eq snsCommentList.SNS_NUMBER}">
                   			  <tr>
                   			     <td><img src='/ModuHome/images/member/${snsCommentList.STORED_FILE_NAME}' width='50px' style='border-radius: 50%; float: left; margin-right: 30px'></td>
    	    	                 <td width='50'>${snsCommentList.MEMBER_ID}</td>
    	    	                 <td width='250'>${snsCommentList.SNS_CM_CONTENT}</td>
    	    	              </tr> 	    	                              			
                   		</c:if>
                   	</c:forEach>   
                  </table>   
            </div>    
        
           </div> 
            
            </c:forEach>
          </div>

          <div class="col-md-2"></div>
        </div>
      </div>
    </section>



 <div class="modal fade bs-example-modal-sm police" id="police" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm" style="width:500px;">
    <div class="modal-content">
     <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
        <div class="modal-title" style="height:20px;">
        	<div class="container-fluid">
        		<div class="col-xs-6" style="align:left; text-align:left;"><h5 style="font:맑은고딕;"><strong>게시글 신고</strong></h5></div>
	        	<div class="col-xs-6" style="align:right; text-align:right;">
	        		<!-- <a href="#" data-dismiss="modal">
	        			<img src="/style/resources/images/main/del_img.png" alt="del_img" style="height:60%;" />
					</a>	 -->										        	
	        	</div>
        	</div>
        </div>
     </div>
	  <form action="<c:url value="/policeReg"/>" method="post" class="form-horizontal" enctype="multipart/form-data">
      <div class="modal-body">
      	<div class="container-fluid">
		    <div class="row">
		        <div class="col-xs-12" style="text-align:left;align:left;" > 
           			<div style="min-height:200px;">
                        <div class="col-xs-12">
		        			<Strong>신고 내용</Strong>		        		   				
		        				<input type="hidden" name="MEMBER_NUMBER" value="${MEMBER_NUMBER}" id="MEMBER_NUMBER" />
     							<input type="hidden" name="SNS_NUMBER" value="${SNS_NUMBER}" id="SNS_NUMBER" />
     							<input type="hidden" name="url" value="${url}" id="url"/>
					   	    	<textarea class="form-control" rows="14" id="POLICE_CONTENT" name="POLICE_CONTENT" ></textarea>					        
				   		</div>
		        	</div>
		        </div>
		    </div>
	  	</div>
	  </div>
      <div class="modal-footer">
      	<div class="form-group">
	      <div class="col-xs-12" style="text-align:right;">
	        <button type="submit" class="btn btn btn-warning" ><Strong>등록</Strong></button>
	        <a href="#" class="btn btn-default" data-dismiss="modal" ><Strong>&nbsp;&nbsp;취소&nbsp;&nbsp;</Strong></a>
	      </div>
	    </div>   
      </div>
	  </form>
    </div>
  </div>
</div>


</body>

</html>