<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>통합검색</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free Bootstrap Theme by uicookies.com">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
    <link href="https://fonts.googleapis.com/css?family=Bellefair|Open+Sans" rel="stylesheet">
    <link rel="stylesheet" href="/ModuHome/style/css/styles-merged.css">
    <link rel="stylesheet" href="/ModuHome/style/css/style.min.css">

 <!--  <script src="/ModuHome/search/js/scripts.min.js"></script>
  <script src="/ModuHome/search/js/main.min.js"></script>
  <script src="/ModuHome/search/js/custom.js"></script> -->

</head>
<body>

<div class="col-md-12" style="background-color:#85C8DD; height: 80px; width: 100%; margin: 0px 0px 150px 0px;">
</div>

<!-- <section class="flexslider">
      <ul class="slides">
        <li style="background-image: url(/ModuHome/style/img/search.jpg)" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
              
                <div class="probootstrap-slider-text text-center" style=" margin-top:300px;">
                  <h1 class="probootstrap-heading" style="font-size: 100px;"><span><strong>search</strong></span></h1>
                </div>
         
              </div>

            </div>

          </div>
        </li>
      </ul>
</section>
             <div class="col-md-12 text-center">
         			마이페이지 주문내역 활동내역 회원정보
         	</div>  -->




<section class="probootstrap-section probootstrap-bg-white">
	<div class="container" >
    	<div class="row">
        	<div class="col-md-12 text-center section-heading probootstrap-animate"	data-animate-effect="fadeIn">
         		<div class="col-md-12 probootstrap-animate">
         			
         			<div class="col-md-12 text-center" style="height: 100%; width: 100%; border:5px solid #85C8DD;">
         				
         				<div class="col-md-4"></div>
         				<div class="col-md-4">
	        			  <img src="/ModuHome/style/img/img_sm_3.jpg" style="border-radius: 50%; width: 200px; height: 200px; margin-top: 20px; ">
						</div>
						<div class="col-md-4"></div>
						
						<div class="col-md-12" style="margin:20px 0px 20px 0px; font-size=20px; ">${sessionScope.MEMBER_NUMBER }님</div>
						
						<div class="col-md-12">
             				<div class="mypage-box"  align="center">
                			<li style="list-style: none;">

							<div class="col-md-3"  ></div>
                   			<div class="col-md-3">
                     		<div style="font-size: 20px">팔로우</div>
                     		<div><a onclick="followModal('followingList');" id="follow_quantity" style='font-family:나눔고딕,san-serif;font-size:12px;color:#555555;text-decoration:none;' >${follow_quantity }</a></div>
                   			</div>  
                    		<div class="col-md-3">
                      		<div style="font-size: 20px">팔로잉</div>
                      		<div><a onclick="followModal('followerList');" id="following_quantity" style='font-family:나눔고딕,san-serif;font-size:12px;color:#555555;text-decoration:none;' >${following_quantity }</a></div>
                    		</div>
                    		<div class="col-md-12" style=" margin-top: 10px;">
								<c:if test="${memberModel.MEMBER_NUMBER != sessionScope.MEMBER_NUMBER}">
									<a onclick='follow("${memberModel.MEMBER_NUMBER }");' id="follow_btn" >
							
									<c:if test="${follow_exist == 0 }">
										<img src="/ModuHome/style/img/follow_btn.png" alt="follow_btn" style="width:100px;" />
									</c:if>
						        					
									<c:if test="${follow_exist == 1 }">
										<img src="/ModuHome/style/img/following_btn.png" alt="following_btn" style="width:100px;" />
									</c:if>
									</a>
								</c:if>                   
                    		</div>
                  			</li>
              				</div>
         				 </div>
						
						<div class="col-md-12" style="margin:20px 0px 80px 0px;">
							<div class="col-md-3 text-center ">
							<div style="font-size:20px;"><strong><a href="/ModuHome/gllist">주문내역<br/></a></strong></div>
							</div>
							
							<div class="col-md-3 text-center ">
							<div style="font-size:20px;"><strong><a href="/ModuHome/gllist">활동내역<br/></a></strong></div>
							</div>
							
							<div class="col-md-3 text-center ">
							<div style="font-size:20px;"><strong><a href="/ModuHome/gllist">회원정보<br/></a></strong></div>
							</div>
							
							<div class="col-md-3 text-center ">
							<div style="font-size:20px;"><strong><a href="/ModuHome/gllist">게시판<br/></a></strong></div>
							</div>
							
							<div class="col-md-12 "><hr style="border:solid 1px #85C8DD; "></div>
						
							<div class="col-md-3 text-center ">
							<a href="/ModuHome/gllist">test1<br/></a>
							<a href="/ModuHome/gllist">test2<br/></a>
							</div>
							
							<div class="col-md-3 text-center" >
							<a href="/ModuHome/gllist">장바구니<br/></a>
							<a href="/ModuHome/gllist">내 스토리<br/></a>
							<a href="/ModuHome/gllist">보관함<br/></a>
							</div>

							<div class="col-md-3 text-center">
							<a href="/ModuHome/gllist">회원정보수정<br/></a>
							<a href="/ModuHome/gllist">탈퇴<br/></a>
							</div>     
							
							<div class="col-md-3 text-center">
							<a href="/ModuHome/gllist">공지사항<br/></a>
							<a href="/ModuHome/gllist">FAQ<br/></a>
							</div>
							
				

      				  </div>
      					
      					
      					<!-- <div class="col-md-12 text-left">주문내역</div>
      					<div class="col-md-12 "><hr style="border:solid 1px #85C8DD; "></div>

      					<div class="col-md-12" style="margin-bottom:20px;">
      					
      					주문내역내용
      					
      					</div> -->
					
					
					</div>
         			</div>
          		</div>
			</div>
    	</div>
	</div>
</section>

</body>

<script type="text/javascript">
var state = "style";
var handler = null;
var isLoading = false;
var contNum = 1;
var follow_target ="";
var load_mem_id = parseInt($(".load_mem_id").attr("id"));

function followModal(state){
	if(state == 'followerList'){
		loadfollowerData();
		$("#follow_sub").text("팔로워");
		$('#follow').modal('show');
	}
	if(state == 'followingList'){
		loadfollowingData();
		$("#follow_sub").text("팔로잉");
		$('#follow').modal('show');
	}
}

function loadfollowerData() {
  var load_mem_id = parseInt($(".load_mem_id").attr("id"));
  $.ajax({
		type : 'post', 
		url : 'followerViewData',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'json',
		data : JSON.stringify({
			follow : load_mem_id
		}),
		success: setfollowerData
  });
};

function loadfollowingData() {
  var load_mem_id = parseInt($(".load_mem_id").attr("id"));
  $.ajax({
		type : 'post', 
		url : 'followingViewData',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'json',
		data : JSON.stringify({
			following : load_mem_id
		}),
		success: setfollowingData
  });
};

function setfollowerData(data) {

  var html = '';
  if(data != null){
		$(data).each(
			function(){
				console.log(this);
					
				html+=	"<tr>"
				    +     	"<td style='height:40px;width:20%;vertical-align:middle;align:middle;text-align:middle;'>"
				    + 			"<img src='/style/resources/images/mem_prof/"+this.prof_img+"' alt='prof_img' style='width:33px;height:31px;' class='img-circle' />"
				    + 		"</td>"
				    + 		"<td style='height:40px;width:60%;vertical-align:top;align:left;text-align:left;'>"
				    + 			"<a  href='/style/myPageLikeCol.do?mem_id="+this.follow_id+"' style='font-size:12px;font-weight:bold;color:#555555;font-family:나눔고딕;'>"+this.nickname+"</a><br>"
				    + 			"<font style='font-size:11px;color:#555555;'>"+this.intro+"</font>"
				    + 		"</td>"
				    + 		"<td style='height:40px;width:20%;vertical-align:middle;align:center;text-align:center;'>"
				    +			"<a href='#' onclick='followM(\""+this.follow_id+"\");' id='list_follow_btn"+this.follow_id+"' >"
					if(this.follow_to != 0){
					html+=			"<img src='/style/resources/images/main/followList_del.png' alt='followList_Del' width='40px'>"
					}
					if(this.follow_to == 0){
					html+=			"<img src='/style/resources/images/main/followList_reg.png' alt='followList_Reg' width='40px'>"
					}
				    html+=		"</a>"	
		   		 	+		"</td>"
				    + 	"</tr>";
			}	
		);
		  $('#follow_table').html(html);
	}
};

function setfollowingData(data) {
  var html = '';
  if(data != null){
		$(data).each(
			function(){
				console.log(this);
					
				html+=	"<tr>"
				    +     	"<td style='height:40px;width:20%;vertical-align:middle;align:middle;text-align:middle;'>"
				    + 			"<img src='/style/resources/images/mem_prof/"+this.prof_img+"' alt='prof_img' style='width:33px;height:31px;' class='img-circle' />"
				    + 		"</td>"
				    + 		"<td style='height:40px;width:60%;vertical-align:top;align:left;text-align:left;'>"
				    + 			"<a  href='/style/myPageLikeCol.do?mem_id="+this.following_id+"' style='font-size:12px;font-weight:bold;color:#555555;font-family:나눔고딕;'>"+this.nickname+"</a><br>"
				    + 			"<font style='font-size:11px;color:#555555;'>"+this.intro+"</font>"
				    + 		"</td>"
				    + 		"<td style='height:40px;width:20%;vertical-align:middle;align:center;text-align:center;'>"
				    +			"<a href='#' onclick='followM(\""+this.following_id+"\");' id='list_follow_btn"+this.following_id+"' >"
					if(this.follow_to != 0){
					html+=			"<img src='/style/resources/images/main/followList_del.png' alt='followList_Del' width='40px'>"
					}
					if(this.follow_to == 0){
					html+=			"<img src='/style/resources/images/main/followList_reg.png' alt='followList_Reg' width='40px'>"
					}
				    html+=		"</a>"	
		   		 	+		"</td>"
				    + 	"</tr>";
			}	
		);
		  $('#follow_table').html(html);
	}
};


function followM(follow_id){
  var mem_id = $(".mem_id").attr("id");
  follow_target = follow;
  $.ajax({
	  	type : 'post', 
		url : 'followDo.do',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'json',
		data : JSON.stringify({
			follow : mem_id,
			following : follow
		}),
		success: followM_ok
  });
};

function followM_ok(data){
	var html = "";
	if(data == 1){
		html=	"<img src='/style/resources/images/main/followList_del.png' alt='followList_Del' width='40px'>"
	}
	if(data == 0){
		html=	"<img src='/style/resources/images/main/followList_reg.png' alt='followList_Reg' width='40px'>"
	}
	$('#list_follow_btn'+follow_target).html(html);
}

 function follow(load_mem_id){
	var mem_id = parseInt($(".mem_id").attr("id"))
	$.ajax({
		type : 'post', 
		url : 'followDo',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'json',
		data : JSON.stringify({
			follow : load_mem_id,
			following : mem_id
		}),
		success: follow_ok
	});
};


function follow_ok(data){
	var html = "";
	var dual = "";
	if(data == 1){
		dual = parseInt($('#following_quantity').text())+1;
		html=	"<img src='/ModuHome/style/img/following_btn.png' alt='following_btn' style='width:100px;' />"
	}
	if(data == 0){
		dual = parseInt($('#following_quantity').text())-1;
		html=	"<img src='/ModuHome/style/img/follow_btn.png' alt='follow_btn' style='width:100px;' />"
	}

	$('#following_quantity').text(dual);
	$('#mini_follow_quantity').text(dual);
	$('#follow_btn').html(html);
}
	

</script>

</html>