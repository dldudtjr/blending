
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>BLENDING TREND </title>
<link rel="stylesheet" href="<c:url value='/files/lib/jquery/css/jquery-ui.min.css'/>">
<link rel="stylesheet" href="<c:url value='/files/lib/swiper/swiper-bundle.min.css'/>">
<link rel="stylesheet" href="<c:url value='/files/css/lib.css'/>">
<link rel="stylesheet" href="<c:url value='/files/css/main.css'/>">

<script src="<c:url value='/files/lib/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/files/lib/jquery/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/files/lib/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/files/lib/swiper/swiper-bundle.min.js'/>"></script>
<script src="<c:url value='/files/lib/waypoints/jquery.waypoints.min.js'/>"></script>
<script src="<c:url value='/files/lib/waypoints/shortcuts/sticky.min.js'/>"></script>
<script src="<c:url value='/files/lib/waypoints/shortcuts/inview.min.js'/>"></script>
<script src="<c:url value='/files/js/ui.js'/>"></script>
<script src="<c:url value='/files/js/main-pc.js'/>"></script>
<script src="<c:url value='/files/lib/jquery/jquery.number.min.js'/>"></script>
<script src="<c:url value='/files/lib/jquery/jquery.validate.min.js'/>"></script>
<script src="<c:url value='/files/lib/jquery/messagebox.js'/>"></script>
<script src="<c:url value='/files/js/common.js'/>"></script>

</head>

<body>
	<div class="site-container">
		<tiles:insertAttribute name="head" />
		<main class="main-container sub">
			<div class="main-content">
				<div class="sidebar-layout">
					<tiles:insertAttribute name="gnb" />
					<tiles:insertAttribute name="content" />
				</div>
				<hr class="spacer-bottom">
			</div>
			<!-- /.main-content -->
		</main>
		<tiles:insertAttribute name="foot" />
	</div>
</body>
</html>