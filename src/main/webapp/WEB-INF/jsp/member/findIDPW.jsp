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
                  <h1 class="probootstrap-heading">아이디/비밀번호 찾기</h1>
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

          <div class="col-md-3 probootstrap-animate">
            <form action="/moduhome/login/findID" method="post" class="probootstrap-form">


              <label for="password">아이디 찾기</label>

              <div class="form-group">
                <input type="text" class="form-control" id="MEMBER_NAME" name="MEMBER_NAME" placeholder="이름">
              </div>
              <div class="form-group">
                <input type="email" class="form-control" id="MEMBER_EMAIL" name="MEMBER_EMAIL" placeholder="이메일주소">
              </div>
              
              <div class="form-group" align="center">
                <input type="submit" class="btn btn-primary btn-lg" id="submit" name="submit" value="아이디는?">
              </div>
            </form>
          </div> 

          <div class="col-md-1 probootstrap-animate"></div>

          <div class="col-md-3 probootstrap-animate">
            <form action="/moduhome/login/findPW" method="post" class="probootstrap-form">

              <label for="password">비밀번호 찾기</label>

              <div class="form-group">
                <input type="text" class="form-control" id="MEMBER_ID" name="MEMBER_ID" placeholder="아이디" >
              </div>
              <div class="form-group">
                <input type="text" class="form-control" id="MEMBER_NAME" name="MEMBER_NAME" placeholder="이름">
              </div>
              <div class="form-group">
                <input type="email" class="form-control" id="MEMBER_EMAIL" name="MEMBER_EMAIL" placeholder="이메일주소">
              </div>

              <div class="form-group" align="center">
                <input type="submit" class="btn btn-primary btn-lg" id="submit" name="submit" value="비밀번호는?">
              </div>
            </form>
          </div>

          <div class="col-md-2 probootstrap-animate"></div>
          
        </div>
      </div>
    </section>   


</body>
</html>