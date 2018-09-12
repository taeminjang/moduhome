   <link rel="stylesheet" href="/MODA/css/memberDelete.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
    

파람:${param}
<div class="modal-body" style="width: 500px; height:350px;">
<form method="post" action="/ModuHome/qna/modalqnaWrite" enctype="multipart/form-data">
<input type="hidden" name="QNA_CATEGORY" value="상품문의">
<input type="hidden" name="GOODS_NUMBER" value="${param.GOODS_NUMBER}">
<%-- <input type="hidden" name="MEMBER_NUMBER" value="${param.MEMBER_NUMBER}"> --%>
<input type="hidden" name="MEMBER_NUMBER" value="${sessionScope.MEMBER_NUMBER}">
<input type="hidden" name="QNA_NUMBER" value="${QNA_NUMBER}">
	<div class="list-item" style="width:80%;">
				<div class="item-contents col-xs-24 col-md-18">
					제목:<input type="text" id="is-title" name="QNA_TITLE" class="xx-control" maxlength="20" required="">
				</div>
				<div class="item-contents col-xs-24 col-md-18">
					문의 내용: <textarea name="QNA_CONTENT" id="is-contents" rows="4" maxlength="200" class="xx-control" required=""></textarea>
				</div>
				<div class="item-contents col-xs-24 col-md-8">
					비밀번호:<input type="password" id="is-password" name="QNA_PASSWORD" class="xx-control" maxlength="4" required="">
				</div>
			<div class="item-contents col-xs-24 col-md-8">
				비밀글&nbsp;<input type="checkbox" id="is-secret" name="QNA_SECRET" class="xx-control">
			</div>
			<div class="item-contents col-xs-24 col-md-8">
				이미지 첨부: <input type="file" id="is-file" name="QNA_IMAGE" class="xx-control" >
			</div>
	</div>
	<div class="modal-button">
		<button type="submit" class="oto_bb">
			<span class="button-label">확인</span>
		</button>
		<button class="btn-close"  data-dismiss="modal">
			<span class="button-label">닫기</span>
		</button>
	</div>
	</form>
</div>
