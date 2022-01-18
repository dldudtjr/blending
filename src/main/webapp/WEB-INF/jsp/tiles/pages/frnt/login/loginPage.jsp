<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="/WEB-INF/jsp/tiles/layouts/lpsm/head.jsp" flush="true" />
</head>
<script>

	var authFido="";
	var authPin="";
	var authPtn="";
	$(function() {

		if(getCookie("idSaveCheck") == "true"){
			$("#idSaveCheck").prop("checked",true);
			$("#loginId").val(getCookie("loginId"));
			$("#userPasswordTmp").val(getCookie("userPasswordTmp"));
		}

		/* 가입문의  */
		$("#signup_text").click(function(){
			$(".signup_box").toggle();
		});

	    $("#userPasswordTmp").keydown(function(key) {
		    if (key.keyCode == 13) {
			    loginDo();
		    }
	    });
        /* Languages */
        $(".Languages").click(function(){
        	$(this).toggleClass("on");
        	$(".Languagesdown").toggle();
        });

        /* 앱설치 팝업 */
        $(".close_app").click(function(){
        	$(".install_app").hide();
        });

        var popup = getCookie("installPopUp");
        var filter = "win16|win32|win64|mac|macintel";
    	if ( navigator.platform && popup != "false") {
			if (filter.indexOf(navigator.platform.toLowerCase()) < 0 && isMobile.Android() == true && userAgent.match(/INNOVOTINGAPP/) == null) {
				// mobile
				$(".install_app").show();
			} else {
				//$(".install_app").show();
				$(".install_app").remove();
			}
		}
		$(".loginChg").click(function(){
			$(".webLogin, .appwebLogin, .appLogin").toggle();
		});

		$(".manualDown").click(function() {
			var url = "<c:url value='/web/lgn/manualDown.ax'/>";
			location.href = url;
		});


		$(".webLogin, .appwebLogin, .appLogin").hide();

		if (userAgent.match(/INNOVOTINGAPP/) == "INNOVOTINGAPP"){
			authFido  = window.android.getSharedPref("FIDO_USE") == 'Y' ? 'Y' : 'N';
			authPin   = window.android.getSharedPref("PIN_SAVE") != '' ? 'Y' : 'N';
			authPtn   = window.android.getSharedPref("PATTERN_SAVE") != '' ? 'Y' : 'N';

			if(authFido == 'Y' || authPin == 'Y' || authPtn == 'Y'){
	    		$(".webLogin").hide();
	    		$(".appLogin").show();
	    		if(authFido == 'Y' || authPin == 'Y' || authPtn == 'Y'){
	    			callActivity("AUTH_CONFIRM");
				}else{
					$(".loginChg").click();
				}
	    	}else{
	    		$(".webLogin").show();
	    		$(".appwebLogin, .appLogin").remove();
	    	}
		}else{
    		$(".webLogin").show();
    		$(".appwebLogin, .appLogin").remove();
    	}
	});


	function rtnFunction(msg){
		$.MessageBox(msg);
 	}
 	function rtnSensing(msg){
 		//위도/경도/센서/날짜/온도/습도/밝기
 		$.MessageBox("rtnSensing="+msg);
 		//$.MessageBox("jsonVal="+jsonVal);
 	}
 	function rtnAndSensing(){
	   var data = window.AppInventor.getWebViewString();
		data = data.split("||");

 	    var sendata ={
 	    				 tagSn 				:	data[0]
 	    				,gatherDate 		:	data[1]
 	    			    ,temperature 		:	data[2]
 	    			    ,humidity   		:	data[3]
 	    			    ,illumination 		:	data[4]
 	   					,latitude 			:	data[5]
 	    				,longitude 			:	data[6]
 	    				,latitudeDegree		:	data[5]
 						,latitudeMinute		:   '0'
						,longitudeDegree	:	data[6]
						,llongitudeMinute	:   '0'
 	    				}

 		// $.MessageBox(JSON.stringify(sendata));

 		$.ajax({
			type : "POST",
			data : sendata,
			url : '<c:url value="/cms/lgn/iotDataAdd.ax"/>',
			success: function(data) {

			},
			error : function(error) {
				console.log("error: "+error)
				return;
			}
		});
 	}

	function loginAppDo(){
		if (userAgent.match(/INNOVOTINGAPP/) == "INNOVOTINGAPP"){
    		$(".appLogin").show();

    		if(authFido == 'Y' || authPin != 'Y' || authPtn == 'Y'){
    			callActivity("AUTH_CONFIRM");
    		}else{
    			$.MessageBox("<code:msg code='loginp.msg.txt8'/>"); //아이디로 로그인후 인증수단을 추가해주세요
    		}

    	}
	}

	function loginDo() {
		if ($.trim($('#loginId').val()) == '') {
			$.MessageBox("<code:msg code='valid.id'/>"); // '아이디를 입력해주세요!'
			$('#loginId').focus();
			return;
		}
		if ($.trim($('#userPasswordTmp').val()) == '') {
			$.MessageBox("<code:msg code='valid.pw'/>"); // '패스워드를 입력해주세요!'
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
			data : $("#userVO").serialize(),
			success : function(data) {
				if(data.code == "0000"){
					if (userAgent.match(/INNOVOTINGAPP/) == "INNOVOTINGAPP" && authFido == 'N' && authPin == 'N' && authPtn == 'N'){
						msg = "<code:msg code='loginp.msg.txt7'/>"; //인증수단을 추가 하시겠습니까?
						MessageBoxConfirm(msg).done(function(){
							callActivity("PATTERN_USE");
						}).fail(function(){
							location.href='/web/main/index.lp';
						});
					}else{
						location.href='/web/main/index.lp';
					}
					$(".modal_bg_sub").hide();
				}else{
					$(".modal_bg_sub").hide();
					if(data.msg){
						$.MessageBox(data.msg);
					}
					else{
						$.MessageBox("<code:msg code='success.common.error'/>");
						var url = "<c:url value='/web/lgn/logOut.lp'/>";
						location.href=url;
					}
					$("#userPassword").val("");
				}
			},
			error : function(e) {
				console.log(JSON.stringify(e));
			}
		});
	}

	// 팝업 페이지
	function closeWindow() {
		setCookie("installPopUp", "false", 1);
		$(".close_app").click();
	}


	function rtnConfirmPattern(rtn) {
		if(rtn == "Y"){
			$(".modal_bg_sub").show();
			loginSubmit("<c:url value='/web/lgn/loginDidDo.ax'/>");
		}
	}

	function rtnConfirmPin(rtn) {
		if(rtn == "Y"){
			$(".modal_bg_sub").show();
			loginSubmit("<c:url value='/web/lgn/loginDidDo.ax'/>");
		}
	}

	function rtnConfirmFido(rtn) {
		if(rtn == "Y"){
			$(".modal_bg_sub").show();
			loginSubmit("<c:url value='/web/lgn/loginDidDo.ax'/>");
		}
	}

	function rtnUseFido(rtn) {
		submitDo(rtn, "authFido");
	}

	function rtnUsePattern(rtn) {
		submitDo(rtn, "authPtn");
	}

	function rtnUsePin(rtn) {
		submitDo(rtn, "authPin");
	}

	function submitDo(rtn, typ) {
		if (rtn != 'Y') { // 로그인 후 인증수단 요청시 인증 취소하면 인덱스 페이지로
			location.href='/web/main/index.lp';
		}

		// window.android.setSharedPref("USER_ID",$("#loginId").val());

		if($("#deviceId").val()  == "") return false;
		$("#"+typ).val("Y");
		$(".modal_bg_sub").show();
		var url = "<c:url value='/web/udtAuthUserDo.ax'/>"; // 명부목록에서 가져올떄
		$.ajax({
			type : "POST",
			url : url,
			data : $("#userVO").serialize(),
			success : function(data) {
				location.href='/web/main/index.lp';
			},
			error : function(e) {
				console.log(JSON.stringify(e));
			}
		});
	}

</script>
<body>
	<%-- <div class="install_app" style="display:none">
		<div class="close_app"></div>
		<p>BLock-Road <code:msg code='loginp.msg.txt3'/><br><code:msg code='loginp.msg.txt4'/></p>
		<div class="app" onclick="javscript:appChk('install','no');"><code:msg code='loginp.msg.txt5'/></div>
		<span onclick="javscript:closeWindow();"><code:msg code='loginp.msg.txt6'/></span>
	</div> --%>
	<div class="login">
		<h1 onclick="javascript:location.href='/web/main/roadPoIndexLst.lp'"></h1>
		<sf:form commandName="userVO" action="loginDo.lp">
		<input type="hidden" id="sessKey" 		name="sessKey" 		value="${_ssesKey}" />
		<input type="hidden" id="authFido" 		name="authFido" 	/>
		<input type="hidden" id="authPin" 		name="authPin" 		/>
		<input type="hidden" id="authPtn" 		name="authPtn" 		/>
		<input type="hidden" id="deviceId" 		name="deviceId" 	/>
		<input type="hidden" id="returnPage" 	name="returnPage" 	value="${param.returnPage}" />
		<input type="hidden" id="userPassword" 	name="userPassword" 	/>
		<input type="hidden" id="lang" 			name="lang" 		value="${_lang}" />
		<div class="login_box">
		<h2>환영합니다<br>로그인해주세요.</h2>
		<input type="text" 		class="webLogin" 	id="loginId" 			name="loginId" 	title="<code:msg code='button.title.id'/>" placeholder="<code:msg code='web.loginId'/>" />
		<input type="password" 	class="webLogin" 	id="userPasswordTmp" 	name="" title="<code:msg code='button.title.pw'/>" placeholder="<code:msg code='web.userPassword'/>" />

        <input type="checkbox" id="idSaveCheck" name="idSaveCheck" value="true">
        <label for="idSaveCheck">아이디 기억하기</label>
        <input type="checkbox" id="auto_login" name="">
        <!-- <label for="auto_login">자동로그인</label> -->


		<span class="login_btn" onclick="loginDo();return false;" ><code:msg code='button.login'/></span>
		<p><a href="/web/lgn/user/policy.lp">회원 가입하기</a></p>
        </div>
		</sf:form>
		<%-- <input class="sign_in webLogin" type="button" value="<code:msg code='button.login'/>" onclick="loginDo();return false;" />
		<input class="sign_in appLogin" type="button" value="<code:msg code='button.login'/>" onclick="loginAppDo();return false;" /> --%>
		<%-- <div class="forget ">
			<span class="webLogin"><a href="/web/lgn/findIdPw.lp"><code:msg code="button.findIdPw"/></a></span>
			<span class="appwebLogin"><br /><br /><a href="#" class="loginChg"><code:msg code='loginp.msg.txt1'/><!-- 다른 인증수단 로그인 --></a></span>
			<span class="appLogin"><br /><br /><a href="#" class="loginChg"><code:msg code='loginp.msg.txt2'/><!-- 아이디로 로그인 --></a></span>
		</div>
		<span style="font-size:14px;" >
	    	<a href="#" class="book manualDown">Manual Download</a>
    	</span>
    	<br /><br />
		<span style="font-size:14px;" id="signup_text"><code:msg code="login.msg.noMem"/></span>
		<a href="/web/lgn/join.lp"><code:msg code="button.signUp"/></a>
		<br /><br />
		<div class="signup_box">
			<code:msg code="signup.msg.vote"/><!-- 이노보팅은 기업용 블록체인 투표 시스템입니다. --><br>
			<code:msg code="signup.msg.question"/><!-- 사용문의나 가입문의는 --><br>
			<code:msg code="signup.msg.number"/><!-- 고객센터 : 070-4618-0681 --><br>
			<code:msg code="signup.msg.email"/><!-- 이메일 : staff@leadpoint.co.kr로 부탁드립니다. -->
		</div>
		<a href="/web/lgn/join.lp"><code:msg code="button.signUp"/></a>
		<div class="select_box">
			<span class="Languages" id="webLogin_L">Languages</span>
			<ol class="Languagesdown" id="webLogin_L_d">
				<li>
					<label class="langClk" data-lang="ko">한국어</label>
				</li>
				<li>
					<label class="langClk" data-lang="en">English</label>
				</li>
		    </ol>
	    </div> --%>
	</div>
	<div class="modal_bg_sub" style="display:none">
		<svg class="svgspin" viewBox="0 0 16 16">
			<path d="m8 0c-4.42 0-8 3.58-8 8s3.58 8 8 8 8-3.58 8-8-3.58-8-8-8m4.88 9.21c-.57 2.23-2.58 3.79-4.88 3.79s-4.31-1.56-4.88-3.79c-.1-.38.13-.76.51-.86.06-.02.12-.02.18-.02.32 0 .6.22.68.53.41 1.61 1.86 2.73 3.52 2.73s3.1-1.12 3.52-2.73c.08-.31.36-.53.68-.53.06 0 .12.001.18.02.18.05.34.16.43.33s.12.35.07.54"></path>
		</svg>
 	</div>
	<div class="modal_wrap_sub" style="width: 1000px; position: absolute; top: 50%; left: 50%; height: auto; display:none"></div>
	<script>
		if($("#sessKey").val() == "" ){
			location.href="/web/lgn/login.lp";
		}
		if (userAgent.match(/INNOVOTINGAPP/) == "INNOVOTINGAPP") {
			loginAppChk("${_symtcKey}");
		}
	</script>
</body>
</html>