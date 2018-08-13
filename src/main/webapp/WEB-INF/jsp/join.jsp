
<%@page contentType="text/html; charset=utf-8" %>
<div class="container">

   <!-- step-panels//end -->
   <div class="register-privacy">
      <form  method="post" name="frm">

         <!-- agreement-terms.section//end -->
         <section class="input-horizontal list-horizontal section box-shadow">
            <div class="section-head left border">
               <h3>회원정보</h3>
            </div>
            <!--section-head//end-->
<ul class="section-body">
   <li class="id">
      <div class="item-label col-lg-3 col-md-4">
         <label for="mi">
            <strong>* 아이디</strong>
         </label>
      </div>
      <div class="col-lg-21 col-md-20">
         <input type="text" name="MEMBER_ID" id="MEMBER_ID" value="" maxlength="20" class="xx-control" label="아이디" required="">
         <p class="alert alert-positive"></p>
      </div>
   </li>
   
   <li class="nickname">
      <div class="item-label col-lg-2 col-md-4">
         <label for="input-nickname">
            <strong>닉네임</strong>
         </label>
      </div>
      <div class="col-lg-22 col-md-20">
         <input type="text" name="MEMBER_NICKNAME" id="input-nickname" value="" />
         <p class="alert alert-positive"><span class="icon"></span>사용 가능한 닉네임입니다</p>
      </div>
   </li>
   
   <li class="password">
      <div class="item-label col-lg-3 col-md-4">
         <label for="input-password">
            <strong>* 비밀번호</strong>
         </label>
      </div>
      <div class="col-lg-21 col-md-20">
         <input type="password" id="input-password" class="xx-control" value="" name="MEMBER_PASSWORD" required="" label="비밀번호">
      </div>
   </li>
   <li class="password check">
      <div class="item-label col-lg-3 col-md-4">
         <label for="input-password-check">
            <strong>* 비밀번호 확인</strong>
         </label>
      </div>
      <div class="col-lg-21 col-md-20">
         <input type="password" id="input-password-check" class="xx-control" value="" name="password_confirm" required="" label="비밀번호">
      </div>
   </li>
   <li class="name">
      <div class="item-label col-lg-3 col-md-4">
         <label for="input-name">
            <strong>* 이름</strong>
         </label>
      </div>
      <div class="col-lg-21 col-md-20">
         <input type="text" id="input-name" class="xx-control" name="MEMBER_NAME" value="" required="" label="이름"><!--disabled="disabled"-->
      </div>
   </li>
   <li class="cell-phone">
      <div class="item-label col-lg-3 col-md-4">
         <label for="input-cell-phone01">
            <strong>* 핸드폰</strong>
         </label>
      </div>
      <div class="col-lg-21 col-md-20">
         <div class="input-box">
            <input type="text" name="MEMBER_PHONE" id="input-cell-phone01" label="휴대폰" value=""  maxlength="11" class="xx-control" required="">
         </div>
         <div class="checkbox checkbox-inline c01 selected">
            <label>
               <input type="checkbox" name="issms" value="o" checked="">
               <span class="icon icon-checkbox"></span>
               <span class="checkbox-label">구매, 배송 등 쇼핑 관련 SMS 받기</span>
            </label>
         </div>
         <!--<div class="checkbox c02">-->
            <!--<label>-->
               <!--<input type="checkbox" name="" value="">-->
               <!--<span class="icon icon-checkbox"></span>-->
               <!--<span class="checkbox-label">이벤트, 혜택에 개한 소식 받기</span>-->
            <!--</label>-->
         <!--</div>-->
      </div>
   </li>
   <li class="mail">
      <div class="item-label col-lg-3 col-md-4">
         <label for="input-mail">
            <strong>* 이메일</strong>
         </label>
      </div>
      <div class="col-lg-21 col-md-20">
         <div class="input-box">
            <input type="text" name="MEMBER_EMAIL" id="email1" class="xx-control x01" label="이메일" required="" value="" size="10" >
            
            <!-- <div class="selectbox">
               <div class="selectbox-data">
                  <strong class="text">직접입력
                   </strong>
                  <span class="icon icon-dropdown-gray-dark"></span>
               </div>
               <select name="auto_email" class="auto_mail">
                  <option value="">직접입력
                  </option><option value="naver.com">네이버
                  </option><option value="daum.net">한메일
                  </option><option value="gmail.com">지메일
                  </option><option value="nate.com">네이트
                  </option><option value="yahoo.co.kr">야후
                  </option><option value="chol.com">천리안
                  </option><option value="korea.com">코리아닷컴
               </option></select>
            </div> -->
         </div>

         <div class="checkbox checkbox-inline c01 selected">
            <label>
               <input type="checkbox" name="ismail" value="o" checked="">
               <span class="icon icon-checkbox"></span>
               <span class="checkbox-label">구매, 배송 등 쇼핑 관련 이메일 받기</span>
            </label>
         </div>
         <!--<div class="checkbox c02">-->
            <!--<label>-->
               <!--<input type="checkbox" name="ismail" value='o' checked>-->
               <!--<span class="icon icon-checkbox"></span>-->
               <!--<span class="checkbox-label">이벤트, 혜택에 개한 소식 받기</span>-->
            <!--</label>-->
         <!--</div>-->
      </div>
   </li>
   <li class="address">
      <div class="item-label col-lg-3 col-md-4">
         <strong>* 주소</strong>
      </div>
      <div class="col-lg-21 col-md-20">
         <div class="input-box">
         <input type="text" id="sample6_postcode"  name="MEMBER_ZIPCODE" disabled="disabled" label="우편번호" value="" maxlength="6" required="">
            <span class="button button-dimmed" onclick="sample6_execDaumPostcode()">주소 찾기</span>
         </div>
         <input type="text" id="sample6_address" class="xx-control" name="MEMBER_ADDRESS1" label="주소" disabled="disabled" value="" size="48" readonly="" required="">
         <input type="text" id="sample6_address2" class="xx-control" name="MEMBER_ADDRESS2" value="" label="주소" required="">
      </div>
   </li>
   <li class="birth input-placeholder">
      <div class="item-label col-lg-3 col-md-4">
         <label for="input-birth01">
            <strong>주민등록번호 (앞자리)</strong>
         </label>
      </div>
      <div class="col-lg-21 col-md-20">
         <div class="input-box">
               <input type="text" id="input-birth01" name="MEMBER_JUMIN" value="" maxlength="8" placeholder="예)19000101" class="xx-control" required="">
         </div>
      </div>
   </li>
</ul>
<!--
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><script charset="UTF-8" type="text/javascript" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/postcode/1484723365148/170118.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<script>
$("input[name=MEMBER_ID]").blur(function(){
   var MEMBER_ID = $(this).val();
   var p = $(this).parent();
   $.post("/MODA/checkId",{MEMBER_ID:MEMBER_ID},function(data){
      if (!MEMBER_ID){
         $(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("<span class='icon icon-negative-orange'></span> 아이디를 입력해주세요");
         //$("input[name=chkid]").val("");
      } else if (data==1){
         $(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("<span class='icon icon-negative-orange'></span> 이미 등록된 아이디입니다");
         //$("input[name=chkid]").val("");
      } else {
         $(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("<span class='icon icon-positive-skyblue'></span> 사용 가능한 아이디입니다");
         //$("input[name=chkid]").val("on");
      }
   });      
});
/* $(".auto_mail").change(function() {
   $('#email2').val($(this).val());
}); */

</script>
            <div class="section-foot">
               <button type="submit" id="validateBtn" class="button large" onclick="javascript:checkSubmit()">
                  <span class="button-label">회원가입</span>
               </button>
               
               <script type="text/javascript">
               function checkSubmit(){
                  var frm = document.frm.MEMBER_BIRTHDAY;
                  if(frm.value.length != 8){
                     alert('생년월일을 확인해주세요');
                     frm.focus();
                  }else{
                     document.frm.action="/ModuHome/joinComplete";
                     document.frm.submit();
                  }
               }
               </script>
            </div>
            <!--section-foot//end-->
         </section>
         <!-- input-horizontal.section//end -->
      </form>
   </div>
   </div>
   <!-- register-privacy//end -->