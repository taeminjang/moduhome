<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>매거진상세보기</title>
</head>
<body>

    <section class="flexslider">
      <ul class="slides">
        <li style="background-image: url(/ModuHome/style/img/slider_1.jpg)" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
                <div class="probootstrap-slider-text text-center">
                  <h1 class="probootstrap-heading probootstrap-animate">Bringing Style And Comfort For Customer Satisfaction</h1>
                </div>
              </div>
            </div>
          </div>
        </li>
        <li style="background-image: url(/ModuHome/style/img/slider_2.jpg)" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
                <div class="probootstrap-slider-text text-center">
                  <h1 class="probootstrap-heading probootstrap-animate">Affordable Solutions For Better Living</h1>
                </div>
              </div>
            </div>
          </div>
          
        </li>
        <li style="background-image: url(/ModuHome/style/img/slider_3.jpg)" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
                <div class="probootstrap-slider-text text-center">
                  <h1 class="probootstrap-heading probootstrap-animate">We Bring Ideas To Life</h1>
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
          <div class="col-md-10 col-md-offset-1 probootstrap-animate">
            <span><fmt:formatDate value="${mgDetail.MG_REGDATE}" pattern="yyyy.MM.dd" /></span>
            <h2 class="mb0">${mgDetail.MG_TITLE}</h2>
            
            <span> ${mgDetail.MG_HASHTAG}</span>
            <span>고구마</span>
            <span>아이구</span>
            <span>고구마</span>
            <table>
              <tr>
                <td width="150"><p class="lead mt0"><a href='#' onclick='collecting_reg(${mgDetail.MG_NUMBER}, ${sessionScope.MEMBER_NUMBER });'><img src="/ModuHome/style/img/inbox.png" width="25px"></a>보관&nbsp;
                				<a id='collecting_quan'>${collecting_quan }</a></p></td>
                <td width="150"><p class="lead mt0">조회수 <a>${mgDetail.MG_HITCOUNT}</a></p></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </section>

    <section class="probootstrap-section probootstrap-bg-white" style="padding: 0em 0; padding-bottom: 50px">
      <div class="container">
        <div class="row">
          <div class="col-md-10 col-md-offset-1 probootstrap-animate">

            <c:forEach items="${mgContentList}" var="mgContentList"  >
	            <c:if test="${mgDetail.MG_NUMBER eq mgContentList.MG_NUMBER}">
		            <img src="/ModuHome/images/mgContent/${mgContentList.MG_IMAGE}" width="600">
		            <p class="lead">${mgContentList.MG_IMAGE_CONTENT}</p>    
	            </c:if>
            </c:forEach>
            
          </div>
        </div>

        <div class="row">
          <div class="col-md-10 col-md-offset-1 probootstrap-animate">
            <div align="center" style="background-color: #eeeeee; padding: 3em 0;">
			<form name="magazinecm" action="mgCommentInsert" method="post">
	        	<input type="hidden" id="mg_number" name="MG_NUMBER" value="${mgDetail.MG_NUMBER}">
	       		<input type="hidden" id="MEMBER_NUMBER" name="MEMBER_NUMBER" value="${MEMBER_NUMBER}"> 			
				<input type="text" id="mg_cm_content" name="MG_CM_CONTENT" placeholder="덧글을 입력하세요!" style="width: 450px;">
				<input type="submit" value="등록" style="width: 70px;">
			</form>
            </div>
            <div style="background-color: #eeeeee; padding: 2em 0;">
			<c:forEach items="${mgCommentList}" var="mgCommentList" >
				<c:if test="${mgDetail.MG_NUMBER eq mgCommentList.MG_NUMBER}">
	              <table>
	                <tr>
	                  <td rowspan="2"><img src="/ModuHome/style/img/slider_1.jpg" style="width: 70px; height: 70px; border-radius: 50%; margin-right: 30px; margin-left: 30px;"></td>
	                  <td>
	                    <a style="margin-right: 30px; font-size: 17px">gayeon</a>
	                    <span>${mgCommentList.MG_CM_REGDATE}</span>
	                  </td>
	                </tr>
	                <tr>
	                  <td>${mgCommentList.MG_CM_CONTENT}</td>
	                </tr>
	                <tr>
	                  <td>&nbsp;</td>
	                </tr>
	              </table>
				</c:if>
			</c:forEach>	
	              
            </div>
          </div>
        </div>
      </div>
    </section>



</body>


<script>

	function collecting(mg_number){
		document.getElementById("mg_number").value = mg_number;
		loadCollectingData();
		collec_submit()
		$('#collecting').modal('show');
	}
	
	function collec_submit(){
		var mg_number = document.getElementById("mg_number").value;
		var member_number = 61;
		collecting_reg(mg_number, member_number);
	}

	function collecting_reg(mg_number, member_number){
	  $.ajax({
			type : 'post', 
			url : 'collectingReg',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'json',
			data : JSON.stringify({
				mg_number : mg_number,
				member_number : member_number
			}),
			success: collecting_reg_ok
	  });
	};

	function collecting_reg_ok(data){
		if(data == 1){

			alert("매거진 담기가 완료되었습니다. 마이페이지에서 확인하세요!");
			var dual = parseInt($('#collecting_quan').text())+1;
			$('#collecting_quan').text(dual);
			
		}else{
			alert("이미 담기가 완료된 매거진입니다.");
		} 
	}

	function loadCollectingData() {
	  var mem_id = $(".Session_mem_id").attr("id");
	  $.ajax({
			type : 'post', 
			url : 'collectingViewData.do',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'json',
			data : JSON.stringify({
				id : mem_id
			}),
			success: setCollectingData
	  });
	};

	function setCollectingData(data) {

	  var html = '';
	  if(data != null){
			$(data).each(
				function(){
					console.log(this);
						
					html+=	"<tr>"
					    +     	"<td style='height:40px;width:30%;vertical-align:middle;align:middle;text-align:middle;'>"
					    + 			"<img src='/style/resources/images/collection_img/"+this.imgname+"' alt='"+this.imgname+"' class='img-rounded' style='width:90%;height:90%;'/>"
					    + 		"</td>"
					    + 		"<td style='height:40px;width:60%;vertical-align:top;align:left;text-align:left;'>"
					    + 			"<strong style='font-size:12px;font-family:나눔고딕;'>"+this.subject+"</strong><br>"
					    + 			"<font style='font-size:11px;color:#555555;'>"+this.nickname+"</font>"
					    + 		"</td>"
					    + 		"<td style='height:40px;width:10%;vertical-align:middle;align:center;text-align:center;'>"
					    + 			"<input type='radio' name='collection_seq' id='collection_seq' value='"+this.collection_seq+"'>"
					    + 		"</td>"
					    + 	"</tr>";
				}	
			);

			  $('#collecting_table').html(html);
			  
		}else{
			alert("등록된 컬렉션 목록이 없습니다. 먼저 컬렉션을 등록해주세요.");
		}
	};

</script>

</html>