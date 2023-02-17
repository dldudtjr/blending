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
        <div class="main-img brand">
          <div class="main-text-wrap">
            <span class="main-text-sub">해외 시장 진출을 준비하는 브랜드를 위한 서비스</span>
          </div>
        </div>
        <div class="main-form-wrap">
          <div class="main-form">
            <div class="main-form-img"><img src="/resources/images/main_brand1.png" alt=""></div>
            <div class="main-form-text">
              <span class="main-form-title sub">브랜드 랜딩 페이지</span>
              <span>브랜드 홍보용 전용 페이지<br>
                브랜드가 보유한 전제품 및 브랜드 아이덴티티 확인<br>
                검증된 브랜드/기업 상세정보 노출</span>
            </div>
          </div>
          <div class="main-form reverse">
            <div class="main-form-img"><img src="/resources/images/main_brand2.png" alt=""></div>
            <div class="main-form-text">
              <span class="main-form-title sub">카드식 제품제안서</span>
              <span>바이어에게 필요한 필수 제품 정보 확인<br>
                제품의 유통현황 및 인증 상태 확인</span>
            </div>
          </div>
          <div class="main-form">
            <div class="main-form-img"><img src="/resources/images/main_brand3.jpeg" alt=""></div>
            <div class="main-form-text">
              <span class="main-form-title sub">기타 수출 서비스</span>
              <span>글로벌 유통 시장 확인<br>
                국가별 판매채널 및 바이어 검색<br>
                해외 인증, 포워딩 및 통관 정보</span>
            </div>
          </div>
        </div>

        <hr class="spacer-bottom">
      </div><!-- /.main-content -->
    </main>
	<jsp:include page="/WEB-INF/jsp/tiles/layouts/frnt/foot.jsp" flush="true" />
	</div>
	<!-- /.site-container -->

	<!-- 팝업: login -->
	<section class="modal fade wn-modal login" id="popLogin">
		<div class="modal-dialog modal-dialog-centered modal-slide">
			<div class="modal-content">
				<button class="btn-close" data-dismiss="modal" title="닫기"></button>
				<div class="wn-modal-body pa-30">

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
							</label> <label class="checkbox"> <input type="checkbox" id="auto_login" name="auto_login" value="true"> <span class="label">자동 로그인</span>
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
					<input type="hidden" id="userType"  name="userType" />
					<div class="wn-modal-body pa-30">
						<div class="join-title">
							<!-- class="green" 추가 -->
							<p>다양한 글로벌 바이어를 만나보세요.</p>
							<p>무료 브랜드 프로파일 등록</p>
						</div>
						<div class="select-type">
							<a href="javascript:void(0)" class="userType active" > <img src="/resources/images/brand.png" alt=""> <img src="/resources/images/brand_bw.png" alt="">
								<p>Brand</p>
							</a> <a href="javascript:void(0)" class="userType"> <img src="/resources/images/buyer.png" alt=""> <img src="/resources/images/buyer_bw.png" alt="">
								<p>Buyer</p>
							</a>
						</div>
						<section class="join-form">
							<div class="form-field">
								<div class="d-flex">
									<input type="text" class="input-text input-detail" placeholder="이름" name="lastNm" id="lastNm" />
									<input type="text" class="input-text input-detail" placeholder="성"   name="firstNm" id="firstNm" />
								</div>
							</div>
							<div class="form-field">
								<input type="text" class="input-text" name="email" placeholder="Email" value="" id="email" />
							</div>
							<div class="form-field">
								<input type="password" class="input-text" name="password" placeholder="password" value="" id="password">
							</div>
							<div class="form-field">
								<div class="input-add add-right2">
									<div class="custom-select wd-100">
										<select>
											<option value="">+82</option>
										</select>
									</div>
									<input type="text" class="input-text" name="phone" placeholder="Phone" id="phone">
								</div>
							</div>
							<div class="form-field">
								<input type="text" class="input-text" name="cmpyNm" placeholder="회사명" value="" id="cmpyNm">
							</div>
							<div class="form-field">
								<label class="checkbox">
									<input type="checkbox" name="" id="">
									 <span class="label"><span class="t-blue">서비스 약관</span> 및 <span class="t-blue">개인 정보 보호 정책</span>을 읽었으며<br>이에 동의합니다.</span>
								</label>
							</div>
							<div class="mt-30">
								<a href="#" class="button bt-blue d-block saveBtn">계속</a>
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

			if(getCookie("auto_login") == "true"){
				$("#auto_login").prop("checked",true);
			}




		    $("#userPasswordTmp").keydown(function(key) {
			    if (key.keyCode == 13) {
				    loginDo();
			    }
		    });

		    $.validator.addMethod("pw_regexp", function(value, element) {
				// return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
				return this.optional(element) ||  /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+]).*$/.test(value);

			});

		    $.validator.addMethod("telnum", function(telnum, element) {
				var pattern = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/;
				if (!pattern.test(telnum)) {
					return this.optional(element) || false;
				}
				return true;
			});


			jQuery.validator.addMethod("notEqual", function(value, element, param) {
				if(value == $(param).val()){
				  return this.optional(element) || false;
				}
			  return true;
			});

			$("#saveFm").validate({
				rules : {
					lastNm : {
						required : true
					},
					firstNm : {
						required : true
					},
					email : {
						required : true
					},
					phone : {
						required : false,
						telnum : true
					},
					password : {
						 pw_regexp : true // 정규식
						,required  : true // 정규식
						,minlength : 8 // 최소입력글수  4자
						,maxlength : 12
					},
					cmpyNm : {
						required : true
					},


				},
				messages : {
					lastNm : {
						required : "<code:msg code='validate.msg.common'/>"
					},
					firstNm : {
						required : "<code:msg code='validate.msg.common'/>"
					},
					email : {
						required : "<code:msg code='validate.msg.common'/>"
					},
					password : {
						required  : "<code:msg code='valid.pwd.nine'/>"
					},
					phone : {
						required  : "<code:msg code='valid.pwd.nine'/>"
					},
					cmpyNm : {
						required : "<code:msg code='validate.msg.common'/>"
					},
				},
				errorPlacement : function(error, element) {
					if (element.is(":radio") || element.is(":checkbox")) {
					} else if (element.is('select')) {
						element.attr("placeholder", error[0].outerText);
						element.css("border", "red solid 1px");
						element.css("width", "500px");
					} else {
						element.attr("placeholder", error[0].outerText);
					}
				},
				submitHandler : function() {
					$(".modal_bg_sub").show();
					joinDo();
				}
			});

			$(".saveBtn").click(function() {
				$("#saveFm").submit();
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

         if($("#auto_login").is(":checked") == true){
            setCookie("auto_login", "true", 31);
         }else{
         	 deleteCookie("auto_login");
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
		if($(".userType:eq(0)").hasClass("active")){
			$("#userType").val("001");
		}else{
			$("#userType").val("002");
		}
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
