<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<%@page contentType="text/html; charset=utf-8" %>
<div class="container">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<section class="step-panels">
		<ol>
			<li class="c01 col-xs-7">
				<div>AUTHENTICATION<span class="icon"></span></div>
			</li>
			<!--<li class="arrow arrow1">&gt;</li>-->
			<li class="c02 col-xs-24 col-sm-10 selected">
				<div>PRIVACY<span class="icon"></span></div>
			</li>
			<!--<li class="arrow arrow2">&gt;</li>-->
			<li class="c03 col-xs-7">
				<div>WELCOME</div>
			</li>
		</ol>
	</section>
	<!-- step-panels//end -->
	<div class="register-privacy">
		<form  method="post" name="frm" enctype="multipart/form-data" >
			
			<section class="input-horizontal list-horizontal section box-shadow">
				<div class="section-head left border">
					<h3>회원정보</h3>
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
			<input type="text" name="MEMBER_ID" id="MEMBER_ID" value="" maxlength="20" label="아이디" required="" readonly="">
		</div>
	</li>
	
	<li class="nickname">
		<div class="item-label col-lg-3 col-md-4">
			<label for="input-nickname">
				<strong>* 닉네임</strong>
			</label>
		</div>
		<div class="col-lg-21 col-md-20">
			<input type="text" name="MEMBER_NICKNAME" id="MEMBER_NICKNAME" value="" maxlength="20" class="xx-control" label="닉네임" required="">
			<p class="alert alert-positive"></p>
		</div>
	</li>
	
	<li class="password">
		<div class="item-label col-lg-3 col-md-4">
			<label for="input-password">
				<strong>* 비밀번호</strong>
			</label>
		</div>
		<div class="col-lg-21 col-md-20">
			<input type="password" id="MEMBER_PASSWORD" class="xx-control" value="" name="MEMBER_PASSWORD" required="" label="비밀번호">
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
	<li class="name">
		<div class="item-label col-lg-3 col-md-4">
			<label for="MEMBER_NAME">
				<strong>* 이름</strong>
			</label>
		</div>
		<div class="col-lg-21 col-md-20">
			<input type="text" id="MEMBER_NAME" class="xx-control" name="MEMBER_NAME" value="" required="" label="이름" readonly="">
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
					<input type="text" id="MEMBER_JUMIN" name="MEMBER_JUMIN" value="" maxlength="8" placeholder="예)19000101" class="xx-control" required="">
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
				<input type="text" name="MEMBER_PHONE" id="MEMBER_PHONE" label="휴대폰" value=""  maxlength="11" class="xx-control" required="">
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
				<input type="text" name="MEMBER_EMAIL" id="MEMBER_EMAIL" class="xx-control x01" label="이메일" required="" value="" size="20" >
				<a href="javascript:email_code();">인증번호받기</a>
				<p class="alert alert-positive" id="password_chch"></p>
			</div>
		</div>
	</li>
	
	<li class="auth">
		   <div class="item-label col-lg-3 col-md-4">
			<label for="input-auth">
				<strong>* 인증번호입력</strong>
			</label>
		   </div>
		<div class="col-lg-21 col-md-20">
			<input type="password" id="auth" class="xx-control" value="" name="auth" required="" label="인증번호" placeholder="인증번호를 입력해주세요." disabled="disabled">
		    <a href="javascript:member_send();" id="auth_ok">인증확인</a>
		</div>
	</li>
	
	
	<li class="address">
		<div class="item-label col-lg-3 col-md-4">
			<strong> 주소</strong>
		</div>
		<div class="col-lg-21 col-md-20">
			<div class="input-box">
			<input type="text" id="MEMBER_ZIPCODE"  name="MEMBER_ZIPCODE" label="우편번호" value="" maxlength="6" required="" readonly="">
				<span class="button button-dimmed" onclick="sample6_execDaumPostcode()">주소 찾기</span>
			</div>
			<input type="text" id="MEMBER_ADDRESS1" class="xx-control" name="MEMBER_ADDRESS1"  label="주소"  value="" size="48" readonly="" required="">
			<input type="text" id="MEMBER_ADDRESS2" class="xx-control" name="MEMBER_ADDRESS2"  value="" label="주소" required="">
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
			<input type="file" name="MEMBER_PROP" id="MEMBER_PROP" accept="image/gif,image/jpeg,image/png" onchange="chk_file_type(this)" />
			 <img src="/ModuHome/style/img/profile-default.jpg" alt="heart_img" height="100px" width="90px" id="proimg">
			
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
						<span class="button-label">회원가입</span>
					</button>

<!-- 아이디 중복확인 -->
<script>
/* 스크립터의 전역변수 */
var id_ok ="";
var password_ok ="";
var email_ok ="";
var name_ok="";
var phone_ok="";
var email_wr_ok="";
var jumin_ok="";
var nick_ok="";
var auth_email="";

/* 아이디 중복확인 */
$("input[name=MEMBER_ID]").blur(function(){
	var MEMBER_ID = $(this).val();
	var p = $(this).parent();
	
	$.post("/ModuHome/checkId",{MEMBER_ID:MEMBER_ID},function(data){
		if (!MEMBER_ID){
			$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("아이디를 입력해주세요.");
			//$("input[name=chkid]").val("");
		} else if (data==1){
			$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("<span class='icon icon-negative-orange'></span> 이미 등록된 아이디입니다");
			//$("input[name=chkid]").val("");
		} else {
			$(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("<span class='icon icon-positive-skyblue'></span> 사용 가능한 아이디입니다");
			//$("input[name=chkid]").val("on");
			id_ok="ok";
		}
	});		
});

/* 닉네임 중복확인 */
$("input[name=MEMBER_NICKNAME]").blur(function(){
	var mem_nickname = $(this).val();
	var p = $(this).parent();
	
        if(mem_nickname == ""){
        	$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("닉네임을 입력해주세요.");
        	nick_ok ="";
        }else {
			$(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("");
			nick_ok="ok";
		}
      
});

/* 비밀번호 유효성검사 */ 
$("input[name=MEMBER_PASSWORD]").blur(function(){
	var password= $(this).val();
	var password_ch= document.frm.MEMBER_PASSWORD_CH.value;
	var p =  $("#password_chch").parent();
        if(password_ch == ""){
        	$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("");
        	password_ok = "";
        }else if (password != password_ch){
			$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("비밀번호를 확인해주세요.");
			password_ok = "";
		}else if (password == password_ch){
			$(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("");
			password_ok = "ok";
		}
      
});

$("input[name=MEMBER_PASSWORD_CH]").blur(function(){
	var password_ch= $(this).val();
	var password = document.frm.MEMBER_PASSWORD.value;
	var p = $(this).parent();
	
        if(password_ch == ""){
        	$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("비밀번호를 확인해주세요.");
        	password_ok = "";
        }else if (password != password_ch){
			$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("비밀번호가 다릅니다.");
			password_ok = "";
		}else if (password == password_ch){
			$(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("");
			password_ok = "ok";
			
		}
      
});
/* 이름 유효성 */
$("input[name=MEMBER_NAME]").blur(function(){
	var mem_name = $(this).val();
	var p = $(this).parent();
	
        if(mem_name == ""){
        	$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("이름을 입력해주세요.");
        	name_ok ="";
        }else {
			$(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("");
			name_ok="ok";
		}
      
});
/* 폰 유효성 */
$("input[name=MEMBER_PHONE]").blur(function(){
	var mem_phone = $(this).val();
	var p = $(this).parent();
	
        if(mem_phone == ""){
        	$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("전화번호을 입력해주세요.");
        	phone_ok ="";
        }else {
			$(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("");
			phone_ok ="ok";
		}
      
});
/* 이메일 유효성 */
$("input[name=MEMBER_EMAIL]").blur(function(){
	var mem_email = $(this).val();
	var p = $(this).parent();
	
        if(mem_email == ""){
        	$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("이메일을 입력해주세요.");
        	email_wr_ok ="";
        }else {
			$(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("");
			email_wr_ok ="ok";
		}
      
});
/* 생년월일 */
$("input[name=MEMBER_JUMIN]").blur(function(){
	var mem_jumin = $(this).val();
	var p = $(this).parent();
	
        if(mem_jumin == ""){
        	$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("생년월일을 입력해주세요");
        	jumin_ok ="";
        }else if(frm.MEMBER_JUMIN.value.length != 8){
			$(".alert",p).removeClass("alert-positive").addClass("alert-negative").html("생년월일을 정확히 입력해주세요.");
			jumin_ok ="";
		}else{
			$(".alert",p).removeClass("alert-negative").addClass("alert-positive").html("");
			jumin_ok = "ok";
		}
      
});

/* 이메일 */
function email_code(){
	
	   var f = document.frm;
	   auth_email = f.MEMBER_EMAIL.value; //회원가입누를때 이메일 바꿔 내는것을 방지
	   var email = f.MEMBER_EMAIL.value;

	 	  if(email == '') {
		      alert("이메일을 입력해주세요");
		      return false;
		  }else{
	    	  $.ajax({
	    	        type: "POST",
	    	        url: "./loginForm/modu_email_auth",
	    	        data: ({mode:"email_code", email:email}),
	    	        //contentType: "text/plain; charset=euc-kr",
	    	        success: function(data) {
	    	        	console.log(data);
	    	        	if(data != 0){
	    	        		alert("이미 가입된 이메일입니다.다른이메일을 입력해주세요");
	    	        	}else{ 
	    	        		alert("인증번호를 요청하신 이메일로 발송했습니다.");
	    	        		var auth2 = document.getElementById("auth"); /* 이메일인증번호를 보낼 시 인증번호input칸이 풀린다 이유: 이메일값과 인증번호값을 넣지않고 회원가입을 하는것을 막기위해 */
	    	        		   auth2.removeAttribute("disabled"); /* 인증번호 input칸의 disabled속성을 삭제 */
	    	        	}
	    	        	
	    	        	if(data != null)    {
	    	            	console.log("로그 내용2"+data);
	    	            }
	    	        },
	    	        error: function(e){
	    	         alert('error' + e);
	    	        }
	    	    });
	      }
	   
	}
	
function member_send(){
	   var f = document.frm;
	   var email = f.MEMBER_EMAIL.value;
	   var auth = f.auth.value;
   		$.ajax({
      	 type: "POST",
       	 url: "./joinForm/modal_email_auth_success",
       	 data: ({email:email, auth:auth}),
      	  //data: ({Id:$("#Id").val(), Pwd:$("#Pwd").val()}),
      	  //contentType: "text/plain; charset=euc-kr",
      	  success: function(data) {
        		 /* alert("auth값받음"+data); */
   	     	 console.log("로그 내용1");     
           	 if(data == 1)    {
            		alert("인증완료");
            		email_ok="ok";
            		var auth2 = document.getElementById("auth"); /* 이메일인증번호를 보낼 시 인증번호input칸이 풀린다 이유: 이메일값과 인증번호값을 넣지않고 회원가입을 하는것을 막기위해 */
	        		   auth2.setAttribute("disabled", "disabled"); /* 인증완료 후 인증창 닫힘 */
            		   /* 인증완료 후 auth값 ok */
         	   } else {
         		  
          	  	alert("인증번호가 맞지 않습니다.");
          	  	f.auth.value ="";
          	  	console.log("로그 내용3");
       	     }
     	   },
     	   error: function(e){
     	    alert('error' + e);
   	     }
   	 });
	}

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
					
					 /* 회원가입버튼 누를경우 */
						function checkSubmit(){
							var frm = document.frm;
							if(id_ok == ""){
								alert('아이디를 확인해주세요.');
							}else if(password_ok ==""){
								alert('비밀번호를 다시 확인해주세요.');	
							}else if(frm.MEMBER_JUMIN.value.length != 8){
								alert('생년월일을 확인해주세요.');								
							}else if(email_ok == ""){
								alert("이메일인증을 완료해주세요.");
							}else if(email_wr_ok == ""){
							   alert("이메일인증을 완료해주세요.");
						    }else if(name_ok ==""){
						    	 alert("이름을 확인해주세요.");
						    }else if(phone_ok ==""){
						    	alert("전화번호를 확인해주세요.");
						    }else if(jumin_ok==""){
						    	alert("생년월일을 확인해주세요.");
						    }else if(nick_ok==""){
						    	alert("닉네임을 확인해주세요.");
						    }else if(auth_email != document.frm.MEMBER_EMAIL.value){
						    	alert("인증된 이메일을 입력해주세요.");
						    }
							else{
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