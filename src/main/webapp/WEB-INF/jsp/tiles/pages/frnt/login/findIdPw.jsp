<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/tiles/layouts/lpsm/head.jsp" flush="true" />
<style>
.srchMsg{ margin:25px 0 15px 10px; color:#0F4C81; font-weight:500;}
</style>
</head>
<script>
	$(document).ready(function() {
		$('.wrap_cate').click(function(e) {
			e.preventDefault();
			var tab_id = $(this).attr('data-cate');
			$('.wrap_cate').removeClass('on');
			$(this).addClass('on');

			$('.wrap_cont').hide();
			$('.wrap_find_' + tab_id).show();
		});

		$.validator.addMethod("pw_regexp", function(value, element) {
			return this.optional(element) || /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
		});

		// 패스워드 정규직
		$.validator.addMethod("pw_regexp", function(value, element) {
			return this.optional(element) || /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
		});

		$.validator.addMethod("telnum", function(telnum, element) {
			var pattern = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/;
			if (!pattern.test(telnum)) {
				return this.optional(element) || false;
			}
			return true;
		});

		$("#saveFm").validate({
			rules : {
				userNm : "required",
				emplyrEmail : {
					required : true,
					email : true
				}
			},
			messages : {
				userNm : "<code:msg code='valid.msg.userNm'/>", //유권자 이름을 입력해 주세요
				emplyrEmail : {
					required : "<code:msg code='valid.msg.emplyrEmail'/>", //이메일을 입력해 주세요
					email : "<code:msg code='valid.msg.emailChk'/>" //email 형식에 맞게 입력해주세요
				}
			},
			submitHandler : function() {
				findIdDo();
			}
		});

		$("#saveFmB").validate({
			rules : {
				loginId : {
					required : true,
					email : true
				},
				emplyrEmail : {
					required : true,
					email : true
				}
			},
			messages : {
				loginId : {
					required : "<code:msg code='valid.msg.loginId'/>", //이메일(ID)을 입력해 주세요
					email : "<code:msg code='valid.msg.emailChk'/>" //email 형식에 맞게 입력해주세요
				},
				emplyrEmail : {
					required : "<code:msg code='valid.msg.emplyrEmail'/>",    //이메일을 입력해 주세요
					email : "<code:msg code='valid.msg.emailChk'/>" //email 형식에 맞게 입력해주세요
				}
			},
			submitHandler : function() {
				submitDo();
			}
		});
		$("#btn_idudt").click(function(e) {
			e.preventDefault();
			$("#saveFm").submit();
		});

		$("#btn_pwudt").click(function(e) {
			e.preventDefault();
			$("#saveFmB").submit();
		});

		function findIdDo () {
			$(".modal_bg_sub").show();
			var url = "<c:url value='/web/lgn/findIdDo.ax'/>";
			$.ajax({
				url : url,
				data : $("#saveFm").serialize(),
				type : 'POST',
				success : function(result) {
					$(".modal_bg_sub").hide();
					if (result.id) {
						$("#loginId").val(result.id);
						$(".srchMsg").show();
						$("#loginId").show();
					} else {
						$.MessageBox(result.msg);
					}
				},
				error : function(e) {
					$.MessageBox("<code:msg code='success.common.error'/>");
					console.log(JSON.stringify(e));
				}
			});
		}

		function submitDo() {
			$(".modal_bg_sub").show();
			var url = "<c:url value='/web/lgn/findIdPwDo.ax'/>";
			$.ajax({
				url : url,
				data : $("#saveFmB").serialize(),
				type : 'POST',
				success : function(result) {
					$(".modal_bg_sub").hide();
					if(result.code =="0000"){ //success
						$.MessageBox(result.msg).done(function(){ // 발송되었습니다.
							url = "<c:url value='/web/lgn/login.lp'/>";
								location.href = url;
	 					}).fail(function(){
	 					    // Do something in response to NO
	 					});
					}else{ //success
						$.MessageBox(result.msg);
					}
				},
				error : function(e) {
					$.MessageBox("<code:msg code='success.common.error'/>");
					console.log(JSON.stringify(e));
				}
			});
		}

	});
</script>
<body>
	<div class="wrap">
		<div class="header" style="height:auto;">
			<div class="header_bar">
				<h2><a href="/web/lgn/login.lp" style="color:#fff;"><span><code:msg code="main.top.title"/></span><br>Inno-Voting</a></h2>
			</div>
		</div>
		<div class="contents">
			<ul class="top_btn" style="margin-bottom: 30px;">
				<li class="wrap_cate on" data-cate="001"><code:msg code="web.srchId"/><!--아이디 찾기--></li>
				<li class="wrap_cate " data-cate="002"><code:msg code="web.srchPw"/><!--비밀번호 찾기--></li>
			</ul>
			<sf:form commandName="saveFm" cssClass="form-horizontal">
				<input type="hidden" name="tokenR" value="${tokenR}" >
				<div class="wrap_cont wrap_find_001">
					<h3><code:msg code="web.srchId"/><!--아이디 찾기--></h3>
					<div class="input_box">
						<c:set var="srchNm"><code:msg code="web.userNm"/></c:set><!--이름-->
						<c:set var="srchEmail"><code:msg code="web.srchEmail"/></c:set><!--아이디 찾기 시 받을 이메일 주소 -->
						<sf:input path="userNm" placeholder="${srchNm}" />
						<sf:input path="emplyrEmail" maxlength="50" placeholder="${srchEmail}" />
						<p class="srchMsg" style="display:none;"> <code:msg code="web.srchIdrst"/> : </p>
						<sf:input path="loginId" style="display:none;" />
						<!-- <input type="text" placeholder="전화번호">
							<input class="btn_input" type="text" placeholder="인증번호">
							<button>인증번호 받기</button> -->
					</div>
					<div class="bottom_btn type">
						<button id="btn_idudt"><code:msg code="button.ok"/></button>
					</div>
				</div>
			</sf:form>
			<sf:form commandName="saveFmB" cssClass="form-horizontal">
				<div class="wrap_cont wrap_find_002" style="display: none;">
					<h3><code:msg code="web.srchPw"/><!--비밀번호 찾기--></h3>
					<div class="input_box">
						<c:set var="srchId"><code:msg code="web.loginId"/></c:set><!--이름-->
						<sf:input path="loginId" placeholder="${srchId}" />
						<sf:input path="emplyrEmail" maxlength="50" placeholder="${srchEmail}" />
					</div>
					<div class="bottom_btn type">
						<button id="btn_pwudt"><code:msg code="button.ok"/></button>
					</div>
				</div>
			</sf:form>
		</div>
	</div>
	<div class="modal_bg" ></div>
	<div class="modal_wrap" style="width: 1000px; position: absolute; top: 50%; left: 50%; height: auto;" ></div>
	<div class="modal_bg_sub" >
		<svg class="svgspin" viewBox="0 0 16 16">
			<path d="m8 0c-4.42 0-8 3.58-8 8s3.58 8 8 8 8-3.58 8-8-3.58-8-8-8m4.88 9.21c-.57 2.23-2.58 3.79-4.88 3.79s-4.31-1.56-4.88-3.79c-.1-.38.13-.76.51-.86.06-.02.12-.02.18-.02.32 0 .6.22.68.53.41 1.61 1.86 2.73 3.52 2.73s3.1-1.12 3.52-2.73c.08-.31.36-.53.68-.53.06 0 .12.001.18.02.18.05.34.16.43.33s.12.35.07.54"></path>
		</svg>
 	</div>
	<div class="modal_wrap_sub" style="width: 1000px; position: absolute; top: 50%; left: 50%; height: auto;"></div>
</body>
</html>