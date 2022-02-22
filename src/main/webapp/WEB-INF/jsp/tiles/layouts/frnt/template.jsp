
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
		<main class="main-container sub">
			<div class="main-content">
		 		<div class="sub-img" style="display:none" id="brandNMain">
		          <div class="form-attach-image">
		            <input type="file" name="brandCoverImg" id="input-file" hidden="" accpet="image/*">
		            <label for="input-file">
		              <div class="attach-image-thumb">
		                <span>Cover Image</span>
		                <div class="img-square">
		                  <div class="img-crop" id="brandCoverImg" data-attach-role="bgImg"></div>
		                </div>
		              </div>
		            </label>
		          </div>
		        </div>

				  <div class="sub-img" style="display:none" id="brandMain">

			       </div>
			       <div class="detail-top" id="brandTop">
			          <div class="detail-top-wrap">
			            <button class="button bt-s bt-outline bt-blue">미리보기</button>
			            <button class="button bt-s bt-blue">제출하기</button>
			          </div>
			        </div>

					<div class="sidebar-layout">
						<tiles:insertAttribute name="lnb" />
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