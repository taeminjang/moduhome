<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    
<link href="https://fonts.googleapis.com/css?family=Bellefair|Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="/ModuHome/style/css/styles-merged.css">
<link rel="stylesheet" href="/ModuHome/style/css/style.min.css"> 
<script src="/ModuHome/style/js/scripts.min.js"></script>
<script src="/ModuHome/style/js/custom.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>first</title>
              <style type="text/css">

                #order-d-table {
                  margin-bottom: 30px;
                }
                #order-d-td-a {
                  font-size: 12px;
                  background-color: #eeeeee;
                  border: 1px solid #b4b4b4;
                  height: 35px;

                }
                #order-d-td-b {
                  font-size: 12px;
                  background-color: #fff;
                  border: 1px solid #b4b4b4;
                  height: 35px;
                }

                #order-d-th {
                  font-size: 12px;
                  background-color: #eeeeee;
                  border: 1px solid #b4b4b4;
                }
                #order-d-btn{
                  background-color: #85c8dd;
                  border: none;
                  color: #fff;
                  border-radius: 10px;

                }
              </style>
</head>
<body>

<div style="display:none;" class="Session_mem_id" id="${mem_id}">
</div>
<div class="container" style="background-color: #fff;">
    <section class="probootstrap-section probootstrap-bg-white">
      <div class="container">
        <div class="row">
          <div class="col-md-10 probootstrap-animate">
            <form action="#" method="post" class="probootstrap-form">

              <div align="center" style="padding-bottom: 25px;">
                <span style="font-size: 25px;">주문상세내역</span>
              </div>

              <div align="center"  style="padding-bottom: 50px;">
                <table width="100%">
                  <tr>
                    <td style="background-color: #85c8dd; color: #fff;" align="center">[이예영] 님께서 2012년 02월 02일에 주문하신 내역입니다.</td>
                  </tr>
                </table>
              </div>

              <div>
                <span>주문자정보</span>
                <table width="100%" align="center" id="order-d-table">
                  <tr>
                    <td width="10%" align="center" id="order-d-td-a">주문번호</td>
                    <td width="40%" align="center" id="order-d-td-b">34234324234324324</td>
                    <td width="10%" align="center" id="order-d-td-a">주문일자</td>
                    <td width="40%" align="center" id="order-d-td-b">2014.14.11</td>
                  </tr>
                  <tr>
                    <td width="10%" align="center" id="order-d-td-a">주문번호</td>
                    <td width="40%" align="center" id="order-d-td-b">34234324234324324</td>
                    <td width="10%" align="center" id="order-d-td-a">주문일자</td>
                    <td width="40%" align="center" id="order-d-td-b">2014.14.11</td>
                  </tr>
                  <tr>
                    <td width="10%" align="center" id="order-d-td-a">주문메모</td>
                    <td colspan="3" width="90%" id="order-d-td-b">&nbsp;&nbsp;예영님의 회색거미줄티 너무너무 예뻐요 얼른 배송해주세요오오오오옷!!!!!!!</td>
                  </tr>    
                </table>

              </div>

              <div>
                <span>배송지정보</span>
                <table width="100%" align="center" id="order-d-table">
                  <tr>
                    <td width="10%" align="center" id="order-d-td-a">배송번호</td>
                    <td width="40%" align="center" id="order-d-td-b">34234324234324324</td>
                    <td width="10%" align="center" id="order-d-td-a">송장번호</td>
                    <td width="40%" align="center" id="order-d-td-b">23432423432<button id="order-d-btn">배송추적</button></td>
                  </tr>
                  <tr>
                    <td width="10%" align="center" id="order-d-td-a">수취인</td>
                    <td width="40%" align="center" id="order-d-td-b">예딱이</td>
                    <td width="10%" align="center" id="order-d-td-a">연락처</td>
                    <td width="40%" align="center" id="order-d-td-b">010-2222-3333</td>
                  </tr>
                  <tr>
                    <td width="10%" align="center" id="order-d-td-a">주소</td>
                    <td colspan="3" width="90%" id="order-d-td-b">&nbsp;&nbsp;강남구 남도빌딩 3층 냠냠냠냠냠 소시지 맛있어</td>
                  </tr>    
                  <tr>
                    <td width="10%" align="center" id="order-d-td-a">배송메세지</td>
                    <td colspan="3" width="90%" id="order-d-td-b">&nbsp;&nbsp;제가 인터넷으로 시킨 맥주안주 소시지 문앞에 잘 둬주세요</td>
                  </tr>                      
                </table>
              </div>


              <div>
                <span>주문상품정보</span>
                <table width="100%" align="center" id="order-d-table">
                  <tr id="order-d-tr">
                    <th width="53%" id="order-d-th" style="text-align: center">상품정보</th>
                    <th width="7%" id="order-d-th" style="text-align: center">수량</th>
                    <th width="13%" id="order-d-th" style="text-align: center">가격</th>
                    <th width="12%" id="order-d-th" style="text-align: center">처리상태</th>
                    <th width="15%" id="order-d-th" style="text-align: center">배송번호</th>
                  </tr>
                  <tr>
                    <td id="order-d-td-b"><img src="img/arrrr.png" width="60px" height="60px">&nbsp;&nbsp;예딱이표 회색 거미줄티셔츠으으</td>
                    <td id="order-d-td-b" align="center">10</td>
                    <td id="order-d-td-b" align="center">9330,000원</td>
                    <td id="order-d-td-b" align="center">배송준비</td>
                    <td id="order-d-td-b" align="center">1032dsfsdsa-231</td>
                  </tr>
                  <tr>
                    <td id="order-d-td-b"><img src="img/arrrr.png" width="60px" height="60px">&nbsp;&nbsp;예딱이표 회색 거미줄티셔츠으으</td>
                    <td id="order-d-td-b" align="center">10</td>
                    <td id="order-d-td-b" align="center">9330,000원</td>
                    <td id="order-d-td-b" align="center">배송준비</td>
                    <td id="order-d-td-b" align="center">1032dsfsdsa-231</td>
                  </tr>    
                  <tr>
                    <td id="order-d-td-a" colspan="5" align="right">예딱이표 회색 거미줄티셔츠으으&nbsp;&nbsp;</td>
                  </tr>                                   
                </table>
              </div>

              <div>
                <span>결제정보</span>
                <table width="100%" align="center" id="order-d-table">
                  <tr id="order-d-tr">
                    <th width="30%" id="order-d-th" style="text-align: center">결제방법</th>
                    <th width="30%" id="order-d-th" style="text-align: center">결제금액</th>
                    <th width="40%" id="order-d-th" style="text-align: center">세부내역</th>
                  </tr>
                  <tr>
                    <td align="center" id="order-d-td-b">카드</td>
                    <td align="center" id="order-d-td-b">90,000원&nbsp;(입금완료)</td>
                    <td align="center" id="order-d-td-b"></td>
                  </tr>                   
                </table>
              </div>

              <div align="center">
                <button id="order-d-btn">&nbsp;&nbsp;닫기&nbsp;&nbsp;</button>
              </div>

        
            </form>
          </div>
        </div>
      </div>
    </section>  
    
    </div>
    </body>

    <script>
    function openWin(){  
	    window.open("http://localhost:8080/ModuHome/myOrderDetail", "조회하기", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	}; 
    </script>
      </html>