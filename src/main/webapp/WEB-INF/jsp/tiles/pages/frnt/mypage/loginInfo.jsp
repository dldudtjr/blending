<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="sidebar-main">
	<header class="sidebar-main-header">
		<h3 class="tit">로그인 설정</h3>
	</header>
	<div class="info-wrap block mt-30">
			<h4 class="info-wrap-title">로그인 이메일 & 비밀번호 설정</h4>
			<sf:form commandName="emailFm" cssClass="form-horizontal" enctype="multipart/form-data">
			<div class="form-field">
				<div class="input-add add-right2">
					<input type="text" class="input-text" name="email" id="email" placeholder="새로운 이메일">
					<button type="button"  class="emailSend button bt-blue-text">인증</button>
				</div>
				<font style="color:blue; font-size:9pt">* 새로운 이매일 입력후 인증버튼을 누르세요  </font>
			</div>
			</sf:form>
			<!-- <div class="form-field">
				<input type="password" class="input-text" name="userPassword" placeholder="새로운 비밀번호" value="">
			</div> -->
			<sf:form commandName="saveFm" cssClass="form-horizontal" enctype="multipart/form-data">
			<div class="form-field">
				<input type="password" class="input-text" name="chgPassWd" id="chgPassWd" placeholder="새로운 비밀번호" value="">
			</div>
			<div class="form-field">
				<div class="input-add add-right2">
					<input type="password" class="input-text" name="chgPassWdChk" id="chgPassWdChk" placeholder="비밀번호 확인 ">
					<button type="button"  class="passwordChk button bt-blue-text">확인</button>
				</div>
				<font style="color:blue; font-size:9pt">* 비밀번호 입력 후 확인버튼을 누르세요  </font><br />
				<font style="color:red;  font-size:9pt">* <code:msg code='validate.msg.pw_regexp'/></font>
			</div>
			</sf:form>
<%--
			<h4 class="info-wrap-title mt-30">접근 권한</h4>
			<div class="connectAuth">
				<c:forEach items="${authLst}" var="row" varStatus="cnt">
					<div class="form-field">
						<div class="d-flex">
							<div class="input-add add-right2">
								<input type="text" class="input-text wd-160" name="" placeholder="이름" value="${row.userFullNm}" disabled>
								<input type="text" class="input-text" name="userEmailArr" placeholder="Email"  value="${row.email}" >
								<button type="button" class="btnDel button bt-blue-text">삭제 </button>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="form-field">
					<div class="d-flex">
						<div class="input-add add-right2">
							<input type="text" class="input-text wd-160" name="" placeholder="이름" value="" disabled>
							<input type="text" class="input-text" name="userEmailArr" placeholder="Email">
							<button type="button" class="btnAdd button bt-blue-text">추가</button>
						</div>
					</div>
				</div>
			</div> --%>
		<!-- <div class="mt-30 bt-right">
			<a href="#" class="authSaveBtn button bt-blue w-140">저장</a>
		</div> -->
		<!-- <div class="form-field">
			<div class="d-flex">
				<div class="input-add add-right2">
					<input type="text" class="input-text wd-160" placeholder="이름" value=""> <input type="text" class="input-text" name="" placeholder="Email">
					<button class="button bt-blue-text">추가</button>
				</div>
			</div>
		</div> -->
	</div>
</div>
<script>
var cnt = 0;

$(function() {
	$(".detail-top").hide();



    $(document).on("click",".btnAdd",function() {
    	var txt = "";
    	txt +='<div class="form-field">';
    		txt +='<div class="d-flex">';
    		txt +='<div class="input-add add-right2">';
    			txt +='<input type="text" class="input-text wd-160" placeholder="이름" name="nameArr" value="">';
    			txt +='<input type="text" class="input-text" name="emailArr" placeholder="Email">';
    			txt +='<button class="btnDel button bt-blue-text">삭제 </button>';
    		txt +='</div>';
    	txt +='</div>';
    	txt +='</div>';
    	$(".connectAuth").append(txt);
		cnt ++;
		if(cnt > 1){
	        var offset = $(".btnAdd").offset();
	        $('html, body').animate({scrollTop : offset.top}, 200);
		}


    });

   $(document).on("click",".btnDel",function() {
    	$(this).parent().parent().remove();
    });




	$.validator.addMethod("pw_regexp", function(value, element) {
		// return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
		return this.optional(element) ||  /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+]).*$/.test(value);

	});

	jQuery.validator.addMethod("notEqual", function(value, element, param) {
		if(value == $(param).val()){
		  return this.optional(element) || false;
		}
	  return true;
	});

	$("#emailFm").validate({
		rules : {
			 email : {
					required: true,
					email : true
				},

		},
		messages : {
			email : {
			 required	: "<s:message code='validate.msg.common'/>" //ID (이메일형식)를 입력해 주세요
			,email 		: "email 형식에 맞게 입력해 주세요" //email 형식에 맞게 입력해 주세요
		},
		},
		errorPlacement : function(error, element) {
			if(element.is(":radio") || element.is(":checkbox")){
			}else if ( element.is('select') ) {
				element.attr("placeholder",error[0].outerText);
				element.css("border", "red solid 1px");
				element.css("width", "500px");
			}else{
				element.attr("placeholder",error[0].outerText);
			}
		},
		submitHandler : function() {

			var msg = "이메일을 변경 하시겠습니까? \n 변경후 재로그인 부탁드립니다. ";
			if (confirm(msg)) {

				var url = "<c:url value='/web/mypage/emailChgDo.ax'/>";
				var sendData = $("#emailFm").serialize();
				fn_submitFileRtnAjax(url, sendData);
			}
		}
	});




	$("#saveFm").validate({
		rules : {
			/* userPassword : {
				required  : true // 정규식
			}, */
			chgPassWd : {
				 pw_regexp : true // 정규식
				,required  : true // 정규식
				,minlength : 8 // 최소입력글수  4자
				,maxlength : 12
				,notEqual: "#userPassword"
			// 최대입력글수 12자
			},
			chgPassWdChk : {
				 required  : true // 정규식
				,pw_regexp : true // 정규식
				,minlength : 8 // 최소입력글수  4자
				,maxlength : 12
				,equalTo : '#chgPassWd' // #mb_password 와 일치하는지 확인
			}
		},
		messages : {
			/* userPassword : {
				 required 	: "<code:msg code='valid.msg.passwd'/>" //패스워드를 입력해 주세요
			}, */
			chgPassWd : {
				 required 	: "<code:msg code='validate.msg.pw_regexp'/>" //패스워드를 입력해 주세요
				,pw_regexp 	: "<code:msg code='validate.msg.pw_regexp'/>" //영문 대소문자, 숫자, 특수문자를 반드시 입력해 주시기 바랍니다.
				,minlength 	: "<code:msg code='validate.msg.minlength'/>" //{0}자 이상 입력해 주시기 바랍니다.
				,maxlength 	: "<code:msg code='validate.msg.maxlength'/>" //{0}자 이하로 입력해 주시기 바랍니다.
				,notEqual	: "<code:msg code='lgn.common.msgJ'/>" //아이디와 동일한 이메일을 사용할 수 없습니다.
			},
			chgPassWdChk : {
				required 	: "<code:msg code='validate.msg.pw_regexp'/>" //패스워드를 입력해 주세요
				,pw_regexp 	: "<code:msg code='validate.msg.pw_regexp'/>" //영문 대소문자, 숫자, 특수문자를 반드시 입력해 주시기 바랍니다.
				,minlength 	: "<code:msg code='validate.msg.minlength'/>" //{0}자 이상 입력해 주시기 바랍니다.
				,maxlength 	: "<code:msg code='validate.msg.maxlength'/>" //{0}자 이하로 입력해 주시기 바랍니다.
				,equalTo : "<code:msg code='validate.msg.password.equalTo'/>" //패스워드가 일치하지 않습니다.
			}
		},
		errorPlacement : function(error, element) {
			$(element).addClass("error");

			if(element.is(":radio") || element.is(":checkbox")){

			}else{
				element.attr("placeholder",error[0].outerText);
			}
		},
		submitHandler : function() {
			submitDo();
		}
	});

	$(document).on("click",".passwordChk",function() {
		var msg ="패스워드를 변경 하시겠습니까? \n 변경후 재로그인 부탁드립니다.";
		if (confirm(msg)) {
			$("#saveFm").submit();
		}
	});

	$(document).on("click",".emailSend",function() {
		$("#emailFm").submit();
	});


	$(document).on("click",".authSaveBtn",function() {
		var msg ="접속 권한을 추가 하시겠습니까?? \n 이름과 이메일이 가입된 유저의 정보와 일치하지 않을시 저장되지 않습니다. ";
		if (confirm(msg)) {
			var url = "<c:url value='/web/mypage/udtConnectAuthDo.ax'/>";
			var sendData = $("#saveFm").serialize();
			fn_submitReloadAjax(url, sendData);
		}
	});

});



function rtnFunction(typ, data){
	location.href='/web/lgn/logOut.bt';
}

function submitDo(){
	var url = "<c:url value='/web/mypage/passChgSubmitDo.ax'/>";
	var sendData = $("#saveFm").serialize();
	fn_submitReloadAjax(url, sendData);
}

</script>