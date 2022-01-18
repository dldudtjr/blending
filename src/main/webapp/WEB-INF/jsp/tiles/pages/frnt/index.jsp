<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>BLENDING TREND - COMING SOON</title>
<link rel="stylesheet" href="<c:url value='/files/lib/jquery/css/jquery-ui.min.css'/>">
<link rel="stylesheet" href="<c:url value='/files/lib/swiper/swiper-bundle.min.css'/>">
<link rel="stylesheet" href="<c:url value='/files/css/lib.css'/>">
<link rel="stylesheet" href="<c:url value='/files/css/main.css'/>">

<script src="<c:url value='/files/lib/svgxuse/svgxuse.min.js'/>"></script>
<script src="<c:url value='/files/lib/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/files/lib/jquery/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/files/lib/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/files/lib/swiper/swiper-bundle.min.js'/>"></script>
<script src="<c:url value='/files/lib/waypoints/jquery.waypoints.min.js'/>"></script>
<script src="<c:url value='/files/lib/waypoints/shortcuts/sticky.min.js'/>"></script>
<script src="<c:url value='/files/lib/waypoints/shortcuts/inview.min.js'/>"></script>
<script src="<c:url value='/files/js/ui.js'/>"></script>
<script src="<c:url value='/files/js/main-pc.js'/>"></script>
<script src="<c:url value='/files/js/detail.js'/>"></script>

</head>
<body>

	<div class="site-container">
	    <div class="coming-img">
	      <div class="coming-bg"></div>
	      <div class="coming-wrap">
	        <div class="coming-consulting">
	          <span>우리회사 제품 수출이 가능할까?<br>
	            어디로 수출 할 수 있을까?<br>
	            어떻게 어디서부터 시작을 해야할까?
	          </span>
	          <a href="https://forms.gle/fFpZn9qAV7cs2RLJ9">무 료 상 담</a>
	        </div>
	        <span>COMING SOON</span>
	       <div class="coming-timer">
          <span id="dd">00
						<p>DAYS</p>
					</span> <span id="hh">00
						<p>HOURS</p>
					</span> <span id="mm">00
						<p>MINUTES</p>
					</span> <span id="ss">00
						<p>SECONDS</p>
					</span>
        </div>
        <span class="coming-title"><img src="<c:url value='/files/' />images/BT_w.png" alt=""></span>
	      </div>
	    </div>
	  </div><!-- /.site-container -->

	<script>
		function counter() {
			var dday = new Date("feb 14,2022,09:00:00").getTime(); //디데이
			setInterval(
					function() {
						var now = new Date(); //현재 날짜 가져오기
						var distance = dday - now;
						var d = Math.floor(distance / (1000 * 60 * 60 * 24));
						var h = Math.floor((distance % (1000 * 60 * 60 * 24))
								/ (1000 * 60 * 60));
						var m = Math.floor((distance % (1000 * 60 * 60))
								/ (1000 * 60));
						var s = Math.floor((distance % (1000 * 60)) / 1000);
						if (s < 10) {
							s = '0' + s;
						}
						if (m < 10) {
							m = '0' + m;
						}
						if (h < 10) {
							h = '0' + h;
						}


						$("#dd").html(d+"<p>DAYS</p>")
						$("#hh").html(h+"<p>HOURS</p>")
						$("#mm").html(m+"<p>MINUTES</p>")
						$("#ss").html(s+"<p>SECONDS</p>")
						$(".coming-timer").show();
					}, 1000);
		}
		counter();
	</script>
</body>

</html>
