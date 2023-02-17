<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script>
const dt = new DataTransfer(); // Permet de manipuler les fichiers de l'input file
</script>
	<div class="sidebar-main">
					<!-- 	<header class="sidebar-main-header">
							<h3 class="tit">제품상세</h3>
						</header> -->
			<sf:form commandName="srchFm" cssClass="form-horizontal" >
				<input type="hidden" name="productId" id="makingProductId" />
			</sf:form>
			<sf:form commandName="saveFm" cssClass="form-horizontal" enctype="multipart/form-data">
				<sf:hidden path="productId" />
				<sf:hidden path="ingredients" />
				<sf:hidden path="productRegStatus"/>
				<sf:hidden path="productOrgStatus"  value="002" />
						<div class="detail-wrap">
							<div class="detail-wrap-left">
								<div class="form-field">
									<h4 class="detail-wrap-title">제품명</h4>
									<sf:input path="productNm" class="input-text" placeholder="SeSi Leggings"  disabled="true"  />
								</div>

								<div class="mt-30">
									<div class="form-field">
										<h4 class="detail-wrap-title important">제품이미지</h4>
										<div class="form-attach-file">
											<input type="file" name="productImg" id="productImg" hidden="" accpet="image/*">
											<label for="productImg">
												<span class="button bt-outline bt-blue2"><i class="wn-icon plus mr-5"></i>파일 첨부</span>
											</label>
											<div id="productImgLst" class="attach-list" data-attach-role="attach-list">
												 <c:forEach items="${productImgLst}" var="row" varStatus="cnt">
													<div class="column img-file" width="150px">
																		<a href="#"><i class="wn-icon remove upload-file-delete"  data-value="${row.parntsDtaId}" data-fileId="${row.fileId}">취소</i></a>
														<div style="width: 150px;">
															<img class="image fileDown" data-value="${row.parntsDtaId}" data-fileId="${row.fileId}" src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${row.parntsDtaId}&fileId=${row.fileId}" width="150">
															<label class="image-label">${row.realFileNm}</label>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>

								<script>

								function readMultipleImage(input,divId) {
										const multipleContainer = document.getElementById(divId)

										// 인풋 태그에 파일들이 있는 경우
										if(input.files) {
												// 이미지 파일 검사 (생략)
												console.log(input.files)
												// 유사배열을 배열로 변환 (forEach문으로 처리하기 위해)
												const fileArr = Array.from(input.files)
												const $colDiv1 = document.createElement("div")
												const $colDiv2 = document.createElement("div")
												$colDiv1.classList.add("column")
												$colDiv2.classList.add("column")
												$colDiv1.classList.add("img-file")
												$colDiv2.classList.add("img-file")


												fileArr.forEach((file, index) => {


														const $ahref = document.createElement("a")
														const $deli = document.createElement("i")
														$deli.classList.add("wn-icon")
														$deli.classList.add("remove")
														$deli.classList.add("file-delete")
														$deli.textContent = "취소"
														$deli.setAttribute("file-name", file.name);
														$ahref.appendChild($deli)

														const reader = new FileReader()
														const $imgDiv = document.createElement("div")
														const $img = document.createElement("img")
														$img.classList.add("image")
														const $label = document.createElement("label")
														$label.classList.add("image-label")
														$label.textContent = file.name

													/*   const $span = document.createElement("span")
														$span.classList.add("file-delete")
														$span.textContent = "X" */
														$imgDiv.appendChild($img)
														/* $imgDiv.appendChild($span) */
														$imgDiv.appendChild($label)



														reader.onload = e => {
																$img.src = e.target.result
																$img.height = "150"
																$img.width = "150"

															 // $imgDiv.style.width = ($img.naturalWidth) * 0.2 + "px"
															 $imgDiv.style.width = "150px"
															 $imgDiv.style.height = "230px"
															 // $imgDiv.style.height = ($img.naturalHeight) * 0.2 + "px"
														}

														console.log(file.name)
														if(index % 2 == 0) {
															$colDiv1.appendChild($ahref)
																$colDiv1.appendChild($imgDiv)
														} else {
															$colDiv2.appendChild($ahref)
																$colDiv2.appendChild($imgDiv)
														}

														reader.readAsDataURL(file)
												})
												multipleContainer.appendChild($colDiv1)
												multipleContainer.appendChild($colDiv2)
										}
								}
								const inputMultipleImage = document.getElementById("productImg")
								inputMultipleImage.addEventListener("change", e => {
										readMultipleImage(e.target,"productImgLst")

										$('.file-delete').click(function(){
										let name = $(this).attr("file-name")
										// Supprimer l'affichage du nom de fichier
										$(this).parent().parent().remove();
										for(let i = 0; i < dt.items.length; i++){
											// Correspondance du fichier et du nom
											if(name === dt.items[i].getAsFile().name){
												// Suppression du fichier dans l'objet DataTransfer
												dt.items.remove(i);
												continue;
											}
										}
										document.getElementById('productImg').files = dt.files;
									});


								});

								</script>

								<!-- <div class="mt-30">
									<div class="form-field">
										<h4 class="detail-wrap-title">Variant
											<div class="help-wrap">
												<i class="wn-icon help">QnA</i>
												<div class="help-cont">
													<span>세부내용 설명입니다. 세부내용 설명입니다.</span>
												</div>
											</div>
										</h4>
										<sf:input path="productStyleNo" class="input-text" placeholder="Enter number" />
									</div>
								</div> -->
								<h4 class="detail-wrap-title strong important">제품가격</h4>
								<div class="mt-30">
									<div class="d-flex">
										<div class="form-field">
											<h4 class="detail-wrap-title">공급가(FOB)
												<div class="help-wrap">
													<i class="wn-icon help">QnA</i>
													<div class="help-cont">
														<span>세부내용 설명입니다. 세부내용 설명입니다.</span>
													</div>
												</div>
											</h4>
											<div class="input-add add-right2">
												<div class="custom-title wd-130">US $</div>
												 <sf:input path="cost" class="input-text" placeholder="20.00" />
											</div>
										</div>
										<div class="form-field">
											<h4 class="detail-wrap-title">권장소비자가(SRP)
												<div class="help-wrap">
													<i class="wn-icon help">QnA</i>
													<div class="help-cont">
														<span>세부내용 설명입니다. 세부내용 설명입니다.</span>
													</div>
												</div>
											</h4>
											<div class="input-add add-right2">
												<div class="custom-title wd-200">US $</div>
												<div class="input-line">
													 <sf:input path="msrp"   class="input-text" placeholder="Min." />
													 <sf:input path="msrpMax" class="input-text ml-0" placeholder="Max." />
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="mt-30">
									<div class="d-flex">
											<div class="form-field">
												<h4 class="detail-wrap-title">최소주문수량
													<div class="help-wrap">
														<i class="wn-icon help">QnA</i>
														<div class="help-cont">
															<span>본 제품의 해외발주용 최소수량</span>
														</div>
													</div>
												</h4>
												<div class="input-add">
													 <sf:input path="smpOrder" class="input-text" placeholder="주문가능한 최소 수량 입력" />
												</div>
											</div>
											<div class="form-field">
												<h4 class="detail-wrap-title">Margin
													<div class="help-wrap">
														<i class="wn-icon help">QnA</i>
														<div class="help-cont">
															<span>세부내용 설명입니다. 세부내용 설명입니다.</span>
														</div>
													</div>
												</h4>
												<div class="input-add">
													<sf:input path="margin" 		class="input-text" placeholder="Min." />
														<sf:input path="marginMax" 	class="input-text " placeholder="Max." />
												</div>
											</div>
										</div>
				</div>
								<%--  <div class="mt-30">
									<h4 class="detail-wrap-title">
										가격에 대한 설명
										<div class="ml-auto gray-6">
											<ul class="list-v-bar t-14">
												<li><span class="strong">101</span></li>
												<li><span>200</span></li>
											</ul>
										</div>
									</h4>
									<div class="form-field">
										<textarea class="textarea" name="costInfo" rows="4" placeholder="이 공간을 사용하여 구매자에게 가격 요인 및 협상 가능한 요율과 같은 추가 정보를 알립니다.">${saveFm.costInfo}</textarea>
									</div>
								</div> --%>
								<h4 class="detail-wrap-title strong important">제품 바코드</h4>
								<div class="mt-30">
									<!-- <h4 class="detail-wrap-title">제품바코드가 있나요?
										<div class="help-wrap">
											<i class="wn-icon help">QnA</i>
											<div class="help-cont">
												<span>세부내용 설명입니다. 세부내용 설명입니다.</span>
											</div>
										</div>
									</h4>
									<div class="form-field">
										<label class="radio">
										<sf:radiobutton path="bcdYn" class="input-text divYn" value="Y" />
											<span class="label">Yes</span>
										</label>
										<label class="radio">
											<sf:radiobutton path="bcdYn" class="input-text divYn" value="N" />
											<span class="label">No</span>
										</label>
									</div> -->
									<div class="form-field bcdYnDiv">
										<div class="input-add add-right2">
											<%-- <div class="custom-select wd-130">
												<sf:select path="bcdSlt">
													<c:forEach items="${CodeIdSP01}" var="row" varStatus="cnt">
								<sf:option value="${row.srchKey}" label="${row.srchTxt}"  />
							</c:forEach>
													<sf:option value="1" lable="UPC" />
													<sf:option value="2" lable="1" />
													<sf:option value="3" lable="2" />
												</sf:select>
											</div> --%>
											<sf:input path="bcdNo" class="input-text" placeholder="Enter barcode" />
										</div>
									</div>
								</div>
								<h4 class="detail-wrap-title strong">제품 패키지 여부</h4>
								<div class="mt-30">
									<!-- <h4 class="detail-wrap-title">제품 패키지가 있습니까?
										<div class="help-wrap">
											<i class="wn-icon help">QnA</i>
											<div class="help-cont">
												<span>세부내용 설명입니다. 세부내용 설명입니다.</span>
											</div>
										</div>
									</h4> -->
									<div class="form-field">
										<label class="radio">
											<sf:radiobutton path="pkgYn" class="input-text divYn" value="Y" />
											<span class="label">Yes</span>
										</label>
										<label class="radio">
											<sf:radiobutton path="pkgYn" class="input-text divYn" value="N" />
											<span class="label">No</span>
										</label>
									</div>
								</div>
								<div class="pkgYnDiv" style="display: block;">
								<div class="mt-30 " >
									<h4 class="detail-wrap-title">패키지 규격
										<div class="help-wrap">
											<i class="wn-icon help">QnA</i>
											<div class="help-cont">
												<span>세부내용 설명입니다. 세부내용 설명입니다.</span>
											</div>
										</div>
									</h4>
									<div class="form-field">
										<div class="input-add add-right2">
											<div class="custom-select wd-130">
												<sf:select path="pkgStdCode">
												<c:forEach items="${CodeIdSP02}" var="row" varStatus="cnt">
								<sf:option value="${row.srchKey}" label="${row.srchTxt}"  />
							</c:forEach><%--
													<sf:option value="001" label="mm"  />
													<sf:option value="002" label="cm"  />
													<sf:option value="003" label="m"   />
													<sf:option value="004" label="in"  />
													<sf:option value="005" label="ft"  /> --%>
												</sf:select>

											</div>
											<div class="input-line">
												<sf:input path="pkgStdX" class="input-text" placeholder="가로" />
												<sf:input path="pkgStdY" class="input-text" placeholder="세로" />
												<sf:input path="pkgStdH" class="input-text" placeholder="높이" />
											</div>
										</div>
									</div>
								</div>
								<div class="d-flex mt-30 ">
									<div class="form-field">
										<h4 class="detail-wrap-title">제품 용량
											<div class="help-wrap">
												<i class="wn-icon help">QnA</i>
												<div class="help-cont">
													<span>내용물의 무게/함량</span>
												</div>
											</div>
										</h4>
										<div class="input-add add-right2">
											<div class="custom-select wd-130">
												 <sf:select path="productVolCode">
												 <c:forEach items="${CodeIdSP03}" var="row" varStatus="cnt">
												<sf:option value="${row.srchKey}" label="${row.srchTxt}"  />
											</c:forEach>
													</sf:select>
											</div>
											 <sf:input path="productVol" class="input-text" placeholder="Volume" />
										</div>
									</div>
									<div class="form-field">
										<h4 class="detail-wrap-title">제품 무게
											<div class="help-wrap">
												<i class="wn-icon help">QnA</i>
												<div class="help-cont">
													<span>제품 패키지를 포함하는 무게</span>
												</div>
											</div>
										</h4>
										<div class="input-add add-right2">
											<div class="custom-select wd-130">
												<sf:select path="productWtCode">
												<c:forEach items="${CodeIdSP04}" var="row" varStatus="cnt">
								<sf:option value="${row.srchKey}" label="${row.srchTxt}"  />
							</c:forEach>
												</sf:select>
											</div>
											<sf:input path="productWt" class="input-text" placeholder="Product Weight" />
										</div>
									</div>
								</div>
								</div>
								<div class="mt-30">
									<h4 class="detail-wrap-title">카튼 박스가 있습니까?
										<div class="help-wrap">
											<i class="wn-icon help">QnA</i>
											<div class="help-cont">
												<span>해외 배송을 위한 아웃 박스</span>
											</div>
										</div>
									</h4>
									<div class="form-field">
										<label class="radio">
										<sf:radiobutton path="cartonYn" class="input-text divYn" value="Y" />
											<span class="label">Yes</span>
										</label>
										<label class="radio">
											<sf:radiobutton path="cartonYn" class="input-text divYn" value="N" />
											<span class="label">No</span>
										</label>
									</div>
								</div>
								<div class="cartonYnDiv" style="display: block;">
									<div class="mt-30">
										<h4 class="detail-wrap-title">카튼 규격</h4>
										<div class="form-field">
											<div class="input-add add-right2">
												<div class="custom-select wd-130">
												 <sf:select path="cartonStdCode">
												 <c:forEach items="${CodeIdSP05}" var="row" varStatus="cnt">
								<sf:option value="${row.srchKey}" label="${row.srchTxt}"  />
							</c:forEach><%--
													<sf:option value="001" label="mm" />
													<sf:option value="002" label="cm" />
													<sf:option value="003" label="m" />
													<sf:option value="004" label="in" />
													<sf:option value="005" label="ft" /> --%>
												</sf:select>
												</div>
												<div class="input-line">
													 <sf:input path="cartonX" class="input-text" placeholder="가로" />
												<sf:input path="cartonY" class="input-text" placeholder="세로"  />
												<sf:input path="cartonH" class="input-text" placeholder="높이"  />
												</div>
											</div>
										</div>
									</div>
									<div class="d-flex mt-30">
										<div class="form-field">
											<h4 class="detail-wrap-title">카튼 CBM</h4>
											<div class="input-add add-right2">
												<div class="custom-select wd-130">
													 <sf:select path="cartonCbmVolCode">
													 <c:forEach items="${CodeIdSP03}" var="row" varStatus="cnt">
								<sf:option value="${row.srchKey}" label="${row.srchTxt}"  />
							</c:forEach>
														<%-- <sf:option value="001" label="mm³" />
														<sf:option value="001" label="cm³" />
														<sf:option value="001" label="m³" />
														<sf:option value="001" label="ml" />
														<sf:option value="001" label="l" />
														<sf:option value="001" label="in³" />
														<sf:option value="001" label="ft³" />
														<sf:option value="001" label="fl oz" />
														<sf:option value="001" label="기타" /> --%>
													</sf:select>
												</div>
												 <sf:input path="cartonCbmVol" class="input-text" placeholder="Volume"  />
											</div>
										</div>
										<div class="form-field">
											<h4 class="detail-wrap-title">카튼 무게</h4>
											<div class="input-add add-right2">
												<div class="custom-select wd-130">
													<sf:select path="cartonWtCode">
														<c:forEach items="${CodeIdSP04}" var="row" varStatus="cnt">
								<sf:option value="${row.srchKey}" label="${row.srchTxt}"  />
							</c:forEach><%--
														<sf:option value="001" label="kg" />
														<sf:option value="001" label="g" />
														<sf:option value="001" label="lb" />
														<sf:option value="001" label="oz" />
														<sf:option value="001" label="fl oz" /> --%>
													</sf:select>
												</div>
												 <sf:input path="cartonWt" class="input-text" placeholder="Gross Weight"  />
											</div>
										</div>
									</div>
									<!-- <div class="d-flex mt-30">
										<div class="form-field">
											<h4 class="detail-wrap-title">Pallet TI</h4>
											<sf:input path="palletTi" class="input-text"  placeholder="Pallet 1단 박스 수"  />
										</div>
										<div class="form-field">
											<h4 class="detail-wrap-title">Pallet HI</h4>
											 <sf:input path="palletHi" class="input-text"  placeholder="Pallet 총 단수 "  />
										</div>
									</div>
									<div class="d-flex mt-30">
										<div class="form-field">
											<h4 class="detail-wrap-title">Pallet 당 총 카튼 수</h4>
											<sf:input path="cartonTot" class="input-text"  readonly="true" />
										</div>
										<div class="form-field"></div>
									</div> -->
								</div>
								<div class="mt-30">
									<h4 class="detail-wrap-title">인박스가 있습니까?
										<div class="help-wrap">
											<i class="wn-icon help">QnA</i>
											<div class="help-cont">
												<span>카튼박스에 포장 전 제품을 소분하여 카튼박스에 담는 이너 박스</span>
											</div>
										</div>
									</h4>
									<div class="form-field">
										<label class="radio">
											<sf:radiobutton path="inboxYn" class="input-text divYn" value="Y" />
											<span class="label">Yes</span>
										</label>
										<label class="radio">
											<sf:radiobutton path="inboxYn" class="input-text divYn" value="N" />
											<span class="label">No</span>
										</label>
									</div>
								</div>
								<div class="inboxYnDiv" style="display: block;">
									<div class="mt-30">
										<h4 class="detail-wrap-title">인박스 규격</h4>
										<div class="form-field">
											<div class="input-add add-right2">
												<div class="custom-select wd-130">
												<sf:select path="inboxStdCode">
														<c:forEach items="${CodeIdSP02}" var="row" varStatus="cnt">
								<sf:option value="${row.srchKey}" label="${row.srchTxt}"  />
							</c:forEach>
													 <!--  <option >mm</option>
														<option >cm</option>
														<option >m</option>
														<option >in</option>
														<option >ft</option> -->
													</sf:select>
												</div>
												<div class="input-line">
												<sf:input path="inboxX" class="input-text" placeholder="가로" />
												<sf:input path="inboxY" class="input-text" placeholder="세로 " />
												<sf:input path="inboxH" class="input-text" placeholder="높이 " />
												</div>
											</div>
										</div>
									</div>
									<div class="d-flex mt-30">
										<div class="form-field">
											<h4 class="detail-wrap-title">인박스 CBM</h4>
											<div class="input-add add-right2">
												<div class="custom-select wd-130">
													<sf:select path="inboxCbmVolCode">
														<c:forEach items="${CodeIdSP03}" var="row" varStatus="cnt">
								<sf:option value="${row.srchKey}" label="${row.srchTxt}"  />
							</c:forEach>
														<!-- <option >mm³</option>
														<option >cm³</option>
														<option >m³</option>
														<option >ml</option>
														<option >l</option>
														<option >in³</option>
														<option >ft³</option>
														<option >fl oz</option>
														<option >기타</option> -->
													</sf:select>
												</div> 
											 <sf:input path="inboxCbmVol" class="input-text" placeholder="Volume " />
											</div>
										</div>
										<div class="form-field">
											<h4 class="detail-wrap-title">인박스 무게</h4>
											<div class="input-add add-right2">
												<div class="custom-select wd-130">
													<sf:select path="inboxWtCode">
														<c:forEach items="${CodeIdSP05}" var="row" varStatus="cnt">
									<sf:option value="${row.srchKey}" label="${row.srchTxt}"  />
								</c:forEach>
														<!-- <option >kg</option>
														<option >g</option>
														<option >lb</option>
														<option >oz</option>
														<option >fl oz</option> -->
													</sf:select>
												</div>
												<sf:input path="inboxWt" class="input-text" placeholder="무게 " />
											</div>
										</div>
									</div>
								</div>
								<h4 class="detail-wrap-title strong">제품 성분 및 유통기한</h4>
								<div class="mt-30">
									<h4 class="detail-wrap-title">제품 유통기한
										<div class="help-wrap">
											<i class="wn-icon help">QnA</i>
											<div class="help-cont">
												<span>개봉전 제품의 유통기한을 입력</span>
											</div>
										</div>
									</h4>
									<div class="form-field">
										<label class="radio">
											<sf:radiobutton path="expireDtYn" class="input-text divYn" value="Y" />
											<span class="label">Yes</span>
										</label>
										<label class="radio">
											<sf:radiobutton path="expireDtYn" class="input-text divYn" value="N" />
											<span class="label">No</span>
										</label>
									</div>
									<div class="form-field expireDtYnDiv">
										<div class="input-add add-right2">
											<div class="custom-select wd-130">
												<sf:select path="expireDtCode">
												 <c:forEach items="${CodeIdSP04}" var="row" varStatus="cnt">
								<sf:option value="${row.srchKey}" label="${row.srchTxt}"  />
							</c:forEach>
<!--
													<option >Days</option>
													<option >Weeks</option>
													<option >Months</option>
													<option >Years</option> -->
												</sf:select>
											</div>
											<sf:input path="expireDt" class="input-text" placeholder="" />
										</div>
									</div>
								</div>
								<div class="mt-30">
									<h4 class="detail-wrap-title">제품 전성분
										<div class="help-wrap">
											<i class="wn-icon help">QnA</i>
											<div class="help-cont">
												<span>제품의 전성분을 콤마로구분하여 기입</span>
											</div>
										</div>
									</h4>
									<div class="form-field">
										<label class="radio">
											<sf:radiobutton path="ingredientsYn" class="input-text divYn" value="Y" />
											<span class="label">Yes</span>
										</label>
										<label class="radio">
											<sf:radiobutton path="ingredientsYn" class="input-text divYn" value="N" />
											<span class="label">No</span>
										</label>
									</div>
									<div class="form-field">
						<!-- <div class="input-add add-right ingredientsYnDiv">
							<input type="text" class="input-text ingredientsTmp" name="ingredientsTmp" placeholder="직접입력" value="">
							<button type="button" class="button bt-blue-light w-140 ingredientsAdd">등록</button>
						</div> -->
						<!-- <div class="detail-tag ingredientsLst ingredientsYnDiv">
							<c:if test="${not empty saveFm.ingredients}" >
								<c:forEach var="item" items="${fn:split(saveFm.ingredients,'||')}">
									<span class="tag-pill">${item}<input type="hidden" name="ingredientsArr" value="${item}"> <a href="#" class="btn-remove"><i class="wn-icon close"></i></a></span>
								</c:forEach>
							</c:if>
						</div> -->
						<input type="text" id="ingredients" name="ingredients" class="input-text ingredientsYnDiv" placeholder="제품 전성분을 입역하십시오. 콤마(,) 사용하여 분리" />
					</div>
								</div>
								<div class="mt-30">
									<h4 class="detail-wrap-title">영양사실 라벨
										<div class="help-wrap">
											<i class="wn-icon help">QnA</i>
											<div class="help-cont">
												<span>식품 혹은 건강기능식품과 같이 해당사항이 있는 품목</span>
											</div>
										</div>
									</h4>
									<div class="form-field">
										<label class="radio">
											<sf:radiobutton path="labelYn" class="input-text divYn" value="Y" />
											<span class="label">Yes</span>
										</label>
										<label class="radio">
											<sf:radiobutton path="labelYn" class="input-text divYn" value="N" />
											<span class="label">No</span>
										</label>
									</div>
					<div class="form-field labelYnDiv">
						<div class="form-attach-file ">
							<input type="file" name="labelImg[]" id="labelImg" hidden="" accpet="image/*"> <label for="labelImg"> <span class="button bt-outline bt-blue2"><i class="wn-icon plus mr-5"></i>라벨 이미지</span>
							</label>
							<div id="labelImgLst" class="attach-list" data-attach-role="attach-list">
								<c:forEach items="${labelImgLst}" var="row" varStatus="cnt">
									<div class="column img-file" width="150px">
										<a href="#"><i class="wn-icon remove upload-file-delete" data-value="${row.parntsDtaId}" data-fileId="${row.fileId}">취소</i></a>
										<div style="width: 150px;">
											<img class="image fileDown" data-value="${row.parntsDtaId}" data-fileId="${row.fileId}" src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${row.parntsDtaId}&fileId=${row.fileId}" width="150"> <label class="image-label">${row.realFileNm}</label>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<script>
				const inputMultipleImageB = document.getElementById("labelImg")
				inputMultipleImageB.addEventListener("change", e => {
					readMultipleImage(e.target,"labelImgLst")
						 $('.file-delete').click(function(){
										let name = $(this).attr("file-name")
						// Supprimer l'affichage du nom de fichier
						$(this).parent().remove();
						for(let i = 0; i < dt.items.length; i++){
							// Correspondance du fichier et du nom
							if(name === dt.items[i].getAsFile().name){
								// Suppression du fichier dans l'objet DataTransfer
								dt.items.remove(i);
								continue;
							}
						}
						document.getElementById('labelImg').files = dt.files;
					});


				});

				</script>
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
	let prductRegMap = new Map();
	var doubletyp = "S";
	prductRegMap.set('000', 'introduce');
	prductRegMap.set('001', 'detail');
	prductRegMap.set('002', 'distribution');
	prductRegMap.set('003', 'maketing');

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

				makeSetString();

				var form = $('form')[1];
				var formData = new FormData(form);
				$(".modal_bg_sub").show();
				var url = "<c:url value='/web/brand/productSubmitDo.ax'/>";
				fn_submitFileRtnAjax(url, formData);
			}
		});



		$(".divYn").click(function() {
			if($(this).val() == "Y" ){
				$("."+$(this).attr("name")+"Div").show()
			}else{
				$("."+$(this).attr("name")+"Div").hide()
			}
		});

	 	if($("input:radio[name=inboxYn]:checked").val() == "N"){
			$(".inboxYnDiv").hide()
		}
		if($("input:radio[name=pkgYn]:checked").val() == "N"){
			$(".pkgYnDiv").hide()
		}
		if($("input:radio[name=cartonYn]:checked").val() == "N"){
			$(".cartonYnDiv").hide()
		}


		if($("input:radio[name=expireDtYn]:checked").val() == "N"){
			$(".expireDtYnDiv").hide()
		}

		 if($("input:radio[name=ingredientsYn]:checked").val() == "N"){
				$(".ingredientsYnDiv").hide()
			}

		 if($("input:radio[name=labelYn]:checked").val() == "N"){
				$(".labelYnDiv").hide()
			}

		 if($("input:radio[name=bcdYn]:checked").val() == "N"){
				$(".bcdYnDiv").hide()
			}


		$(".saveBtn").click(function() {
			$("#saveFm").submit();
		});

		$(".pauseBtn").click(function() {
			$("#saveFm").append("<input type='text' name='saveMode' id='saveMode' value='A'>");
			$("#saveFm").submit();
		});


		const savedRegStatus = "${savedRegStatus}"
			if (savedRegStatus == "004" ){
				$(".sidebar-menu-item > .wn-icon").removeClass("check3").addClass("check1");
			}else if ( savedRegStatus == "003" ){
				$(".sidebar-menu-item > .wn-icon:eq(0)").removeClass("check3").addClass("check1");
				$(".sidebar-menu-item > .wn-icon:eq(1)").removeClass("check3").addClass("check1");

			}else if ( savedRegStatus == "002" ){
				$(".sidebar-menu-item > .wn-icon:eq(0)").removeClass("check3").addClass("check1");
			}


			$(".sidebar-menu-item > .wn-icon:eq(1)").removeClass("check3").addClass("check1");

			$(".fileDown").click(function(){
						 location.href='<c:url value="/util/fileDownload.ax"/>?parntsDtaId='+$(this).attr("data-value")+'&fileId='+$(this).attr("data-fileId");
					 });

					 $(".upload-file-delete").click(function(){
						 var url ="<c:url value='/util/fileDelete.ax'/> ";
						 var sendData = {"parntsDtaId" : $(this).attr("data-value"),"fileId" : $(this).attr("data-fileId") };
						 ajaxSubmit(url,sendData);
						 $(this).parent().parent().parent().remove();
					 });


	});


	function makeSetString() {
		let dvIds = ['ingredients']

		dvIds.forEach(function(item, index, array) {
			txt ="";
			$('input[name^="'+item+'Arr"]').each( function() {
							txt += this.value+"||"
			});
			$("#"+item).val(txt);
		});
	}


	function rtnFunction(typ, data) {
		if(	$("#saveMode").val() == "B" ){
			alert("저장되었습니다.");
			location.reload();
			return false;
		}


		var nextPg = "distribution";
		$("#makingProductId").val(data.productId);
		var url = "<c:url value='/web/brand/"+ nextPg+ "/productAdd.bt'/>";
		$("#srchFm").attr("action",url);
		$("#srchFm").submit();
	}
</script>
