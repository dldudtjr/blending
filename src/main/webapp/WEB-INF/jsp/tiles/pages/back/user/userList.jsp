<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<style>

.board-red{
  background-color: red;
}
</style>
<div class="sidebar-main">
						<header class="sidebar-main-header">
							<h3 class="tit">회원관리</h3>
						</header>
						<sf:form commandName="srchFm" cssClass="form-horizontal" >
						<div class="d-flex mb-15">
							<div class="search-box">
								<sf:input path="srchTxt"  cssClass="input-text input-search"  placeholder="검색" />
								<button title="검색" class="btn-search-icon" type="submit"></button>
							</div>
							<input type="hidden" name="tokenR" value="${tokenR}" />
							<sf:hidden path="totalRecordCount" />
							<sf:hidden path="currentPageNo" />
							<input type="hidden" name="buyerViewYn" id="buyerViewYn" />
							<div class="ml-auto">
								<a href="#" class="button bt-yellow allbuyerViewChg" data-view="Y" data-userid="${row.userId}">On</a>
								<a href="#" class="button bt-white  allbuyerViewChg"  data-view="N" data-userid="${row.userId}">Off</a>
								<a href="#" class="button bt-pupple w-110">신규</a>
							</div>
						</div>
						<table class="board-table">
							<thead>
								<tr>
									<th><input type="checkbox" class="allIdx"></th>
									<th>구분</th>
									<th>이름</th>
									<th>직급</th>
									<th>ID(email)</th>
									<th>Phone</th>
									<th>회사명</th>
									<th>브랜드명</th>
									<th>상태</th>
									<th>Password</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${srchLst}" var="row" varStatus="cnt">
									<c:set value="${srchFm.totalRecordCount - (srchFm.recordCountPerPage* (srchFm.currentPageNo - 1)) - cnt.index}" var="listCnt" />
									<tr class="<c:if test="${cnt.count%2 == 0 }">board-bgc</c:if><c:if test="${row.useYn eq'N'}">board-red</c:if>    ">
										<td>
											<input type="checkbox" name="userIdArr" class="rowIdx" value="${row.userId}" />
										</td>
										<td>
										<c:if test="${row.userType eq '001'}">BRAND
										</c:if>
										<c:if test="${row.userType eq '002'}">
										BUYER
										</c:if>

										</td>
										<td>${row.firstNm}${row.lastNm}</td>
										<td>${row.position}</td>
										<td>${row.email}</td>
										<td>${row.phone}</td>
										<td>${row.cmpyNm}</td>
										<td>${row.brandNm}</td>
										<td>
											<a href="#" class="button bt-yellow buyerViewChg" data-view="Y" data-userid="${row.userId}">On</a>
											<a href="#" class="button bt-white buyerViewChg"  data-view="N" data-userid="${row.userId}">Off</a>
										</td>
										<td><a href="#" class="button bt-gray passwdChg" data-email="${row.email}" data-userid="${row.userId}">재설정</a></td>
										<td>
											<a href="#" class="button bt-blue-light logPop" data-email="${row.email}" data-userid="${row.userId}">LOG</a>
											<a href="#" class="button bt-orange expireChg"  data-userid="${row.userId}">탈퇴</a>
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

					$(".allbuyerViewChg").click(function() {
						var msg = "상태를 변경 하시겠습니까? \n ";
						$("#buyerViewYn").val($(this).attr("data-view"));

						if (confirm(msg)) {
							var url = "<c:url value='/back/lgn/udtBuyerViewChgDo.ax'/>";
							$.ajax({
								url : url,
								data : $("#srchFm").serialize(),
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

					$(".buyerViewChg").click(function() {
						var msg = "상태를 변경 하시겠습니까? \n ";
						if (confirm(msg)) {
							var url = "<c:url value='/back/lgn/udtBuyerViewChgDo.ax'/>";
							$.ajax({
								url : url,
								data : { buyerViewYn : $(this).attr("data-view"),email : $(this).attr("data-userid") },
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

					$(".passwdChg").click(function() {
						var msg = "비밀번호 변경 하시겠습니까? \n ";
						if (confirm(msg)) {
							var url = "<c:url value='/back/lgn/udtUserPassDo.ax'/>";
							$.ajax({
								url : url,
								data : { email : $(this).attr("data-email"),userId : $(this).attr("data-userid") },
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


					$(".expireChg").click(function() {
						var msg = "탈퇴 하시겠습니까? \n ";
						if (confirm(msg)) {
							var url = "<c:url value='/back/lgn/expireChg.ax'/>";
							$.ajax({
								url : url,
								data : { userId : $(this).attr("data-userid") },
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

					$(".logPop").click(function() {
						var url = "<c:url value='/back/user/historyList.bt'/>";
						var openNewWindow = window.open("about:blank");
						openNewWindow.location.href = url+"?srchTxt="+$(this).attr("data-email")
					});

					$(".lnbchk").eq(0).addClass("active");

					</script>
