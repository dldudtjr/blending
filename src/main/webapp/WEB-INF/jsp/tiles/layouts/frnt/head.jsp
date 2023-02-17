<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<style>
.error { border:1px solid red; }
</style>
<header class="global-header">
	<div class="global-nav-bar-container" id="stickyHeader">
		<nav class="global-nav-bar"> <!-- no-line white  -->
			<div class="wrapper">
				<a href="<c:url value='/web/main/main.bt'/>" class="header-logo-link">
					<h1 class="header-logo" title="BLENDING TREND"></h1>
				</a>
				<ul class="gnb-menu">

				<%-- 	<c:if test="${not empty _sessionKey}">
						<li class="menu-item"><a href="<c:url value='/web/main/main.bt'/>"><span class="tit">Home</span></a></li>
					</c:if> --%>


					<c:choose>
						<c:when test="${not empty _sessionKey && _sessionKey.userType eq'001'}">
							<li class="menu-item"><a href="<c:url value='/web/brand/productLst.bt'/>"><span class="tit">Brand</span></a></li>
						</c:when>
						<c:when test="${not empty _sessionKey && _sessionKey.userType eq'002'}">
							<li class="menu-item"><a href="<c:url value='/web/buyer/productLst.bt'/>"><span class="tit">Brand</span></a></li>
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${not empty _sessionKey && _sessionKey.userType eq'001'}">
							<li class="menu-item"><a href="<c:url value='/web/brandN/buyerLst.bt'/>"><span class="tit">Buyers</span></a></li>
						</c:when>
						<c:when test="${not empty _sessionKey && _sessionKey.userType eq'002'}">
						</c:when>
					</c:choose>

					<c:if test="${empty _sessionKey}">
							<li class="menu-item"><a href="<c:url value='/web/main/brandMain.bt'/>"><span class="tit">Brand</span></a></li>
							<li class="menu-item"><a href="<c:url value='/web/main/buyerMain.bt'/>"><span class="tit">Buyers</span></a></li>
					</c:if>

				</ul>
				<!--로그인 전 -->
				<c:if test="${empty _sessionKey}">
					<ul class="global-top-menu gnb-menu-extra">
						<li class="gtm-item"><a href="javascript:void(0)" class="gtm-item-main" onclick="fn_modal('popLogin');"> <span class="top-btn login">LOG IN</span>
						</a></li>
						<li class="gtm-item"><a href="javascript:void(0)" class="gtm-item-main" onclick="$('#popJoin').modal('show')"> <span class="top-btn join">회원가입</span>
						</a></li>
					</ul>
				</c:if>
				<c:if test="${not empty _sessionKey}">
					<ul class="global-top-menu gnb-menu-extra">
						<c:if test="${_subimg ne 'true'}">
							<li class="gtm-item">
								<a href="<c:url value='/web/mypage/loginInfo.bt'/>" class="gtm-item-main">
									<span class="top-btn">Verification</span>
								</a>
							</li>
						</c:if>

						<li class="gtm-item hover-menu">
							<a href="#" class="gtm-item-main">
								<span class="top-info">
									<c:if test="${not empty _sessionKey.cmpyFileId}" >
										<img src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${_sessionKey.cmpyId}&fileId=${_sessionKey.cmpyFileId}">
									</c:if>
									<c:if test="${empty _sessionKey.cmpyFileId}" >
										<img src="/resources/images/info_img.png" alt="">
									</c:if>
								</span>
							 	<span class="top-info-arrow"></span>
							</a>
							<div class="gtm-item-sub hover-sub">
								<ul class="sub-list com-sub-list">
									<!-- <li class="sub-item"><a href="<c:url value='/web/mypage/registGuide.bt'/>">등록가이드</a></li> -->
									<li class="sub-item"><a href="<c:url value='/web/mypage/userInfo.bt'/>">설정</a></li>
									<li class="sub-item"><a href="<c:url value='/web/lgn/logOut.bt'/>">로그아웃</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</c:if>
			</div>
		</nav>
	</div>
</header>
<script>

	$(function() {
		if (window.location.href.indexOf("main") > -1) {
			 $(".global-nav-bar").addClass("no-line");
			 $(".global-nav-bar").addClass("white")
		}
	});
	function MessageBoxAlert(msg) {
		$(".modal_bg_sub").hide();
		$(".modal_cl").click();
		MessageBoxAlert(msg).done(function(data) {
			$(".btn_search").click();
		});
	}

	function fn_modal(divId){
		if(getCookie("auto_login") == "true"){
			loginDo();
		}else{
			$('#'+divId).modal('show');
		}
	}


	function MessageBoxConfirm(message) {
		return $.MessageBox({
			title : "Confirm",
			buttonDone : "<code:msg code='button.confirm'/>",
			buttonFail : "<code:msg code='button.cancel'/>",
			message : message
		});
	}

	function MessageBoxPrompt(message) {
		return $.MessageBox({
			input : true,
			title : "Message",
			buttonDone : "<code:msg code='button.confirm'/>",
			buttonFail : "<code:msg code='button.cancel'/>",
			message : message
		});
	}
</script>
