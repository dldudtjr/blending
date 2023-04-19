<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<c:if test="${_subimg ne 'true'}">
	<aside class="sidebar">
		<nav class="sidebar-nav">
			<h3 class="sidebar-menu-hd">계정 설정</h3>
			<ul class="sidebar-menu">

				<li class="sidebar-menu-item userInfo">
					<a href="<c:url value='/web/mypage/userInfo.bt'/>">나의 정보</a>
				</li>
				<li class="sidebar-menu-item cmpyInfo">
					<a href="<c:url value='/web/mypage/cmpyInfo.bt'/>">회사 정보</a>
				</li>
<%-- 				<li class="sidebar-menu-item userInfo">
					<a href="<c:url value='/web/mypage/userInfo.bt'/>">계정 정보</a>
				</li> --%>

				<li class="sidebar-menu-item loginInfo">
					<a href="<c:url value='/web/mypage/loginInfo.bt'/>">로그인 설정</a>
				</li>
				<li class="sidebar-menu-item payInfo">
					<a href="<c:url value='/web/mypage/payInfo.bt'/>">구독</a>
				</li>
			</ul>
		</nav>
	</aside>
	<script>
		$("."+location.pathname.split("/")[3].replace(".bt","")).addClass("active");
	</script>
</c:if>