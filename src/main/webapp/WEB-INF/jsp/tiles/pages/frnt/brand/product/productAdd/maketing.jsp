<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="sidebar-main">
            <header class="sidebar-main-header">
              <h3 class="tit">마케팅</h3>
            </header>
            <sf:form commandName="srchFm" cssClass="form-horizontal" >
				<input type="hidden" name="productId" id="makingProductId" />
			</sf:form>
			<sf:form commandName="saveFm" cssClass="form-horizontal" enctype="multipart/form-data">
				<sf:hidden path="productId" />
				<sf:hidden path="productRegStatus" value="004"/>
				<sf:hidden path="productOrgStatus"  value="004" />
            <div class="detail-wrap">
              <div class="detail-wrap-left">
                <div class="form-field">
                  <h4 class="detail-wrap-title">마케팅 예산<span>- 선택사항</span>
                    <div class="help-wrap">
                      <i class="wn-icon help">QnA</i>
                      <div class="help-cont">
                        <span>세부내용 설명입니다. 세부내용 설명입니다.</span>
                      </div>
                    </div>
                  </h4>
                  <div class="custom-select">
                 	 <sf:select path="marketingBudget">
	                      <c:forEach items="${CodeIdSP07}" var="row" varStatus="cnt">
								<sf:option value="${row.srchKey}" label="${row.srchTxt}"  />
							</c:forEach>
                        </sf:select>
                      <!-- <option value="">선택</option>
                      <option value="">~ US$10K</option>
                      <option value="">US$10K ~ US$50K</option>
                      <option value="">US$50K ~ US$100K</option>
                      <option value="">US$100K ~</option>
                       -->
                  </div>
                </div>
                <div class="mt-30">
                  <div class="form-field">
                    <h4 class="detail-wrap-title">추가 이미지/갤러리<span>- 선택사항</span></h4>
                    <div class="form-attach-file">
                     <input type="file" name="productImgAnother[]" id="productImgAnother" hidden="" accpet="image/*">
                      <label for="productImgAnother">
                        <span class="button bt-outline bt-blue2"><i class="wn-icon plus mr-5"></i>사진 추가</span>
                      </label>
                      <div id="productImgAnotherLst" class="attach-list" data-attach-role="attach-list">
                      		<c:forEach items="${productImgAnotherLst}" var="row" varStatus="cnt">
								<div class="column">
									<div style="width: 200px; height: 230px;">
										<img class="image fileDown" data-value="${row.parntsDtaId}" data-fileId="${row.fileId}" src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${row.parntsDtaId}&fileId=${row.fileId}" height="200" width="200">
										<span class="file-delete" data-value="${row.parntsDtaId}" data-fileId="${row.fileId}">X</span>
										<label class="image-label">${row.realFileNm}</label>
									</div>
								</div>
							</c:forEach>


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
		                        fileArr.forEach((file, index) => {
		                            const reader = new FileReader()
		                            const $imgDiv = document.createElement("div")
		                            const $img = document.createElement("img")
		                            $img.classList.add("image")
		                            const $label = document.createElement("label")
		                            $label.classList.add("image-label")
		                            $label.textContent = file.name

		                            const $span = document.createElement("span")
		                            $span.classList.add("file-delete")
		                            $span.textContent = "X"
		                            $imgDiv.appendChild($img)
		                            $imgDiv.appendChild($span)
		                            $imgDiv.appendChild($label)



		                            reader.onload = e => {
		                                $img.src = e.target.result
		                                $img.height = "200"
		                                $img.width = "200"

		                               // $imgDiv.style.width = ($img.naturalWidth) * 0.2 + "px"
		                               $imgDiv.style.width = "200px"
		                               $imgDiv.style.height = "230px"
		                               // $imgDiv.style.height = ($img.naturalHeight) * 0.2 + "px"
		                            }

		                            console.log(file.name)
		                            if(index % 2 == 0) {
		                                $colDiv1.appendChild($imgDiv)
		                            } else {
		                                $colDiv2.appendChild($imgDiv)
		                            }

		                            reader.readAsDataURL(file)
		                        })
		                        multipleContainer.appendChild($colDiv1)
		                        multipleContainer.appendChild($colDiv2)
		                    }
		                }

		                var divId ="productImgAnother";
		                const inputMultipleImage = document.getElementById(divId)
		                inputMultipleImage.addEventListener("change", e => {
		                    readMultipleImage(e.target,divId+"Lst")

		                    $('span.file-delete').click(function(){
		                		let name = $(this).next('span.name').text();
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
		                		document.getElementById(divId).files = dt.files;
		                	});
		                });
		                </script>
                    </div>
                  </div>
                </div>
                <div class="mt-30">
                  <div class="form-field">
                    <h4 class="detail-wrap-title">제품 영상<span>- 선택사항</span></h4>
                    <div class="form-attach-file">
                      <input type="file" name="" id="inputFileQna2" hidden="">
                      <label for="inputFileQna2">
                        <span class="button bt-outline bt-blue2"><i class="wn-icon plus mr-5"></i>영상 추가</span>
                      </label>
                      <div class="attach-list" data-attach-role="attach-list">

                      </div>
                    </div>
                  </div>
                </div>

                <div class="mt-30 bt-right">
                  <a href="#" class="button bt-blue w-140 saveBtn">제출하기</a>
                  <div class="form-msg mt-10">제품이 완벽하지 않더라도 걱정마세요, 언제라도 다시 수정할 수 있습니다.</div>
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


			$(".wn-icon:eq(1)").removeClass("check3").addClass("check1");

			$(".fileDown").click(function(){
         		location.href='<c:url value="/util/fileDownload.ax"/>?parntsDtaId='+$(this).attr("data-value")+'&fileId='+$(this).attr("data-fileId");
         	});

         	$(".file-delete").click(function(){
         		var url ="<c:url value='/util/fileDelete.ax'/> ";
         		var sendData = {"parntsDtaId" : $(this).attr("data-value"),"fileId" : $(this).attr("data-fileId") };
         		ajaxSubmit(url,sendData);
         		$(this).parent().remove();
         	});
	});

	function rtnFunction(typ, data) {
		alert(data.msg);
		var url = "<c:url value='/web/brand/productLst.bt' />";
		$("#srchFm").attr("action",url);
		$("#srchFm").submit();
	}

</script>
