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
                  <td><input type="text" class="form-control" id="MEMBER_ID" name="MEMBER_ID" value="" label="아이디" required></td>
                </tr>
                
                <tr><td>　</td></tr>
                
                <tr>
                  <td width="120px"><label for="name">이름</label></td>
                  <td><input type="text" class="form-control" id="MEMBER_NAME" name="MEMBER_NAME" value="" label="이름" required></td>
                </tr>
                
                <tr><td>　</td></tr>
                
                <tr>
                  <td width="100px"><label for="name">닉네임</label></td>
                  <td><input type="text" class="form-control" id="MEMBER_NICKNAME" name="MEMBER_NICKNAME" value="" label="닉네임" required></td>
                </tr>
                
                <tr><td>　</td></tr>
                
                <tr>
                  <td width="120px"><label for="name">비밀번호</label></td>
                  <td><input type="password" class="form-control" id="MEMBER_PASSWORD" name="MEMBER_PASSWORD" value="" label="비밀번호" required></td>
                </tr>
                
                <tr><td>　</td></tr>
                
                <tr>
                  <td width="120px"><label for="name">비밀번호 확인</label></td>
                  <td><input type="password" class="form-control" id="MEMBER_PASSWORD_CH" name="MEMBER_PASSWORD_CH" value="" label="비밀번호체크" required></td>
                </tr>
                
                <tr><td>　</td></tr>
                
                <tr>
                  <td width="120px"><label for="name">생년월일</label></td>
                  <td><input type="text" class="form-control" id="MEMBER_JUMIN" name="MEMBER_JUMIN" value="" label="생년월일" placeholder="예)19000101" maxlength="8" required></td>
                </tr>
                
                <tr><td>　</td></tr>
                
                <tr>
                  <td width="120px"><label for="name">연락처</label></td>
                  <td><input type="text" class="form-control" id="MEMBER_PHONE" name="MEMBER_PHONE" value="" label="연락처" required maxlength="11"></td>
                </tr>
                
                <tr><td>　</td></tr>
                
                <tr>
                  <td width="120px"><label for="name">이메일</label></td>
                  <td><input type="text" class="form-control" id="MEMBER_EMAIL" name="MEMBER_EMAIL" value="" label="이메일" required maxlength="20"></td>
                  <td><a href="javascript:email_code();">　인증번호받기</a></td>
                </tr>
                
                <tr><td>　</td></tr>
                
                <tr>
                  <td width="120px"><label for="name">이메일 인증코드</label></td>
                  <td><input type="text" class="form-control" id="auth" name="auth" value="" label="인증번호" required maxlength="7" placeholder="인증번호를 입력해주세요." disabled="disabled"></td>
                  <td><a href="javascript:member_send();" id="auth_ok">　인증확인</a></td>
                </tr>
                
                <tr><td>　</td></tr>
                
                <tr>
                  <td width="120px"><label for="name">우편번호</label></td>
                  <td><input type="text" class="form-control" id="MEMBER_ZIPCODE" name="MEMBER_ZIPCODE" label="우편번호" value="" maxlength="6" required readonly=""></td>
                </tr>
                
                <tr>
                  <td width="120px"><label for="name">주소</label></td>
                  <td><input type="text" class="form-control" id="MEMBER_ADDRESS1" name="MEMBER_ADDRESS1" label="주소1" value="" maxlength="48" required readonly=""></td>
                  <td><a href="sample6_execDaumPostcode()">　주소찾기</a></td>
                </tr>
                <tr>
                  <td width="120px"><label for="name">　</label></td>
                  <td><input type="text" class="form-control" id="MEMBER_ADDRESS2" name="MEMBER_ADDRESS2" label="주소2" value=""  required ></td>
                </tr>
                
                 <tr><td>　</td></tr>
                 
                <tr>
                  <td width="120px"><label for="name">프로필사진</label></td>
                  <td><input type="file"  id="MEMBER_PROP" name="MEMBER_PROP" accept="image/gif,image/jpeg,image/png" onchange="chk_file_type(this)" /></td>
                  <td><img src="/ModuHome/style/img/profile-default.jpg" alt="heart_img" height="100px" width="90px" id="proimg"></td>
                </tr>
                
                <tr><td>　</td></tr>

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