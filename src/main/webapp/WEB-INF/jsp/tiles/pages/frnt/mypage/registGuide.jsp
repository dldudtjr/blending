<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
          <div class="sidebar-main">
            <header class="guide-title">
              <div class="guide-title-img">
              <c:if test="${not empty _sessionKey.cmpyFileId}">
				<img src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${_sessionKey.cmpyId}&fileId=${_sessionKey.cmpyFileId}">
			</c:if>
			<c:if test="${empty _sessionKey.cmpyFileId}">
				<img src="/resources/images/info_img.png" alt="">
			</c:if>

              	<img src="images/info_img.png" alt="">
              	</div>

             <h3 class="tit">${_sessionKey.cmpyNm}</h3>
            </header>
            <div class="guide-wrap">
              <span class="guide-right mt-20 mb-20">
                <strong>Brand Visibility</strong><span class="px-10">-</span>Published
              </span>
              <ul class="guide-step">
                <li><strong>프로필 상태</strong><span class="px-10">-</span>Incomplete</li>
                <li>
                  <i class="wn-icon check1">완료</i><span>계정 생성하기</span>
                </li>
                <li>
                  <i class="wn-icon check1">완료</i><span>이메일 인증하기</span>
                  <!-- <div class="ml-auto">
                    <a href="#" class="button small bt-blue-light w-140">인증하기</a>
                  </div> -->
                </li>
                <c:if test="${_sessionKey.userType eq '001'}">
                <li>
                  <i class="wn-icon check4">미완료</i><span>제품 등록하기</span>
                  <div class="ml-auto">
                    <a href="#" class="button small bt-blue-light w-140 add-bt">제품추가</a>
                  </div>
                </li>
                </c:if>
                <!-- <li>
                  <i class="wn-icon check5">미완료</i><span>브랜드 페이지 사용자화</span>
                </li> -->
              </ul>
            </div>
          </div>

<script>
$( document ).ready(function() {
	$("#brandTop").remove();
	$(".sidebar").remove();
	$(".add-bt").click(function(){
		var url	 ="<c:url value='/web/brand/productAdd.bt' />";
		location.href=url;
	});
});

</script>
