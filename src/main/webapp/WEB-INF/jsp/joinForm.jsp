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
                  <h1 class="probootstrap-heading">Contact Us</h1>
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

          <div class="col-md-3 probootstrap-animate"></div>
           
          <div class="col-md-6 probootstrap-animate">
            <form action="/ModuHome/join" method="post" class="probootstrap-form">

              <table>
                <tr>
                  <td width="120px"><label for="name">아이디</label></td>
                  <td><input type="text" class="form-control" id="name" name="name"></td>
                </tr>
                <tr>
                  <td width="120px"><label for="name">비밀번호</label></td>
                  <td><input type="text" class="form-control" id="name" name="name"></td>
                </tr>
                <tr>
                  <td width="120px"><label for="name">비밀번호 확인</label></td>
                  <td><input type="text" class="form-control" id="name" name="name"></td>
                  <td><p>이야오</p></td>
                </tr>
                <tr>
                  <td width="120px"><label for="name">이름</label></td>
                  <td><input type="text" class="form-control" id="name" name="name"></td>
                </tr>
                <tr>
                  <td width="120px"><label for="name">닉네임</label></td>
                  <td><input type="text" class="form-control" id="name" name="name"></td>
                </tr>
                <tr>
                  <td width="120px"><label for="name">주민등록번호</label></td>
                  <td><input type="text" class="form-control" id="name" name="name"> - 
                      <input type="text" class="form-control" id="name" name="name"></td>
                </tr>
                <tr>
                  <td width="120px"><label for="name">이메일</label></td>
                  <td><input type="text" class="form-control" id="name" name="name"></td>
                  <td><input type="submit" class="btn btn-primary btn-lg" id="submit" name="submit" value="인증하기"></td>
                  <td><p>이야오</p></td>
                </tr>
                <tr>
                  <td width="120px"><label for="name">이메일 인증코드</label></td>
                  <td><input type="text" class="form-control" id="name" name="name"></td>
                </tr>
                <tr>
                  <td width="120px"><label for="name">휴대폰번호</label></td>
                  <td><input type="text" class="form-control" id="name" name="name"></td>
                </tr>
                <tr>
                  <td width="120px"><label for="name">우편번호</label></td>
                  <td><input type="text" class="form-control" id="name" name="name"></td>
                </tr>
                <tr>
                  <td width="120px"><label for="name">집주소</label></td>
                  <td><input type="text" class="form-control" id="name" name="name"></td>
                  <td><input type="submit" class="btn btn-primary btn-lg" id="submit" name="submit" value="우편찾기"></td>
                </tr>
                <tr>
                  <td width="120px"><label for="name">상세주소</label></td>
                  <td><input type="text" class="form-control" id="name" name="name"></td>
                </tr>
                <tr>
                  <td width="120px"><label for="name">프로필사진</label></td>
                  <td><input type="text" class="form-control" id="name" name="name"></td>
                  <td><input type="submit" class="btn btn-primary btn-lg" id="submit" name="submit" value="업로드"></td>
                </tr>

              </table>

              <div class="form-group" align="center">
                <input type="submit" class="btn btn-primary btn-lg" id="submit" name="submit" value="회원가입">
                <input type="submit" class="btn btn-primary btn-lg" id="submit" name="submit" value="가입취소">
              </div>
            </form>
          </div>

          <div class="col-md-3 probootstrap-animate"></div>
          
        </div>
      </div>
    </section>   

    <footer class="probootstrap-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
              <ul class="probootstrap-footer-social">
                <li><a href="#"><i class="icon-twitter"></i></a></li>
                <li><a href="#"><i class="icon-facebook"></i></a></li>
                <li><a href="#"><i class="icon-github"></i></a></li>
                <li><a href="#"><i class="icon-dribbble"></i></a></li>
                <li><a href="#"><i class="icon-linkedin"></i></a></li>
                <li><a href="#"><i class="icon-youtube"></i></a></li>
              </ul>
          </div>
        </div>
        <!-- END row -->
        <div class="row">
          <div class="col-md-12 copyright text-center">
            <p>&copy; 2017 <a href="https://probootstrap.com/">uiCookies:FineOak</a>. All Rights Reserved. <br> Designed &amp; Developed with <i class="icon icon-heart"></i> by <a href="https://probootstrap.com/">uicookies.com</a></p>
          </div>
        </div>
      </div>
    </footer>
    

    <script src="js/scripts.min.js"></script>
    <script src="js/custom.min.js"></script>

</body>
</html>