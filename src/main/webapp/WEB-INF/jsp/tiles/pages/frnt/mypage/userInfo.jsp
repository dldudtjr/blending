<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="sidebar-main">
	<header class="sidebar-main-header">
		<h3 class="tit">나의 정보</h3>
	</header>
	<sf:form commandName="saveFm" cssClass="form-horizontal" enctype="multipart/form-data">
		<sf:hidden path="userId" />
		<div class="info-wrap mt-30">
			<div class="form-attach-image">
				<input type="file" name="" id="input-file" hidden=""> <label for="input-file">
					<div class="attach-image-thumb">
						<span class="attach-image-thumb-text">Your Photo<br> <br> <br> <br>Upload image
						</span>
						<div class="img-square">
							<div class="img-crop" data-attach-role="bgImg"></div>
						</div>
					</div>
				</label>
			</div>
			<div class="ml-auto info-field">
				<div class="form-field">
					<sf:input path="firstNm" 	class="input-text" placeholder="이름"  />
				</div>
				<div class="form-field">
					<sf:input path="lastNm" 	class="input-text" placeholder="성 " />
				</div>
				<div class="form-field">
					<sf:input path="position" 	class="input-text" placeholder="직책 " />
				</div>
				<div class="form-field">
					<div class="input-add add-right2">
						<sf:hidden path="emailCheckYn" />
						<sf:input path="email" 		class="input-text" placeholder="Email" />
						<c:if test="${saveFm.emailCheckYn eq 'Y' }">
							<button class="button bt-blue-text">인증완료 </button>
						</c:if>
						<c:if test="${saveFm.emailCheckYn eq 'N' }">
							<button class="button bt-blue-text emailSend">인증</button>
						</c:if>
					</div>
				</div>
				<div class="form-field select-add">
					<div class="input-add add-right2">
						<div class="custom-select wd-130">
							<select>
								<option value="">+82</option>
								<option value="">+82</option>
								<option value="">+82</option>
							</select>
						</div>
						<sf:input path="phone" class="input-text" placeholder="Phone" />
						<sf:hidden path="phoneCheckYn" />

						<c:if test="${saveFm.emailCheckYn eq 'Y' }">
							<button class="button bt-blue-text">인증완료 </button>
						</c:if>
						<c:if test="${saveFm.emailCheckYn eq 'N' }">
							<button class="button bt-blue-text emailSend">인증</button>
						</c:if>
						<!-- <button class="button">인증완료</button> -->
					</div>
				</div>
				<div class="form-field">
					<sf:input path="preferredTimeZone" class="input-text" placeholder="선호하는 시간대(Preferred Time Zone)" />
				</div>
				<div class="mt-30 bt-right">
					<a href="#" class="saveBtn button bt-blue w-140">저장</a>
				</div>
			</div>
		</div>
	</sf:form>
</div>

<script>
$( document ).ready(function() {
	/*
	$.validator.addMethod("phone", function(phone, element) {
		var pattern = /^[09]{2,3}[09]{3,4}[09]{4}$/;
		if (!pattern.test(telnum)) {
			return this.optional(element) || false;
		}
		return true;
	}); */

	$("#saveFm").validate({
		rules : {
			firstNm : {
				required : true
			}
			,lastNm : {
				required : true
			}
			,email : {
				required : true
			}
			,phone : {
				required : true
			}

		},
		messages : {
			firstNm : {
				required : "<code:msg code='validate.msg.common'/>"
			}
			,lastNm : {
				required : "<code:msg code='validate.msg.common'/>"
			}
			,email : {
				required : "<code:msg code='validate.msg.common'/>"
			}
			,phone : {
				required : "<code:msg code='validate.msg.common'/>"
			}
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
			var form = $('form')[0];
			var formData = new FormData(form);
			$(".modal_bg_sub").show();
			var url = "<c:url value='/web/mypage/userInfoSubmitDo.ax'/>";
			fn_submitFileAjax(url, formData);
		}
	});

	$(".saveBtn").click(function() {
		$("#saveFm").submit();
	});

});

</script>
