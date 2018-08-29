<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>first</title>

<script type="text/javascript">


$(document).ready(function() {   
	var mem_id = $(".mem_id").attr("id");
	var url = window.location.href;  /* 현재 url */
	$('#police').on('hide.bs.modal', function (e) {  /* 취소나 x눌렀을 경우 돌아가는 페이지  */
		location.href = url;  
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
    function likeReg(article_seq,like_count){
      var mem_id = $(".mem_id").attr("id");
      var likeCount = like_count+1;
      article_seqJS = article_seq;
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
         }
      });
    };
          

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


</script>

</head>
<body>

<div style="display:none;" class="url" id="${url}">
</div>    
 
<div style="display:none;" class="mem_id" id="${MEMBER_NUMBER}">
</div> 
    
    <section class="probootstrap-section probootstrap-bg-white">
      <div class="container">
		
		
        <!-- END row -->
        <div class="row">
          <div class="col-md-2"></div>
        
          <div class="col-md-8">			
            <c:forEach items="${snsList}" var="snsList">

            <div class="probootstrap-service-2 probootstrap-animate">
              <div class="text" style="width:100%;">
                <img src="/ModuHome/style/img/img_sm_1.jpg" width="50px" style="border-radius: 50%; float: left; margin-right: 30px">
                <h6>${snsList.MEMBER_NUMBER }</h6>
                <h6><fmt:formatDate value="${snsList.SNS_REGDATE}" pattern="yyyy.MM.dd" /></h6>
              </div>
              <div class="text" style="width:100%;">  
                <p>${snsList.SNS_CONTENT}</p>
              </div>

              <div class="text" style="width:100%;"> 
				<c:if test="${snsList.SNS_IMAGE ne null}">
					<img src="/ModuHome/images/snsMain/${snsList.SNS_IMAGE}" width="60" height="60" >
				</c:if>
              </div>
              
              <div class="text" style="width:100%; margin:0em 0;  margin-bottom: 0px;">
           
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