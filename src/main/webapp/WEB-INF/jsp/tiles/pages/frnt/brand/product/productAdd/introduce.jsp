<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="sidebar-main">
	<!-- <header class="sidebar-main-header">
		<h3 class="tit">제품소개</h3>
	</header> -->
	<sf:form commandName="srchFm" cssClass="form-horizontal" >
		<input type="hidden" name="productId" id="makingProductId" />
	</sf:form>

	<sf:form commandName="saveFm" cssClass="form-horizontal" enctype="multipart/form-data">
		<sf:hidden path="productId" />
		<sf:hidden path="productRegStatus"  />
		<sf:hidden path="productOrgStatus"  value="001" />
		<sf:hidden path="cateNm" />
		<sf:hidden path="certStatus" />
		<sf:hidden path="usp" />
		<input type="file" name="test" style="display:none">
		<div class="detail-wrap">
			<div class="detail-wrap-left">
				<div class="d-flex">
                  <div class="form-field">
                    <h4 class="detail-wrap-title important">제품명</h4>
					<sf:input path="productNm" class="input-text" placeholder="직접입력" />
                  </div>
                  <div class="form-field">
                    <h4 class="detail-wrap-title important">제품 출시</h4>
                    <sf:input path="productRelDt" class="input-text" placeholder="2021.09" />
                  </div>
                </div>
				<div class="mt-30">
					<div class="form-field">
						<h4 class="detail-wrap-title important">
							카테고리<!--  선택 -->
							<!-- <div class="help-wrap">
								<i class="wn-icon help">QnA</i>
								<div class="help-cont">
									<span>세부내용 설명입니다. 세부내용 설명입니다.</span>
								</div>
							</div> -->
						</h4>
						<!-- <a href="#" class="link">모든 카테고리 찾아보기</a> -->
						<div class="input-add add-right">
							<input type="text" class="input-text categoryTmp" name="categoryTmp" placeholder="직접입력" value="">
							<button type="button" class="button bt-blue-light w-140 categoryAdd">등록</button>
						</div>
					</div>

					<div class="form-field">
						<h4 class="form-label">1개 이상 입력</h4>
					</div>
					<div class="detail-tag categoryLst">
						<c:if test="${not empty saveFm.cateNm}" >
							<c:forEach var="item" items="${fn:split(saveFm.cateNm,'||')}">
								<span class="tag-pill">${item}<input type="hidden" name="categoryArr" value="${item}"> <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>
							</c:forEach>
						</c:if>
					</div>
					<!--
					<div class="form-field categoryList">
						<div class="breadcrumb-container">
	                      <span class="breadcrumb-title">레깅스</span>
	                      <ul class="breadcrumb">
	                        <li><a href="#">의류</a></li>
	                        <li><a href="#">여성의류</a></li>
	                      </ul>
	                      <div class="ml-auto">
	                        <a href="#" class="btn-remove"><i class="wn-icon close"></i></a>
	                      </div>
	                    </div>
                    <div class="breadcrumb-container">
                      <span class="breadcrumb-title">레깅스</span>
                      <ul class="breadcrumb">
                        <li><a href="#">의류</a></li>
                        <li><a href="#">여성의류</a></li>
                        <li><a href="#">의류</a></li>
                        <li><a href="#">여성의류</a></li>
                      </ul>
                      <div class="ml-auto">
                        <a href="#" class="btn-remove"><i class="wn-icon close"></i></a>
                      </div>
                    </div>
					</div> -->
				</div>
				<div class="mt-30">
					<div class="form-field">
						<h4 class="detail-wrap-title">제품인증현황</h4>
						<div class="input-add add-right">
							<input type="text" class="input-text certStatusTmp" name="certStatusTmp" placeholder="직접입력" value="">
							<button type="button" class="button bt-blue-light w-140 certStatusAdd">등록</button>
						</div>
						<div class="form-field">
							<h4 class="form-label">1개 이상 입력</h4>
						</div>
						<div class="detail-tag certStatusLst">
							<c:if test="${not empty saveFm.certStatus}" >
								<c:forEach var="item" items="${fn:split(saveFm.certStatus,'||')}">
									<span class="tag-pill">${item}<input type="hidden" name="certStatusArr" value="${item}"> <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>
								</c:forEach>
							</c:if>
						</div>
						<%-- <h4 class="detail-wrap-title">제품인증현황</h4>
						<sf:input path="certStatus" class="input-text" placeholder="직접입" /> --%>
						<!-- <div class="qna-thumb">
                      <div class="img-container">
                        <img src="/resources/images/Icon-detail-img.png" alt="">
                      </div>
                      <div class="ml-15">
                        <div class="tit single-line">Interested in learning more about certifications for your brand or products?</div>
                        <div class="option">Browse providers <a href="#" class="link">here.</a></div>
                      </div>
                    </div> -->
					</div>
				</div>
				<div class="mt-30">
					<div class="form-field">
						<h4 class="detail-wrap-title important">USP (Unique Selling Propositions)</h4>
						<div class="form-field">
							<div class="input-add add-right">
								<input class="input-text uspTmp" placeholder="Unique Selling Propositions" />
								<button type="button" class="button bt-blue-light w-140 uspAdd">등록</button>
							</div>
						</div>
						<div class="detail-tag uspLst">
						<c:if test="${not empty saveFm.usp}" >
							<c:forEach var="item" items="${fn:split(saveFm.usp,'||')}">
								<span class="tag-pill">${item}<input type="hidden" name="uspArr" value="${item}"> <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>
							</c:forEach>
						</c:if>
						</div>
					</div>
				</div>
				<div class="mt-30">
					<h4 class="detail-wrap-title">
						간략한 제품 소개
						<div class="help-wrap">
							<i class="wn-icon help">QnA</i>
							<div class="help-cont">
								<span>세부내용 설명입니다. 세부내용 설명입니다.</span>
							</div>
						</div>
						<div class="ml-auto gray-6">
							<ul class="list-v-bar t-14">
								<li><span class="strong">101</span></li>
								<li><span>200</span></li>
							</ul>
						</div>
					</h4>
					<div class="form-field">
						<textarea class="textarea" name="productInfo" id="productInfo" rows="4" placeholder="">${saveFm.productInfo}</textarea>
					</div>
				</div>
				<div class="mt-30 bt-right">
					 <a href="#" class="button bt-blue w-140 pauseBtn">저장 </a>
					<a href="#" class="button bt-blue w-140 saveBtn">다음</a>
				</div>
			</div>
			<aside class="detail-side">

			</aside>
		</div>
	</sf:form>
</div>

<script>


	$(document).ready(function() {
		if($("#productId").val()){
			var url = "<c:url value='/web/brand/productLatestDo.ax'/>";
			var sendData = {"productId" : $("#productId").val() };

				$.ajax({
					url: url,
					data: sendData,
					type: 'POST',
					success: function(data) {
						$(".detail-side").html(data);
					},
					error: function(e) {
						console.log(JSON.stringify(e));
					}
			});
		}

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
				 var txt="";

				 $('input[name^="categoryArr"]').each( function() {
				        txt += this.value+"||"
				 });

				 $("#cateNm").val(txt);
				 txt="";


				 $('input[name^="certStatusArr"]').each( function() {
				        txt += this.value+"||"
				 });

				 $("#certStatus").val(txt);
				 txt="";

				 $('input[name^="uspArr"]').each( function() {
				        txt += this.value+"||"
				 });

				 $("#usp").val(txt);

				var form = $('form')[1];
				var formData = new FormData(form);
				$(".modal_bg_sub").show();
				var url = "<c:url value='/web/brand/productSubmitDo.ax'/>";
				fn_submitFileRtnAjax(url, formData);
			}
		});

		$(".saveBtn").click(function() {
//			$("#saveFm").append("<input type='text' name='saveMode' id='saveMode' value='A'>");
			$("#saveFm").submit();
		});

		$(".pauseBtn").click(function() {
			$("#saveFm").append("<input type='text' name='saveMode' id='saveMode' value='A'>");
			$("#saveFm").submit();
		});



		var doubletyp ="S"
		$(".categoryAdd").click(function(){
			if(doubletyp == "S" && $(".categoryTmp").val()){
				doubletyp == "B";
				txt ='<span class="tag-pill">'+$(".categoryTmp").val()+'<input type="hidden" name="categoryArr" value="'+$(".categoryTmp").val()+'"> <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>';

            $(".categoryLst").append(txt);
            $(".categoryTmp").val("");
            doubletyp == "S";
			}
		});

		$(".certStatusAdd").click(function(){
			if(doubletyp == "S" && $(".certStatusTmp").val()){
				doubletyp == "B";
				txt ='<span class="tag-pill">'+$(".certStatusTmp").val()+'<input type="hidden" name="certStatusArr" value="'+$(".certStatusTmp").val()+'"> <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>';

            $(".certStatusLst").append(txt);
            $(".certStatusTmp").val("");
            doubletyp == "S";
			}
		});


		$(".uspAdd").click(function(){
			if(doubletyp == "S" && $(".uspTmp").val()){
				doubletyp == "B";
				txt ='<span class="tag-pill">'+$(".uspTmp").val()+'<input type="hidden" name="uspArr" value="'+$(".uspTmp").val()+'"> <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>';
            $(".uspLst").append(txt);
            $(".uspTmp").val("");
            doubletyp == "S";
			}
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

	function rtnFunction(typ, data) {
		if(	$("#saveMode").val() == "A" ){
			alert("저장되었습니다.");
			location.reload();
			return false;
		}

		var nextPg = "detail";
		$("#makingProductId").val(data.productId);
		var url = "<c:url value='/web/brand/"+ nextPg+ "/productAdd.bt'/>";

		if($("#saveMode").val() == "B"){
			url = "<c:url value='/web/brand/productLst.bt'/>";
		}


		$("#srchFm").attr("action",url);
		$("#srchFm").submit();
	}
</script>