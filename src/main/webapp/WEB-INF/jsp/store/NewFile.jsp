<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- herina script end product view 1st -->
	<div class="container">
		<div class="furniture-view">
			<div class="row">
				<div class="col-xs-6 furniture-view-image monday-slick">
					<div class="furniture-view-image-wrapper">
						<div class="furniture-image">
							<img
								src="//cdn.ggumim.co.kr/cache/furniture/600/20180826221408SpDkq0A3Gg.jpg" />
						</div>
						<div class="furniture-image">
							<img
								src="//cdn.ggumim.co.kr/cache/furniture/600/20180826221410HtPpEGkpyq.jpg" />
						</div>
						<div class="furniture-image">
							<img
								src="//cdn.ggumim.co.kr/cache/furniture/600/20180826221414RkVDdVYL4Y.jpg" />
						</div>
						<div class="furniture-image">
							<img
								src="//cdn.ggumim.co.kr/cache/furniture/600/20180826221424LOUxwEnfW0.jpg" />
						</div>
						<div class="furniture-image">
							<img
								src="//cdn.ggumim.co.kr/cache/furniture/600/20180826221429NlI3aCnzgW.jpg" />
						</div>
					</div>
					<!--/.furniture-view-image-wrapper-->
					<div class="discount hide">
						(20%)<span>%</span>
					</div>
					<!--/.discount-->
				</div>
				<!--/.left menu end-->
				<div class="col-xs-6 furniture-view-infomation">
					<div class="furniture-view-brand">까사마루</div>
					<div class="furniture-view-name">오드리 접이식 테이블 세트</div>
					<div class="furniture-view-cost">
						<span class="original slashit">99,000 원</span><br /> <span
							class="discount">79,000</span> 원 <span class="discount_rate">(20%)</span>
					</div>
					<div class="furniture-delivery">
						<div class="row">
							<div class="col-xs-3">배송비</div>
							<div class="col-xs-9">
								<div style="float: left; font-size: 12px;">무료</div>
								<div style="float: left; font-size: 12px;">(선결제)</div>
								<input type="hidden" name="delivery-payment" value="0">
							</div>
						</div>
						<div class="row" style="margin-top: 10px; margin-bottom: 10px;">
							<div class="col-xs-3">구매 후기</div>
							<div class="col-xs-9">
								<div class="review-star-wrapper">
									<i class="fa fa-star grade-star-o" aria-hidden="true"></i> <i
										class="fa fa-star grade-star-o" aria-hidden="true"></i> <i
										class="fa fa-star grade-star-o" aria-hidden="true"></i> <i
										class="fa fa-star grade-star-o" aria-hidden="true"></i> <i
										class="fa fa-star grade-star-o" aria-hidden="true"></i>
								</div>
							</div>
						</div>
					</div>
					<!--/.right top menu end-->
					<div class="furniture-view-option ">
						<div class="option-set">
							<div class="option-title">색상</div>
							<div class="option-item-group" id="optionset0">
								<div class="option-item" data-idx="58913"
									onclick="FurnitureView.clickOption(0,this)">오크</div>
								<div class="option-item" data-idx="58914"
									onclick="FurnitureView.clickOption(0,this)">브라운</div>
							</div>
						</div>
					</div>
					<!--/.furniture-view-option-->
					<div class="row furniture-view-count">
						<div class="col-md-12 title">수량</div>
						<div class="col-md-12 item-quantity">
							<div class="left" onclick="FurnitureView.countDown();">
								<span class="fa fa-angle-down"></span>
							</div>
							<div class="order_count">
								<span>1</span>
							</div>
							<div class="right" onclick="FurnitureView.countUp();">
								<span class="fa fa-angle-up"></span>
							</div>
						</div>
					</div>
					<div class="furniture-view-total-price">
						<div>
							합계 : <span class="price">0</span> 원
						</div>
					</div>
					<div class="row" style="margin-right: -100px; margin-left: -1px;">
						<div class="col-xs-5 btn-cart" id="cartBtn"
							onclick="FurnitureView.addCart();">장바구니</div>
						<div class="col-xs-5 btn-just-buy"
							onclick="FurnitureView.order();">바로구매</div>
					</div>
					<div class="row" style="margin-right: -100px; margin-left: 10px;">
						<div class="col-xs-12">
							<div id="naverPayButton"
								style="margin-top: 10px; margin-bottom: 10px;"></div>
						</div>
					</div>
				</div>
		</div>
		</div>
		</div>
</body>
</html>