<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div class="modal-dialog modal-dialog-centered modal-slide">
	<div class="modal-content">
		<button class="btn-close" data-dismiss="modal" title="닫기"></button>
		<sf:form commandName="saveFm" action="couponMngSubmitDo.ax">
			<div class="wn-modal-body pa-30">
				<div class="join-title">
					<p>쿠폰 등록</p>
				</div>
				<section class="join-form">
					<div class="form-field">
						<input type="text" class="input-text input-detail" placeholder="쿠폰코드" name="couponCode" id="couponCode" value='${saveFm.couponCode}' />
					</div>
					<div class="form-field">
						<div class="d-flex">
							<input type="text" class="input-text input-detail" placeholder="적용 시작일" name="couponStDt" id="couponStDt" value='${saveFm.couponStDt}' />
							<input type="text" class="input-text input-detail" placeholder="적용 마감일" name="couponEdDt" id="couponEdDt" value='${saveFm.couponEdDt}'/>
						</div>
					</div>
					<div class="form-field">
						<input type="text" class="input-text" name="discount" placeholder="할인율" value="" id="discount" value='${saveFm.discount}'/>
					</div>
					<div class="form-field">
						<div class="input-add add-right2">
							<div class="custom-select wd-100" style="width:330px !important">
								<select id="type" name="type">
									<option value="001">일회성</option>
									<option value="002">다회성</option>
								</select>
							</div>
						</div>
					</div>
					<div class="form-field">
						<div class="input-add add-right2">
							<div class="custom-select wd-100" style="width:330px !important">
								<select id="useYn" name="useYn">
									<option value="Y">활성화</option>
									<option value="N">비활성화</option>
								</select>
							</div>
						</div>
					</div>
					<div class="mt-30">
						<a href="#" class="button bt-blue d-block saveBtn">저장</a>
					</div>
				</section>
			</div>
		</sf:form>
	</div>
</div>

<script>

$( document ).ready(function() {

	$("#saveFm").validate({
		rules : {
			couponCode : {
				required : true
			},
			couponStDt : {
				required : true
			},
			couponEdDt : {
				required : true
			},
			discount : {
				required : true
			},
			type : {
				required : true
			},
		},
		messages : {
			couponCode : {
				required : "<code:msg code='validate.msg.common'/>"
			},
			couponStDt : {
				required : "<code:msg code='validate.msg.common'/>"
			},
			couponEdDt : {
				required : "<code:msg code='validate.msg.common'/>"
			},
			discount : {
				required : "<code:msg code='validate.msg.common'/>"
			},
			type : {
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
			submitDo();
		}
	});

	$(".saveBtn").click(function() {
		$("#saveFm").submit();
	});
	
});

	function submitDo() {
		var url = "<c:url value='/back/coupon/couponMngSubmitDo.ax'/>";
		var sendData = $("#saveFm").serialize();
		fn_submitRtnAjax(url, sendData, '')
	}
	
	function rtnFunction(typ, data) {
		alert("저장 되었습니다");
		$("#srchFm").submit();
	}
	
</script>
