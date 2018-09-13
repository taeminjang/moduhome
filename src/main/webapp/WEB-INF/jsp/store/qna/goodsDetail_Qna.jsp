<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
  <div class="product-view-qna-list section box-shadow" id="changeQnaList">
  <div class="furniture-qna">
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
               
                     <c:forEach var="goodsQna" items="${qnaList}" varStatus="stat">
                     <c:if test="${qnaEndPagingNum >= stat.count}">
                     <li>
                        <div class="brief">
                        <!-- 질문자 제목 -->
                           <strong class="title">제목: ${goodsQna.QNA_TITLE}</strong>
                           <div class="info" style="display:inline;">
                              <p class="author">작성자: ${goodsQna.MEMBER_NAME}</p>
                             
                           </div>
                        </div>
                        <div class="detail">
                        <!-- 질문자내용 -->
                           <div class="contents">
                              <div class="description">
                                 <p>내용: ${goodsQna.QNA_CONTENT} 
                                  <c:if test="${goodsQna.MEMBER_NUMBER eq sessionScope.MEMBER_NUMBER }">
												<c:url var="viewURL" value="/qnaDelete">
													<c:param name="QNA_NUMBER" value="${goodsQna.QNA_NUMBER}" />
													<c:param name="DETAIL" value="1" />
													<c:param name="GOODS_NUMBER" value="${goodsBasic.GOODS_NUMBER}" />
								</c:url>
 							    <p style="float:right;"><a href="${viewURL}" style="float:right;" class="delete" onclick="return delchk()">[삭제]</a></p>
 							  </c:if> 
                                 </p>
                                  <p class="date">작성일: ${goodsQna.QNA_REGDATE}</p>
                                  
                                  <c:if test="${goodsQna.QNA_IMAGE ne null }">
                                       <img src="/ModuHome/images/qna/${goodsQna.QNA_IMAGE }" width="100" height="100">
                                       </c:if>
                                       
                                 <%-- <c:if test="${goodsQna.IMAGE ne null }">
                                    <div class="picture">
                                       <img
                                          src="/ModuHome/images/qna/${goodsQna.IMAGE}">
                                    </div>
                                 </c:if> --%>
                                
                                                              
                              
                              </div>
                              <hr>
                           </div>
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
                  
                        </div>
                     </li>
                     </c:if>
                     </c:forEach> 
                     <!-- 반복끝 -->
                  </ul>
				<c:if test ="${qnaSize gt 5}">
                  <div style="text-align:center;">
                     <c:if test="${qnaNowPage ne 1 }">
                     <a class="pg_prev" style="margin-top: -8px;" href="javascript:ajaxQnaPaging(1,${qnaEndPagingNum},${qnaStartPagingNum},${qnaNowPage});">-</a>
                     </c:if>   
                        <span class="pg_current">${qnaNowPage}</span>
                        <c:if test="${qnaNowPage ne 1 }">
                        <span class="pg_page">
                        ${qnaTotalPage}   
                        </span>
                        </c:if>   
                     <c:if test="${qnaNowPage ne qnaTotalPage}">   
                     <a class="pg_next" style="margin-top: -8px;" href="javascript:ajaxQnaPaging(2,${qnaEndPagingNum},${qnaStartPagingNum},${qnaNowPage});" >-</a>
                        
                     </c:if>
                     </div>
                  </c:if>  
            </div>
         </div>
         </div>
</body>
</html>