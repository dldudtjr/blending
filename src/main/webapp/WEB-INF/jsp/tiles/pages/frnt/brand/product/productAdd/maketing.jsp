<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="sidebar-main">
            <!-- <header class="sidebar-main-header">
              <h3 class="tit">마케팅</h3>
            </header> -->
            <sf:form commandName="srchFm" cssClass="form-horizontal" >
				<input type="hidden" name="productId" id="makingProductId" />
			</sf:form>
			<sf:form commandName="saveFm" cssClass="form-horizontal" enctype="multipart/form-data">
				<sf:hidden path="productId" />
				<sf:hidden path="productRegStatus" value="004"/>
				<sf:hidden path="productOrgStatus"  value="004" />
            <div class="detail-wrap">
              <div class="detail-wrap-left">

                <div class="mt-30">
                  	<h4 class="detail-wrap-title">제품명</h4>
	                <div class="form-field">
						<sf:input path="productNm" class="input-text" placeholder="SeSi Leggings"  disabled="true"  />
					</div>
                </div>
				<div class="mt-30">
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
                      			<div class="column img-file" width="150px">
					                <a href="#"><i class="wn-icon remove upload-file-delete"  data-value="${row.parntsDtaId}" data-fileId="${row.fileId}">취소</i></a>
									<div style="width: 150px;">
										<img class="image fileDown" data-value="${row.parntsDtaId}" data-fileId="${row.fileId}" src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${row.parntsDtaId}&fileId=${row.fileId}" width="150">
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
		                            	$colDiv1.appendChild($ahref)
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
	                		document.getElementById(divId).files = dt.files;
	                	});

		                });

		                </script>
                    </div>
                  </div>
                </div>
                 <!-- <div class="mt-30">
                  <div class="form-field">
                    <h4 class="detail-wrap-title">제품 영상<span>- 선택사항</span></h4>
                    20220217
                    <div class="input-add item-center add-right">
                      <p class="youtube-text">유튜브 URL</p>
                      <input type="text" class="input-text" name="mvUrl" placeholder="직접입력" value="">
                      <button class="button bt-gray w-140">URL 변경</button>
                    </div>
                    // 20220217
                  </div>
                </div> -->

               <!--  <div class="mt-30">
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
                </div> -->

                <div class="mt-30 bt-right">
              <!--  <a href="#" class="button bt-blue w-140 pauseBtn">저장 </a> -->
                  <a href="#" class="button bt-blue w-140 saveBtn">제출하기</a>
                  <div class="form-msg mt-10">제품이 완벽하지 않더라도 걱정마세요, 언제라도 다시 수정할 수 있습니다.</div>
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

		$(".pauseBtn").click(function() {
			$("#saveFm").append("<input type='text' name='saveMode' id='saveMode' value='A'>");
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

			$(".upload-file-delete").click(function(){
         		var url ="<c:url value='/util/fileDelete.ax'/> ";
         		var sendData = {"parntsDtaId" : $(this).attr("data-value"),"fileId" : $(this).attr("data-fileId") };
         		ajaxSubmit(url,sendData);
         		$(this).parent().remove();
         	});
	});

	function rtnFunction(typ, data) {
		if(	$("#saveMode").val() == "A" ){
			alert("저장되었습니다.");
			location.reload();
			return false;
		}


		alert(data.msg);
		var url = "<c:url value='/web/brand/productLst.bt' />";
		$("#srchFm").attr("action",url);
		$("#srchFm").submit();
	}

</script>
