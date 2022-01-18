<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="sidebar-main">
	<header class="sidebar-main-header">
		<h3 class="tit">회사 정보</h3>
	</header>
	<sf:form commandName="saveFm" cssClass="form-horizontal" enctype="multipart/form-data">
	<sf:hidden path="cmpyId" />
	<div class="info-wrap mt-30">

		<div class="form-attach-image">
			<input type="file" name="" id="input-file" hidden=""> <label for="input-file">
				<div class="attach-image-thumb">
					<span class="attach-image-thumb-text">Company Logo<br>
					<br>
					<br>
					<br>Upload image
					</span>
					<div class="img-square">
						<div class="img-crop" data-attach-role="bgImg"></div>
					</div>
				</div>
			</label>
		</div>

		<div class="ml-auto info-field">
			<div class="form-field">
				<sf:input path="cmpyNm" 	class="input-text" placeholder="회사명"  />
			</div>
			<div class="form-field">
				<sf:input path="brandNm" 	class="input-text" placeholder="브랜드명"  />
			</div>
			<div class="form-field">
				<sf:input path="bizRegNo" 	class="input-text" placeholder="회사 등록 번호"  /><!-- <input type="text" class="input-text" name="" placeholder="회사 등록 번호" value=""> -->
			</div>
			<%-- <div class="form-field">
				<div class="input-add add-right2">
					<sf:input path="repEmail" class="input-text" placeholder="회사 등록 번호"  />
					<sf:hidden path="repEmailCheckYn" />
					<c:if test="${saveFm.repEmailCheckYn eq 'Y' }">
						<button class="button bt-blue-text">인증완료 </button>
					</c:if>
					<c:if test="${saveFm.repEmailCheckYn eq 'N' }">
						<button class="button bt-blue-text emailSend">인증</button>
					</c:if>

					<button class="button bt-blue-text">인증</button>
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
					<sf:input path="repPhone" class="input-text" placeholder="Phone"  />
					<sf:hidden path="repPhoneCheckYn" />
					<c:if test="${saveFm.repPhoneCheckYn eq 'Y' }">
						<button class="button bt-blue-text">인증완료 </button>
					</c:if>
					<c:if test="${saveFm.repPhoneCheckYn eq 'N' }">
						<button class="button bt-blue-text phoneSend">인증</button>
					</c:if>
				</div>
			</div> --%>
			<div class="form-field">
				<sf:input path="sectors"	class="input-text" placeholder="업종 "  />
			</div>
			<div class="form-field">
				<sf:input path="industry"	class="input-text" placeholder="산업 "  />
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

	$("#saveFm").validate({
		rules : {
			cmpyNm : {
				required : true
			}
			,repEmail : {
				required : true
			}

		},
		messages : {
			cmpyNm : {
				required : "<code:msg code='validate.msg.common'/>"
			}
			,repEmail : {
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
			var url = "<c:url value='/web/mypage/cmpyInfoSubmitDo.ax'/>";
			fn_submitFileAjax(url, formData);
		}
	});

	$(".saveBtn").click(function() {
		$("#saveFm").submit();
	});

});

</script>
