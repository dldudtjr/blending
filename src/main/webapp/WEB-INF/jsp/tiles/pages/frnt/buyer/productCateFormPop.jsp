<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script src="<c:url value='/resources/js/main-pc.js'/>"></script>


<sf:form commandName="savePopFm" cssClass="form-horizontal" enctype="multipart/form-data">
 	<sf:hidden path="productCateId" />
	<sf:hidden path="keyword" />
 	<div class="form-field">
		<sf:input path="productCateNm" class="input-text" placeholder="Interested Brands" />
	</div>
	<div class="form-field mt-30">
		<h4 class="detail-wrap-title bold">Keywords</h4>
		<div class="form-field">
			<div class="input-add add-right">
				<input type="text" class="input-text KeywordTmp" name="KeywordTmp" placeholder="Keywords">
				<button type="button" class="button bt-blue-light w-140 KeywordAdd">등록</button>
			</div>
		</div>
		<div class="form-field">
			<h4 class="form-label">1개 이상 입력</h4>
		</div>
		<div class="detail-tag keywordLst">
			<c:if test="${not empty savePopFm.keyword}">
				<c:forEach var="item" items="${fn:split(savePopFm.keyword,'||')}">
					<span class="tag-pill">${item}<input type="hidden" name="keywordArr" value="${item}"> <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<div class="d-flex mt-30">
		<div class="form-field">
			<h4 class="detail-wrap-title bold">MSRP</h4>
			<div class="d-flex">
				<sf:input path="msrpMin" class="input-text" placeholder="Min." />
				<sf:input path="msrpMax" class="input-text" placeholder="Max." />
			</div>
		</div>
		<div class="form-field">
			<h4 class="detail-wrap-title bold">Cost</h4>
			<div class="d-flex">
				<sf:input path="costMin" class="input-text" placeholder="Min." />
				<sf:input path="costMax" class="input-text" placeholder="Max." />
			</div>
		</div>
		<div class="form-field">
			<h4 class="detail-wrap-title bold">Margin</h4>
			<div class="d-flex">
				<sf:input path="marginMin" class="input-text" placeholder="Min." />
				<sf:input path="marginMax" class="input-text" placeholder="Max." />
			</div>
		</div>
	</div>
	<div class="form-field mt-20">
		<div class="subscribe-select category">
			<!-- <a href="javascript:void(0)" class="t-16"><b>조건1</b></a>
		        <a href="javascript:void(0)" class="t-16 active"><b>조건2</b></a>
		        <a href="javascript:void(0)" class="t-16"><b>조건3</b></a>
		        <a href="javascript:void(0)" class="t-16"><b>조건4</b></a>
		        <a href="javascript:void(0)" class="t-16"><b>조건5</b></a>
		        <a href="javascript:void(0)" class="t-16"><b>조건6</b></a>
		        <a href="javascript:void(0)" class="t-16"><b>조건7</b></a>
		        <a href="javascript:void(0)" class="t-16"><b>조건8</b></a>
		        <a href="javascript:void(0)" class="t-16"><b>조건9</b></a>
		        <a href="javascript:void(0)" class="t-16"><b>조건10</b></a>
		        <a href="javascript:void(0)" class="t-16"><b>조건11</b></a>
		        <a href="javascript:void(0)" class="t-16"><b>조건12</b></a> -->
		</div>
	</div>
	<div class="mt-20 text-center">
		<a href="javascript:void(0)" class="button bt-blue bt-s wd-130 saveBtn">저장</a>
	</div>
</sf:form>
<script>

var doubletyp ="S"
    var sltTxt ="keyword";
	$("."+sltTxt+"Add").click(function(){
		if(doubletyp == "S" && $("."+sltTxt+"Tmp").val()){
			doubletyp == "B";
			txt ='<span class="tag-pill">'+$("."+sltTxt+"Tmp").val()+'<input type="hidden" name="'+sltTxt+'Arr" value="'+$("."+sltTxt+"Tmp").val()+'"> <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>';

        $("."+sltTxt+"Lst").append(txt);
        $("."+sltTxt+"Tmp").val("");
        doubletyp == "S";
		}
	});


      $("#savePopFm").validate({
			rules : {
				productCateNm : {
					required : true
				}
			},
			messages : {
				productCateNm : {
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
				 var txt="";

			 $('input[name^="keywordArr"]').each( function() {
			        txt += this.value+"||"
			 });

				 $("#keyword").val(txt);

				var form = $('form')[1];
				var formData = new FormData(form);
				$(".modal_bg_sub").show();
				var url = "<c:url value='/web/buyer/cateSubmitDo.ax'/>";
				fn_submitFileRtnAjax(url, formData);
			}
		});

		$(".saveBtn").click(function() {
			$("#savePopFm").submit();
		});

		function rtnFunction(typ,data){
//			alert(data.code);
			location.reload();
		}



</script>
<!-- // 팝업: Category Groups -->



