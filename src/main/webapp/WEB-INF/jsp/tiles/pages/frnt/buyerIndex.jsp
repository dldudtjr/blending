<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>BLENDING TREND - COMING SOON</title>
<link rel="stylesheet" href="<c:url value='/resources/lib/jquery/css/jquery-ui.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/lib/swiper/swiper-bundle.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/lib.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">


<script src="<c:url value='/resources/lib/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/lib/jquery/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/resources/lib/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/resources/lib/swiper/swiper-bundle.min.js'/>"></script>
<script src="<c:url value='/resources/lib/waypoints/jquery.waypoints.min.js'/>"></script>
<script src="<c:url value='/resources/lib/waypoints/shortcuts/sticky.min.js'/>"></script>
<script src="<c:url value='/resources/lib/waypoints/shortcuts/inview.min.js'/>"></script>
<script src="<c:url value='/resources/js/ui.js'/>"></script>
<script src="<c:url value='/resources/js/main-pc.js'/>"></script>
<script src="<c:url value='/resources/js/detail.js'/>"></script>
<script src="<c:url value='/resources/js/common.js'/>"></script>
<script src="<c:url value='/resources/lib/jquery/messagebox.js'/>"></script>
<script src="<c:url value='/resources/lib/crypto-js/aes.js'/>"></script>
<script src="<c:url value='/resources/lib/crypto-js/sha256.js'/>"></script>
<script src="<c:url value='/resources/lib/jquery/messagebox.js'/>"></script>
</head>
<body>
	<div class="site-container">
<%-- ${_sessionKey} --%>
		<jsp:include page="/WEB-INF/jsp/tiles/layouts/frnt/head.jsp" flush="true" />
		<main class="main-container">
      <div class="main-content main-bg">
        <div class="main-img buyer">
          <div class="main-text-wrap">
            <span class="main-text-sub">신제품 소싱이 필요한 국내/외 바이어를 위한 서비스</span>
          </div>
        </div>
        <div class="main-form-wrap">
          <div class="main-form">
            <div class="main-form-img"><img src="/resources/images/sample1.jpg" alt=""></div>
            <div class="main-form-text">
              <span class="main-form-title sub">신제품 큐레이션</span>
              <span>바이어 전용 데시보드로 소싱 시간 단축<br>
                인기 신제품 및 트렌딩 제품을 실시간 확인</span>
            </div>
          </div>
          <div class="main-form reverse">
            <div class="main-form-img"><img src="/resources/images/sample2.jpg" alt=""></div>
            <div class="main-form-text">
              <span class="main-form-title sub">바이어 맞춤 큐레이션 리스트</span>
              <span>상세 조건 필터로 필요한 제품 검색<br>
                관심 제품을 저장하여 미래 소싱에 사용</span>
            </div>
          </div>
          <div class="main-form">
            <div class="main-form-img"><img src="/resources/images/sample3.jpg" alt=""></div>
            <div class="main-form-text">
              <span class="main-form-title sub">커스텀 서비스</span>
              <span>브랜드와 다이렉트 연결<br>
                신제품 모집 일정 관리<br>
                해외 브랜드사 확인/검증</span>
            </div>
          </div>
        </div>

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
						<sf:form commandName="loginFm" action="loginDo.lp">
								<input type="hidden" id="sessKey" 		name="sessKey" 		value="${_ssesKey}" />
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
						</sf:form>
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
				<sf:form commandName="saveFm" action="joinDo.lp">
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
				</sf:form>
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
			alert("<code:msg code='valid.id'/>"); // '아이디를 입력해주세요!'
			$('#loginId').focus();
			return;
		}
		if ($.trim($('#userPasswordTmp').val()) == '') {
			alert("<code:msg code='valid.pw'/>"); // '패스워드를 입력해주세요!'
			$('#userPasswordTmp').focus();
			return;
		}

		loginSubmit("<c:url value='/web/lgn/loginDo.ax'/>");
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

		var encrypt = CryptoJS.AES.encrypt($("#userPasswordTmp").val(), "${_symtcKey}");
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
						alert("<code:msg code='success.common.error'/>");
						//var url = "<c:url value='/web/lgn/logOut.lp'/>";
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
			alert("<code:msg code='valid.id'/>"); // '아이디를 입력해주세요!'
			$('#loginId').focus();
			return;
		}
		if ($.trim($('#userPasswordTmp').val()) == '') {
			alert("<code:msg code='valid.pw'/>"); // '패스워드를 입력해주세요!'
			$('#userPasswordTmp').focus();
			return;
		} */

		var url = "<c:url value='/web/lgn/joinSubmitDo.ax'/>";
		var sendData = $("#saveFm").serialize();
		fn_submitRtnAjax(url, sendData, '')

	}

	function rtnFunction(typ,data){
		alert(data.msg);
		if(data.code == "0001"){
			location.href='';
		}
	}

/*
	function counter() {
		var dday = new Date("feb 14,2022,09:00:00").getTime(); //디데이
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
	counter(); */
</script>

</body>

</html>


