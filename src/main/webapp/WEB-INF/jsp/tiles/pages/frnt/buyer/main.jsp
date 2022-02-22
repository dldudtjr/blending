<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<sf:form commandName="srchFm" cssClass="form-horizontal">
	<input type="hidden" name="productId" id="productId">
</sf:form>
<div class="sidebar-main title-up">
	<header class="guide-title">
		<div class="guide-title-img">
			<img src="/resources/images/info_img.png" alt="">
		</div>
		<h3 class="tit">Farming Season</h3>
	</header>
	<div class="guide-wrap">
		<div class="guide-tab">
			<a href="product.html" class="active">Product</a> <a href="brand.html">Brand</a> <a href="#" class="share ml-auto"><img src="/resources/images/Icon-ionic-ios-share-alt.png" alt="공유하기"></a>
		</div>
		<div class="line-gray"></div>
		<div class="product-wrap">
			<div class="product-left">
				<c:forEach items="${srchLst}" var="row" varStatus="cnt">
					<div class="product-form add-line">
						<div class="product-img">
							<img src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${row.productId}&fileId=${row.fileId}">
						</div>
						<div class="info-bt ml-auto">
							<a href="javascript:void(0)" class="product-popup-bt" data-productid="${row.productId}"  ><img src="/resources/images/Icon-feather-menu.png" alt=""></a>
							<div class="product-bot-bt">
								<a href="#"><img src="/resources/images/Icon-ionic-ios-checkmark-circle.png" alt=""></a>
								<a href="#"><img src="/resources/images/Icon-material-wifi.png" alt=""></a>
								<a href="#"><img src="/resources/images/Icon-feather-menu.png" alt=""  class="product-manage" data-productid="${row.productId}" ></a>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- <div class="product-form add-line">
					<div class="product-img">
						<img src="/resources/images/sample1.png" alt="">
					</div>
					<div class="info-bt ml-auto">
						<a href="javascript:void(0)" class="product-popup-bt" data-productId="" ><img src="/resources/images/Icon-feather-menu.png" alt=""></a>
						<div class="product-bot-bt">
							<a href="#"><img src="/resources/images/Icon-ionic-ios-checkmark-circle.png" alt=""></a>
							<a href="#"><img src="/resources/images/Icon-material-wifi.png" alt=""></a>
						</div>
					</div>
				</div> -->
				<div class="product-form">
					<a href="javascript:void(0)" class="add-bt"> <img src="/resources/images/Icon-material-add-circle.png" alt=""> <span>Add Product</span>
					</a>
				</div>
				<!-- <div class="product-form">
					<a href="#" class="add-bt"> <img src="/resources/images/Icon-material-add-circle.png" alt=""> <span>Add Product</span>
					</a>
				</div>
				<div class="product-form">
					<a href="#" class="add-bt"> <img src="/resources/images/Icon-material-add-circle.png" alt=""> <span>Add Product</span>
					</a>
				</div> -->
			</div>
			<ul class="product-right">
				<li>
					<section class="detail-right-container">
						<div class="detail-img">
							<img src="/resources/images/info_img.png" alt="">
						</div>
						<div class="detail-img-text">
							<span>SeSi Lever</span> <span class="detail-img-text-title">SeSi Leggings</span>
							<div class="add-r mt-10">
								<span>$20.00</span> <span>Cost/item</span> <span>58.00%</span> <span>Margin</span>
							</div>
						</div>
					</section>
				</li>
				<li>Products <span>0</span></li>
				<li>주소 <span>-</span></li>
				<li>Website <span>-</span></li>
				<li>Established <span>2021</span></li>
				<li>Revenue <span>$ ~ $</span></li>
				<li>Instagram <span>Url</span></li>
				<li>Facebook <span>Url</span></li>
				<li>Youtube <span>Url</span></li>
			</ul>
		</div>
	</div>
</div>

<script>
$(function(){

	$(".product-popup-bt").click(function(){
		var url	 ="<c:url value='/web/brand/productDtl.bt' />";
		var sendData ={"productId" : $(this).data("productid") };
		fn_submitModal(url,sendData,"popProduct");
	});

	$(".product-manage").click(function(){
		var url	 ="<c:url value='/web/brand/productMod.bt' />";
		$("#productId").val($(this).data("productid"));
		$("#srchFm").attr("action",url);
		$("#srchFm").submit();
	});



	$(".add-bt").click(function(){
		var url	 ="<c:url value='/web/brand/productAdd.bt' />";
		location.href=url;

	});
})


</script>

<!-- 팝업: product -->
  <section class="modal fade wn-modal modal_wrap" id="popProduct">

  </section>

