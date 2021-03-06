
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>










<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>BLENDING TREND - COMING SOON</title>
<link rel="stylesheet" href="/resources/lib/jquery/css/jquery-ui.min.css">
<link rel="stylesheet" href="/resources/lib/swiper/swiper-bundle.min.css">
<link rel="stylesheet" href="/resources/css/lib.css">
<link rel="stylesheet" href="/resources/css/main.css">


<script src="/resources/lib/jquery/jquery.min.js"></script>
<script src="/resources/lib/jquery/jquery-ui.min.js"></script>
<script src="/resources/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/lib/swiper/swiper-bundle.min.js"></script>
<script src="/resources/lib/waypoints/jquery.waypoints.min.js"></script>
<script src="/resources/lib/waypoints/shortcuts/sticky.min.js"></script>
<script src="/resources/lib/waypoints/shortcuts/inview.min.js"></script>
<script src="/resources/js/ui.js"></script>
<script src="/resources/js/main-pc.js"></script>
<script src="/resources/js/detail.js"></script>
<script src="/resources/js/common.js"></script>
<script src="/resources/lib/jquery/messagebox.js"></script>
<script src="/resources/lib/crypto-js/aes.js"></script>
<script src="/resources/lib/crypto-js/sha256.js"></script>
<script src="/resources/lib/jquery/messagebox.js"></script>
<script>
	var now = new Date(); //현재 날짜 가져오기
	let date1 = new Date(2022, 02, 22, 13, 00, 00);

	if (date1.getTime() < now.getTime()){
		location.href='/web/main/index.bt'
	}
</script>
</head>
<body>
	<div class="site-container">

		<header class="global-header">
	<div class="global-nav-bar-container sticky" id="stickyHeader">
		<nav class="global-nav-bar no-line white"> <!-- no-line white  -->
			<div class="wrapper">
				<a href="/web/main/main.bt;jsessionid=45B3FD545823A8BE333C33C1CAD0BB7D" class="header-logo-link">
					<h1 class="header-logo" title="BLENDING TREND"></h1>
				</a>
				<ul class="gnb-menu">
				</ul>
				<!--로그인 전 -->

					<ul class="global-top-menu gnb-menu-extra">

					</ul>


			</div>
		</nav>
	</div>
</header>
		 <main class="main-container">
      <div class="main-content main-bg">
        <div class="main-img">
          <div class="main-text-wrap">
            <span class="main-text-title">Product Sourcing Marketplace</span>
            <span>글로벌 소비재 시장 진출을 위한 필수 관문</span>
<!--              <a href="https://forms.gle/fFpZn9qAV7cs2RLJ9">무 료 상 담</a> -->
            <a href="https://forms.gle/fFpZn9qAV7cs2RLJ9">무료제품등록</a>
            <div class="coming-timer">
              <span id="dd">00
						<p>DAYS</p>
					</span> <span id="hh">00
						<p>HOURS</p>
					</span> <span id="mm">00
						<p>MINUTES</p>
					</span> <span id="ss">00
						<p>SECONDS</p>
					</span>
            </div>
          </div>
          <div class="main-text-bottom">
            <span>글로벌 셀러 및 소비자에게 당신의 제품을 소개하고 경험할 수 있는 기회를 제공</span>
          </div>
        </div>
        <!--
        <div class="main-form-wrap">
          <div class="main-form">
            <div class="main-form-img"><img src="/resources/images/sample1.jpg" alt=""></div>
            <div class="main-form-text">
              <span class="main-form-title">커스텀 브랜드 페이지</span>
              <span>브랜드페이지를 꾸미고 제품의 특장점을 강조하여 매력 어필 자유로운 브랜드 및 제품 페이지 공유</span>
            </div>
          </div>
          <div class="main-form reverse">
            <div class="main-form-img"><img src="/resources/images/sample2.jpg" alt=""></div>
            <div class="main-form-text">
              <span class="main-form-title">바이어 맞춤 큐레이션</span>
              <span>바이어가 필요로하는 필수 정보 위주 제품 쇼케이스 바이어 맞춤형 카테고리 큐레이션 및 필터링</span>
            </div>
          </div>
          <div class="main-form">
            <div class="main-form-img"><img src="/resources/images/sample3.jpg" alt=""></div>
            <div class="main-form-text">
              <span class="main-form-title">다채널 제품 홍보 및 판매</span>
              <span>다양한 글로벌 바이어에게 직접 브랜드 제안 글로벌 마케팅 채널 구축</span>
            </div>
          </div>
          <div class="main-fotter-btn">
            <a href="main_brand.html" class="brand-btn">
              <i class="wn-icon brand">브랜드</i>
              <span class="brand-color"><b>Brand</b> 더 알아보기</span>
            </a>
            <a href="main_buyer.html" class="buyer-btn">
              <i class="wn-icon buyer">바이어</i>
              <span class="buyer-color"><b>Buyer</b> 더 알아보기</span>
            </a>
          </div>
        </div> -->

        <hr class="spacer-bottom">
      </div><!-- /.main-content -->
    </main>

		<footer class="global-footer">
			<div class="footer-content">
				<h1 class="header-logo" title="BLENDING TREND"></h1>
			</div>
		</footer>
	</div>
	<!-- /.site-container -->

	<!-- 팝업: login -->
	<section class="modal fade wn-modal login" id="popLogin">
		<div class="modal-dialog modal-dialog-centered modal-slide">
			<div class="modal-content">
				<button class="btn-close" data-dismiss="modal" title="닫기"></button>
				<div class="wn-modal-body pa-30">
					<div class="select-type">
						<a href="javascript:void(0)" class="active"> <img src="/resources/images/brand.png" alt=""> <img src="/resources/images/brand_bw.png" alt="">
							<p>Brand</p>
						</a> <a href="javascript:void(0)"> <img src="/resources/images/buyer.png" alt=""> <img src="/resources/images/buyer_bw.png" alt="">
							<p>Buyer</p>
						</a>
					</div>
					<section class="login-form pa-30">
						<form id="loginFm" action="loginDo.lp" method="post">
								<input type="hidden" id="sessKey" 		name="sessKey" 		value="" />
						<div class="mt-10">
							<div class="form-field">
								<input type="text" class="input-text" id="loginId" name="loginId" placeholder="아이디">
							</div>
							<div class="form-field">
								<input type="hidden" id="userPassword" 	name="userPassword" 	/>
								<input type="password" class="input-text" id="userPasswordTmp" name="" placeholder="비밀번호">
							</div>
						</div>
						<div class="login-menu">
							<label class="checkbox"> <input type="checkbox" id="idSaveCheck" name="idSaveCheck" value="true" checked> <span class="label">아이디 저장</span>
							</label> <label class="checkbox"> <input type="checkbox" id="auto_login"> <span class="label">자동 로그인</span>
							</label>
						</div>
						</form>
						<div class="mt-30">
							<a href="#" class="button bt-black d-block" onclick="loginDo();return false;">로그인</a>
						</div>
						<div class="mt-15">
							<ul class="list-v-bar">
								<!-- <li><a href="./WN_PB_PC_MEM_020400.html">회원가입</a></li>
								<li><a href="./WN_PB_PC_MEM_020500.html">아이디/비밀번호 찾기</a></li> -->
							</ul>
						</div>
					</section>
				</div>
			</div>
		</div>
	</section>

	<!-- 팝업: Join -->
	<section class="modal fade wn-modal login" id="popJoin">
		<div class="modal-dialog modal-dialog-centered modal-slide">
			<div class="modal-content">
				<button class="btn-close" data-dismiss="modal" title="닫기"></button>
				<form id="saveFm" action="joinDo.lp" method="post">
					<div class="wn-modal-body pa-30">
						<div class="join-title">
							<!-- class="green" 추가 -->
							<p>다양한 글로벌 바이어를 만나보세요.</p>
							<p>무료 브랜드 프로파일 등록</p>
						</div>
						<section class="join-form">
							<div class="form-field">
								<div class="d-flex">
									<input type="text" class="input-text input-detail" placeholder="이름" name="lastNm">
									<input type="text" class="input-text input-detail" placeholder="성" name="firstNm">
								</div>
							</div>
							<div class="form-field">
								<input type="text" class="input-text" name="email" placeholder="Email" value="">
							</div>
							<div class="form-field">
								<input type="password" class="input-text" name="password" placeholder="password" value="">
							</div>
							<div class="form-field">
								<div class="input-add add-right2">
									<div class="custom-select wd-100">
										<select>
											<option value="">+82</option>
											<option value="">+82</option>
											<option value="">+82</option>
										</select>
									</div>
									<input type="text" class="input-text" name="phone" placeholder="Phone">
								</div>
							</div>
							<div class="form-field">
								<input type="text" class="input-text" name="cmpyNm" placeholder="회사명" value="">
							</div>
							<div class="form-field">
								<label class="checkbox">
									<input type="checkbox" name="" id="">
									 <span class="label"><span class="t-blue">서비스 약관</span> 및 <span class="t-blue">개인 정보 보호 정책</span>을 읽었으며<br>이에 동의합니다.</span>
								</label>
							</div>
							<div class="mt-30">
								<a href="#" class="button bt-blue d-block" onclick="joinDo();return false;">계속</a>
								<!-- bt-blue 또는 bt-green -->
							</div>
						</section>
					</div>
				</form>
			</div>
		</div>
	</section>
<script>

$( document ).ready(function() {

		if(getCookie("idSaveCheck") == "true"){
			$("#idSaveCheck").prop("checked",true);
			$("#loginId").val(getCookie("loginId"));
			$("#userPasswordTmp").val(getCookie("userPasswordTmp"));
		}


	    $("#userPasswordTmp").keydown(function(key) {
		    if (key.keyCode == 13) {
			    loginDo();
		    }
	    });
	});

	function loginDo() {
		if ($.trim($('#loginId').val()) == '') {
			alert("아이디를 입력해주세요"); // '아이디를 입력해주세요!'
			$('#loginId').focus();
			return;
		}
		if ($.trim($('#userPasswordTmp').val()) == '') {
			alert("비밀번호를 입력해주세요"); // '패스워드를 입력해주세요!'
			$('#userPasswordTmp').focus();
			return;
		}

		loginSubmit("/web/lgn/loginDo.ax");
	}


	function loginSubmit(urls){
         if($("#idSaveCheck").is(":checked") == true){
           	setCookie("idSaveCheck", "true", 31);
         	setCookie("loginId", $("#loginId").val(), 31);
  	        setCookie("userPasswordTmp",$("#userPasswordTmp").val() , 31);
         }else{
        	 deleteCookie("idSaveCheck");
        	 deleteCookie("loginId");
        	 deleteCookie("userPasswordTmp");
         }

		var encrypt = CryptoJS.AES.encrypt($("#userPasswordTmp").val(), "");
		$("#userPassword").val(encrypt)
		$.ajax({
			type : "POST",
			url : urls,
			data : $("#loginFm").serialize(),
			success : function(data) {

				if(data.code == "0000"){
					location.reload();
					$(".modal_bg_sub").hide();
				}else{
					$(".modal_bg_sub").hide();
					if(data.msg){
						alert(data.msg);
					}
					else{
						alert("오류가 발생했습니다.");
						//var url = "/web/lgn/logOut.lp";
						//location.href=url;
					}
					$("#userPassword").val("");
				}
			},
			error : function(e) {
				console.log(JSON.stringify(e));
			}
		});
	}


	function joinDo() {
		/* if ($.trim($('#loginId').val()) == '') {
			alert("아이디를 입력해주세요"); // '아이디를 입력해주세요!'
			$('#loginId').focus();
			return;
		}
		if ($.trim($('#userPasswordTmp').val()) == '') {
			alert("비밀번호를 입력해주세요"); // '패스워드를 입력해주세요!'
			$('#userPasswordTmp').focus();
			return;
		} */

		var url = "/web/lgn/joinSubmitDo.ax";
		var sendData = $("#saveFm").serialize();
		fn_submitRtnAjax(url, sendData, '')

	}

	function rtnFunction(typ,data){
		alert(data.msg);
		if(data.code == "0001"){
			location.href='';
		}
	}


	function counter() {
		var dday = new Date("feb 22,2022,13:00:00").getTime(); //디데이
		setInterval(
				function() {
					var now = new Date(); //현재 날짜 가져오기
					var distance = dday - now;
					var d = Math.floor(distance / (1000 * 60 * 60 * 24));
					var h = Math.floor((distance % (1000 * 60 * 60 * 24))
							/ (1000 * 60 * 60));
					var m = Math.floor((distance % (1000 * 60 * 60))
							/ (1000 * 60));
					var s = Math.floor((distance % (1000 * 60)) / 1000);



					let date1 = new Date(2022, 02, 22, 13, 00, 00);

					if (date1.getTime() < now.getTime()){
						location.href='/web/main/index.bt'
					}

					if (s < 10) {
						s = '0' + s;
					}
					if (m < 10) {
						m = '0' + m;
					}
					if (h < 10) {
						h = '0' + h;
					}




					$("#dd").html(d+"<p>DAYS</p>")
					$("#hh").html(h+"<p>HOURS</p>")
					$("#mm").html(m+"<p>MINUTES</p>")
					$("#ss").html(s+"<p>SECONDS</p>")
					$(".coming-timer").show();
				}, 1000);
	}
	counter();
</script>

</body>

</html>


