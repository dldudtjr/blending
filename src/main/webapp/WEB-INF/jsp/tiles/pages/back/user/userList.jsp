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
						<div class="d-flex mb-15">
						<sf:form commandName="srchFm" cssClass="form-horizontal" >
								<div class="search-box">
									<sf:input path="srchTxt"  cssClass="input-text input-search"  placeholder="검색" />
									<button title="검색" class="btn-search-icon" type="submit"></button>
								</div>
								<input type="hidden" name="tokenR" value="${tokenR}" />
				<sf:hidden path="totalRecordCount" />
				<sf:hidden path="currentPageNo" />
			</sf:form>

							<div class="ml-auto">
								<a href="#" class="button bt-pupple w-110">신규</a>
							</div>
						</div>
						<table class="board-table">
							<thead>
								<tr>
									<th>구분</th>
									<th>이름</th>
									<th>ID(email)</th>
									<th>Phone</th>
									<th>회사명</th>
									<th>브랜드명</th>
									<th>결제</th>
									<th>Password</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${srchLst}" var="row" varStatus="cnt">
					<c:set value="${srchFm.totalRecordCount - (srchFm.recordCountPerPage* (srchFm.currentPageNo - 1)) - cnt.index}" var="listCnt" />

									<tr class="<c:if test="${cnt.count%2 == 0 }">board-bgc</c:if><c:if test="${row.useYn eq'N'}">board-red</c:if>    ">
										<td>
										<c:if test="${row.userType eq '001'}">BRAND
										</c:if>
										<c:if test="${row.userType eq '002'}">
										BUYER
										</c:if>

										</td>
										<td>${row.firstNm}${row.lastNm}</td>
										<td>${row.email}</td>
										<td>${row.phone}</td>
										<td>${row.cmpyNm}</td>
										<td>${row.brandNm}</td>
										<td>--</td>
										<td><a href="#" class="button bt-gray passwdChg" data-email=${row.email}>재설정</a></td>
										<td>
											<a href="#" class="button bt-blue-light logPop" data-email=${row.email}>LOG</a>
											<a href="#" class="button bt-orange expireChg" data-email=${row.email}>탈퇴</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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


					$(".passwdChg").click(function() {
						var msg = "비밀번호 변경 하시겠습니까? \n ";
						if (confirm(msg)) {
							var url = "<c:url value='/back/lgn/udtUserPassDo.ax'/>";
							$.ajax({
								url : url,
								data : { email : $(this).attr("data-email") },
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
								data : { email : $(this).attr("data-email") },
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
