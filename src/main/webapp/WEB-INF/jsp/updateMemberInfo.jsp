<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<%@page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container">

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

	
	<div class="register-privacy">
		<form  method="post" name="frm" enctype="multipart/form-data" >
			
			<section class="input-horizontal list-horizontal section box-shadow">
				<div class="section-head left border">
					<h3>회원정보수정</h3>
				</div>
				<!--section-head//end-->
<ul class="section-body">
	
	<li >
		<div>
			<label for="mi">
				<strong>* 아이디</strong>
			</label>
		</div>
		<div>
			<input type="text" name="MEMBER_ID" id="MEMBER_ID" value="${member.MEMBER_ID }" maxlength="20" label="아이디" required="" readonly="" disabled="disabled" >
			<input type="hidden" name="MEMBER_NUMBER" id="MEMBER_NUMBER" value="${member.MEMBER_NUMBER}" required="" >
		</div>
	</li>
	
	<li class="nickname">
		<div class="item-label col-lg-3 col-md-4">
			<label for="input-nickname">
				<strong>* 닉네임</strong>
			</label>
		</div>
		<div class="col-lg-21 col-md-20">
			<input type="text" name="MEMBER_NICKNAME" id="MEMBER_NICKNAME" value="${member.MEMBER_NICKNAME}" maxlength="20" class="xx-control" label="닉네임" required="">
			<p class="alert alert-positive"></p>
		</div>
	</li>
	
		<li class="name">
		<div class="item-label col-lg-3 col-md-4">
			<label for="MEMBER_NAME">
				<strong>* 이름</strong>
			</label>
		</div>
		<div class="col-lg-21 col-md-20">
			<input type="text" id="MEMBER_NAME" class="xx-control" name="MEMBER_NAME" value="${member.MEMBER_NAME}" required="" label="이름"><!--disabled="disabled"-->
			<p class="alert alert-positive" id="password_chch"></p>
		</div>
	</li>
	
		<li class="password">
		<div class="item-label col-lg-3 col-md-4">
			<label for="input-password">
				<strong>* 비밀번호</strong>
			</label>
		</div>
		<div class="col-lg-21 col-md-20">
			<input type="password" id="MEMBER_PASSWORD" class="xx-control" value="${member.MEMBER_PASSWORD}" name="MEMBER_PASSWORD" required="" label="비밀번호">
		</div>
	</li>
	<li class="password check">
		<div class="item-label col-lg-3 col-md-4">
			<label for="input-password-check">
				<strong>* 비밀번호 확인</strong>
			</label>
		</div>
		<div class="col-lg-21 col-md-20">
			<input type="password" id="MEMBER_PASSWORD_CH" class="xx-control" value="" name="MEMBER_PASSWORD_CH" required="" label="비밀번호체크">
			<p class="alert alert-positive" id="password_chch"></p>
		</div>
	</li>
	
	<li class="birth input-placeholder">
		<div class="item-label col-lg-3 col-md-4">
			<label for="input-birth01">
				<strong>* 생년월일</strong>
			</label>
		</div>
		<div class="col-lg-21 col-md-20">
			<div class="input-box">
					<input type="text" id="MEMBER_JUMIN" name="MEMBER_JUMIN" value="${member.MEMBER_JUMIN}" maxlength="8" placeholder="예)19000101" class="xx-control" required="">
					<p class="alert alert-positive" id="password_chch"></p>
			</div>
		</div>
	</li>
	
	<li class="cell-phone">
		<div class="item-label col-lg-3 col-md-4">
			<label for="MEMBER_PHONE">
				<strong>* 핸드폰</strong>
			</label>
		</div>
		<div class="col-lg-21 col-md-20">
			<div class="input-box">
				<input type="text" name="MEMBER_PHONE" id="MEMBER_PHONE" label="휴대폰" value="${member.MEMBER_PHONE}"  maxlength="11" class="xx-control" required="">
				<p class="alert alert-positive" id="password_chch"></p>
			</div>
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
				<input type="text" name="MEMBER_EMAIL" id="MEMBER_EMAIL" class="xx-control x01" label="이메일" required="" value="${member.MEMBER_EMAIL}" size="20" disabled="disabled">
				
				<p class="alert alert-positive" id="password_chch"></p>
			</div>
		</div>
	</li>
	
	
	<li class="address">
		<div class="item-label col-lg-3 col-md-4">
			<strong> 주소</strong>
		</div>
		<div class="col-lg-21 col-md-20">
			<div class="input-box">
			<input type="text" id="MEMBER_ZIPCODE"  name="MEMBER_ZIPCODE" label="우편번호" value="${member.MEMBER_ZIPCODE}" maxlength="6" required="" readonly="">
				<span class="button button-dimmed" onclick="sample6_execDaumPostcode()">주소 찾기</span>
			</div>
			<input type="text" id="MEMBER_ADDRESS1" class="xx-control" name="MEMBER_ADDRESS1"  label="주소"  value="${member.MEMBER_ADDRESS1}" size="48" readonly="" required="">
			<input type="text" id="MEMBER_ADDRESS2" class="xx-control" name="MEMBER_ADDRESS2"  value="${member.MEMBER_ADDRESS2}" label="주소" required="">
		</div>
	</li>
	
	<li class="prop">
		<div class="item-label col-lg-3 col-md-4">
			<label for="prop">
				<strong> 사진</strong>
			</label>
		</div>
		<div class="col-lg-21 col-md-20">
		  <!-- <input type="text" id="MEMBER_PROP" name="MEMBER_PROP" value="" maxlength="8"  class="xx-control" required=""> -->
			<input type="file" name="MEMBER_PROP" id="MEMBER_PROP" value="${member.ORIGINAL_FILE_NAME}" accept="image/gif,image/jpeg,image/png" onchange="chk_file_type(this)" />
			 <img src="/ModuHome/images/member/${member.STORED_FILE_NAME}" alt="heart_img" height="100px" width="90px" id="proimg">
			
		</div>
	</li>
	
	
</ul>

<!-- 다음 주소 -->
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
                document.getElementById('MEMBER_ZIPCODE').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('MEMBER_ADDRESS1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('MEMBER_ADDRESS2').focus();
            }
        }).open();
    }
</script>

                  <div class="section-foot">
					<button type="submit" id="validateBtn" class="button large" onclick="javascript:checkSubmit()">
						<span class="button-label">정보수정</span>
					</button>


<script>
/* 스크립터의 전역변수 */




/* 닉네임 중복확인 */
$("input[name=MEMBER_NICKNAME]").blur(function(){
	var mem_nickname = $(this).val();
	var p = $(this).parent();
	
        if(mem_nickname == ""){
        	$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("닉네임을 입력해주세요.");
        	
        }else {
			$(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("");
			
		}
      
});

/* 비밀번호 유효성검사 */ 
$("input[name=MEMBER_PASSWORD]").blur(function(){
	var password= $(this).val();
	var password_ch= document.frm.MEMBER_PASSWORD_CH.value;
	var p =  $("#password_chch").parent();
        if(password_ch == ""){
        	$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("");
        	
        }else if (password != password_ch){
			$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("비밀번호를 확인해주세요.");
		
		}else if (password == password_ch){
			$(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("");
			
		}
      
});

$("input[name=MEMBER_PASSWORD_CH]").blur(function(){
	var password_ch= $(this).val();
	var password = document.frm.MEMBER_PASSWORD.value;
	var p = $(this).parent();
	
        if(password_ch == ""){
        	$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("비밀번호를 확인해주세요.");
        	
        }else if (password != password_ch){
			$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("비밀번호가 다릅니다.");
			
		}else if (password == password_ch){
			$(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("");
			
			
		}
      
});
/* 이름 유효성 */
$("input[name=MEMBER_NAME]").blur(function(){
	var mem_name = $(this).val();
	var p = $(this).parent();
	
        if(mem_name == ""){
        	$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("이름을 입력해주세요.");
        	
        }else {
			$(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("");
			
		}
      
});
/* 폰 유효성 */
$("input[name=MEMBER_PHONE]").blur(function(){
	var mem_phone = $(this).val();
	var p = $(this).parent();
	
        if(mem_phone == ""){
        	$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("전화번호을 입력해주세요.");
        	
        }else {
			$(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("");
			
		}
      
});

      

/* 생년월일 */
$("input[name=MEMBER_JUMIN]").blur(function(){
	var mem_jumin = $(this).val();
	var p = $(this).parent();
	
        if(mem_jumin == ""){
        	$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("생년월일을 입력해주세요");
        	
        }else if(frm.MEMBER_JUMIN.value.length != 8){
			$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("생년월일을 정확히 입력해주세요.");
			
		}else{
			$(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("");
			
		}
      
});

function chk_file_type(obj) { /*이미지 파일만 올릴수 있게 설정 */
	 var file_kind = obj.value.lastIndexOf('.');
	 var file_name = obj.value.substring(file_kind+1,obj.length);
	 var file_type = file_name.toLowerCase();

	 var check_file_type = new Array();

	 check_file_type=['jpg','gif','png','jpeg','bmp'];



	 if(check_file_type.indexOf(file_type)==-1){
	  alert('이미지 파일만 선택할 수 있습니다.');
	  var parent_Obj=obj.parentNode
	  var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
	  return false;
	 }
	}

			        
					    
					/*  이미지 미리보기  */
$(document).ready(function(){
	 function readURL(input) {
		if (input.files && input.files[0]) {
		 var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	       reader.onload = function (e) {
			 //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
			 $('#proimg').attr('src', e.target.result);
			    //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
			    //(아래 코드에서 읽어들인 dataURL형식)
			  }                   
			 reader.readAsDataURL(input.files[0]);
		  //File내용을 읽어 dataURL형식의 문자열로 저장
			    }
		   }//readURL()--
				   
			    //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
		  $("#MEMBER_PROP").change(function(){
		     //alert(this.value); //선택한 이미지 경로 표시
       readURL(this);
		     });
		     });
					
					 /* 회원수정버튼 누를경우 */
						function checkSubmit(){
							var frm = document.frm;
						   if(frm.MEMBER_NICKNAME ==""){
					    	    alert("닉네임을 입력해주세요.");
						    }else if(frm.MEMBER_NAME ==""){
						    	 alert("이름을 입력해주세요.");
						    }else if(frm.MEMBER_PASSWORD ==""){
								alert('비밀번호를 다시 확인해주세요.');	
							}else if(frm.MEMBER_PASSWORD.value !=frm.MEMBER_PASSWORD_CH.value){
								alert('비밀번호를 다시 확인해주세요.');						
							}else if(frm.MEMBER_JUMIN=""){
								alert('생년월일을 입력해주세요.');	
					        }else if(frm.MEMBER_JUMIN.value.length != 8){
								alert('생년월일을 확인해주세요.');								
					        }else if(frm.MEMBER_PHONE ==""){
						    	alert("전화번호를 입력해주세요.");
						    }
							else{
								document.frm.action="/ModuHome/updateMemComplete";
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