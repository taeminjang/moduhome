<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="checkBuy" value="248"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
  <div class="product-view-qna-list section box-shadow" id="changeQnaList">
  <div class="furniture-qna">상품넘버:${GOODS_NUMBER}
				<div class="commerce-title">
					<h2 style="margin-bottom: 0px;">Q&A</h2>
					<div class="qna-wrapper">
						<c:if test="${sessionScope.MEMBER_ID eq null}">
                                       <div class="review-write-btn" style="float:right;">
                                 <a href="#"  data-size="md" data-label="상품 문의 작성"
                                    onClick="alert('로그인을 해주세요.'); return false;">QNA 작성하기
                                 </a></div>
                              </c:if> 
                               <c:if test="${sessionScope.MEMBER_ID ne null }">
                                 <div class="review-write-btn" style="float:right;">
                                <%--  <a href="/ModuHome/qna/modal_qnaForm?GOODS_NUMBER=${goodsBasic.GOODS_NUMBER}"
                                    target="modal" data-size="md" data-label="상품 문의 작성">QNA 작성하기</a> --%>
                                <a href="/ModuHome/qna/modal_qnaForm?GOODS_NUMBER=${GOODS_NUMBER}" data-toggle="modal" data-target="#myModal">QNA 작성하기</a>
                                  </div>
                              </c:if> 
					</div>
				</div>
			</div>
            <!-- ajax_review_list 감싸는 div 삭제 불가 -->
            <div id="ajax_qna_list">
               <div class="section-body">
                  <ul class="list-dropdown">
                     <!-- 반복시작 -->
                     <c:forEach var="goodsQna" items="${qnaList}" varStatus="stat">
                     <c:if test="${qnaEndPagingNum >= stat.count}">
                     <c:if test="${qnaStartPagingNum < stat.count}">
                        <li><strong class="title" style="float:left;">${goodsQna.QNA_TITLE}</strong></li>
                     <li>${goodsQna.QNA_CONTENT}</li>
                     <li> <c:if test="${goodsQna.QNA_IMAGE ne null }">
                             <img src="/ModuHome/images/qna/${goodsQna.QNA_IMAGE}" style="width: 150px; margin-top: 0px;">
                          </c:if>
                     </li>
                     <li style="float:right;">${goodsQna.MEMBER_NAME}&nbsp;&nbsp;
                              / ${goodsQna.QNA_REGDATE}&nbsp;&nbsp;
                                  <c:if test="${goodsQna.MEMBER_NUMBER eq sessionScope.MEMBER_NUMBER }">
												<c:url var="viewURL" value="/qnaDelete">
													<c:param name="QNA_NUMBER" value="${goodsQna.QNA_NUMBER}" />
													<c:param name="DETAIL" value="1" />
													<c:param name="GOODS_NUMBER" value="${GOODS_NUMBER}" />
												</c:url>
								    <a href="${viewURL}" style="float:right;" class="delete" onclick="javascript:return confirm('삭제하시겠습니까?');">[삭제]</a>
								  	</c:if> 
                     </li>
                        <!-- 답변내용 -->
                        <c:if test="${goodsQna.QNA_REPCONTENT ne null}">
                           <div class="answer">
                              <img src="/ModuHome/theme/admin.png" style="width: 100px;height: 50px;">
                              <p>${goodsQna.QNA_REPCONTENT}</p>
                              <div class="info">
                                 <p class="author">admin</p>
                                 <p class="date">/ ${goodsQna.QNA_REPDATE}</p>
                              </div>
                           </div> 
                        </c:if>
                     </c:if>
                     </c:if>
                     </c:forEach> 
                     <!-- 반복끝 -->
                  </ul>
                  <c:if test="${qnaSize gt 5 }">
                           <div style="text-align:center;">
                           <c:if test="${qnaNowPage ne 1 }">
                           <a class="pg_prev" href="javascript:ajaxQnaPaging(1,${qnaEndPagingNum},${qnaStartPagingNum},${qnaNowPage});">이전</a>
                           </c:if>
                              <span class="pg_current">${qnaNowPage}</span>
                              <c:if test="${qnaNowPage ne 1 && qnaNowPage ne qnaTotalPage}">
                              <span class="pg_page">
                              Of
                              </span>
                              <span class="pg_page">
                              ${qnaTotalPage}</span>
                              </c:if>
                           <c:if test="${qnaNowPage ne qnaTotalPage }">
                           <a class="pg_next" href="javascript:ajaxQnaPaging(2,${qnaEndPagingNum},${qnaStartPagingNum},${qnaNowPage});">다음</a>
                           </c:if>
                           </div>
                           </c:if>
            </div>
         </div>
         </div>
</body>
</html>