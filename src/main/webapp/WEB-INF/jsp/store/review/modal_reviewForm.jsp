   <link rel="stylesheet" href="/ModuHome/css/memberDelete.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style type="text/css">
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('http://localhost:8080/ModuHome/images/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>
    
    <script type="text/javascript">


    $(window).load(function(){
      
$('.starRev span').click(function(){
  $(this).parent().children('span').removeClass('on');
  $(this).addClass('on').prevAll('span').addClass('on');
  return false;
});

    });

</script>

<div class="modal-body"><form method="post" action="/ModuHome/reviewWrite" enctype="multipart/form-data">
<input type="hidden" name="mode" value="cs">
<input type="hidden" name="GOODS_NUMBER" value="${GOODS_NUMBER}">
	<section class="inquiry box-shadow">
		<div class="section-body list-horizontal">
			<div class="list-item">
				<div class="item-title col-xs-24 col-md-6">
					<label for="is-title"><strong>제목 ${REVIEW_NUMBER} </strong></label>
					
				</div>
				<div class="item-contents col-xs-24 col-md-18">
					<input type="text" id="is-title" name="REVIEW_TITLE" class="xx-control" required="">
				</div>
			</div>
			<div class="list-item">
				<div class="item-title col-xs-24 col-md-6">
					<label for="is-title"><strong>작성자</strong></label>
				</div>
				<div class="item-contents col-xs-24 col-md-18">
					${MEMBER_NAME}
					<input type="hidden" id="is-title" name="MEMBER_NUMBER" class="xx-control" value="${MEMBER_NUMBER }">
				</div>
			</div>
			<div class="list-item">
				<div class="item-title col-xs-24 col-md-6">
					<label for="is-title"><strong>평가하기</strong></label>
				</div>
				<span class="star-input">
	<span class="input">
    	<input type="radio" name="REVIEW_SCORE" value="1" id="p1">
    	<label for="p1">1</label>
    	<input type="radio" name="REVIEW_SCORE" value="2" id="p2">
    	<label for="p2">2</label>
    	<input type="radio" name="REVIEW_SCORE" value="3" id="p3" checked="checked">
    	<label for="p3">3</label>
    	<input type="radio" name="REVIEW_SCORE" value="4" id="p4">
    	<label for="p4">4</label>
    	<input type="radio" name="REVIEW_SCORE" value="5" id="p5">
    	<label for="p5">5</label>
  	</span>
  	<!-- <output for="star-input"><b>0</b>점</output>  -->						
</span>
			</div>
			<div class="list-item">
				<div class="item-title col-xs-24 col-md-6">
					<label for="is-file"><strong>이미지 첨부</strong></label>
				</div>
				<div class="item-contents col-xs-24 col-md-8">
					<input type="file" id="is-file" name="REVIEW_IMAGE" class="xx-control" >
				</div>
			</div>
			<div class="list-item">
				<div class="item-title col-xs-24 col-md-6">
					<label for="is-contents"><strong>구매 후기</strong></label>
				</div>
				<div class="item-contents col-xs-24 col-md-18">
					<textarea name="REVIEW_CONTENT" id="is-contents" rows="8" class="xx-control" required=""></textarea>
				</div>
			</div>
		</div>
	</section>
	<div class="modal-button">
		<button type="submit" class="oto_bb">
			<span class="button-label">확인</span>
		</button>
		<button class="btn-close">
			<span class="button-label"><a href = "javascript:window.close()">닫기</a></span>
		</button>
	</div>
</form>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/star.js"></script>
<script src="theme/pshp/js/event.js"></script>

