<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="detail-side-container">
	<div class="detail-side-wrapper">
		<div class="detail-side-content">
			<section class="detail-right-container">
				<div class="detail-img">
					<c:if test="${not empty productCurrent.fileId}">
						<img src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${productCurrent.productId}&fileId=${productCurrent.fileId}">
					</c:if>
					<c:if test="${empty productCurrent.fileId}">
						<img src="/resources/images/info_img.png" alt="">
					</c:if>
				</div>
				<div class="detail-img-text">
					<!-- <span>SeSi Lever</span> -->
					<span class="detail-img-text-title">${productCurrent.productNm}</span>
					<div class="add-r mt-10">
						<span>$ ${productCurrent.cost}</span>
						<!--  <span>Cost/item</span> <span>58.00%</span> <span>Margin</span> -->
						<span>MSRP ${saveFm.msrp}</span>
						<span>Cost/Item ${saveFm.cost}</span>
					</div>
				</div>
			</section>
			<div class="detail-preview">
				<i class="wn-icon eye"></i><span class="ml-5">Preview Product Profile</span>
			</div>
			<div class="detail-help mt-20">
				<span class="detail-help-title"><i class="wn-icon help blue mr-5"></i>Need help?</span>
				<span>We will help guide you along the process.</span> <a href="#" class="link">Find more information</a>
			</div>
		</div>
	</div>
</div>