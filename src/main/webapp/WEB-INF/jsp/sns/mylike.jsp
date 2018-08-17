<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
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
			<td id='like_img'>
				<a href='#' onclick='likeReg();' >
					<img src='/ModuHome/style/img/heart_off.png' alt='heart_img' width='20px' >
				</a>
			</td>
			
			
				<!-- <a href='#' onclick='likeDel();' >
					<img src='/ModuHome/style/img/heart_on.png' alt='heart_img' width='20px'>
				</a>
			 -->
            
            <h3>예딱이님 반갑습니다~</h3>
              <div class="col-md-12 probootstrap-animate">
                <h3>좋아요 수</h3>
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
  <script>
  function likeReg(){
		  
		  $.ajax({
			  	type :"POST", 
				url : 'likeSNSReg',
				data :({MEMBER_NUMBER:4,SNS_NUMBER:123}),
				success: like_reg_ok
		  });
		};
		
		function like_reg_ok(data){
			var html = "<a href='#' onclick='likeDel();' >"
			    +    "<img src='/style/resources/images/main/heart_on.png' alt='heart_img' width='20px'>"
			    +   "</a>"
			    
			    $('#like_img').html(html);
 		}
  </script>


</html>