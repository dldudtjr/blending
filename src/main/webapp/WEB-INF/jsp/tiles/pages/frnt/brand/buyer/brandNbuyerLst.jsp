<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<sf:form commandName="srchFm" cssClass="form-horizontal">
	<input type="hidden" name="productId" id="productId">
</sf:form>
<div class="sidebar-main">
	<div class="buyerCard-wrap">
		<c:forEach items="${srchLst}" var="row" varStatus="cnt">
			<div class="buyerCard-form">
				<div class="buyerCard-img">
					<c:if test="${not empty row.fileId}" >
						<img src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${row.cmpyId}&fileId=${row.fileId}">
					</c:if>
					<c:if test="${empty row.fileId}" >
						<img src="/resources/images/bt_logo@2x.png" alt="">
					</c:if>
				</div>
				 <div class="buyerCard-text">
					<a href="#" class="buyerCard-title mt-15"><b>${row.cmpyNm}</b></a>
					<!-- <a href="#" class="buyerCard-more mt-10"><b>더보기</b></a>
	       				 <a href="#" class="buyerCard-send active mt-15 mb-15">제안서 보내기</a> -->
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<script>
	$(".main-content").addClass("buyer");
	$(".global-nav-bar").addClass("buyer");
	$(".detail-top").hide();
	$(".sidebar").hide();
</script>