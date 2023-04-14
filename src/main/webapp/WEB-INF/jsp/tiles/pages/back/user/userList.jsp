<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<style>
.board-red {
	background-color: red;
}
</style>
<script>
	$(document)
			.ready(
					function() {

						$("#userPasswordTmp").keydown(function(key) {
							if (key.keyCode == 13) {
								loginDo();
							}
						});

						$.validator
								.addMethod(
										"pw_regexp",
										function(value, element) {
											return this.optional(element)
													|| /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+]).*$/
															.test(value);
										});

						$.validator.addMethod("telnum", function(telnum,
								element) {
							var pattern = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/;
							if (!pattern.test(telnum)) {
								return this.optional(element) || false;
							}
							return true;
						});

						jQuery.validator.addMethod("notEqual", function(value,
								element, param) {
							if (value == $(param).val()) {
								return this.optional(element) || false;
							}
							return true;
						});

						$("#saveFm")
								.validate(
										{
											rules : {
												lastNm : {
													required : true
												},
												firstNm : {
													required : true
												},
												email : {
													required : true
												},
												phone : {
													required : false,
													telnum : true
												},
												password : {
													pw_regexp : true // 정규식
													,
													required : true // 정규식
													,
													minlength : 8 // 최소입력글수  4자
													,
													maxlength : 20
												},
												cpassword : {
													pw_regexp : true // 정규식
													,
													required : true // 정규식
													,
													minlength : 8 // 최소입력글수  4자
													,
													maxlength : 20,
													equalTo : '#password'
												},
												cmpyNm : {
													required : true
												},

											},
											messages : {
												lastNm : {
													required : "<code:msg code='validate.msg.common'/>"
												},
												firstNm : {
													required : "<code:msg code='validate.msg.common'/>"
												},
												email : {
													required : "<code:msg code='validate.msg.common'/>"
												},
												password : {
													required : "패스워드를 입력해 주세요",
													pw_regexp : "영문 대소문자, 숫자, 특수문자를 반드시 입력해 주시기 바랍니다.",
													minlength : "{0}자 이상 입력해 주시기 바랍니다.",
													maxlength : "{0}자 이하로 입력해 주시기 바랍니다."

												},
												cpassword : {
													required : "패스워드를 입력해 주세요",
													pw_regexp : "영문 대소문자, 숫자, 특수문자를 반드시 입력해 주시기 바랍니다.",
													minlength : "{0}자 이상 입력해 주시기 바랍니다.",
													maxlength : "{0}자 이하로 입력해 주시기 바랍니다.",
													equalTo : "패스워드가 일치하지 않습니다."
												},
												phone : {
													required : "<code:msg code='valid.pwd.nine'/>"
												},
												cmpyNm : {
													required : "<code:msg code='validate.msg.common'/>"
												},
											},
											errorPlacement : function(error,
													element) {
												if (element.is(":radio")
														|| element
																.is(":checkbox")) {
												} else if (element.is('select')) {
													element.attr("placeholder",
															error[0].outerText);
													element.css("border",
															"red solid 1px");
													element.css("width",
															"500px");
												} else {
													element.attr("placeholder",
															error[0].outerText);
												}
											},
											submitHandler : function() {
												$(".modal_bg_sub").show();
												joinDo();
											}
										});

								$(".saveBtn").click(function() { // 조회버튼
									$("#saveFm").submit();
								});
					});

	function joinDo() {
		if ($(".userType:eq(0)").hasClass("active")) {
			$("#userType").val("001");
		} else {
			$("#userType").val("002");
		}
		var url = "<c:url value='/web/lgn/joinSubmitDo.ax'/>";
		var sendData = $("#saveFm").serialize();
		fn_submitRtnAjax(url, sendData, '')

	}

	function rtnFunction(typ, data) {
		alert("저장 되었습니다");
		if (data.code == "0001") {
			$("#srchFm").submit();
		}
	}
</script>

<!-- 팝업: Join -->
<section class="modal fade wn-modal login" id="popJoin">
	<div class="modal-dialog modal-dialog-centered modal-slide">
		<div class="modal-content">
			<button class="btn-close" data-dismiss="modal" title="닫기"></button>
			<sf:form commandName="saveFm" action="joinDo.lp">
				<input type="hidden" id="userType" name="userType" />
				<div class="wn-modal-body pa-30">
					<section class="join-form">
						<div class="form-field">
							<div class="d-flex">
								<input type="text" class="input-text input-detail" placeholder="이름" name="lastNm" id="lastNm" /> <input type="text" class="input-text input-detail" placeholder="성" name="firstNm" id="firstNm" />
							</div>
						</div>
						<div class="form-field">
							<input type="text" class="input-text" name="email" placeholder="Email" value="" id="email" />
						</div>
						<div class="form-field">
							<input type="password" class="input-text" name="password" placeholder="password 영문대소+숫자+특수문자 8~20" value="" id="password">
						</div>
						<div class="form-field">
							<input type="password" class="input-text" name="cpassword" placeholder="confirm password" value="" id="cpassword">
						</div>
						<div class="form-field">
							<div class="input-add add-right2">
								<div class="custom-select wd-100">
									<select>
										<option value="">+82</option>
									</select>
								</div>
								<input type="text" class="input-text" name="phone" placeholder="Phone" id="phone">
							</div>
						</div>
						<div class="form-field">
							<input type="text" class="input-text" name="cmpyNm" placeholder="회사명" value="" id="cmpyNm">
						</div>
						<div class="mt-30">
							<a href="#" class="button bt-blue d-block saveBtn">저장</a>
							<!-- bt-blue 또는 bt-green -->
						</div>
					</section>
				</div>
			</sf:form>
		</div>
	</div>
</section>


<div class="sidebar-main">
	<header class="sidebar-main-header">
		<h3 class="tit">회원관리</h3>
	</header>
	<sf:form commandName="srchFm" cssClass="form-horizontal">
		<div class="d-flex mb-15">
			<div class="ml-5 custom-select wd-130">
				<sf:select path="srchUserType">
					<sf:option value="">ALL</sf:option>
					<sf:option value="002">BUYER</sf:option>
					<sf:option value="001">BRAND</sf:option>
				</sf:select>
			</div>
			<div class="search-box">
				<sf:input path="srchTxt" cssClass="input-text input-search" placeholder="검색" />
				<button title="검색" class="btn-search-icon" type="submit"></button>
			</div>

			<input type="hidden" name="tokenR" value="${tokenR}" />
			<sf:hidden path="totalRecordCount" />
			<sf:hidden path="currentPageNo" />
			<input type="hidden" name="buyerViewYn" id="buyerViewYn" />
			<div class="ml-auto">
				<a href="#" class="button bt-yellow allbuyerViewChg" data-view="Y">On</a> <a href="#" class="button bt-white  allbuyerViewChg" data-view="N">Off</a> <a href="#" class="button bt-pupple w-110" onclick="$('#popJoin').modal('show')">신규</a>
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
						<td><input type="checkbox" name="userIdArr" class="rowIdx" value="${row.userId}" /></td>
						<td><c:if test="${row.userType eq '001'}">BRAND</c:if> <c:if test="${row.userType eq '002'}">BUYER</c:if></td>
						<td><a href="#" class="button bt-blue-light userChgPop" data-email="${row.email}">${row.firstNm}${row.lastNm}</td>
						<td>${row.position}</td>
						<td>${row.email}</td>
						<td>${row.phone}</td>
						<td>${row.cmpyNm}</td>
						<td>${row.brandNm}</td>
						<td><a href="#" class="button <c:if test='${row.buyerViewYn eq "Y"}'> bt-blue </c:if><c:if test='${row.buyerViewYn ne "Y"}'> bt-white </c:if> buyerViewChg" data-view="Y" data-userid="${row.userId}">On</a> <a href="#" class="button <c:if test='${row.buyerViewYn eq "N"}'> bt-blue </c:if><c:if test='${row.buyerViewYn ne "N"}'> bt-white </c:if> buyerViewChg" data-view="N" data-userid="${row.userId}">Off</a></td>
						<td><a href="#" class="button bt-gray passwdChg" data-email="${row.email}" data-userid="${row.userId}">재설정</a></td>
						<td><a href="#" class="button bt-blue-light logPop" data-email="${row.email}" data-userid="${row.userId}">LOG</a> <a href="#" class="button bt-orange expireChg" data-userid="${row.userId}">탈퇴</a></td>
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
					$("#srchFm").submit();
				},
				error : function(e) {
					console.log(JSON.stringify(e));
				}
			});
		}
	});

	$(".buyerViewChg").click(function() {
		var datas = {
			buyerViewYn : $(this).data("view"),
			userId : $(this).data("userid")
		};
		var msg = "상태를 변경 하시겠습니까? \n ";
		if (confirm(msg)) {
			var url = "<c:url value='/back/lgn/udtBuyerViewChgDo.ax'/>";
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

	$(".passwdChg").click(function() {
		var msg = "비밀번호 변경 하시겠습니까? \n ";
		if (confirm(msg)) {
			var url = "<c:url value='/back/lgn/udtUserPassDo.ax'/>";
			$.ajax({
				url : url,
				data : {
					email : $(this).attr("data-email"),
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

	$(".expireChg").click(function() {
		var msg = "탈퇴 하시겠습니까? \n ";
		if (confirm(msg)) {
			var url = "<c:url value='/back/lgn/expireChg.ax'/>";
			$.ajax({
				url : url,
				data : {
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

	$(".logPop").click(
			function() {
				var url = "<c:url value='/back/user/historyList.bt'/>";
				var openNewWindow = window.open("about:blank");
				openNewWindow.location.href = url + "?srchTxt="
						+ $(this).attr("data-email")
			});

	$(".lnbchk").eq(0).addClass("active");

	$(".userChgPop").click(function() {
		var url = "<c:url value='/web/userchange.bt'/>";
		var openNewWindow = window.open("about:blank");
		openNewWindow.location.href = url + "?loginId=" + $(this).data("email")
	});
</script>
