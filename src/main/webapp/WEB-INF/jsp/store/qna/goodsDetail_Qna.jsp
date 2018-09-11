<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/MODA/theme/aboki/common.css">
<link rel="stylesheet" href="/MODA/theme/aboki/footer.1.css">
<link rel="stylesheet" href="/MODA/theme/aboki/header.1.css">
<link rel="stylesheet" href="/MODA/theme/aboki/main.css">
<link rel="stylesheet" href="/MODA/theme/aboki/nanumgothic.css">
<link rel="stylesheet" href="/MODA/theme/aboki/shopdetail(1).css">
<link rel="stylesheet" href="/MODA/theme/aboki/power_review_custom.2.css">
<link rel="stylesheet" href="/MODA/theme/aboki/4_1_1.css">
<link rel="stylesheet" href="/MODA/theme/aboki/base.css">
<link rel="stylesheet" href="/MODA/theme/aboki/okdgg_layer.css">
<link rel="stylesheet" href="/MODA/theme/aboki/button.css">
<link rel="stylesheet" href="/MODA/theme/aboki/detail131031.css">
<link rel="stylesheet" href="/MODA/theme/aboki/shopdetail_color_tab_04.css">
<link rel="stylesheet" href="/MODA/theme/aboki/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="/MODA/theme/aboki/scroll.css">
<link rel="stylesheet" href="/MODA/theme/aboki/shopdetail.css">
<link rel="stylesheet" href="/MODA/theme/aboki/sorivu_basic.css">
<link rel="stylesheet" href="/MODA/theme/aboki/payco_buttons_pc.css">
<link rel="stylesheet" href="/MODA/theme/aboki/pagingcss.css">
</head>
<body>
<%
session.setAttribute("MEMBER_ID", "test34");
session.setAttribute("MEMBER_NUMBER", "77");
%>    
<div class="PR15N01-hd">
            <h2>상품문의</h2>
</div>
         
            <!-- ajax_review_list 감싸는 div 삭제 불가 -->
            <div id="ajax_qna_list">
               <div class="section-body">
                  <ul class="list-dropdown">
                     <!-- 반복시작 -->
                     <c:forEach var="goodsQna" items="${goodsQna}" varStatus="stat">
                     <c:if test="${qnaEndPagingNum >= stat.count}">
                     <c:if test="${qnaStartPagingNum < stat.count}">
                     
                     <li>
                        <div class="brief">
                        <!-- 질문자 제목 -->
                           <strong class="title">${goodsQna.QNA_TITLE}</strong>
                           <div class="info">
                              <p class="author">${goodsQna.MEMBER_NAME}</p>
                              <p class="date">/ ${goodsQna.QNA_REGDATE}</p>
                           </div>
                        </div>
                        <div class="detail">
                        <!-- 질문자내용 -->
                           <div class="contents">
                              <div class="description">
                                 <p>${goodsQna.QNA_CONTENT}</p>
                                <c:if test="${goodsQna.MEMBER_NUMBER eq sessionScope.MEMBER_NUMBER }">
												<c:url var="viewURL" value="/qnaDelete">
													<c:param name="QNA_NUMBER" value="${goodsQna.QNA_NUMBER}" />
													<c:param name="DETAIL" value="1" />
													<c:param name="GOODS_NUMBER" value="${goodsBasic.GOODS_NUMBER}" />
								</c:url>
							    <a href="${viewURL}" style="float:right;" class="delete" onclick="return delchk()">[삭제]</a>
							  </c:if> 
                                 <c:if test="${goodsQna.IMAGE1 ne null }">
                                    <div class="picture">
                                       <img
                                          src="/SIRORAGI/file/qnaFile/${goodsQna.IMAGE1}">
                                    </div>
                                 </c:if>
                                 <c:if test="${goodsQna.IMAGE2 ne null }">
                                    <div class="picture">
                                       <img
                                          src="/SIRORAGI/file/qnaFile/${goodsQna.IMAGE2}">
                                    </div>
                                 </c:if>
                              </div>
                           </div>
                        <!-- 답변내용 -->
                        <c:if test="${goodsQna.QNA_REPCONTENT ne null}">
                           <div class="answer">
                              <p>${goodsQna.QNA_REPCONTENT}</p>
                              <%-- <c:if test="${goodsQna.IMAGE1 ne null }">
                                    <div class="picture">
                                       <img
                                          src="/SIRORAGI/file/qnaFile/${goodsQnaAdmin.IMAGE1}">
                                    </div>
                                 </c:if>
                                 <c:if test="${goodsQnaUser.IMAGE2 ne null }">
                                    <div class="picture">
                                       <img
                                          src="/SIRORAGI/file/qnaFile/${goodsQnaAdmin.IMAGE2}">
                                    </div>
                                 </c:if> --%>
                              <div class="info">
                                 <p class="author">admin</p>
                                 <p class="date">/ ${goodsQna.QNA_REPDATE}</p>
                              </div>
                           </div> 
                        </c:if>
                        </div>
                     </li>
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
         
</body>
</html>