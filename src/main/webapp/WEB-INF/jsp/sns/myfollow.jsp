<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>first</title>
</head>
<body>

    <section class="flexslider">
      <ul class="slides">
        <li style="background-image: url(img/slider_1.jpg)" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
                <div class="probootstrap-slider-text text-center">
                  <h1 class="probootstrap-heading">마이페이지 - 팔로우</h1>
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
            
			<c:if test="${memberModel.MEMBER_NUMBER != sessionScope.MEMBER_NUMBER}">
				<a href='#' onclick='follow("${memberModel.MEMBER_NUMBER }");' id="follow_btn" >
					<c:if test="${follow_exist == 0 }">
						<img src="/ModuHome/style/img/follow_btn.png" alt="follow_btn" style="width:100px;" />
					</c:if>
			        					
					<c:if test="${follow_exist == 1 }">
						<img src="/ModuHome/style/img/following_btn.png" alt="following_btn" style="width:100px;" />
					</c:if>
				</a>
			</c:if>
            
            
            
            <h3>${memberModel.MEMBER_NICKNAME }님 반갑습니다~</h3>
            
              <div class="col-md-6 probootstrap-animate">
                <h3>팔로우</h3>
                <a href="#" onclick="followModal('followerList');" id="mini_follow_quantity" style='font-family:나눔고딕,san-serif;font-size:12px;color:#555555;text-decoration:none;' >${follow_quantity }</a>
                <h3>20</h3>
              </div>
              <div class="col-md-6 probootstrap-animate">
                <h3>팔로우</h3>
                <a href="#" onclick="followModal('followingList');" id="mini_following_quantity" style='font-family:나눔고딕,san-serif;font-size:12px;color:#555555;text-decoration:none;' >${following_quantity }</a>
                <h3>20</h3>
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


</body>

<script type="text/javascript">
var state = "style";
var handler = null;
var isLoading = false;
var contNum = 1;
var follow_target ="";
var load_mem_id = $(.load_mem_id).attr(id);
/* 
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
  var mem_id = $(".mem_id").attr("MEMBER_NUMBER");
  $.ajax({
		type : 'post', 
		url : 'followerViewData.do',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'json',
		data : JSON.stringify({
			following_id : load_mem_id
		}),
		success: setfollowerData
  });
};

function loadfollowingData() {
  var mem_id = $(".mem_id").attr("MEMBER_NUMBER");
  $.ajax({
		type : 'post', 
		url : 'followingViewData.do',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'json',
		data : JSON.stringify({
			follow : load_mem_id
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
} */

function follow(load_mem_id){
  var mem_id = $(.mem_id).attr(id)
  $.ajax({
	  	type : 'post', 
		url : 'followDo',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'json',
		data : JSON.stringify({
			follow : mem_id,
			following : load_mem_id
		}),
		success: follow_ok
  });
};

function follow_ok(data){
	var html = "";
	var dual = "";
	if(data == 1){
		dual = parseInt($('#follow_quantity').text())+1;
		html=	"<img src='/ModuHome/style/img/following_btn.png' alt='following_btn' style='width:100px;' />"
	}
	if(data == 0){
		dual = parseInt($('#follow_quantity').text())-1;
		html=	"<img src='/ModuHome/style/img/follow_btn.png' alt='follow_btn' style='width:100px;' />"
	}

	$('#follow_quantity').text(dual);
	$('#mini_follow_quantity').text(dual);
	$('#follow_btn').html(html);
}
	

</script>

</html>