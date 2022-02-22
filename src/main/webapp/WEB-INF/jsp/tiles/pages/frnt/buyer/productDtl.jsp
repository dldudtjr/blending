<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script src="<c:url value='/resources/js/main-pc.js'/>"></script>
<!-- 팝업: product -->
    <div class="modal-dialog modal-dialog-centered modal-slide">
      <div class="modal-content">
        <button class="btn-close" data-dismiss="modal" title="닫기"></button>
        <div class="wn-modal-body">
          <div class="pop-product-img">
            <c:if test="${fn:length(productImgLst) > 0}">
            	<img src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${productImgLst[0].parntsDtaId}&fileId=${productImgLst[0].fileId}" height="200">
		    </c:if>

          </div>
          <div class="pop-product-wrap">
            <div class="pop-product-title">
              <img src="images/product-logo.png" alt="" style="width: 30px;">
              <span class="ml-10">Farming Season</span>
            </div>
            <div class="pop-product-sub">
              <span class="product-title-name">${saveFm.productNm}</span>
              <span class="px-5">-</span>
              <span class="">Korean Taste for Seasoning</span>
            </div>
            <div class="pop-product-sub2">
              <p>MSRP ${saveFm.msrp}</p>
              <p>Cost/Item ${saveFm.cost}</p>
              <%-- <p>Margin ${saveFm.productNm}</p> --%>
            </div>
          </div>
          <footer class="wn-modal-footer">
            <a href="#"><i class="wn-icon int"></i><span>Interested</span></a>
            <a href="#"><i class="wn-icon cont"></i><span>Contact</span></a>
            <a href="#"><i class="wn-icon sample"></i><span>Sample</span></a>
            <a href="javascript:void(0)" class="detail-info-bt"><i class="wn-icon deInfo"></i><span>Detail Info</span></a>
          </footer>
        </div>
        <div class="wn-modal-body">
          <nav>
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a href="#tab-content-1" class="nav-link active" data-toggle="tab">소개</a>
              </li>
              <li class="nav-item">
                <a href="#tab-content-2" class="nav-link" data-toggle="tab">유통현황</a>
              </li>
              <li class="nav-item">
                <a href="#tab-content-3" class="nav-link" data-toggle="tab">가격</a>
              </li>
            </ul>
          </nav>
          <div class="tab-content">
            <section class="tab-pane show active" id="tab-content-1">
              <div class="pop-detail-info">
                <span class="pop-detail-info-title">제품소개</span>
                <span>${saveFm.productInfo}</span>
              </div>
              <div class="pop-detail-info">
                <span class="pop-detail-info-title">USP (Unique Selling Propositions)</span>
               		 <c:if test="${not empty saveFm.usp}" >
						<c:forEach var="item" items="${fn:split(saveFm.usp,'||')}">
							<p>${item}</p>
						</c:forEach>
					</c:if>
              </div>
            </section>
            <section class="tab-pane" id="tab-content-2">
              <div class="pop-detail-info">
                <span class="pop-detail-info-title">제조 국가</span>
                 <span>
                 	<c:if test="${not empty saveFm.manuFacturedCountry}" >
						<c:forEach var="item" items="${fn:split(saveFm.manuFacturedCountry,'||')}">
							${item}
						</c:forEach>
					</c:if>
                </span>
              </div>
              <div class="pop-detail-info">
                <span class="pop-detail-info-title">제조 도시</span>
                <span>
               		<c:if test="${not empty saveFm.manuFacturedCity}" >
						<c:forEach var="item" items="${fn:split(saveFm.manuFacturedCity,'||')}">
							${item}
						</c:forEach>
					</c:if>
				</span>
              </div>
              <div class="pop-detail-info">
                <span class="pop-detail-info-title">판매 가능 여부</span>
                <span>
                	  <c:if test = "${sellYn eq 'N'}">아니요</c:if>
				      <c:if test = "${sellYn eq 'Y'}">예</c:if>
                </span>
              </div>
              <div class="pop-detail-info">
                <span class="pop-detail-info-title">유통업자</span>
                <span>
                 	  <c:if test = "${purchaseYn eq 'N'}">아니요</c:if>
				      <c:if test = "${purchaseYn eq 'Y'}">예</c:if>
                </span>
              </div>
              <div class="pop-detail-info">
                <span class="pop-detail-info-title">유통처</span>
                <span>
                	 <c:if test="${not empty saveFm.distributedWhere}" >
							<c:forEach var="item" items="${fn:split(saveFm.distributedWhere,'||')}">
							${item}
							</c:forEach>
						</c:if>
                 </span>
              </div>
            </section>
            <section class="tab-pane" id="tab-content-3">
              <div class="pop-detail-info flex">
                <span class="pop-detail-info-title">권장 소비자가격(MSRP)</span>
                <span>US$ ${saveFm.msrp} </span>
              </div>
              <div class="pop-detail-info flex">
                <span class="pop-detail-info-title">공급가격(Cost)</span>
                <span>US$ ${saveFm.cost}</span>
              </div>
            <!--   <div class="pop-detail-info flex">
                <span class="pop-detail-info-title">마진(Margin)</span>
                <span>US$ 8 - US$ 10</span>
              </div> -->
              <div class="pop-detail-info flex mt-40">
                <span class="pop-detail-info-title">카튼당 구매가격</span>
                <span>US$ 20</span>
              </div>
              <div class="pop-detail-info flex">
                <span class="pop-detail-info-title">카튼박스 입수량</span>
                <span>10</span>
              </div>
              <div class="pop-detail-info flex mt-40">
                <span class="pop-detail-info-title">무상샘플지원</span>
                <span>3</span>
              </div>
            </section>
          </div>
        </div>
      </div>
    </div>

