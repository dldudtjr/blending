<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<sf:form commandName="srchFm" cssClass="form-horizontal">
	<sf:hidden path="srchTxt" />
</sf:form>


<div class="sidebar-main">
            <div class="detail-wrap">
              <div class="buyer-wrap-left">
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
		                    <a href="#"><i class="wn-icon int"></i><span>Interested</span></a>
		                    <a href="#"><i class="wn-icon cont"></i><span>Contact</span></a>
		                    <a href="#"><i class="wn-icon sample"></i><span>Sample</span></a>
		                  </footer>
	                </div>
					</c:forEach>
              </div>
              <div class="buyer-wrap-right">
                <div class="search-box">

                  <input type="text" class="input-text input-search" placeholder="검색" id="srchTxtTmp" value="${srchFm.srchTxt}" />
                  <button type="button" class="btn-search-icon srchBtn" title="검색"></button>
                </div>
                <div class="new-reg mt-10">
                  <div><span>신규 등록 브랜드</span><b><fmt:formatNumber type="number" 	maxFractionDigits="3" value="${latestBrandCnt.newBrandCnt}" /></b></div>
                  <div><span>신규 등록 제품</span><b><fmt:formatNumber type="number" 	maxFractionDigits="3" value="${latestBrandCnt.newProductCnt}" /></b></div>
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
                      <span>${_sessionKey.firstNm} ${_sessionKey.lastNm}</span>
                      <a href="/web/mypage/userInfo.bt"><i class="wn-icon set"></i></a>
                    </div>
                  </div>
                  <div class="pa-15 mt-5" style="display:none">
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
                            <td>9<div><i class="color1"></i><i class="color2"></i><i class="color3"></i></div></td>
                            <td>10</td>
                          </tr>
                          <tr>
                            <td>11</td>
                            <td>12<div><i class="color1"></i></div></td>
                            <td>13</td>
                            <td>14<div><i class="color3"></i></div></td>
                            <td>15</td>
                            <td>16</td>
                            <td>17</td>
                          </tr>
                          <tr>
                            <td>18</td>
                            <td>19<div><i class="color2"></i><i class="color3"></i></div></td>
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
                        <div><b>28</b><i class="color1"></i><span>신제품 콜</span></div>
                        <div><b>30</b><i class="color2"></i><span>브랜드 화상미팅</span></div>
                        <div><b>30</b><i class="color3"></i><span>브랜드 화상미팅</span></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
<script>
$(function(){

//	$("#brandTop").remove();
//	$("#brandMain").remove();
	$(".global-nav-bar").addClass("buyer");
	$(".main-container").addClass("buyer");
	$(".main-container").removeClass("sub");

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

	$(".srchBtn").click(function(){
		$("#srchTxt").val($("#srchTxtTmp").val())
		$("#srchFm").submit();
	});
})


</script>

<!-- 팝업: product -->
  <section class="modal fade wn-modal modal_wrap" id="popProduct">

  </section>

