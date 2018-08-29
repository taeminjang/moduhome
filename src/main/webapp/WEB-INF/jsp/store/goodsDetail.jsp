<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<!-- CSS Offset -->
<link type="text/css" rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" />
<link type="text/css" rel="stylesheet"
	href="//cdn.ggumim.co.kr/resource/house_interior_web/ggumim-1.2.05.min.css" />
<script type="text/javascript"
	src="//cdn.ggumim.co.kr/resource/house_interior_web/ggumim.stack-1.2.05.min.js"></script>




<style>
.btn-just-buy {
	border: 1px solid #85C8DD;
    background: #85C8DD;
    color: #fff;
}
.btn-cart {
	border: 1px solid #b2b2b2;
    background: #b2b2b2;
    color: #fff;
}
.container {
	width: 800px;
}


</style>
</head>
<body class="">
	<div class="head head-fixed">
		<div class="head-bar head-bar-white">
			<div class="navigation">
			
			</div>
		</div>
	</div>
	<!-- <div class="main-menu"> <ul> <li class=""><a href="/"><img src="//cdn.ggumim.co.kr/resource/icons/btn_home_nor.png" alt="" class="home-menu-icon">홈</a></li> <li class=""><a href="/star/"><img src="//cdn.ggumim.co.kr/resource/icons/btn_star_nor.png" alt="" class="home-menu-icon">매거진</a></li> <li class=""><a href="/furniture/"><img src="//cdn.ggumim.co.kr/resource/icons/btn_furniture_sel.png" alt="" class="home-menu-icon">스토어</a></li> <li class=""><a href="/story/"><img src="//cdn.ggumim.co.kr/resource/icons/btn_story_nor.png" alt="" class="home-menu-icon">스토리</a></li> <li class=""><a href="/picture/"><img src="//cdn.ggumim.co.kr/resource/icons/btn_picture_nor.png" alt="" class="home-menu-icon">사진</a></li> </ul> </div> -->
	
	<div class="container">
		<div class="furniture-view">
			<div class="row">
				<div class="col-xs-6 furniture-view-image monday-slick">
				<!-- 	<div class="furniture-view-image-wrapper">
						<div class="furniture-image">
							<img
								src="//cdn.ggumim.co.kr/cache/furniture/600/20180820185305D8r6zjRFhR.jpg" />
						</div>
						<div class="furniture-image">
							<img
								src="//cdn.ggumim.co.kr/cache/furniture/600/20180820183725A5GiMfuNxZ.jpg" />
						</div>
					</div> -->
						<div class="furniture-view-image-wrapper">
									<c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="0" end="1">
									<div class="furniture-image">
									<img src="/ModuHome/images/goods/${goodsImage.IMAGE}" onerror="this.src='/ModuHome/images/noimg_130.gif'" />
									</div>
									</c:forEach>
							</div > 
					
					
					<!--/.furniture-view-image-wrapper-->
				
					<!--/.discount-->
				</div>
				<!--/.left menu end-->
				<div class="col-xs-6 furniture-view-infomation">
							<div class="furniture-view-brand">${goodsBasic.GOODS_BRNAME}</div>
							<div class="furniture-view-name">${goodsBasic.GOODS_NAME}</div>
							<div class="furniture-view-cost">
								<c:if test="${goodsBasic.GOODS_PRICE eq goodsBasic.GOODS_DISPRICE}">
								<span class="original slashit">
									<fmt:formatNumber value="${goodsBasic.GOODS_PRICE}" type="number" />원
								</span><br/> 
						        </c:if>
								<c:if test="${goodsBasic.GOODS_PRICE ne goodsBasic.GOODS_DISPRICE}">
										<span class="original slashit"><fmt:formatNumber
												value="${goodsBasic.GOODS_PRICE}" type="number" />원</span><br/> 
										<span class="discount"><fmt:formatNumber
												value="${goodsBasic.GOODS_DISPRICE}" type="number" /></span>원 
												<span class="discount_rate">(<fmt:formatNumber
													value="${(goodsBasic.GOODS_PRICE - goodsBasic.GOODS_DISPRICE)*100 / goodsBasic.GOODS_PRICE}"
													type="number" />%할인)</span>
								</c:if>
							</div>
						<div class="furniture-delivery">
							<div class="row">
								<div class="col-xs-3">배송비</div>
								<div class="col-xs-9">
									<div style="float: left; font-size: 12px;">2,500 원 (
										30,000원 이상 무료 )</div>
									<div style="float: left; font-size: 12px;">(선결제)</div>
									<input type="hidden" name="delivery-payment" value="0">
								</div>
							</div>
						</div>
					
					
					<!--/.right top menu end-->
					<div class="furniture-view-option ">
						<div>상품옵션</div>
						<div class="option-set">
						<select id="option" onchange="setOption2(this)"
							style="width: 225px">
							<option value="">-옵션 선택-</option>
							<c:forEach var="goodsDetail" items="${goodsDetail}"
								varStatus="stat">
								<c:if test="${goodsDetail.GOODS_AMOUNT > 0}">
									<c:if
										test="${goodsBasic.GOODS_DISPRICE ne goodsBasic.GOODS_PRICE }">
										<option
											value="${goodsDetail.GOODS_OPTION1}-${goodsDetail.GOODS_OPTION2 }"
											data-optnm1="${goodsDetail.GOODS_OPTION1 }"
											data-optnm2="${goodsDetail.GOODS_OPTION2 }"
											stock="${goodsDetail.GOODS_AMOUNT }"
											price="${goodsBasic.GOODS_DISPRICE }"
											kinds="${goodsDetail.GOODS_KIND_NUMBER }">${goodsDetail.GOODS_OPTION1}-${goodsDetail.GOODS_OPTION2 }</option>
										<c:if test="${goodsBasic.GOODS_DISPRICE eq goodsBasic.GOODS_PRICE }">
										</c:if>
										<c:if test="${goodsDetail.GOODS_AMOUNT eq 0}">
										</c:if>
									</c:if>
								</c:if>
							</c:forEach>
						</select>
						</div>	
						<div>
							<ul class="MK_inner-opt-cm" id="MK_innerOpt_01"></ul>
						</div>
						<div id="MK_innerOptTotal" class="">
							<p class="totalRight">
								<span class="MK_txt-total">합계</span> <span id="MK_txt-won"
									data-price="">0원</span>
							</p>
						</div>	
					</div>
					<!--/.furniture-view-option-->
					<div class="row" style="margin-right: -100px; margin-left: -1px;">
							<div class="col-xs-5 btn-cart" id="cartBtn"
								onclick="javascript:_exec('cart');">장바구니</div>
							<div class="col-xs-5 btn-just-buy"
								onclick="javascript:_exec('buy');">바로구매</div>
					</div>
				</div>
				<!--/.right bottom menu-->
			</div>
			<!--/right menu-->
		</div>
		<!--/. row-->
		<!-- <div class="furniture-data hide">
			<table>
				<tbody>
					<tr>
						<td>
							/.furniture-size
						</td>
					</tr>
				</tbody>
			</table>
		</div> -->
		<!--/.furniture-data-->
		<div class="container">
			<div class="commerce-title">
				<h2>제품 설명</h2>
			</div>
		<div class="furniture-view-body">
			<c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="2">
			<img src="/ModuHome/images/goods/${goodsImage.IMAGE}" width="600">
			<br>
			</c:forEach>
		</div> 
		<!--/.furniture-view-body-->
		
		<div class="space15 mt10"></div>
		<a name="review"></a>
		<div class="furniture-review">
			<div class="mt18"></div>
			<div class="furniture-review-title">
				<span class="title">구매 후기</span> <span class="message">후기
					작성하고 추가 적립 받으세요!</span> <span class="review-write-btn"
					onclick="location.href='/login/';">후기 작성하기</span>
			</div>
			<div class="furn_review furniture-view-fix-width">
				<div style="padding: 12px; text-align: center; color: #8F8F8F;">아직
					작성된 후기가 없습니다.</div>
			</div>
			<div class="furniture-together">
				<div class="commerce-title">
					<h2>함께 본 제품</h2>
				</div>
				<div id="furniture-together-list"
					class="row furniture-item-group-3 furniture-related-wrapper">
					<div class="furniture-slick-item">
						<a href="/furniture/view/14656"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20170627141310fjJz4BS1w3.jpg" />
						</a>
						<div class="description">
							<div class="name">[하우스레시피] 모리노키 원목 손잡이 쟁반 4종</div>
							<div class="price_original">
								<s>17,000 원</s>
							</div>
							<div class="price_discount">
								<span>5,800</span> 원 (66%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/14705"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20170302183544WxPtH2nHjd.JPG" />
						</a>
						<div class="description">
							<div class="name">[마켓비] MANTIC 캔들 램프 (할로겐전구 무료증정)</div>
							<div class="price_original">
								<s>39,900 원</s>
							</div>
							<div class="price_discount">
								<span>16,400</span> 원 (59%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/14733"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20170627144915CLgy3ejXwG.jpg" />
						</a>
						<div class="description">
							<div class="name">[마켓비] RUSTA 장스탠드</div>
							<div class="price_original">
								<s>29,900 원</s>
							</div>
							<div class="price_discount">
								<span>17,900</span> 원 (40%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/14760"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20180828160502d83EXW2fde.jpg" />
						</a>
						<div class="description">
							<div class="name">[데코뷰] 호텔식 화이트 시폰 커튼</div>
							<div class="price_original">
								<s>116,000 원</s>
							</div>
							<div class="price_discount">
								<span>76,000</span> 원 (34%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/14834"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20170726145723wxjmopqdQM.jpg" />
						</a>
						<div class="description">
							<div class="name">[마켓비] BELY 해초 바구니</div>
							<div class="price_original">
								<s>22,900 원</s>
							</div>
							<div class="price_discount">
								<span>12,400</span> 원 (46%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/14835"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20170719171359kwXJSDgIj9.jpg" />
						</a>
						<div class="description">
							<div class="name">[아레테까사] 스칸 식기건조대</div>
							<div class="price_original">
								<s>8,900 원</s>
							</div>
							<div class="price_discount">
								<span>3,500</span> 원 (61%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/14846"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/2017071012472893pO7bsY0M.jpg" />
						</a>
						<div class="description">
							<div class="name">[요리즐] 매그넛 블랙라벨 키친툴 세트</div>
							<div class="price_original">
								<s>34,800 원</s>
							</div>
							<div class="price_discount">
								<span>31,300</span> 원 (11%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/14875"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20170823133905TqOAFdngMA.png" />
						</a>
						<div class="description">
							<div class="name">[노바리빙] 다용도 문걸이 수납선반</div>
							<div class="price_original">
								<s>21,900 원</s>
							</div>
							<div class="price_discount">
								<span>17,500</span> 원 (20%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/19115"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20180329192905tvGVzuXVNZ.jpeg" />
						</a>
						<div class="description">
							<div class="name">[데코뷰] 키친 소프트 주방매트 (택1)</div>
							<div class="price_original">
								<s>42,000 원</s>
							</div>
							<div class="price_discount">
								<span>29,400</span> 원 (30%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/19212"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/201803291931345fRPT4qEVn.jpeg" />
						</a>
						<div class="description">
							<div class="name">[룸앤홈] 네온LED무드등</div>
							<div class="price_original">
								<s>19,900 원</s>
							</div>
							<div class="price_discount">
								<span>15,900</span> 원 (20%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/23257"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/2018052407452418UY1KmXnd.jpg" />
						</a>
						<div class="description">
							<div class="name">[블루밍앤미] 롱 스탬 유칼립투스</div>
							<div class="price_original">
								<s>5,000 원</s>
							</div>
							<div class="price_discount">
								<span>4,000</span> 원 (20%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/23915"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/201805291359551JticBMaTH.jpg" />
						</a>
						<div class="description">
							<div class="name">[프랑코] 스탠드 분리수거함</div>
							<div class="price_original">
								<s>68,000 원</s>
							</div>
							<div class="price_discount">
								<span>46,900</span> 원 (31%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/24817"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20180605145200lx5fHhQcHW.jpeg" />
						</a>
						<div class="description">
							<div class="name">[아르셰] 메모 패드</div>
							<div class="price_original">
								<s>36,000 원</s>
							</div>
							<div class="price_discount">
								<span>17,900</span> 원 (50%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/26897"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20180627172107cm2c8quOUe.jpg" />
						</a>
						<div class="description">
							<div class="name">[더홈스] 접이식 에코백</div>
							<div class="price_original">
								<s>12,900 원</s>
							</div>
							<div class="price_discount">
								<span>10,300</span> 원 (20%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/27203"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/201807111755448by7pSCxAb.jpg" />
						</a>
						<div class="description">
							<div class="name">[웰림] 못없이 설치하는 디자이너 벽걸이 화분</div>
							<div class="price_original">
								<s>20,000 원</s>
							</div>
							<div class="price_discount">
								<span>16,900</span> 원 (16%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/29149"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/20180810150706E2kHojUNUg.jpg" />
						</a>
						<div class="description">
							<div class="name">[라이크하우스] [1+1]비닐봉투 보관함/비닐봉지정리함 비닐정리함
								비닐봉지보관함 [HY]</div>
							<div class="price_original">
								<s>9,200 원</s>
							</div>
							<div class="price_discount">
								<span>4,600</span> 원 (50%)
							</div>
						</div>
					</div>
					<div class="furniture-slick-item">
						<a href="/furniture/view/29751"> <img
							src="//cdn.ggumim.co.kr/cache/furniture/600/2018081616502591u1IKm1US.jpg" />
						</a>
						<div class="description">
							<div class="name">[블루밍앤미] 블루밍앤미 리스&갈란드</div>
							<div class="price_original">
								<s>11,000 원</s>
							</div>
							<div class="price_discount">
								<span>8,800</span> 원 (20%)
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- -->
			<div class="furniture-qna">
				<div class="commerce-title">
					<h2 style="margin-bottom: 0px;">Q&A</h2>
					<div class="qna-wrapper">
						<div
							onclick="location.href='https://www.ggumim.co.kr/furniture/write_qna/29976';">Q&A
							작성하기</div>
						<div
							onclick="kakao_link('https://lc-api.lunasoft.co.kr/lunachat/api-connect/@%EC%A7%91%EA%BE%B8%EB%AF%B8%EA%B8%B0%EC%A0%9C%EB%B3%B4/main');">
							<img style="height: 35px"
								src="//cdn.ggumim.co.kr/resource/icons/btn_kakao_talk_contact2.png">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">작성된 Q&A가 없습니다.</div>
				</div>
			</div>
		</div>
		<!--/.furniture-view-->
	</div>
	<br />
	<br />
	</div>
	<div class="comment-list" id="comment">
		<div class="comment-container"></div>
		<!--/.comment-container-->
	</div>
	<!--/.comment-list-->
	<!-- Mobon Shop Log Tracker v3.1 start -->
	<script src="https://cdn.megadata.co.kr/js/enliple_min2.js"
		defer="defer" onload="mobRfShop()"></script>
	<script>
		Stack
				.add(function() {
					FurnitureView.init("29976");
					FurnitureView
							.setUnit('{"56885-":{"unitIdx":219575,"price":20800,"name":"\ub9c8\ud638\uac00\ub2c8","count":241,"count_type":0,"status":1,"sold":1},"56886-":{"unitIdx":219576,"price":20800,"name":"\uc5d0\ubcf4\ub2c8","count":241,"count_type":0,"status":1,"sold":1}}');
					FurnitureView.setExtraUnit('[]');
					FurnitureView.setOptionStatus('{"56886-":1,"56885-":1}');
					FurnitureView
							.setOption('{"56885":{"idx":56885,"parent_idx":56884,"type":2,"name":"\ub9c8\ud638\uac00\ub2c8","price":0,"url":"","map":"","color":"#FFFFFF","parent_name":"\uceec\ub7ec"},"56886":{"idx":56886,"parent_idx":56884,"type":2,"name":"\uc5d0\ubcf4\ub2c8","price":0,"url":"","map":"","color":"#FFFFFF","parent_name":"\uceec\ub7ec"}}');
					FurnitureView.setOptionSet('[[56885,56886]]');
					FurnitureView.vars.dept = 1;
					FurnitureView.vars.outsideLink = '';
					var option_count = $(".option-item").length;

					if (option_count > 4) {
						$(".furniture-view-extra-option").css("margin-top",
								"100px");
					}
					FurnitureView.visibility = '1';
					FurnitureView.naverPay.stock = "Y";
				});
		/*
		 Stack.add(function(){
		 FurnitureView.getReviews();
		 });
		 */

		/*
		 Stack.add(function() {
		 Comment.init("2", "29976");
		 setTimeout(function() {
		 Comment.getList(".comment-container");
		 }, 1000);
		 });
		 */
	</script>
	
	<script type="text/javascript" async
		src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
	<!-- // WIDERPLANET SCRIPT END 2018.7.5 -->
	<!-- Shopping targeting -->
	
	
	<!--JS Offsite-->
	<!-- <script type="text/javascript">
		window.Symbol
				|| function(t) {
					"use strict";
					var e = Object.defineProperty, n = "__symbol-"
							+ Math.ceil(1e9 * Math.random()) + "-", i = 0;
					function o(t) {
						if (!(this instanceof o))
							return new o(t);
						var e = n + i++;
						this._symbol = e
					}
					e(o.prototype, "toString", {
						enumerable : !1,
						configurable : !1,
						writable : !1,
						value : function() {
							return this._symbol
						}
					}), t.Symbol = o
				}(this);
	</script> -->
	<script type="text/javascript"
		src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript"
		src="https://pay.naver.com/customer/js/naverPayButton.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="//cdn.ggumim.co.kr/resource/house_interior_web/ggumim-1.2.05.min.js"></script>
	<script>
		var api_url = "https://api.ggumim.co.kr";
		//  쌍였던 애들 처리
		Stack.process();

		// 너무 많이 페이지 내러가면, 업 버튼 생기기
		Scrolltop.begin();

		// 갤러리!
		Naruto.begin();
	</script>
	
</body>
</html>
