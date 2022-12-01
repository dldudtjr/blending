
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>BLENDING TREND </title>
<link rel="stylesheet" href="<c:url value='/resources/lib/jquery/css/jquery-ui.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/lib/swiper/swiper-bundle.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/lib.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
<script src="<c:url value='/resources/lib/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/lib/jquery/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/resources/lib/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/resources/lib/swiper/swiper-bundle.min.js'/>"></script>
<script src="<c:url value='/resources/lib/waypoints/jquery.waypoints.min.js'/>"></script>
<script src="<c:url value='/resources/lib/waypoints/shortcuts/sticky.min.js'/>"></script>
<script src="<c:url value='/resources/lib/waypoints/shortcuts/inview.min.js'/>"></script>
<script src="<c:url value='/resources/js/ui.js'/>"></script>
<script src="<c:url value='/resources/js/main-pc.js'/>"></script>
<%-- <script src="<c:url value='/resources/lib/jquery/jquery.number.min.js'/>"></script> --%>
<script src="<c:url value='/resources/lib/jquery/jquery.validate.min.js'/>"></script>
<script src="<c:url value='/resources/lib/jquery/messagebox.js'/>"></script>
<script src="<c:url value='/resources/js/common.js'/>"></script>


</head>

<body>
	<div class="site-container">
		<tiles:insertAttribute name="head" />
		 <main class="main-container sub admin">
	      <div class="main-content">
	        <div class="sidebar-layout">
	        	<tiles:insertAttribute name="lnb" />
		        <tiles:insertAttribute name="content" />
	         </div>
	        <hr class="spacer-bottom">
	      </div><!-- /.main-content -->
	    </main>
		<%-- <tiles:insertAttribute name="foot" /> --%>
	</div>
</body>
</html>