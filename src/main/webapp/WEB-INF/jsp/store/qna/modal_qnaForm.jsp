   <link rel="stylesheet" href="/MODA/css/memberDelete.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
    
<% 
session.setAttribute("MEMBER_ID", "test5");
session.setAttribute("MEMBER_NUMBER", "4");
%>
<div class="modal-body">
<form method="post" action="/ModuHome/qna/modalqnaWrite" enctype="multipart/form-data">
<input type="hidden" name="QNA_CATEGORY" value="상품문의">
<input type="hidden" name="GOODS_NUMBER" value="${param.GOODS_NUMBER}">
<input type="hidden" name="MEMBER_NUMBER" value="${param.MEMBER_NUMBER}">
<input type="hidden" name="QNA_NUMBER" value="${QNA_NUMBER}">
${goodsQna.QNA_NUMBER}, ${param.QNA_NUMBER}
	<section class="inquiry box-shadow">
		<div class="section-body list-horizontal">
			<div class="list-item">
				<div class="item-title col-xs-24 col-md-6">
					<label for="is-title"><strong>제목${goodsBasic.GOODS_NUMBER } ${GOODS_NUMBER}, ${QNA_NUMBER}</strong></label>
				</div>
				
				<div class="item-contents col-xs-24 col-md-18">
					<input type="text" id="is-title" name="QNA_TITLE" class="xx-control" required="">
				</div>
			</div>
			
			<div class="item-title col-xs-24 col-md-6">
				<label for="is-secret"><strong>비밀글 여부</strong></label>
			</div>
				<div class="item-contents col-xs-24 col-md-8">
					<input type="checkbox" id="is-secret" name="QNA_SECRET" class="xx-control">
				</div>
			
			<div class="list-item">
			<c:choose>
			<c:when test="${session.MEMBER_ID ne null}">
			<div class="item-title col-xs-24 col-md-6">
					<label for="is-password"><strong>비밀번호</strong></label>
				</div>
				<div class="item-contents col-xs-24 col-md-8">
					<input type="hidden" id="is-password" name="QNA_PASSWORD" class="xx-control" required="">
				</div>
			</c:when>
			<c:when test="${sessionScope.MEMBER_ID eq null}">
				<div class="item-title col-xs-24 col-md-6">
					<label for="is-password"><strong>비밀번호</strong></label>
				</div>
				<div class="item-contents col-xs-24 col-md-8">
					<input type="password" id="is-password" name="QNA_PASSWORD" class="xx-control" required="">
				</div>
			</c:when>
			</c:choose>
			</div>
			
			<div class="list-item">
				<div class="item-title col-xs-24 col-md-6">
					<label for="is-file"><strong>이미지 첨부</strong></label>
				</div>
				<div class="item-contents col-xs-24 col-md-8">
					<input type="file" id="is-file" name="QNA_IMAGE" class="xx-control" >
				</div>
			</div>
			
			<div class="list-item">
				<div class="item-title col-xs-24 col-md-6">
					<label for="is-contents"><strong>문의 내용</strong></label>
				</div>
				<div class="item-contents col-xs-24 col-md-18">
					<input name="QNA_CONTENT" id="is-contents" rows="8 " class="xx-control" required=""></textarea>
				</div>
			</div>
		</div>
	</section>
	<div class="modal-button">
		<button type="submit" class="oto_bb">
			<span class="button-label">확인</span>
		</button>
		<button class="btn-close">
			<span class="button-label">닫기</span>
		</button>
	</div>
</form>
<script src="/theme/store/js/main.js"></script></div>
