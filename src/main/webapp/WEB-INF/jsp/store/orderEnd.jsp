<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
        
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div id="orderSt">
	<h1 class="tit-pop"><img src="/MODA/theme/pshp/img_MODA/orderpop_top_title.gif" alt="order information" title="order information"></h1>
 		<p class="txt-date">
		 <span><strong>[<span id="order_name1"><c:choose>
					<c:when test="${orderMember ne null }">
					<em>${orderMember.MEMBER_NAME }</em>
					</c:when>
					<c:otherwise>
						<em>${BUYER_NAME }</em>
					</c:otherwise>
					</c:choose></span>] </strong>님께서 <span id="order_date1">${orderDate }</span>에 주문하신 내역입니다.</span>
 <ul class="tab">
        <li><img src="/MODA/theme/pshp/img_MODA/orderpop_tab_detail_on.gif" alt="주문상세조회" title="주문상세조회"></li>
        <li>
        </li>
        <li>
        </li>
 </ul>
 	<div id="orderInfo">
 	       <h2>주문자정보</h2>
 	 	   	   <div class="table-w table-orderinfo">
 	 	   	   <table summary="">
                <caption>주문자정보</caption>
                <colgroup>
                    <col width="120">
                    <col width="*">
                    <col width="120">
                    <col width="*">
                </colgroup>
                <tbody>
               		 <tr>
                        <th scope="row"><div class="tb-center">주문번호</div></th>
                        <td><div class="tb-center"><span id="order_num">${ORDER_CODE }</span></div></td>
                        <th scope="row"><div class="tb-center">주문일자</div></th>
                        <td><div class="tb-center"><span id="order_date2">${orderDate }</span></div></td>
                     </tr>
                     <tr>
                        <th scope="row"><div class="tb-center">주문자</div></th>
                        <td><div class="tb-center"><span id="order_name2">
                        	<c:choose>
							<c:when test="${orderMember ne null }">
							<em>${orderMember.MEMBER_NAME }</em>
							</c:when>
							<c:otherwise>
							<em>${BUYER_NAME }</em>
							</c:otherwise>
							</c:choose></span></div></td>
                        <th scope="row"><div class="tb-center">이메일</div></th>
                        <td><div class="tb-center">
                        	<c:choose>
							<c:when test="${orderMember ne null }">
							<em>${orderMember.MEMBER_EMAIL }</em>
							</c:when>
							<c:otherwise>
							<em>${BUYER_EMAIL }</em>
							</c:otherwise>
							</c:choose>
							</div></td>
                    		</tr>
             	     <tr>
                        <th scope="row"><div class="tb-center">품절시 환불 방법</div></th>
                        <td colspan="3"><div class="tb-left">주문시 결제방법으로 환불</div></td>
                     </tr>
                
                
                
                </tbody>
                </table>
 	 	   	   </div><!-- table-w table-orderinfo -->
 	 	   	   
 	 	   	   <h2>배송지정보</h2>
 	 	   	   <div class="table-w table-region">
 	 	   	 	  <table summary="">
              		  <caption>배송지정보</caption>
             		  <colgroup>
              		  <col width="120">
                      <col width="*">
                      <col width="120">
                      <col width="*">
               		  </colgroup>
                <tbody>
                	 <tr>
                        <th scope="row"><div class="tb-center">수취인</div></th>
                        <td><div class="tb-center"><span id="name_S-18071902-393273647-00">
						<em>${RECEIVER_NAME }</em>
						</span></div></td>
                        <th scope="row"><div class="tb-center">연락처</div></th>
                        <td><div class="tb-center"><span id="receiverphone_S-18071902-393273647-00"><em>${RECEIVER_PHONE }</em></span></div></td>
                     </tr>
                	 <tr>
                        <th scope="row"><div class="tb-center">주소</div></th>
                        <td colspan="3"><div class="tb-left"><span id="post_S-18071902-393273647-00">(${RECEIVER_ZIPCODE })</span> : <span id="address_S-18071902-393273647-00"> ${RECEIVER_ADDRESS1 } ${RECEIVER_ADDRESS2 }</span></div></td>
                     </tr>
              		 <tr>
                        <th scope="row"><div class="tb-center">배송메세지</div></th>
                        <td colspan="3"><div class="tb-left"><em>${DELIVERY_MESSAGE }</em></div></td>
                     </tr>
                
                
                </tbody>
                </table>
                </div><!-- table-w table-region -->
 	 	   	   
 	 	   	   
 	 	<h2>주문상품정보</h2>
        <div class="table-w table-prdinfo">
            <table summary="">
                <caption>주문상품정보</caption>
                <colgroup>
                    <col width="60">
                    <col width="*">
                    <col width="60">
                    <col width="65">
                    <col width="60">
                    <col width="120">
                    
                 
                </colgroup>
                <thead>
                <tr><th scope="row" colspan="2"><div class="tb-center">주문상품정보</div></th>
                    <th scope="row"><div class="tb-center">수량</div></th>
                    <th scope="row"><div class="tb-center">가격</div></th>
                    <th scope="row"><div class="tb-center">적립</div></th>
                    <th scope="row"><div class="tb-center">주문번호</div></th>
                   
                </tr>
                </thead>
                <tfoot>
                </tfoot>
                <tbody>
                <c:forEach var="orderEnd"  items="${goods}" varStatus="stat">
                <tr>
                <c:url var="viewURL" value="/goodsDetail">
                <c:param name="GOODS_NUMBER" value="${orderEnd.GOODS_NUMBER }" />
                </c:url>
                
                    <td>
                        <div class="tb-center">
                        <a href="${viewURL}"><img src="/ModuHome/images/goods/${orderEnd.GOODS_THUMBNAIL}" style="width: 58px; height: 58px"></a>
                        </div>
                    </td>
              	    <td>
                            <div class="tb-left">
                                <a href="${viewURL}">[MODA] ${orderEnd.GOODS_NAME} <br></a>
                                <span class="quantity order_table_Td style4"><img src="/MODA/theme/pshp/img_MODA/order1_optionicon.gif"> 옵션1 :  ${orderEnd.GOODS_OPTION1} / 옵션2 :  ${orderEnd.GOODS_OPTION2}</span>
                            </div>
                    </td>
                    <td><div class="tb-center">${orderEnd.EA } 개</div></td>
                    <td><div class="tb-center tb-price"><strong><font color="#FF5D00">
                    <c:choose>
						<c:when test="${orderEnd.GOODS_DISPRICE ne orderEnd.GOODS_PRICE}">
						<del>${orderEnd.GOODS_PRICE * orderEnd.EA}원</del><br/>
						<fmt:formatNumber value="${orderEnd.GOODS_DISPRICE * orderEnd.EA}" type="number" />원
						</c:when>
						<c:otherwise>
						<fmt:formatNumber value="${orderEnd.TOTALPRICE }" type="number" />원
						</c:otherwise>
						</c:choose>
                    </font></strong></div></td>
                    
                   <td>
                   <c:if test="${not empty sessionScope.MEMBER_ID}">
                   <div class="tb-center"><span class="style4">
                  					<c:choose>
									<c:when test="${orderEnd.GOODS_DISPRICE ne orderEnd.GOODS_PRICE}">
									<span><fmt:formatNumber value="${orderEnd.GOODS_DISPRICE * orderEnd.EA / 100}" type="number" />원</span>
									</c:when>
									<c:otherwise>
									<span><fmt:formatNumber value="${orderEnd.TOTALPRICE / 100}" type="number" />원</span>
									</c:otherwise>
									</c:choose>
                   </span></div>
                   </c:if>
                   <c:if test="${empty sessionScope.MEMBER_ID}">
                   <div class="tb-center"><span class="style4">0원
                   </span></div>
                   </c:if>
                   </td>
                <td><div class="tb-center">${ORDER_CODE }</div></td>   
                </tr>
                </c:forEach>
                </tbody>
                </table>
                </div><!-- table-w table-prdinfo -->
                
 	<h2>결제정보</h2>
 	<div class="table-w table-payinfo">
 	<table summary="">
                <caption>결제정보</caption>
                <colgroup>
                    <col width="180">
                    <col width="250">
                    <col width="*">
                </colgroup>
                <thead>
                    <tr><th scope="row"><div class="tb-center">결제방법</div></th>
                    <th scope="row"><div class="tb-center">결제금액</div></th>
                    <th scope="row"><div class="tb-center">포인트 사용내역</div></th>
                    <th scope="row"><div class="tb-center">세부내역</div></th>
                </tr></thead>
                <tfoot>
                    <tr>
                        <td><div class="tb-center"><span id="pay_method">무통장(가상계좌)</span></div></td>
                        <td><div class="tb-center"><em><fmt:formatNumber value="${TOTALPRICE}" type="number" />원</em></div></td>
                        <td><div class="tb-center"><em><fmt:formatNumber value="${usePoint}" type="number" />점</em></div></td>
                        <td><div class="tb-center"><span id="pay_info">농협중앙회 301-0548-7870-42 (예금주:(주)MODA))<span id="\&quot;bankname_banker\&quot;">
                        <c:choose>
							<c:when test="${orderMember ne null }">
							<em>${orderMember.MEMBER_NAME }</em>
							</c:when>
							<c:otherwise>
							<em>${BUYER_NAME}</em>
							</c:otherwise>
							</c:choose>
                        </span></span> </div></td>
                    </tr>
                </tfoot>
	</table>
 	</div><!-- table-w table-payinfo -->
 	 	   	  
 	 	   	  
 	 	   	   	<br>
 	 	   	   	<br>
 	 	   	   	<br>
 	 	   	   	<br>
 	 	   	   	
 	 	   	    <div class="btn-foot">
 	 	   	    <center>
                <a href="/ModuHome/main">
                <img src="/MODA/theme/pshp/img_MODA/btn_h36_shopping.gif" alt="주문확인" title="주문확인">
                </a>
                </center>
                </div>
                
 	 	   	   
 	</div><!-- orderInfo -->
</div><!-- orderSt -->


</body>
</html>