<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script>
	let prductRegMap = new Map();

	prductRegMap.set('001', 'introduce');
	prductRegMap.set('002', 'detail');
	prductRegMap.set('003', 'distribution');
	prductRegMap.set('004', 'maketing');

	$(document).ready(function() {

		$("#saveFm").validate({
			rules : {
				productNm : {
					required : true
				}

			},
			messages : {
				productNm : {
					required : "<code:msg code='validate.msg.common'/>"
				}
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
				var form = $('form')[0];
				var formData = new FormData(form);
				$(".modal_bg_sub").show();
				var url = "<c:url value='/web/brand/productSubmitDo.ax'/>";
				fn_submitFileRtnAjax(url, formData);
			}
		});

		$(".saveBtn").click(function() {
			$("#saveFm").submit();
		});

	});

	function rtnFunction(typ, data) {
		var url = "<c:url value='/web/brand/"
				+ prductRegMap.get($("#productRegCode").val())
				+ "/productAdd.ax'/>";
	}
</script>