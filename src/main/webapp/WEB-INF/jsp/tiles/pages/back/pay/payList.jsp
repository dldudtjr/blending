<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<style>
.board-red {
	background-color: red;
}
</style>
<div class="sidebar-main">
	<header class="sidebar-main-header">
		<h3 class="tit">결제관</h3>
	</header>
	<sf:form commandName="srchFm" cssClass="form-horizontal">
		<div class="d-flex mb-15">
			<div class="search-box">
				<sf:input path="srchTxt" cssClass="input-text input-search" placeholder="검색" />
				<button title="검색" class="btn-search-icon" type="submit"></button>
			</div>
			<input type="hidden" name="tokenR" value="${tokenR}" />
			<sf:hidden path="totalRecordCount" />
			<sf:hidden path="currentPageNo" />
			<input type="hidden" name="buyerViewYn" id="buyerViewYn" />
			<div class="ml-auto">
				<a href="#" class="button bt-yellow allbuyerViewChg" data-view="Y" data-userid="${row.userId}">On</a> <a href="#" class="button bt-white  allbuyerViewChg" data-view="N" data-userid="${row.userId}">Off</a> <a href="#" class="button bt-pupple w-110">신규</a>
			</div>
		</div>
		<table class="board-table">
			<thead>
				<tr>
					<th><input type="checkbox" class="allIdx"></th>
					<th>회사명</th>
					<th>이름</th>
					<th>서비스구분</th>
					<th>사용 기간</th>
					<th>서비스시작일</th>
					<th>서비스종료일</th>
					<th>결제일</th>
					<th>결제금액</th>
					<th>환불일</th>
					<th>환불금액</th>
					<th>상태</th>
					<th>결제취소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${srchLst}" var="row" varStatus="cnt">
					<c:set value="${srchFm.totalRecordCount - (srchFm.recordCountPerPage* (srchFm.currentPageNo - 1)) - cnt.index}" var="listCnt" />
					<tr class="<c:if test="${cnt.count%2 == 0 }">board-bgc</c:if><c:if test="${row.useYn eq'N'}">board-red</c:if>    ">
						<td><input type="checkbox" name="userIdArr" class="rowIdx" value="${row.userId}" /></td>
						<td>${row.cmpyNm}</td>
						<td>${row.firstNm}${row.lastNm}</td>
						<td>${row.priceCodeTxt}</td>
						<td>${row.periodUse}</td>
						<td>${row.serviceStDt}</td>
						<td>${row.serviceEdDt}</td>
						<td>${row.paymentDt}</td>
						<td>${row.servicePrice}</td>
						<td>${row.refundDt}</td>
						<td>${row.refundPrice}</td>
						<td>${row.statusTxt}</td>
						<td>
							<c:if test="${row.status eq '002'}">
								<a href="#" class="button bt-gray cancelPay" data-serviceid="${row.serviceId}" data-ordercode="${row.orderCode}" data-userid="${row.userId}">취소</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</sf:form>
	<footer class="board-footer">
		<ui:pagination paginationInfo="${srchFm}" jsFunction="fn_Lst" type="bootstrapk" />
		<!-- <div class="wn-pagination">
								<a href="#" class="wn-pg-prev">&lt;</a>
								<a href="#" class="wn-pg-num active">1</a>
								<a href="#" class="wn-pg-num">2</a>
								<a href="#" class="wn-pg-num">3</a>
								<a href="#" class="wn-pg-num">4</a>
								<a href="#" class="wn-pg-num">5</a>
								<a href="#" class="wn-pg-next">&gt;</a>
							</div> -->
	</footer>
</div>
<script>
	function fn_Lst(page) {
		$('#currentPageNo').val(page);
		$('#srchFm').submit();
	}

	$(".btn_search").click(function() { // 조회버튼
		$('#currentPageNo').val("1");
		$("#srchFm").submit();
	});

	$(".cancelPay").click(function() {
		var msg = "결제를 취소 하시겠습니까? \n ";
		if (confirm(msg)) {
			var url = "<c:url value='/back/pay/cancelPayDo.ax'/>";
			$.ajax({
				url : url,
				data : {
					orderCode : $(this).attr("data-orderCode"),
					serviceId : $(this).attr("data-serviceid"),
					userId : $(this).attr("data-userid")
				},
				type : 'POST',
				success : function(result) {
					alert(result.msg);
				},
				error : function(e) {
					console.log(JSON.stringify(e));
				}
			});
		}
	});

</script>
