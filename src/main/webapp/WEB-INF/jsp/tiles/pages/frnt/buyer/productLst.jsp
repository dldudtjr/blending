<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<sf:form commandName="srchFm" cssClass="form-horizontal">
	<sf:hidden path="srchTxt" />
</sf:form>


<div class="sidebar-main">
	<div class="detail-wrap">
		<div class="buyer-wrap-left">
			<div class="buyer-group">
				<div class="buyer-form-title-wrap">
					<div class="buyer-form-title">Newly Submitted</div>
					<div class="ml-auto d-flex align-items-center">
						<a href="javascript:void(0)" class="mr-15"><img src="/resources/images/Icon-newly1.png" alt="" style="width: 17px;"></a> <a href="javascript:void(0)" class="mr-15"><img src="/resources/images/Icon-newly2.png" alt="" style="width: 19px;"></a> <a href="javascript:void(0)" class="buyer-scroll"><img src="/resources/images/ham.png" alt="" style="width: 23px;"></a>
					</div>
				</div>
				<div class="buyer-form-wrap">
					<c:forEach items="${srchLst}" var="row" varStatus="cnt">
						<div class="buyer-form">
							<div class="pop-product-img">
								<c:if test="${not empty row.fileId}">
									<img src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${row.productId}&fileId=${row.fileId}" style="width: 65px;">
								</c:if>
								<c:if test="${empty row.fileId}">
									<img src="/resources/images/noimg.png" style="width: 65px;">
								</c:if>
							</div>
							<div class="pop-product-wrap">
								<div class="pop-product-title">
									<c:if test="${not empty row.fileId}">
										<img src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${row.cmpyId}&fileId=${row.cmpyFileId}" style="width: 30px;">
									</c:if>
									<c:if test="${empty row.fileId}">
										<img src="/resources/images/product-logo.png" alt="" style="width: 30px;">
									</c:if>
									<span class="ml-10">${row.cmpyNm}</span>
								</div>
								<div class="pop-product-sub">
									<span class="product-title-name">${row.productNm}</span>
									<p>${row.productInfo}</p>
								</div>
								<div class="pop-product-sub2">
									<p>MSRP ${row.msrp}</p>
									<p>Margin 20% ~ 25%</p>
								</div>
							</div>
							<footer class="wn-modal-footer">
								<a href="#"><i class="wn-icon int"></i><span>Interested</span></a> <a href="#"><i class="wn-icon cont"></i><span>Contact</span></a> <a href="#"><i class="wn-icon sample"></i><span>Sample</span></a>
							</footer>
						</div>
					</c:forEach>
				</div>



				<div class="category-group mt-15">
                  <div class="buyer-form-title">Category Groups</div>
                  <div class="ml-auto d-flex align-items-center">
                    <a href="javascript:void(0)" class="categoryPopBt mr-15"><img src="/resources/images/Icon-category1.png" alt="" style="width:21px;"></a>
                    <a href="javascript:void(0)" class="mr-15"><img src="/resources/images/Icon-category2.png" alt="" style="width:25px;"></a>
                    <a href="javascript:void(0)" class="mr-15"><img src="/resources/images/Icon-category3.png" alt="" style="width:18px;"></a>
                    <a href="javascript:void(0)" class="categoryPopManageBt" ><img src="/resources/images/Icon-feather-settings.png" alt="" style="width:21px;"></a>
                  </div>
                </div>

				<c:forEach items="${cateLst}" var="cateRow" varStatus="cnt">
					<!-- 여기부터 셋팅된 그룹목록이 나와야 함   -->
					<div class="buyer-group mt-15" >
	                  <div class="buyer-form-title-wrap">
	                    <div class="buyer-form-title">${cateRow.productCateNm}</div>
	                    <div class="ml-auto d-flex align-items-center">
	                      <a href="javascript:void(0)" class="buyer-scroll mr-15"><img src="/resources/images/ham.png" alt="" style="width:23px;"></a>
	                      <a href="javascript:void(0)" class="mr-15 emailPop" data-id="popContent${cateRow.productCateId}"><img src="/resources/images/Icon-feather-download.png" alt="" style="width:16px;"></a>
	                      <a href="javascript:void(0)" class="mr-15"><img src="/resources/images/Icon-feather-refresh-cw.png" alt="" style="width:18px;"></a>
	                      <a href="javascript:void(0)" class="categoryPopManageBt"><img src="/resources/images/Icon-feather-settings2.png" alt="" style="width:21px;"></a>
	                    </div>
	                  </div>

	                  <div class="buyer-form-wrap" id="popContent${cateRow.productCateId}">
						<c:forEach items="${cateRow.subMap}" var="row" varStatus="cnt">
							${row} asdfasdfasdfasdfasdfasdf
							<div class="buyer-form">
								<div class="pop-product-img">
									<c:if test="${not empty row.fileId}">
										<img src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${row.productId}&fileId=${row.fileId}" style="width: 65px;">
									</c:if>
									<c:if test="${empty row.fileId}">
										<img src="/resources/images/noimg.png" style="width: 65px;">
									</c:if>
								</div>
								<div class="pop-product-wrap">
									<div class="pop-product-title">
										<c:if test="${not empty row.fileId}">
											<img src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${row.cmpyId}&fileId=${row.cmpyFileId}" style="width: 30px;">
										</c:if>
										<c:if test="${empty row.fileId}">
											<img src="/resources/images/product-logo.png" alt="" style="width: 30px;">
										</c:if>
										<span class="ml-10">${row.cmpyNm}</span>
									</div>
									<div class="pop-product-sub">
										<span class="product-title-name">${row.productNm}</span>
										<p>${row.productInfo}</p>
									</div>
									<div class="pop-product-sub2">
										<p>MSRP ${row.msrp}</p>
										<p>Margin 20% ~ 25%</p>
									</div>
								</div>
								<footer class="wn-modal-footer">
									<a href="#"><i class="wn-icon int"></i><span>Interested</span></a>
									<a href="#"><i class="wn-icon cont"></i><span>Contact</span></a>
									<a href="#"><i class="wn-icon sample"></i><span>Sample</span></a>
								</footer>
							</div>
						</c:forEach>
	                  </div>
	                </div>
					<!-- 여기부터 셋팅된 그룹목록이 END  -->
				</c:forEach>

			</div>
		</div>
		<div class="buyer-wrap-right">
			<div class="search-box">

				<input type="text" class="input-text input-search" placeholder="검색" id="srchTxtTmp" value="${srchFm.srchTxt}" />
				<button type="button" class="btn-search-icon srchBtn" title="검색"></button>
			</div>
			<div class="new-reg mt-10">
				<div>
					<span>신규 등록 브랜드</span><b><fmt:formatNumber type="number" maxFractionDigits="3" value="${latestBrandCnt.newBrandCnt}" /></b>
				</div>
				<div>
					<span>신규 등록 제품</span><b><fmt:formatNumber type="number" maxFractionDigits="3" value="${latestBrandCnt.newProductCnt}" /></b>
				</div>
			</div>
			<div class="cal-wrap mt-10">
				<div class="company-wrap">
					<div class="company-img">
						<c:if test="${not empty latestBrandCnt}">
							<img class="image fileDown" src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${latestBrandCnt.cmpyId}&fileId=${latestBrandCnt.fileId}">
						</c:if>
						<c:if test="${empty latestBrandCnt }">
							<img src="/resources/images/dylan-gillis-KdeqA3aTnBY-unsplash.jpg" alt="">
						</c:if>
					</div>
					<span class="company-title">${_sessionKey.cmpyNm}</span>
					<div class="add-r mt-10 mb-20">
						<span>${_sessionKey.firstNm} ${_sessionKey.lastNm}</span> <a href="/web/mypage/userInfo.bt"><i class="wn-icon set"></i></a>
					</div>
				</div>
				<div class="pa-15 mt-5" style="display: none">
					<span class="cal-month">April</span>
					<div class="cal mt-10">
						<table>
							<thead>
								<tr>
									<th>SUN</th>
									<th>MON</th>
									<th>TUE</th>
									<th>WED</th>
									<th>THU</th>
									<th>FRI</th>
									<th>SAT</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="off">28</td>
									<td class="off">29</td>
									<td class="off">30</td>
									<td class="off">31</td>
									<td>Apr 1</td>
									<td>2</td>
									<td>3</td>
								</tr>
								<tr>
									<td>4</td>
									<td>5</td>
									<td>6</td>
									<td>7</td>
									<td>8</td>
									<td>9
										<div>
											<i class="color1"></i><i class="color2"></i><i class="color3"></i>
										</div>
									</td>
									<td>10</td>
								</tr>
								<tr>
									<td>11</td>
									<td>12
										<div>
											<i class="color1"></i>
										</div>
									</td>
									<td>13</td>
									<td>14
										<div>
											<i class="color3"></i>
										</div>
									</td>
									<td>15</td>
									<td>16</td>
									<td>17</td>
								</tr>
								<tr>
									<td>18</td>
									<td>19
										<div>
											<i class="color2"></i><i class="color3"></i>
										</div>
									</td>
									<td>20</td>
									<td>21</td>
									<td>22</td>
									<td>23</td>
									<td>24</td>
								</tr>
								<tr>
									<td>25</td>
									<td>26</td>
									<td>27</td>
									<td>28</td>
									<td>29</td>
									<td>30</td>
									<td class="off">May 1</td>
								</tr>
							</tbody>
						</table>
						<p class="cal-schedule-title">예정된 일정</p>
						<div class="cal-schedule">
							<div>
								<b>28</b><i class="color1"></i><span>신제품 콜</span>
							</div>
							<div>
								<b>30</b><i class="color2"></i><span>브랜드 화상미팅</span>
							</div>
							<div>
								<b>30</b><i class="color3"></i><span>브랜드 화상미팅</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

	<!-- 팝업: product -->
  <section class="modal fade wn-modal modal_wrap" id="popProduct"></section>
  <section class="modal fade wn-modal" id="popCategoryNew"></section>
  <section class="modal fade wn-modal" id="popCategory"></section>



  <!-- 팝업: 이메일로 리스트 공유하기 -->
  <section class="modal fade wn-modal" id="popEmail">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="wn-modal-body">
          <div class="text-center mt-30">
            <b class="gray-9">이메일로 리스트 공유하기</b>
            <div class="form-field pa-15 mt-10">
              <div class="input-add add-right">
                <input type="text" class="input-tex emailTmp" name="emailTmp" placeholder="Keywords">
                <button class="button bt-blue-light w-80 emailAdd">추가</button>
              </div>
            </div>
            <div class="emailLst">
	            <!-- <div class="d-flex align-items-center px-25">
	              <span>asdfasdfg@naver.com</span>
	              <div class="ml-auto">
	                <a href="javascript:void(0)"  class="removeEmailBtn"><img src="/resources/images/x-16-red@2x.png" alt="" style="width: 16px;"></a>
	              </div>
	            </div>
	            <div class="d-flex align-items-center px-25 mt-10">
	              <span>asdfasdfg@naver.com</span>
	              <div class="ml-auto">
	                <a href="javascript:void(0)"  class="removeEmailBtn"><img src="/resources/images/x-16-red@2x.png" alt="" style="width: 16px;"></a>
	              </div>
	            </div> -->
            </div>
          </div>
          <div class="mt-30 mb-20 text-center">
            <a href="javascript:void(0)" class="button bt-gray bt-s wd-100 eamilcloseBtn" data-dismiss="modal">취소</a>
            <a href="javascript:void(0)" class="button bt-blue bt-s wd-100 eamilSendBtn" >확인</a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- // 팝업: 이메일로 리스트 공유하기 -->
<script>
	$(function() {

		var doubletyp ="S"
		    var sltTxt ="email";
			$("."+sltTxt+"Add").click(function(){
				if(doubletyp == "S" && $("."+sltTxt+"Tmp").val()){
					doubletyp == "B";
					txt ='<div class="d-flex align-items-center px-25 mt-10">'+
							'<span>'+$("."+sltTxt+"Tmp").val()+'</span>'+
							'<input type="hidden" name="'+sltTxt+'Arr" value="'+$("."+sltTxt+"Tmp").val()+'">'+
								'<div class="ml-auto">'+
									'<a href="javascript:void(0)" class="removeEmailBtn"><img src="/resources/images/x-16-red@2x.png" alt="" style="width: 16px;"></a>'+
								'</div>'+
						'</div>';
	            $("."+sltTxt+"Lst").append(txt);
	            $("."+sltTxt+"Tmp").val("");
	            doubletyp == "S";
				}
			});


		$(document).on("click",".removeEmailBtn",function(){
			$(this).parent().parent().remove();
		});

		$(document).on("click",".eamilSendBtn",function(){
			alert("이메일이 발송 되었습니다. ");
			//<link rel="stylesheet" href="/resources/css/main.css"></div>
			location.reload();
			return false;
		});



		var conlistId = ""
		$(document).on("click",".emailPop",function(){
			conlistId = $(this).data("id");
			$('#popEmail').modal('show');
		});



		$(document).on("click",".eamilSendBtn",function(){
			var url = "<c:url value='/web/buyer/productListEmailSend.bt' />";
			var sendData = {
				"productCateId" : $(this).data("userId")
			};
			fn_submitModal(url, sendData, "popCategory");
		});

		$(".categoryPopManageBt").click(function() {
			var url = "<c:url value='/web/buyer/productCateUdtPop.bt' />";
			var sendData = {
				"productCateId" : $(this).data("userId")
			};
			fn_submitModal(url, sendData, "popCategory");
		});

		$(".categoryPopBt").click(function() {
			var url = "<c:url value='/web/buyer/productCatePop.bt' />";
			var sendData = {
				"productCateId" : $(this).data("productcateid")
			};
			fn_submitModal(url, sendData, "popCategoryNew");
		});


		//	$("#brandTop").remove();
		//	$("#brandMain").remove();
		$(".global-nav-bar").addClass("byuer");
		$(".main-container").addClass("byuer");
		$(".main-container").removeClass("sub");

		$(".product-popup-bt").click(function() {
			var url = "<c:url value='/web/brand/productDtl.bt' />";
			var sendData = {
				"productId" : $(this).data("productid")
			};
			fn_submitModal(url, sendData, "popProduct");
		});

		$(".product-manage").click(function() {
			var url = "<c:url value='/web/brand/productMod.bt' />";
			$("#productId").val($(this).data("productid"));
			$("#srchFm").attr("action", url);
			$("#srchFm").submit();
		});

		$(".add-bt").click(function() {
			var url = "<c:url value='/web/brand/productAdd.bt' />";
			location.href = url;

		});

		$(".srchBtn").click(function() {
			$("#srchTxt").val($("#srchTxtTmp").val())
			$("#srchFm").submit();
		});
	})
</script>