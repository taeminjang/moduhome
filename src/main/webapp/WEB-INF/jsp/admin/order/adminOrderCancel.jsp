<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>

<script type="text/javascript">

	//주문번호 같은 열 합치는 Jquery
	$( document ).ready(function() {
	$('#dataTables-example').rowspan(0);
	$('#dataTables-example').rowspan(3);
	$('#dataTables-example').rowspan(4);
	$('#dataTables-example').rowspan(5);
	$('#dataTables-example').rowspan(6);
	$('#dataTables-example').rowspan(7);
	$('#dataTables-example').rowspan(8);
});

$.fn.rowspan = function(colIdx, isStats) {       
	return this.each(function(){      
		var that;     
		$('tr', this).each(function(row) {      
			$('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
				
				if ($(this).html() == $(that).html()
					&& (!isStats 
							|| isStats && $(this).prev().html() == $(that).prev().html()
							)
					) {            
					rowspan = $(that).attr("rowspan") || 1;
					rowspan = Number(rowspan)+1;

					$(that).attr("rowspan",rowspan);
					
					// do your action for the colspan cell here            
					$(this).hide();
					
					//$(this).remove(); 
					// do your action for the old cell here
					
				} else {            
					that = this;         
				}          
				
				// set the that if not already set
				that = (that == null) ? this : that;      
			});     
		});    
	});  
}; 
	function delchk() {
		return confirm("삭제하시겠습니까?");

	}

	function ORDER_PAY_STATE_CHANGE(number) {
		
		var a= number;		
		var x = $('#'+a+'>option:selected').val();
		var currentPage =<%=request.getParameter("currentPage")%>;
		var isSearch =<%=request.getParameter("isSearch")%>;
		var searchNum =<%=request.getParameter("searchNum")%>;
		window.location.href = '/ModuHome/admin/orderStateModify?ORDER_PAY_STATE=' + x
				+ '&currentPage=' + currentPage + '&isSearch=' + isSearch
				+ '&searchNum=' + searchNum + '&ORDER_CODE='+a;
	}
	function ORDER_STATE_CHANGE(number) {
		
		var a= number;		
		var x = $('#'+a+'>option:selected').val();
		var currentPage =<%=request.getParameter("currentPage")%>;
		var isSearch =<%=request.getParameter("isSearch")%>;
		var searchNum =<%=request.getParameter("searchNum")%>;
		window.location.href = '/ModuHome/admin/orderStateModify?ORDER_STATE=' + x
				+ '&currentPage=' + currentPage + '&isSearch=' + isSearch
				+ '&searchNum=' + searchNum + '&ORDER_CODE='+a+"&cancel=1";
	}

	function ORDER_DELIVERY_CHANGE(number) {
		var a= number;	
		var y = $('.'+a+'>option:selected').val();
		var currentPage =<%=request.getParameter("currentPage")%>;
		var isSearch =<%=request.getParameter("isSearch")%>;
		var searchNum =<%=request.getParameter("searchNum")%>;
		window.location.href = '/ModuHome/admin/orderStateModify?ORDER_DELIVERY_STATE=' + y
				+ '&currentPage=' + currentPage + '&isSearch=' + isSearch
				+ "&searchNum=" + searchNum+'&ORDER_CODE='+a;
	}
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
	<h1 class="page-header">주문취소목록</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">


			주문취소목록페이지 검색, 수정, 삭제 기능하는 페이지입니다.
		</div>
		<div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom: 5px;">
						<div class="col-sm-6">
							<a href="cancelList"><button type="button"
									class="btn btn-outline btn-default">전체</button></a> <select
								class="form-control" name="select"
								onchange="window.open(value,'_self');">
								<option value="">--주문상태--</option>
								<option
									value="/ModuHome/admin/cancelList?searchNum=1&isSearch=주문취소">주문취소</option>
								<option
									value="/ModuHome/admin/cancelList?searchNum=1&isSearch=취소완료">취소완료</option>
								</select>  
						</div>
						<div class="col-sm-6" style="text-align: right;">
							<div class="dataTables_info" id="dataTables-example_info"
								role="status" aria-live="polite">총 주문수 : ${totalCount}</div>
						</div>

					</div>
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table  table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row" style="vertical-align: middle;">
										<th
											style="width: 10%; text-align: center; vertical-align: middle;">주문코드</th>
										<th
											style="width: 4%; text-align: center; vertical-align: middle;">번호</th>
										<th
											style="width: 28%; text-align: center; vertical-align: middle;">주문상품</th>
										<th
											style="width: 7%; text-align: center; vertical-align: middle;">회원ID</th>
										<th
											style="width: 10%; text-align: center; vertical-align: middle;">주문상태</th>
										<th
											style="width: 8%; text-align: center; vertical-align: middle;">배송상태</th>
										<th
											style="width: 10%; text-align: center; vertical-align: middle;">주문일자</th>
										<th
											style="width: 8%; text-align: center; vertical-align: middle;">관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="cancelList" items="${cancelList}"
										varStatus="stat">
										<c:url var="viewURL" value="/admin/orderDetail">
											<c:param name="ORDER_CODE" value="${cancelList.ORDER_CODE }" />
											<c:param name="CANCEL" value="1"/>
										</c:url>
										<tr class="gradeA even" role="row">
											<td style="text-align: center; vertical-align: middle;">${cancelList.ORDER_CODE}</td>
											<td style="text-align: center; vertical-align: middle;">${cancelList.ORDER_NUMBER}</td>
											<td style="text-align: center; vertical-align: middle;">
												${cancelList.GOODS_NUMBER }.${cancelList.GOODS_NAME} |
												${cancelList.GOODS_OPTION1} / ${cancelList.GOODS_OPTION2 } /
												${cancelList.ORDER_AMOUNT }개</td>
											
											<td style="text-align: center; vertical-align: middle;">
											<c:if test="${cancelList.MEMBER_ID ne null}">
											${cancelList.MEMBER_ID}
											</c:if>
											<c:if test="${cancelList.MEMBER_ID eq null }">
											비회원
											</c:if>
											<div
													style='display: none;'>${cancelList.ORDER_CODE}</div></td>
													
													
											<td style="text-align: center; vertical-align: middle;">
												<c:if test="${cancelList.ORDER_STATE eq '주문취소'}">
												<select id="${cancelList.ORDER_CODE }" name="ORDER_STATE"
												onchange="ORDER_STATE_CHANGE('${cancelList.ORDER_CODE }')">
													<option value="주문취소" selected>주문취소</option>
													<option value="취소완료">취소완료</option>
												</select>
												<div style='display: none;'>${cancelList.ORDER_CODE}</div>
												</c:if>
												
												<c:if test="${cancelList.ORDER_STATE eq '취소완료'}">
												<select id="${cancelList.ORDER_CODE }" name="ORDER_STATE"
												onchange="ORDER_STATE_CHANGE('${cancelList.ORDER_CODE }')">
													<option value="주문취소">주문취소</option>
													<option value="취소완료" selected>취소완료</option>
												</select>
												<div style='display: none;'>${cancelList.ORDER_CODE}</div>
												</c:if>
												
											</td>
											<td style="text-align: center; vertical-align: middle;">
												배송취소
												<div style='display: none;'>${cancelList.ORDER_CODE}</div>
											</td>
											<td style="text-align: center; vertical-align: middle;"><fmt:formatDate
													value="${cancelList.ORDER_DATE}" pattern="YY.MM.dd HH:mm" />
													<div style='display: none;'>${cancelList.ORDER_CODE}</div></td>
											<td style="text-align: center; vertical-align: middle;">
												<a href="${viewURL}"><input type="image"
													src="/ModuHome/theme/file-alt-48.png" width="28"></a>&nbsp;&nbsp;
												<c:url var="viewURL2" value="cancelDelete">
													<c:param name="ORDER_CODE" value="${cancelList.ORDER_CODE }" />
												</c:url> <a href="${viewURL2}"><input type="image"
													src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png"
													onclick="return delchk()"></a>
											</td>
										</tr>
									</c:forEach>
									<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(cancelList) le 0}">
										<tr>
											<td colspan="9" style="text-align: center;">등록된 상품이 없습니다</td>
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
										<option value="2">주문코드</option>
										<option value="3">상품명</option>
										<option value="4">회원ID</option>
									</select> <input class="form-control" type="text" name="isSearch"
										id="isSearch" /> <span>
										<button type="submit" class="btn btn-default">검색</button>
									</span>
								</form>
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

