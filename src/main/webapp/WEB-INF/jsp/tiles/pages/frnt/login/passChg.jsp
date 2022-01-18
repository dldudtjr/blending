<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
	$(".modal_wrap").css("width", "550px");
	$(".modal_wrap").css("height", "auto");
    $(function() {
	    $('.btnPop_chg').click(function() {
		    if (fn_pw_check()) {
		    	$(".modal_bg_sub").show();
			    $.ajax({
			        type : "POST",
			        url : contextPath + "/lgn/passChgDo.ax",
			        data : {
				        chgPassWd : $("#chgPassWd").val(),
				        userPassword : $("#userPassword").val(),
			        },
			        success : function(data) {
			        	$(".modal_bg_sub").hide();
			        	$.MessageBox(data.msg).done(function(){
					        if ( data.rtn == 'SUCC' ){
					        	$('.btnPop_close').click();
					        }
	 					}).fail(function(){
	 					    // Do something in response to NO
	 					});
			        },
			        error : function(e) {
				        console.log(JSON.stringify(e));
			        }
			    });
		    }
	    });
    });

    var pw_passed = true; // 추후 벨리데이션 처리시에 해당 인자값 확인을 위해

    function fn_pw_check() {
	    var chgPassWd = $('#chgPassWd').val(); //비밀번호
	    pw_passed = true;
	    var pattern1 = /[0-9]/;
	    var pattern2 = /[a-zA-Z]/;
	    var pattern3 = /[~!@\#$%<>^&*]/; // 원하는 특수문자 추가 제거
	    var pw_msg = "";

	    if ($('#userPassword').val().length == 0) {
	    	$.MessageBox("<code:msg code='valid.bPwd'/>"); //이전 비밀번호를 입력해주세요
		    return false;
	    }

	    if (chgPassWd.length == 0) {
	    	$.MessageBox("<code:msg code='valid.aPwd'/>"); //변경 비밀번호를 입력해주세요
		    return false;
	    } else if (chgPassWd != $('#chgPassWdChk').val()) {
	    	$.MessageBox("<code:msg code='valid.fail.pwd'/>"); //변경 비밀번호가 일치하지 않습니다.
		    return false;
	    }

	    if (!pattern1.test(chgPassWd) || !pattern2.test(chgPassWd) || !pattern3.test(chgPassWd) || chgPassWd.length<9||chgPassWd.length>50) {
	    	$.MessageBox("<code:msg code='valid.pwd.nine'/>"); //영문+숫자+특수기호 9자리 이상으로 구성하여야 합니다.
		    return false;
	    }

	    if (chgPassWd.indexOf('${_sessionKey.loginId}') > -1) {
	    	$.MessageBox("<code:msg code='valid.pwd.noId'/>"); //비밀번호는 ID를 포함할 수 없습니다.
		    return false;
	    }

	    var SamePass_0 = 0; //동일문자 카운트
	    var SamePass_1 = 0; //연속성(+) 카운드
	    var SamePass_2 = 0; //연속성(-) 카운드

	    for (var i = 0; i < chgPassWd.length; i++) {
		    var chr_pass_0;
		    var chr_pass_1;
		    var chr_pass_2;

		    if (i >= 2) {
			    chr_pass_0 = chgPassWd.charCodeAt(i - 2);
			    chr_pass_1 = chgPassWd.charCodeAt(i - 1);
			    chr_pass_2 = chgPassWd.charCodeAt(i);

			    //동일문자 카운트
			    if ((chr_pass_0 == chr_pass_1) && (chr_pass_1 == chr_pass_2)) {
				    SamePass_0++;
			    } else {
				    SamePass_0 = 0;
			    }

			    //연속성(+) 카운드
			    if (chr_pass_0 - chr_pass_1 == 1 && chr_pass_1 - chr_pass_2 == 1) {
				    SamePass_1++;
			    } else {
				    SamePass_1 = 0;
			    }

			    //연속성(-) 카운드
			    if (chr_pass_0 - chr_pass_1 == -1 && chr_pass_1 - chr_pass_2 == -1) {
				    SamePass_2++;
			    } else {
				    SamePass_2 = 0;
			    }
		    }

		    if (SamePass_0 > 0) {
		    	$.MessageBox("<code:msg code='valid.pwd.dont1'/>"); //동일문자를 3자 이상 연속 입력할 수 없습니다.
			    pw_passed = false;

		    }

		    if (SamePass_1 > 0 || SamePass_2 > 0) {
		    	$.MessageBox("<code:msg code='valid.pwd.dont2'/>"); //영문, 숫자는 3자 이상 연속 입력할 수 없습니다.
			    pw_passed = false;

		    }

		    if (!pw_passed) {
			    return false;
			    break;
		    }
	    }
	    return true;
    }
</script>
<div class="geneMng_modal">
	<div id="header" class="dragTitle">
		<h1><code:msg code="login.chgPwd"/><!--비밀번호변경--></h1>
		<div class="top_area">
			<p>
				<span></span>&nbsp;<span></span>
			</p>
		</div>
		<a href="#;" class="modal_cl"><code:msg code="button.close"/></a>
	</div>
	<div class="pwc_area">
		<table>
			<caption class="blind"><code:msg code="login.chgPwd"/><!--비밀번호변경--></caption>
			<tbody>
				<tr>
					<th><code:msg code="login.bPwd"/><!--이전 비밀번호--></th>
					<td>
						<input type="password" id="userPassword" name="userPassword" value="" maxlength="64">
					</td>
				</tr>
				<tr>
					<th><code:msg code="login.aPwd"/><!--변경 비밀번호--></th>
					<td>
						<input type="password" id="chgPassWd" name="chgPassWd" value="" maxlength="64">
					</td>
				</tr>
				<tr>
					<th><code:msg code="login.chgPwdChk"/><!--변경 비밀번호(확인)--></th>
					<td>
						<input type="password" id="chgPassWdChk" name="chgPassWdChk" value="" maxlength="64">
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn_area">
		<ul>
			<li><input type="button" value="<code:msg code="button.change"/>" class="btnPop_chg" /></li><!--변경-->
			<li><input type="button" value="<code:msg code="button.cancel"/>" class="btnPop_close" /></li>
		</ul>
	</div>
</div>