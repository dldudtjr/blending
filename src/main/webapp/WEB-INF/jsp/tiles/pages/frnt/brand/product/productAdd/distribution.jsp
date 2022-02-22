<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
  <div class="sidebar-main">
            <header class="sidebar-main-header">
              <h3 class="tit">유통현황</h3>
            </header>
            <sf:form commandName="srchFm" cssClass="form-horizontal" >
				<input type="hidden" name="productId" id="makingProductId" />
			</sf:form>
			<sf:form commandName="saveFm" cssClass="form-horizontal" enctype="multipart/form-data">
				<sf:hidden path="productId" />
				<sf:hidden path="productRegStatus" />
				<sf:hidden path="productOrgStatus"  value="003" />
				<sf:hidden path="manuFacturedCountry" />
				<sf:hidden path="manuFacturedCity" />
				<sf:hidden path="sellWhere" />
				<sf:hidden path="distributorType" />
				<sf:hidden path="distributedWhere" />

            <div class="detail-wrap">
              <div class="detail-wrap-left">
                <h4 class="detail-wrap-title">제품이 제조되는 국가/지역이 어디입니까?</h4>
                <div class="form-field">
                  <div class="form-field">
                    <div class="input-add add-right">
                      <input type="text" class="input-text manuFacturedCountryTmp" placeholder="">
                      <button type="button" class="button bt-blue-light w-140 listAdd" data-id="manuFacturedCountry">등록</button>
                    </div>
                  </div>
                  <div class="detail-tag manuFacturedCountryLst">
	                  <c:if test="${not empty saveFm.manuFacturedCountry}" >
							<c:forEach var="item" items="${fn:split(saveFm.manuFacturedCountry,'||')}">
								<span class="tag-pill">${item}<input type="hidden" name="manuFacturedCountryArr" value="${item}"> <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>
							</c:forEach>
						</c:if>
                  </div>
                </div>
                <div class="mt-30">
                  <h4 class="detail-wrap-title">제품이 제조되는 주/도시가 어디입니까?</h4>
                  <div class="form-field">
                    <div class="form-field">
                      <div class="input-add add-right">
                        <input type="text" class="input-text manuFacturedCityTmp" placeholder="">
                        <button type="button" class="button bt-blue-light w-140 listAdd" data-id="manuFacturedCity">등록</button>
                      </div>
                    </div>
                    <div class="detail-tag manuFacturedCityLst">
                     <c:if test="${not empty saveFm.manuFacturedCity}" >
							<c:forEach var="item" items="${fn:split(saveFm.manuFacturedCity,'||')}">
								<span class="tag-pill">${item}<input type="hidden" name="manuFacturedCityArr" value="${item}"> <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>
							</c:forEach>
						</c:if>
                      <!-- <span class="tag-pill">South Korea <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>
                      <span class="tag-pill">China <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span> -->
                    </div>
                  </div>
                </div>
                <div class="mt-30">
                  <h4 class="detail-wrap-title">이 제품은 현재 판매 가능합니까?</h4>
                  <div class="form-field">
                    <label class="radio">
                    	<sf:radiobutton path="sellYn" class="input-text" value="Y" />
                      <span class="label">Yes</span>
                    </label>
                    <label class="radio">
                    	<sf:radiobutton path="sellYn" class="input-text" value="N" />
                      <span class="label">No</span>
                    </label>
                  </div>
                </div>
                <div class="mt-30">
                  <div class="form-field">
                    <h4 class="detail-wrap-title">이 제품은 현재 어디에서 판매되고 있습니까?</h4>
                    <div class="form-field">
                      <div class="form-field">
                        <div class="input-add add-right">
                          <input type="text" class="input-text sellWhereTmp" placeholder="">
                          <button type="button" class="button bt-blue-light w-140 listAdd" data-id="sellWhere">등록</button>
                        </div>
                      </div>
                      <div class="detail-tag sellWhereLst">
						<c:if test="${not empty saveFm.sellWhere}" >
							<c:forEach var="item" items="${fn:split(saveFm.sellWhere,'||')}">
								<span class="tag-pill">${item}<input type="hidden" name="sellWhereArr" value="${item}"> <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>
							</c:forEach>
						</c:if>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="mt-30">
                  <h4 class="detail-wrap-title">이 제품은 유통업자를 통해 구매 가능한가요?</h4>
                  <div class="form-field">
                    <label class="radio">
                      <sf:radiobutton path="purchaseYn" class="input-text" value="Y" />
                      <span class="label">Yes</span>
                    </label>
                    <label class="radio">
                      <sf:radiobutton path="purchaseYn" class="input-text" value="N" />
                      <span class="label">No</span>
                    </label>
                  </div>
                </div>
                <div class="mt-30">
                  <div class="form-field">
                    <h4 class="detail-wrap-title">어떤 유통업자인가요?</h4>
                    <div class="form-field">
                      <div class="input-add add-right">
                        <input type="text" class="input-text distributorTypeTmp" placeholder="">
                        <button type="button" class="button bt-blue-light w-140 listAdd" data-id="distributorType">등록</button>
                      </div>
                    </div>
                    <div class="detail-tag distributorTypeLst">
                    	<c:if test="${not empty saveFm.distributorType}" >
							<c:forEach var="item" items="${fn:split(saveFm.distributorType,'||')}">
								<span class="tag-pill">${item}<input type="hidden" name="distributorTypeArr" value="${item}"> <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>
							</c:forEach>
						</c:if>
                     <!--  <span class="tag-pill">South Korea <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>
                      <span class="tag-pill">China <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span> -->
                    </div>
                  </div>
                </div>
                <div class="mt-30">
                  <h4 class="detail-wrap-title">당신의 제품을 어디에서 유통할 수 있나요? (e.g. 전체/국가명, 서울/대한민국 등)</h4>
                  <div class="form-field">
                    <div class="input-add add-right">
                      <input type="text" class="input-text distributedWhereTmp" placeholder="">
                      <button type="button" class="button bt-blue-light w-140 listAdd" data-id="distributedWhere">등록</button>
                    </div>
                  </div>
                  <div class="detail-tag distributedWhereLst">
                 	 	<c:if test="${not empty saveFm.distributedWhere}" >
							<c:forEach var="item" items="${fn:split(saveFm.distributedWhere,'||')}">
								<span class="tag-pill">${item}<input type="hidden" name="distributedWhereArr" value="${item}"> <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>
							</c:forEach>
						</c:if>
<!--                     <span class="tag-pill">South Korea <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>
                    <span class="tag-pill">China <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span> -->
                  </div>
                </div>
                <div class="mt-30">
                  <h4 class="detail-wrap-title">소비자에게 직접배송이 가능 한가요?
                    <div class="help-wrap">
                      <i class="wn-icon help">QnA</i>
                      <div class="help-cont">
                        <span>세부내용 설명입니다. 세부내용 설명입니다.</span>
                      </div>
                    </div>
                  </h4>
                  <div class="form-field">
                    <label class="radio">
                    <sf:radiobutton path="deliveryYn" class="input-text" value="Y" />
                      <span class="label">Yes</span>
                    </label>
                    <label class="radio">
                      <sf:radiobutton path="deliveryYn" class="input-text" value="N" />
                      <span class="label">No</span>
                    </label>
                  </div>
                </div>
                <div class="mt-30">
                  <h4 class="detail-wrap-title">PB 상품으로 주문 가능한가요?
                    <div class="help-wrap">
                      <i class="wn-icon help">QnA</i>
                      <div class="help-cont">
                        <span>세부내용 설명입니다. 세부내용 설명입니다.</span>
                      </div>
                    </div>
                  </h4>
                  <div class="form-field">
                    <label class="radio">
	                  <sf:radiobutton path="pbOrderYn" class="input-text" value="Y" />
                      <span class="label">Yes</span>
                    </label>
                    <label class="radio">
                      <sf:radiobutton path="pbOrderYn" class="input-text" value="N" />
                      <span class="label">No</span>
                    </label>
                  </div>
                </div>
                <div class="mt-30">
                  <h4 class="detail-wrap-title">냉장보관이 필요한가요?
                    <div class="help-wrap">
                      <i class="wn-icon help">QnA</i>
                      <div class="help-cont">
                        <span>세부내용 설명입니다. 세부내용 설명입니다.</span>
                      </div>
                    </div>
                  </h4>
                  <div class="form-field">
                    <label class="radio">
                   	 	<sf:radiobutton path="coldStorageYn" class="input-text" value="Y" />
                      <span class="label">Yes</span>
                    </label>
                    <label class="radio">
	                    <sf:radiobutton path="coldStorageYn" class="input-text" value="N" />
                      <span class="label">No</span>
                    </label>
                  </div>
                  <div class="form-field">
                    <div class="detail-form-sub">
                      <h4 class="detail-wrap-title">냉장보관 종류</h4>
                      <label class="radio">
                        <sf:radiobutton path="storageMethodYn" class="input-text" value="Y" />
                        <span class="label">냉장</span>
                      </label>
                      <label class="radio">
                       <sf:radiobutton path="storageMethodYn" class="input-text" value="N" />
                        <span class="label">냉동</span>
                      </label>
                    </div>
                  </div>
                </div>

                <div class="mt-30 bt-right">
                  <a href="#" class="button bt-blue w-140 saveBtn">다음</a>
                </div>
              </div>
              <!-- <aside class="detail-side">
                <div class="detail-side-container">
                  <div class="detail-side-wrapper">
                    <div class="detail-side-content">
                      <section class="detail-right-container">
                        <div class="detail-img"><img src="/resources/images/info_img.png" alt=""></div>
                        <div class="detail-img-text">
                          <span>SeSi Lever</span>
                          <span class="detail-img-text-title">SeSi Leggings</span>
                          <div class="add-r mt-10">
                            <span>$20.00</span>
                            <span>Cost/item</span>
                            <span>58.00%</span>
                            <span>Margin</span>
                          </div>
                        </div>
                      </section>
                      <div class="detail-preview">
                        <i class="wn-icon eye"></i><span class="ml-5">Preview Product Profile</span>
                      </div>
                      <div class="detail-help mt-20">
                        <span class="detail-help-title"><i class="wn-icon help blue mr-5"></i>Need help?</span>
                        <span>We will help guide you along the process.</span>
                        <a href="#" class="link">Find more information</a>
                      </div>
                    </div>
                  </div>
                </div>
              </aside> -->
            </div>
            </sf:form>
          </div>
<script>
	let prductRegMap = new Map();
	var doubletyp = "S";
	prductRegMap.set('000', 'introduce');
	prductRegMap.set('001', 'detail');
	prductRegMap.set('002', 'distribution');
	prductRegMap.set('003', 'maketing');

	$(document).ready(function() {
		$(".detail-top-wrap").remove();
		$("#saveFm").validate({
			rules : {
				productNm : {
					required : true
				}

			},
			messages : {
				productNm : {
					required : "<code:msg code='validate.msg.common'/>"
				}
			},
			errorPlacement : function(error, element) {
				if (element.is(":radio") || element.is(":checkbox")) {
				} else if (element.is('select')) {
					element.attr("placeholder", error[0].outerText);
					element.css("border", "red solid 1px");
					element.css("width", "500px");
				} else {
					element.attr("placeholder", error[0].outerText);
				}
			},
			submitHandler : function() {
				makeSetString();

				var form = $('form')[1];
				var formData = new FormData(form);
				$(".modal_bg_sub").show();
				var url = "<c:url value='/web/brand/productSubmitDo.ax'/>";
				fn_submitFileRtnAjax(url, formData);
			}
		});

		$(".saveBtn").click(function() {
			$("#saveFm").submit();
		});

		const savedRegStatus = "${savedRegStatus}"
			if (savedRegStatus == "004" ){
				$(".wn-icon").removeClass("check3").addClass("check1");
			}else if ( savedRegStatus == "003" ){
				$(".wn-icon:eq(0)").removeClass("check3").addClass("check1");
				$(".wn-icon:eq(1)").removeClass("check3").addClass("check1");

			}else if ( savedRegStatus == "002" ){
				$(".wn-icon:eq(0)").removeClass("check3").addClass("check1");
	 		}

	});
	function makeSetString() {
		let dvIds = ['manuFacturedCountry', 'manuFacturedCity', 'sellWhere', 'distributorType', 'distributedWhere']

		dvIds.forEach(function(item, index, array) {
			 txt ="";
			 $('input[name^="'+item+'Arr"]').each( function() {
			        txt += this.value+"||"
			 });
			 $("#"+item).val(txt);
		});
	}

	function rtnFunction(typ, data) {
		var nextPg = "maketing";
		$("#makingProductId").val(data.productId);
		var url = "<c:url value='/web/brand/"+ nextPg+ "/productAdd.bt'/>";
		$("#srchFm").attr("action",url);
		$("#srchFm").submit();
	}


	var doubletyp = "S";
	$(".listAdd").click(function(){
		if(doubletyp == "S" && $("."+$(this).data("id")+"Tmp").val()){
			doubletyp == "B";
			txt ='<span class="tag-pill">'+$("."+$(this).data("id")+"Tmp").val()+'<input type="hidden" name="'+$(this).data("id")+'Arr" value="'+$("."+$(this).data("id")+"Tmp").val()+'"> <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>';
	    $("."+$(this).data("id")+"Lst").append(txt);
	    $("."+$(this).data("id")+"Tmp").val("");
	    doubletyp == "S";
		}
	});

</script>
