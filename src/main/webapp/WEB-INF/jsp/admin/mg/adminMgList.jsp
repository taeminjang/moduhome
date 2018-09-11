<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	String curDate = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<script type="text/javascript">
	function delchk() {
		return confirm("삭제하시겠습니까?");
	}
	$('.searchOption').val($('.searchOptionVal').val());
	var onWrite = function() {
		location.href = 'mgInsertForm';
	};
</script>
<style type="text/css">
.paging {
	text-align: center;
	height: 32px;
	margin-top: 5px;
	margin-bottom: 15px;
}

.paging a, .paging strong {
	display: inline-block;
	width: 36px;
	height: 32px;
	line-height: 28px;
	font-size: 14px;
	border: 1px solid #e0e0e0;
	margin-left: 5px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
	-moz-box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
	box-shadow: 1px 1px 1px 0px rgba(235, 235, 235, 1);
}

.paging a:first-child {
	margin-left: 0;
}

.paging strong {
	color: #fff;
	background: #337AB7;
	border: 1px solid #337AB7;
}

.paging .page_arw {
	font-size: 11px;
	line-height: 30px;
}
</style>
</head>
<div class="row" style="padding-left: 15px; width: 900px;">
	<h1 class="page-header">매거진</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">매거진 검색, 수정, 삭제 기능하는 페이지입니다.</div>
		<div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom: 5px;">
						<div class="col-sm-6">
							<a href="/ModuHome/admin/mglist">
								<button type="button" class="btn btn-outline btn-default">전체</button>
							</a>
						</div>
						<div class="col-sm-6" style="text-align: right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">
								총 게시글 수 : ${totalCount}				
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 4%; text-align: center;">번호</th>
										<th style="width: 20%; text-align: center;">사진</th>
										<th style="width: 8%; text-align: center;">제목</th>
										<th style="width: 20%; text-align: center;">내용</th>										
										<th style="width: 8%; text-align: center;">등록일자</th>
										<th style="width: 5%; text-align: center;">관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="adminMgList" items="${adminMgList}" varStatus="stat">
										<c:url var="viewURL" value="/admin/mgModifyForm">
											<c:param name="MG_NUMBER" value="${adminMgList.MG_NUMBER }" />
										</c:url>
										<tr class="gradeA even" role="row">
											<td style="text-align: center; vertical-align: middle;">${adminMgList.MG_NUMBER}</td>
											<td style="text-align: center; vertical-align: middle;">
											<c:if test="${adminMgList.MG_TITLE_IMAGE ne null}">
											<img src="/ModuHome/images/mgMain/${adminMgList.MG_TITLE_IMAGE}" width="50" height="50" alt=""  onerror="this.src='/ModuHome/images/noimg_130.gif'" />
											</c:if>
											<td style="text-align: center; vertical-align: middle;">${adminMgList.MG_TITLE}</td>
											<td style="text-align: center; vertical-align: middle;">${adminMgList.MG_CONTENT}</td>
											<td style="text-align: center; vertical-align: middle;">
												<fmt:formatDate value="${adminMgList.MG_REGDATE}" pattern="YY.MM.dd HH:mm" />
											</td>
											
											<td style="text-align: center; vertical-align: middle;">
												<a href="${viewURL}">
													<input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png">
												</a>&nbsp;&nbsp;
												<c:url var="viewURL2" value="/mgdelete">
													<c:param name="MG_NUMBER" value="${adminMgList.MG_NUMBER }" />
												</c:url> 
												<a href="${viewURL2}">
													<input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png"
													onclick="return delchk()">
												</a>
											</td>
										</tr>
									</c:forEach>
									<!--  등록된 글이 없을때 -->
									<c:if test="${fn:length(adminMgList) le 0}">
										<tr>
											<td colspan="9" style="text-align: center;">등록된 매거진이 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="paging">${pagingHtml}</div>
					
					<div class="row">
						<div style="text-align: center;">
							<div id="dataTables-example_filter" class="dataTables_filter">
								<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">제목</option>
										<option value="1">내용</option>
									</select> 
									<input class="form-control" type="text" name="isSearch" id="isSearch" />
									<span>
										<button type="submit" class="btn btn-default">검색</button>
									</span>
								</form>
							</div>
							<div style="text-align: left;" class="col-sm-6">
								<button type="button" onclick="onWrite()" class="btn btn-outline btn-default">쓰기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.table-responsive -->
		</div>
	</div>
	<!-- /.panel -->
</div>