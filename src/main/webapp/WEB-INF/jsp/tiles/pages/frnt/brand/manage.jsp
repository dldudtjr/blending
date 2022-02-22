<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
          <div class="sidebar-main title-up">
          	<header class="guide-title">
				<div class="guide-title-img">
					<c:if test="${not empty _sessionKey.cmpyFileId}">
					<img src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${_sessionKey.cmpyId}&fileId=${_sessionKey.cmpyFileId}">
					</c:if>
					<c:if test="${empty _sessionKey.cmpyFileId}">
						<img src="/resources/images/info_img.png" alt="">
					</c:if>
				</div>
				<h3 class="tit">${_sessionKey.cmpyNm}</h3>
			</header>
            <div class="guide-wrap">
              <div class="guide-tab">
                <a href='<c:url value="/web/brand/productLst.bt"/>' >Product</a>
				<a href='<c:url value="/web/brandN/manage.bt"/>'  class="active">Brand</a>
<!--                 <a href="#" class="share ml-auto"><img src="/resources/images/Icon-ionic-ios-share-alt.png" alt="공유하기"></a> -->
              </div>
              <div class="line-gray"></div>
              <div class="product-wrap">
                <div class="product-left">
                  <div class="product-form">
                    <div class="form-attach-image">
					<input type="file" name="brandImg" id="input-file2" hidden="" accpet="image/*">
                      <label for="input-file2">
                        <div class="attach-image-thumb">
                          <span>Brand Story</span>
                          <div class="img-square">
                            <div class="img-crop" id="brandImg" data-attach-role="bgImg">
                            </div>
                          </div>
                        </div>
                      </label>
                    </div>
                  </div>
                  <!-- 20220217 -->
                  <div class="product-form">
                    <a href="javascript:void(0)" class="add-bt popVideo">
                      <img src="/resources/images/Icon-awesome-video.png" alt="">
                      <span>Add Video</span>
                    </a>
                    <div class="add-video">
                      <div class="input-add item-center">
                        <p class="youtube-text">유튜브 URL</p>
                        <input type="text" class="input-text" name="mvUrl" id="mvUrl" placeholder="직접입력" value="${_sessionKey.mvUrl}">
                      </div>
                    </div>
                  </div>
                  <!-- // 20220217 -->

                </div>
                <ul class="product-right">
				<li>
					<section class="detail-right-container">
						<div class="detail-img">
							<c:if test="${not empty productLatest.fileId}">
							<img src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${productLatest.productId}&fileId=${productLatest.fileId}">
							</c:if>
							<c:if test="${empty productLatest.fileId}">
								<img src="/resources/images/info_img.png" alt="">
							</c:if>

						</div>
						<div class="detail-img-text">
							<span>SeSi Lever</span> <span class="detail-img-text-title">${productLatest.productNm}</span>
							<div class="add-r mt-10">
								<span>$ ${productLatest.cost}</span><!--  <span>Cost/item</span> <span>58.00%</span> <span>Margin</span> -->
							</div>
						</div>
					</section>
				</li>
				<li>Products <span>${productLatest.productTotalCnt}</span></li>
				<!-- <li>주소 <span>-</span></li> -->
				<!-- <li>Website <span>-</span></li>
				<li>Established <span>2021</span></li>
				<li>Revenue <span>$ ~ $</span></li>
				<li>Instagram <span>Url</span></li>
				<li>Facebook <span>Url</span></li>
				<li>Youtube <span>Url</span></li> -->
			</ul>
              </div>
            </div>
          </div>


<script src="<c:url value='/resources/js/ui.js'/>"></script>
<script src="<c:url value='/resources/js/detail.js'/>"></script>

<script>
$(function(){
	$(".main-top-wrap").hide();
	$("#brandTop").remove();
	$("#brandNMain").show();
	$(".main-container").removeClass("sub");

	$(".sidebar").hide();
	$(".guide-title").show();
	$(".global-nav-bar").addClass("no-line");


	  <c:if test="${not empty _sessionKey.coverFileId}">
		var src = "<c:url value='/util/fileDownload.ax'/>?parntsDtaId=${_sessionKey.cmpyId}&fileId=${_sessionKey.coverFileId}";
	  $("#brandCoverImg").css({
          "background-image": "url(" + src + ")",
          "background-color": "#fff",
        });

	  </c:if>
	  <c:if test="${not empty _sessionKey.brandFileId}">
	  var src = "<c:url value='/util/fileDownload.ax'/>?parntsDtaId=${_sessionKey.cmpyId}&fileId=${_sessionKey.brandFileId}";
	  $("#brandImg").css({
          "background-image": "url(" + src + ")",
          "background-color": "#fff",
        });
	  </c:if>


	$(".product-popup-bt").click(function(){
		var url	 ="<c:url value='/web/brand/productDtl.bt' />";
		var sendData ={"productId" : $(this).data("productid") };
		fn_submitModal(url,sendData,"popProduct");
	});

    $("#mvUrl").bind('paste', function() {
    	setTimeout(function(){
    		var url	 ="<c:url value='/web/mypage/udtCmpyMvUrlSubmit.ax' />";
    		var sendData ={"mvUrl" : $("#mvUrl").val()};
    		fn_submitReloadAjax(url,sendData,"popProduct");
    		}, 500);
     });


	$(".product-manage").click(function(){
		var url	 ="<c:url value='/web/brand/productMod.bt' />";
		$("#productId").val($(this).data("productid"));
		$("#srchFm").attr("action",url);
		$("#srchFm").submit();
	});

	$("#input-file").change(function(){
		var form = $('#saveFm')[0];
	       var formData = new FormData(form);
	       formData.append("brandCoverImg", $("#input-file")[0].files[0]);
	       var url	 ="<c:url value='/web/brandN/imgUpload.ax' />";
	       $.ajax({
	           			url: url,
	                   processData: false,
	                   contentType: false,
	                   data: formData,
	                   type: 'POST',
	                   success: function(result){
	                       alert("업로드 성공!!");
	                   }
	           });
	});

	$("#input-file2").change(function(){
		var form = $('#saveFm')[0];
	       var formData = new FormData(form);
	       formData.append("brandImg", $("#input-file2")[0].files[0]);
	       var url	 ="<c:url value='/web/brandN/imgUpload.ax' />";
	       $.ajax({
	           			url: url,
	                   processData: false,
	                   contentType: false,
	                   data: formData,
	                   type: 'POST',
	                   success: function(result){
	                       alert("업로드 성공!!");
	                   }
	           });
	});


 $(".popVideo").click(function(){
	 $('#popVideo').modal('show');
	});

/* 	$(".productAdd").click(function(){
		var url	 ="<c:url value='/web/brand/productAdd.bt' />";
		location.href=url;

	}); */
})

</script>

<!-- 팝업: product -->
  <section class="modal fade wn-modal modal_wrap" id="popProduct">

  </section>

    <!-- 20220217 -->
  <!-- 팝업: add video -->
  <section class="modal fade wn-modal" id="popVideo">
    <div class="modal-dialog modal-dialog-centered modal-video">
      <div class="modal-content">
        <button class="btn-close" data-dismiss="modal" title="닫기"></button>
        <div class="wn-modal-body">
          <iframe width="560" height="320" src="${_sessionKey.mvUrl}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
      </div>
    </div>
  </section>
  <!-- // 20220217 -->


