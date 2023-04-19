<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<style>
.board-red {
	background-color: red;
}
</style>
<div class="sidebar-main">
	<header class="sidebar-main-header">
		<h3 class="tit">쿠폰관리</h3>
	</header>
	<sf:form commandName="srchFm" cssClass="form-horizontal">
		<div class="d-flex mb-15">
			<div class="ml-5 custom-select wd-130">
				<sf:select path="srchCouponType">
					<sf:option value="" >ALL</sf:option>
					<sf:option value="001">일회성</sf:option>
					<sf:option value="002">다회성</sf:option>
				</sf:select>
			</div>
			<div class="search-box">
				<sf:input path="srchTxt" cssClass="input-text input-search" placeholder="쿠폰코드 검색" />
				<button title="검색" class="btn-search-icon" type="submit"></button>
			</div>
			<input type="hidden" name="tokenR" value="${tokenR}" />
			<sf:hidden path="totalRecordCount" />
			<sf:hidden path="currentPageNo" />
			<div class="ml-auto">
				<a href="#" class="button bt-pupple w-110" onClick="$('#popCoupon').modal('show');">신규</a>
			</div>
		</div>
		<table class="board-table">
			<thead>
				<tr>
					<th><input type="checkbox" class="allIdx"></th>
					<th>쿠폰코드</th>
					<th>적용기간</th>
					<th>할인율</th>
					<th>쿠폰유형</th>
					<th>상태</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${srchLst}" var="row" varStatus="cnt">
					<c:set value="${srchFm.totalRecordCount - (srchFm.recordCountPerPage* (srchFm.currentPageNo - 1)) - cnt.index}" var="listCnt" />
					<tr>
						<td><input type="checkbox" name="userIdArr" class="rowIdx" value="${row.couponId}" /></td>
						<td>${row.couponCode}</td>
						<td>${row.couponStDt} ~ ${row.couponEdDt}</td>
						<td>${row.discount}%</td>
						<td>${row.typeTxt}</td>
						<td>
							<a href="#" class="button <c:if test='${row.useYn eq "Y"}'> bt-blue </c:if><c:if test='${row.useYn ne "Y"}'> bt-white </c:if> viewChg" data-view="Y" data-id="${row.couponId}">On</a>
							<a href="#" class="button <c:if test='${row.useYn eq "N"}'> bt-blue </c:if><c:if test='${row.useYn ne "N"}'> bt-white </c:if> viewChg" data-view="N" data-id="${row.couponId}">Off</a>
						</td>
						<td>
							<%-- <a href="#" class="button bt-blue-light btn_udt" data-id="${row.couponId}">수정</a> --%>
							<a href="#" class="button bt-orange btn_del" data-id="${row.couponId}">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</sf:form>
	<footer class="board-footer">
		<ui:pagination paginationInfo="${srchFm}" jsFunction="fn_Lst" type="bootstrapk" />
	</footer>
 
<section class="modal fade wn-modal login" id="popCoupon">
	<div class="modal-dialog modal-dialog-centered modal-slide">
		<div class="modal-content">
			<button class="btn-close" data-dismiss="modal" title="닫기"></button>
			<sf:form commandName="saveFm" action="couponMngSubmitDo.ax">
				<input type="hidden" id="userType"  name="userType" />
				<div class="wn-modal-body pa-30">
					<div class="join-title">
						<p>쿠폰 등록</p>
					</div>
					<section class="join-form">
						<div class="form-field">
							<input type="text" class="input-text input-detail" placeholder="쿠폰코드" name="couponCode" id="couponCode" />
						</div>
						<div class="form-field">
							<div class="d-flex">
								<input type="text" class="input-text input-detail" placeholder="적용 시작일" name="couponStDt" id="couponStDt" />
								<input type="text" class="input-text input-detail" placeholder="적용 마감일" name="couponEdDt" id="couponStDt" />
							</div>
						</div>
						<div class="form-field">
							<input type="text" class="input-text" name="discount" placeholder="할인율" value="" id="discount" />
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
</section>

<script>
function fn_Lst(page) {
	$('#currentPageNo').val(page);
	$('#srchFm').submit();
}

$( document ).ready(function() {

	$(".lnbchk").eq(3).addClass("active");
	
	$(".btn_search").click(function() { // 조회버튼
		$('#currentPageNo').val("1");
		$("#srchFm").submit();
	});
	
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
	
	
	$(".btn_udt").click(function() {
		var url = '<c:url value="/back/coupon/couponMng.ax"/>?couponId='+$(this).data("id");
		$("#popCoupon").html("");
		fn_submitModal(url, '', 'popCoupon');
	});
	
	
	$(".btn_del").click(function() {
		if (confirm("삭제하시겠습니까")) {
			var sendData = {
				"couponId" : $(this).attr("data-id")
				,"tokenR" : $("input[name=tokenR]").val()
			};
			var url = "<c:url value='/back/coupon/delCouponDo.ax'/>";
			fn_submitAjax(url, sendData);
		}
	});
	
	$(".viewChg").click(function() {
		var datas = {
			useYn : $(this).data("view"),
			couponId : $(this).data("id")
		};
		var msg = "상태를 변경 하시겠습니까? \n ";
		if (confirm(msg)) {
			var url = "<c:url value='/back/coupon/udtCouponUseYnDo.ax'/>";
			$.ajax({
				url : url,
				data : datas,
				type : 'POST',
				success : function(result) {
					alert(result.msg);
					$("#srchFm").submit();
				},
				error : function(e) {
					console.log(JSON.stringify(e));
				}
			});
		}
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
