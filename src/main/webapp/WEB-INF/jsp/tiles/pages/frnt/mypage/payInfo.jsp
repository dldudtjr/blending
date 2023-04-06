<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div class="sidebar-main">
	<header class="sidebar-main-header">
		<h3 class="tit">구독정보</h3>
	</header>
	<div class="info-subscribe mt-10">
		<h4 class="info-wrap-title">사용중인 상품</h4>
		<div class="d-flex mt-20">
			<span class="info-subscribe-box">${saveFm.priceCodeTxt}</span>
			<div class="ml-auto wd-700">
				<div class="input-add align-items-center">
					<div class="t-18 gray-5 wd-130 mr-10">마지막 결제</div>
					<input type="text" class="input-text" name="" value="${saveFm.paymentDt}" readonly>
				</div>
				<div class="input-add align-items-center mt-10">
					<div class="t-18 gray-5 wd-130 mr-10">서비스 종료</div>
					<input type="text" class="input-text wd-520" name="" value="${saveFm.serviceEdDt}" readonly>
					<c:if test="${not empty saveFm.serviceEdDt}">
					<button class="button bt-blue w-140 injuryBtn">종료 날짜 연장</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!-- <header class="sidebar-main-header mt-50">
              <h3 class="tit">MY 포인트</h3>
            </header>
            <div class="info-subscribe mt-10">
              <div class="d-flex">
                <div class="form-field">
                  <h4 class="detail-wrap-title">BTM 포인트</h4>
                  <div class="input-add add-right">
                    <input type="text" class="input-text" name="" value="10,000">
                    <button class="button bt-blue w-140">BTM 충전</button>
                  </div>
                  <div class="d-flex align-items-center mt-10">
                    <i class="wn-icon exclamation mr-5"></i>
                    <span class="gray-5">포인트 및 CASH 환불은 고객센터 문의</span>
                  </div>
                </div>
                <div class="form-field ml-50">
                  <h4 class="detail-wrap-title">CASH</h4>
                  <input type="text" class="input-text" name="" value="30,000">
                </div>
              </div>
            </div> -->
	<header class="sidebar-main-header mt-50">
		<h3 class="tit">서비스</h3>
	</header>
	<div class="info-wrap-select mt-30">
		<div class="info-select ${saveFm.priceCode} ">
			<div class="info-select-form free">
				<img src="/resources/images/free.png">
			</div>
		</div>
		<div class="info-select ${saveFm.priceCodeA}">
			<div class="info-select-form">
				<span class="info-select-title">BASIC</span>
				<div class="info-select-cont">
				<span class="wd-100p mb-10"> <br> </span>
				</span> <span class="t-left t-16">1. 브랜드 제안쿠폰<br>2. 제품 무제한 등록<br>3. 바이어 뉴스레터 등록
				</span>
				</div>
			</div>
			<div class="info-select-form2 mt-10">
				<span class="info-select-title">10만원 / Month</span> <span>1년 구독시 2개월 무료 제공</span>
			</div>
		</div>
		<div class="info-select ${saveFm.priceCodeB}">
			<div class="info-select-form">
				<span class="info-select-title">PREMIUM</span>
				<div class="info-select-cont">
					<span class="wd-100p mb-10">BASIC 서비스 <span class="ps-15 plus">+</span>
					</span> <span class="t-left t-16">1. 제안서 Template 제공<br>2. 영업이력 관리<br>3. 커뮤니티 서비스 제공
					</span>
				</div>
			</div>
			<div class="info-select-form2 mt-10">
				<span class="info-select-title">30만원 / Month</span> <span>1년 구독시 2개월 무료 제공</span>
			</div>
		</div>
		<div class="info-select ${saveFm.priceCodeC}">
			<div class="info-select-form">
				<span class="info-select-title">EXCLUSIVE</span>
				<div class="info-select-cont">
					<span class="wd-100p mb-10">PREMIUM 서비스 <span class="px-15 plus">+</span>
					</span> <span class="t-left t-16">1. 팀 로그인<br>2. 브랜드 담당 매니저<br>3. 브랜드 맞춤 서비스
					</span>
				</div>
			</div>
			<div class="info-select-form2 mt-10">
				<span class="info-select-title">150만원 / Month</span> <span>1년 구독시 2개월 무료 제공</span>
			</div>
		</div>
	</div>
	<div class="mt-60 bt-center">
		<a href="javascript:void(0)" class="button bt-blue wd-200 " onclick="payPop();">구독 변경하기</a>
	</div>
</div>

<script>
	$(document).ready(function() {
		$(".detail-top").hide();
	});
</script>


<!-- 팝업: 구독변경하기 -->
<sf:form commandName="saveFm" cssClass="form-horizontal">
	<input type="hidden" id="prvPriceCode" name="prvPriceCode" value="${saveFm.priceCode}" />
	<input type="hidden" id="prvServiceEdDT" name="prvServiceEdDt" value="${saveFm.serviceEdDt}" />
	<section class="modal fade wn-modal subscribe" id="popSubscribe">
		<div class="modal-dialog modal-dialog-centered modal-slide">
			<div class="modal-content">
				<button class="btn-close" data-dismiss="modal" title="닫기"></button>
				<div class="wn-modal-body">
					<div class="pop-subscribe">
						<div class="d-flex justify-content-between">
							<div class="gray-9">
								<span class="mr-15">사용중인 서비스</span><b class="serviceNm">${saveFm.priceCodeTxt}</b>
							</div>
							<div class="gray-9">
								<span class="mr-15">서비스 시작</span><b class="serviceStDt">${saveFm.serviceStDt}</b>
							</div>
							<div class="gray-9">
								<span class="mr-15">서비스 종료</span><b class="serviceEdDt">${saveFm.serviceEdDt}</b>
							</div>
						</div>
					</div>
					<sf:hidden path="priceCode" />
					<input type="hidden" id="price" value="">
					<div class="d-flex align-items-center mt-30">
						<div class="subscribe-title">
							상품명<br>
							<span class="t-13">가격(VAT별도)</span>
						</div>
						<div class="subscribe-select priceCode">

							<a href="javascript:void(0)" data-id="001" data-price="100000" class="t-24 active"><b>BASIC</b><br>
								<p class="t-16 mt-5">￦100,000</p></a>
							<a href="javascript:void(0)" data-id="002" data-price="300000" class="t-24"><b>PREMIUM</b><br>
								<p class="t-16 mt-5">￦300,000</p></a>
							<a href="javascript:void(0)" data-id="003" data-price="1500000" class="t-24"><b>EXCLUSIVE</b><br>
			s					<p class="t-16 mt-5">￦1,500,000</p>
								<div class="help-wrap">
									<i class="wn-icon exclamation ml-5"></i>
									<div class="help-cont">
										<span>결제 진행전 상담 필수</span>
									</div>
								</div> </a>
						</div>
					</div>
					<sf:hidden path="periodUse" data-percent="1" data-paymonth="1" />
					<sf:hidden path="periodMonth"  />
					<div class="d-flex align-items-center mt-30">
						<div class="subscribe-title">구독기간</div>
						<div class="subscribe-select periodUse">
							<a href="javascript:void(0)" data-paymonth="1" 	data-month="1"	data-percent="1" class="t-18 active"><b>1개월</b></a>
							<a href="javascript:void(0)" data-paymonth="3" 	data-month="3"	data-percent="1" class="t-18"><b>3개월</b></a>
							<a href="javascript:void(0)" data-paymonth="6" 	data-month="6"	data-percent="0.9" class="t-18"><b>6개월</b><br>
							<p class="t-16 mt-5"></p></a>
							<a href="javascript:void(0)" data-paymonth="12"  data-month="14"	data-percent="1" class="t-18"><b>12개월</b><br>
							<p class="t-16 mt-5">2개월 무료</p></a>
						</div>
					</div>
					<!--  <div class="d-flex align-items-center mt-30">
            <div class="subscribe-title">BTM 포인트</div>
            <div class="d-flex align-items-center">
              <span class="mr-15">10,000(보유)</span>
              <div class="input-add add-right">
                <input type="text" class="input-text wd-130" name="" placeholder="" value="10,000">
                <button class="button bt-blue wd-80">적용</button>
              </div>
            </div>
            <div class="subscribe-title ml-50">CASH
              <div class="help-wrap">
                <i class="wn-icon exclamation ml-5"></i>
                <div class="help-cont">
                  <span>세부내용 설명입니다. 세부내용 설명입니다.</span>
                </div>
              </div>
            </div>
            <div class="d-flex">
              <span>￦30,000</span>
            </div>
          </div>
          <div class="d-flex align-items-center mt-30">
            <div class="subscribe-title">쿠폰</div>
            <div class="d-flex align-items-center">
              <div class="input-add add-right">
                <input type="text" class="input-text wd-200" name="" placeholder="" value="">
                <button class="button bt-blue wd-80">적용</button>
              </div>
            </div>
          </div>
		-->


					<div class="d-flex align-items-center mt-30">
						<div class="subscribe-title">결제금액</div>
						<div class="d-flex align-items-center">
							<span class="t-18 mr-15">￦</span> <span class="t-18 mr-15 servicePrice">100000</span>
							<sf:hidden path="servicePrice" value="100000" />
						</div>

			<!--
			<div class="t-18 ml-100">결제 후 서비스 종료일</div>
            <div class="d-flex ml-50">
              <span>2022. 09. 16</span>
            </div>
			 -->
					</div>
					<!--           <div class="d-flex align-items-center mt-30">
            <div class="subscribe-title">결제방법</div>
            <div class="subscribe-select">
              <a href="javascript:void(0)" class="t-18 active"><b>신용카드</b></a>
              <a href="javascript:void(0)" class="t-18"><b>계좌이체</b></a>
            </div>
          </div> -->
					<div class="mt-30 bt-center">
						<a href="#" class="button bt-gray wd-200 closeBtn">취소</a> <a href="#" class="submitPay button bt-blue wd-200">결제하기</a>
					</div>
				</div>

			</div>
		</div>
	</section>
</sf:form>
<script>
	var cnt = 0;
	var msg = "${msg}";

	$(function() {

		if (msg != "") {
			alert(msg);
		}

		$(document).on("click", ".closeBtn", function() {
			$('#popSubscribe').modal('hide')
		});

		$(document).on("click", ".submitPay", function() {
			var url = "<c:url value='/web/mypage/appServiceInsDo.ax'/>";
			paySubmit(url, "결제");
		});

		$(document).on("click", ".injuryBtn", function() {
			var price = 100000;
			if($('#prvPriceCode').val() == "002"){
				price = 300000;
			}else if($('#prvPriceCode').val() == "003"){
				price = 1500000;
			}
			$("#price").val(price);
			$('#priceCode').val($('#prvPriceCode').val());
			$('#periodUse').val("1");
			$("#servicePrice").val($("#price").val()  * $("#periodUse").val() * $("#periodUse").data("percent"));

			var url = "<c:url value='/web/mypage/appServiceInsDo.ax'/>";
			paySubmit(url, "결제");
		});



	});

	function payPop() {
		$('#popSubscribe').modal('show');
		$('.periodUse a').eq(0).click();
		$('.priceCode a').eq(0).click();
	}



	function paySubmit(url, msg) {
		$.ajax({
			url : url,
			data : $("#saveFm").serialize(),
			type : 'POST',
			success : function(data) {
				if (data.msg) {
					// submitDo()
					payPopup(data.msg, data.loginId);
				}
			},
			error : function(e) {
				console.log(JSON.stringify(e));
			}
		});
	}

	function payPopup(orderCode, loginId) {
		var sUrl = window.location.origin + "/web/mypage/success.bt";
		var eUrl = window.location.origin + "/web/mypage/error.bt";
		var cUrl = window.location.origin + "/web/mypage/cancel.bt";
		var url = "https://api.steppay.kr/api/public/orders/" + orderCode
				+ "/pay?successUrl=" + sUrl + "&errorUrl=" + eUrl
				+ "&cancelUrl=" + cUrl;
		var name = "appPopup test";
		var option = "width =625, height = 812, top = 100, left = 200, location = no";
		window.open(url, name, option);
	}

	function submitDo() {
		var url = "<c:url value='/web/mypage/success.ax'/>";
		var sendData = $("#saveFm").serialize();

		$.ajax({
			url : url,
			data : $("#saveFm").serialize(),
			type : 'POST',
			success : function(data) {
				alert("결제 되었습니다");
				location.reload();
			},
			error : function(e) {
				console.log(JSON.stringify(e));
			}
		});
	}
</script>
