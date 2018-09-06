<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>first</title>

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="/ModuHome/search/css/styles-merged.css">
    <link rel="stylesheet" href="/ModuHome/search/css/style.min.css">
    <link rel="stylesheet" href="/ModuHome/search/css/custom.css">
</head>
 <script type="text/javascript">
if('${message}' != ""){
	alert('${message}');
}



</script>
<body>

<section class="flexslider">
      <ul class="slides">
        <li style="background-image: url(/ModuHome/style/img/im10.jpg)" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
              
                <div class="probootstrap-slider-text text-center" style=" margin-top:300px;">
                  <h1 class="probootstrap-heading" style="font-size: 100px;"><span><strong>CONTACT US</strong></span></h1>
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

          <div class="col-md-4 probootstrap-animate"></div>
           
          <div class="col-md-4 probootstrap-animate">
            <form action="/ModuHome/login" method="post" class="probootstrap-form">

              <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" class="form-control" id="MEMBER_ID" name="MEMBER_ID">
              </div>
              <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" class="form-control" id="MEMBER_PASSWORD" name="MEMBER_PASSWORD">
              </div>
              

              <div class="form-group" align="center">
                <input type="submit" class="btn btn-primary btn-lg" value="로그인">
                <input type="button" class="btn btn-primary btn-lg" value="메인으로">
              </div>
			  
			  아이디/비밀번호를 잊으셨나요? 
              <!-- <a onclick="openID" href="#">여기를 클릭</a> -->
               <a href="/ModuHome/login/findForm">여기를 클릭</a><br />
               아직회원이 아니신가요?
               <a href="/ModuHome/joinForm">회원가입하기</a><br />
            </form>
          </div>

          <div class="col-md-4 probootstrap-animate"></div>
          
        </div>
      </div>
    </section>   



</body>

<!-- <script type="text/javascript">
function openID() {
	newWindow = window.open('/ModuHome/findID','아이디찾기','width=200, height=300');
	window.onload = openID();
} -->



</html>