<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/MODA/theme/aboki/js/power_review.js"></script>
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
<style type="text/css">
#powerReview .pr-info .score dt p, #powerReview .PR15N01-info2 .score dt,
   #powerReview .PR15N01-info .score dt, #powerReview .info .score dt p {
   color: #ffffff;
}

#powerReview .PR15N01-info .chart li .bar .abs, #powerReview .info .chart li .bar .abs
   {
   background: #000000;
}

#powerReview .PR15N01-recmd .cvr a.lnk-benefit, #powerReview .frm .recmd .lnk-benefit
   {
   color: #000000;
}

#powerReview .PR15N01-recmd .cvr a.lnk-review, #powerReview .btn-h35 {
   background: #000000;
}

#layerReviewModify .recmd .cvr a.lnk-review, #layerReviewModify .layer .recmd .ctr .lnk
   {
   background: #000000;
}

#powerReview .PR15N01-recmd .star-list em, #powerReview .frm .recmd>.star-list em
   {
   color: #109fea;
}

#layerReviewModify .recmd .star-list em, #layerReviewModify .layer .recmd .star-list em
   {
   color: #109fea;
}

#powerReview .PR15N01-review-wrap>li .star-icon .star em, #powerReview .review-wrap>li .star-icon em
   {
   color: #109fea;
}

#writeReview .lcont .review .star-icon em {
   color: #109fea;
}

#powerReview .review-wrap>li .reply-wrap .wrt a {
   background: #000000;
}

#powerReview .review-wrap>li .pr-options {
   background: #f8f8f8;
}

#powerReview .PR15N01-review-wrap>li .pr-options {
   background: #f8f8f8;
}

#powerReview .review-wrap>li .pr-options .emp {
   color: #83a0ff;
}

#powerReview .PR15N01-review-wrap>li .pr-options .emp {
   color: #83a0ff;
}

#powerReview #pr_authimgdiv {
   z-index: 999999
}

.popup_visible_viewPowerReview {
   height: auto;
}

#powerReview .multi-star .star1 em {
   color: #109fea;
}

#powerReview .star1 .star-list em {
   color: #109fea;
}
</style>


</head>
<body>

                  <div id="powerReview">
                           <div class="hd-t">
                              <c:if test="${sessionScope.MEMBER_ID eq null}">
                                 <a href="#"  data-size="md" data-label="구매 후기 작성"
                                    onClick="alert('로그인을 해주세요.'); return false;">
                                       <div class="hd-t"><h2>POWER REVIEW 작성하기</h2></div>
                                 </a>
                              </c:if> 
            
                              <c:if test="${sessionScope.MEMBER_ID ne null}">
                                 <a href="/MODA/review/reviewForm?GOODS_NUMBER=${goodsBasic.GOODS_NUMBER}"
                                    target="modal" data-size="md" data-label="구매 후기 작성">
                                       <div class="hd-t"><h2>POWER REVIEW 작성하기</h2></div>
                                       </a>
                              </c:if>
                           </div>     
                           
                           <div class="PR15N01-hd">
                              <h2>
                                 프리미엄 상품평 <span></span>
                              </h2>
                           </div>
                           
                           <div id="listPowerReview" class="MS_power_review_list">
                           <c:forEach var="goodsReview" items="${goodsReview}" varStatus="stat">
                           <c:if test="${reviewEndPagingNum >= stat.count}">
                           <c:if test="${reviewStartPagingNum < stat.count}">
                           <ul class="PR15N01-review-wrap">
                                 <li id="power_review_block20180711112229"
                                    class="power-review-list-box">
                                 <div class="hd-box">
                                    <ul class="desc">
                                    <li class="pr-list-writer">작성자 : ${goodsReview.MEMBER_NAME}</li><br>
                                    <li class="pr-list-writer"><fmt:formatDate value="${goodsReview.REVIEW_REGDATE}" pattern="YYYY-MM-dd HH:mm" /></li>
                                    </ul>
                                      <div class="star-icon">
                                    <span class="star">
                                    <c:if test="${goodsReview.REVIEW_SCORE == 10 }">
									<font color="#FFBF00" size="5">☆</font>
									</c:if>
                                   	<c:if test="${goodsReview.REVIEW_SCORE == 20 }">
									<font color="#FFBF00" size="5">★</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 30 }">
									<font color="#FFBF00" size="5">★☆</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 40 }">
									<font color="#FFBF00" size="5">★★</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 50 }">
									<font color="#FFBF00" size="5">★★☆</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 60 }">
									<font color="#FFBF00" size="5">★★★</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 70 }">
									<font color="#FFBF00" size="5">★★★☆</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 80 }">
									<font color="#FFBF00" size="5">★★★★</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 90 }">
									<font color="#FFBF00" size="5">★★★★☆</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 100 }">
									<font color="#FFBF00" size="5">★★★★★</font>
									</c:if>
                                    </span>
                                    <span class="icon">
                                    <img src="/MODA/theme/pshp/img_MODA/ico_new_h38.png">
                                    </span>
                                    </div>
                                 </div><!-- hd-box -->
                           <span class="pr-options" style="display: none;">${goodsReview.REVIEW_CONTENT}</span>   
                           <div class="PR15N01-hd">
                           <h2>제목 : ${goodsReview.REVIEW_TITLE }</h2>
                           </div>
                           <div class="content">
                              <p class="content_p"><a class="more-options">내용 : ${goodsReview.REVIEW_CONTENT }</a></p>
                           <div class="ctr">
                           <div class="photo-list">
                                 <ul>
                                    <li>
                                       <div><span></span>
                                       <c:if test="${goodsReview.REVIEW_IMAGE ne null }">
                                       <img src="/MODA/file/reviewFile/${goodsReview.REVIEW_IMAGE}">
                                       </c:if>
                                       </div>
                                    <div class="attach-preview"></div></li>                                    
                                 </ul>
                           </div>   
                               <c:if test="${goodsReview.MEMBER_NUMBER eq sessionScope.MEMBER_NUMBER }">
												<c:url var="viewURL" value="/reviewDelete">
													<c:param name="REVIEW_NUMBER" value="${goodsReview.REVIEW_NUMBER}" />
													<c:param name="DETAIL" value="1" />
													<c:param name="GOODS_NUMBER" value="${goodsBasic.GOODS_NUMBER}" />
													<%-- <c:param name="REVIEW_IMAGE" value="${review.REVIEW_IMAGE }" /> --%>
							  </c:url>
							 <a href="${viewURL}" class="delete" onclick="return delchk()">[삭제]</a>
							  </c:if> 
                           </div><!-- ctr -->
                           </div><!-- content -->

                                 </li><!-- power-review-list-box -->
                           </ul><!-- PR15N01-review-wrap -->
                           </c:if>
                           </c:if>
                           </c:forEach>
                           <c:if test="${reviewSize gt 5 }">
                           <div style="text-align:center;">
                           <c:if test="${reviewNowPage ne 1 }">
                           <a class="pg_prev" href="javascript:ajaxReviewPaging(1,${reviewEndPagingNum},${reviewStartPagingNum},${reviewNowPage});">이전</a>
                           </c:if>
                              <span class="pg_current">${reviewNowPage}</span>
                              <c:if test="${reviewNowPage ne 1 && reviewNowPage ne reviewTotalPage}">
                              <span class="pg_page">
                              Of
                              </span>
                              <span class="pg_page">
                              ${reviewTotalPage}</span>
                              </c:if>
                           <c:if test="${reviewNowPage ne reviewTotalPage }">
                           <a class="pg_next" href="javascript:ajaxReviewPaging(2,${reviewEndPagingNum},${reviewStartPagingNum},${reviewNowPage});">다음</a>
                           </c:if>
                           </div>
                           </c:if>
                           
                           </div><!-- listPowerReview -->
                           
                           
                           </div><!-- powerReview -->    
         
        
         
         

         

</body>
</html>