<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
			<a href="#" class="buyerCard-title mt-15"><b>${row.firstNm} ${row.lastNm}</b></a>
			<a href="#" class="buyerCard-more mt-10"><b>${row.position}</b></a>
      			<a href="#" class="buyerCard-send active mt-15 mb-15">제안서 보내기</a>
		</div>
	</div>
</c:forEach>
