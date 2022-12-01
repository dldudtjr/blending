<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<c:if test="${_subimg ne 'true'}">

	<aside class="sidebar">

		<nav class="sidebar-nav" id="mypageLnb" style="display:none">
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



       <nav class="sidebar-nav" id="brandLnb" style="display:none">
         <ul class="sidebar-menu no-icon icon-order">
			<!-- check1 - 완료 / check2 - 일시중지 /check3 - 작성시 -->
           <li class="sidebar-menu-item introduce"><a href="javascript:productLngLoc('introduce')">제품소개</a>
           <!-- <i class="wn-icon check3">단계1</i> -->
           </li>
           <li class="sidebar-menu-item detail"><a href="javascript:productLngLoc('detail')">제품상세</a>
           <!-- <i class="wn-icon check3">단계2</i> -->
           </li>
           <li class="sidebar-menu-item distribution"><a href="javascript:productLngLoc('distribution')">유통현황</a>
           <!-- <i class="wn-icon check3">단계3</i> -->
           </li>
           <li class="sidebar-menu-item maketing"><a href="javascript:productLngLoc('maketing')">마케팅 </a>
           <!-- <i class="wn-icon check3">단계4</i> -->
           </li>
         </ul>
       </nav>
     </aside>



<script>
	$(function(){
//		alert("#"+location.pathname.split("/")[2]+"Top");



		$("#"+location.pathname.split("/")[2]+"Top").show();
		$("#"+location.pathname.split("/")[2]+"Lnb").show();
		$("."+location.pathname.split("/")[3].replace(".bt","")).addClass("active");


		$(document).on("click",".btn-remove",function(){
			$(this).parent().remove();
		});
	});

	function productLngLoc(nextPg){
		if($("#productId").val()){
			$("#makingProductId").val($("#productId").val());
			var url = "<c:url value='/web/brand/"+ nextPg+ "/productAdd.bt'/>";
			$("#srchFm").attr("action",url);
			$("#srchFm").submit();
		}
	}

</script>
</c:if>
<script>
		if(location.pathname.split("/")[2] == "buyer"){
			$(".global-nav-bar").addClass("buyer");
			$(".detail-top-wrap").hide();
		}
</script>

