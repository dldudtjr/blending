

<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>BLENDING TREND</title>
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

<script src="<c:url value='/resources/lib/jquery/jquery.validate.min.js'/>"></script>

</head>
<body>
	<div class="site-container">
<%-- ${_sessionKey} --%>
		<jsp:include page="/WEB-INF/jsp/tiles/layouts/frnt/head.jsp" flush="true" />
		 <main class="main-container">
      <div class="main-content main-bg">
        <div class="main-img">
          <div class="main-text-wrap">
            <span class="main-text-title">Product Sourcing Marketplace</span>
            <span>????????? ????????? ?????? ????????? ?????? ?????? ??????</span>
<!--              <a href="https://forms.gle/fFpZn9qAV7cs2RLJ9">??? ??? ??? ???</a> -->
            <a href="https://forms.gle/fFpZn9qAV7cs2RLJ9">??????????????????</a>
            <!-- <div class="coming-timer">
              <span id="dd">00
						<p>DAYS</p>
					</span> <span id="hh">00
						<p>HOURS</p>
					</span> <span id="mm">00
						<p>MINUTES</p>
					</span> <span id="ss">00
						<p>SECONDS</p>
					</span>
            </div> -->
          </div>
          <div class="main-text-bottom">
            <span>????????? ?????? ??? ??????????????? ????????? ????????? ???????????? ????????? ??? ?????? ????????? ??????</span>
          </div>
        </div>
        <div class="main-form-wrap">
          <div class="main-form">
            <div class="main-form-img"><img src="/resources/images/sample1.jpg" alt=""></div>
            <div class="main-form-text">
              <span class="main-form-title">????????? ????????? ?????????</span>
              <span>????????????????????? ????????? ????????? ???????????? ???????????? ?????? ?????? ???????????? ????????? ??? ?????? ????????? ??????</span>
            </div>
          </div>
          <div class="main-form reverse">
            <div class="main-form-img"><img src="/resources/images/sample2.jpg" alt=""></div>
            <div class="main-form-text">
              <span class="main-form-title">????????? ?????? ????????????</span>
              <span>???????????? ??????????????? ?????? ?????? ?????? ?????? ???????????? ????????? ????????? ???????????? ???????????? ??? ?????????</span>
            </div>
          </div>
          <div class="main-form">
            <div class="main-form-img"><img src="/resources/images/sample3.jpg" alt=""></div>
            <div class="main-form-text">
              <span class="main-form-title">????????? ?????? ?????? ??? ??????</span>
              <span>????????? ????????? ??????????????? ?????? ????????? ?????? ????????? ????????? ?????? ??????</span>
            </div>
          </div>
          <div class="main-fotter-btn">
            <a href="<c:url value='/web/main/brandMain.bt'/>" class="brand-btn">
              <i class="wn-icon brand">?????????</i>
              <span class="brand-color"><b>Brand</b> ??? ????????????</span>
            </a>
            <a href="<c:url value='/web/main/buyerMain.bt'/>"  class="buyer-btn">
              <i class="wn-icon buyer">?????????</i>
              <span class="buyer-color"><b>Buyer</b> ??? ????????????</span>
            </a>
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

	<!-- ??????: login -->
	<section class="modal fade wn-modal login" id="popLogin">
		<div class="modal-dialog modal-dialog-centered modal-slide">
			<div class="modal-content">
				<button class="btn-close" data-dismiss="modal" title="??????"></button>
				<div class="wn-modal-body pa-30">

					<section class="login-form pa-30">
						<sf:form commandName="loginFm" action="loginDo.lp">
								<input type="hidden" id="sessKey" 		name="sessKey" 		value="${_ssesKey}" />
						<div class="mt-10">
							<div class="form-field">
								<input type="text" class="input-text" id="loginId" name="loginId" placeholder="?????????">
							</div>
							<div class="form-field">
								<input type="hidden" id="userPassword" 	name="userPassword" 	/>
								<input type="password" class="input-text" id="userPasswordTmp" name="" placeholder="????????????">
							</div>
						</div>
						<div class="login-menu">
							<label class="checkbox"> <input type="checkbox" id="idSaveCheck" name="idSaveCheck" value="true" checked> <span class="label">????????? ??????</span>
							</label> <label class="checkbox"> <input type="checkbox" id="auto_login" name="auto_login" value="true"> <span class="label">?????? ?????????</span>
							</label>
						</div>
						</sf:form>
						<div class="mt-30">
							<a href="#" class="button bt-black d-block" onclick="loginDo();return false;">?????????</a>
						</div>
						<div class="mt-15">
							<ul class="list-v-bar">
								<!-- <li><a href="./WN_PB_PC_MEM_020400.html">????????????</a></li>
								<li><a href="./WN_PB_PC_MEM_020500.html">?????????/???????????? ??????</a></li> -->
							</ul>
						</div>
					</section>
				</div>
			</div>
		</div>
	</section>

	<!-- ??????: Join -->
	<section class="modal fade wn-modal login" id="popJoin">
		<div class="modal-dialog modal-dialog-centered modal-slide">
			<div class="modal-content">
				<button class="btn-close" data-dismiss="modal" title="??????"></button>
				<sf:form commandName="saveFm" action="joinDo.lp">
					<input type="hidden" id="userType"  name="userType" />
					<div class="wn-modal-body pa-30">
						<div class="join-title">
							<!-- class="green" ?????? -->
							<p>????????? ????????? ???????????? ???????????????.</p>
							<p>?????? ????????? ???????????? ??????</p>
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
									<input type="text" class="input-text input-detail" placeholder="??????" name="lastNm" id="lastNm" />
									<input type="text" class="input-text input-detail" placeholder="???"   name="firstNm" id="firstNm" />
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
								<input type="text" class="input-text" name="cmpyNm" placeholder="?????????" value="" id="cmpyNm">
							</div>
							<div class="form-field">
								<label class="checkbox">
									<input type="checkbox" name="" id="">
									 <span class="label"><span class="t-blue">????????? ??????</span> ??? <span class="t-blue">?????? ?????? ?????? ??????</span>??? ????????????<br>?????? ???????????????.</span>
								</label>
							</div>
							<div class="mt-30">
								<a href="#" class="button bt-blue d-block saveBtn">??????</a>
								<!-- bt-blue ?????? bt-green -->
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
						 pw_regexp : true // ?????????
						,required  : true // ?????????
						,minlength : 8 // ??????????????????  4???
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
			alert("<code:msg code='valid.id'/>"); // '???????????? ??????????????????!'
			$('#loginId').focus();
			return;
		}
		if ($.trim($('#userPasswordTmp').val()) == '') {
			alert("<code:msg code='valid.pw'/>"); // '??????????????? ??????????????????!'
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
		var dday = new Date("feb 14,2022,09:00:00").getTime(); //?????????
		setInterval(
				function() {
					var now = new Date(); //?????? ?????? ????????????
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


