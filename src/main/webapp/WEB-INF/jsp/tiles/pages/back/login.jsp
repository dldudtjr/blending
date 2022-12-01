<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>BLENDING TREND - admin</title>
  <link rel="stylesheet" href="<c:url value='/resources/lib/jquery/css/jquery-ui.min.css'/> ">
  <link rel="stylesheet" href="<c:url value='/resources/lib/swiper/swiper-bundle.min.css'/> ">
  <link rel="stylesheet" href="<c:url value='/resources/css/lib.css'/> ">
  <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/> ">


</head>
<body>
  <div class="site-container">
    <main class="main-container">
      <div class="flex he-100">
        <div class="admin-bg"></div>
        <div class="admin-login">
          <section class="login-form pa-30">
	          <sf:form commandName="loginFm" action="loginDo.lp">
				<input type="hidden" id="sessKey" 		name="sessKey" 		value="${_ssesKey}" />
	            <p class="admin-login-title mb-20">Log in</p>
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
	            	<label class="checkbox">
	            		 <input type="checkbox" id="idSaveCheck" name="idSaveCheck" value="true" checked>
	            		  <span class="label">Remember ID</span>
							</label>

	            </div>
	            <div class="mt-30">
	              <a href="#" class="button bt-black d-block"  onclick="loginDo();return false;">SIGN IN</a>
           		 </div>
            </sf:form>
          </section>
        </div>
      </div>
    </main>
  </div><!-- /.site-container -->
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
<script src="/resources/js/common.js"></script>

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
				return this.optional(element) ||  /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+]).*$/.test(value);

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

		loginSubmit("<c:url value='/back/lgn/loginDo.ax'/>");
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

	function rtnFunction(typ,data){
		alert(data.code);
		if(data.code == "0001"){
			location.href='/back/user/userList.bt';
		}
	}

</script>
</body>

</html>
