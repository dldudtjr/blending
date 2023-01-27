<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="sidebar-main">
	<header class="sidebar-main-header">
		<h3 class="tit">유저 정보</h3>
	</header>
	<sf:form commandName="saveFm" cssClass="form-horizontal" enctype="multipart/form-data">
		<sf:hidden path="userId" />
		<sf:hidden path="userType" />
		<div class="info-wrap mt-30">

			<div class="form-attach-image">
			<input type="file" name="myImg" id="input-file" hidden="" accpet="image/*">
                <label for="input-file">
                  <div class="attach-image-thumb">
                    <span class="attach-image-thumb-text">Your Photo<br><br><br><br>Upload image</span>
                    <div class="img-square">
                      <div id="myImgLst" class="img-crop" data-attach-role="bgImg"></div>
                    </div>
                  </div>
                </label>
			</div>

			<div class="ml-auto info-field">
				<div class="form-field">
					<sf:input path="firstNm" 	class="input-text" placeholder="이름"  />
				</div>
				<div class="form-field">
					<sf:input path="lastNm" 	class="input-text" placeholder="성 " />
				</div>
				<div class="form-field">
					<sf:input path="position" 	class="input-text" placeholder="직책 " />
				</div>
				<div class="form-field">
					<div class="input-add add-right2">
						<input type="text" value="${saveFm.email}" class="input-text" placeholder="직책 " disabled="disabled"/>
 						<sf:hidden path="emailCheckYn" />
						<sf:input path="email" 		class="input-text" placeholder="Email" />
						<c:if test="${saveFm.emailCheckYn eq 'Y' }">
							<button type="button" class="button bt-blue-text">인증완료 </button>
						</c:if>
						<c:if test="${saveFm.emailCheckYn eq 'N' }">
							<button type="button" class="button bt-blue-text emailSend">인증</button>
						</c:if>
					</div>
				</div>
				<div class="form-field select-add">
					<div class="input-add add-right2">
						<div class="custom-select wd-130">
							<select>
								<option value="">+82</option>
								<option value="">+82</option>
								<option value="">+82</option>
							</select>
						</div>
						<sf:input path="phone" class="input-text" placeholder="Phone" />
						<sf:hidden path="phoneCheckYn" />

						<%-- <c:if test="${saveFm.emailCheckYn eq 'Y' }">
							<button class="button bt-blue-text">인증완료 </button>
						</c:if>
						<c:if test="${saveFm.emailCheckYn eq 'N' }">
							<button class="button bt-blue-text emailSend">인증</button>
						</c:if> --%>
						<!-- <button class="button">인증완료</button> -->
					</div>
				</div>

				<%-- <div class="form-field">
					<sf:input path="preferredTimeZone" class="input-text" placeholder="선호하는 시간대(Preferred Time Zone)" />
				</div> --%>
				<div class="mt-30 bt-right">
					<a href="#" class="saveBtn button bt-blue w-140">저장</a>
				</div>
			</div>
		</div>
	</sf:form>

	<sf:form commandName="emailFm" cssClass="form-horizontal" enctype="multipart/form-data">
				<input type="hidden" class="input-text" name="email" id="email" placeholder="새로운 이메일" value="${saveFm.email}">
		</sf:form>

<script>
$( document ).ready(function() {

	$(document).on("click",".emailSend",function() {
		var msg = "인증 후 재로그인 부탁드립니다. ";
		if (confirm(msg)) {

			var url = "<c:url value='/web/mypage/emailChgDo.ax'/>";
			var sendData = $("#emailFm").serialize();
			fn_submitFileRtnAjax(url, sendData);
		}
	});


	$(".sub-img").remove();
	$(".detail-top").hide();
	/*
	$.validator.addMethod("phone", function(phone, element) {
		var pattern = /^[09]{2,3}[09]{3,4}[09]{4}$/;
		if (!pattern.test(telnum)) {
			return this.optional(element) || false;
		}
		return true;
	}); */

	  <c:if test="${not empty saveFm.fileId}">
		var src = "<c:url value='/util/fileDownload.ax'/>?parntsDtaId=${saveFm.userId}&fileId=${saveFm.fileId}";
		  $("#myImgLst").css({
		      "background-image": "url(" + src + ")",
		      "background-color": "#fff",
		      "background-size" : "contain",
		      "background-repeat": "no-repeat",
		      "width"			:"278px",
		    });

	  </c:if>


	$("#saveFm").validate({
		rules : {
			firstNm : {
				required : true
			}
			,lastNm : {
				required : true
			}
			,email : {
				required : true
			}
			,phone : {
				required : true
			}

		},
		messages : {
			firstNm : {
				required : "<code:msg code='validate.msg.common'/>"
			}
			,lastNm : {
				required : "<code:msg code='validate.msg.common'/>"
			}
			,email : {
				required : "<code:msg code='validate.msg.common'/>"
			}
			,phone : {
				required : "<code:msg code='validate.msg.common'/>"
			}
		},
		errorPlacement : function(error, element) {
			if(element.is(":radio") || element.is(":checkbox")){
			}else if ( element.is('select') ) {
				element.attr("placeholder",error[0].outerText);
				element.css("border", "red solid 1px");
				element.css("width", "500px");
			}else{
				element.attr("placeholder",error[0].outerText);
			}
		},
		submitHandler : function() {
			var form = $('form')[0];
			var formData = new FormData(form);
			$(".modal_bg_sub").show();
			var url = "<c:url value='/web/mypage/userInfoSubmitDo.ax'/>";
			fn_submitFileAjax(url, formData);
		}
	});

	$(".saveBtn").click(function() {
		$("#saveFm").submit();
	});

});

</script>
<%--
	</br>
	<header class="sidebar-main-header">
		<h3 class="tit">회사 정보</h3>
	</header>

	<sf:form commandName="cmpyFm" cssClass="form-horizontal" enctype="multipart/form-data">
	<sf:hidden path="cmpyId" />
	<div class="info-wrap mt-30">

		<div class="form-attach-image">
			<input type="file" name="cmpyImg" id="input-file" hidden="">
			<label for="input-file">
                  <div class="attach-image-thumb">
                    <span class="attach-image-thumb-text">Company Logo<br><br><br><br>Upload image</span>
                    <div class="img-square">
                      <div id="cmpyImgLst" class="img-crop" data-attach-role="bgImg"></div>
                    </div>
                  </div>
                </label>

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
                            /* $imgDiv.appendChild($label) */



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
                    }
                }
                const inputMultipleImage = document.getElementById("cmpyImg")
                inputMultipleImage.addEventListener("change", e => {
                    readMultipleImage(e.target,"cmpyImgLst")

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
                		document.getElementById('cmpyImg').files = dt.files;
                	});


                });

                </script>



		<div class="ml-auto info-field">
			<div class="form-field">
				<sf:input path="cmpyNm" 	class="input-text" placeholder="회사명"  />
			</div>
			<div class="form-field">
				<sf:input path="brandNm" 	class="input-text" placeholder="브랜드명"  />
			</div>
			<div class="form-field">
				<sf:input path="bizRegNo" 	class="input-text" placeholder=" 사업자등록번호 "  /><!-- <input type="text" class="input-text" name="" placeholder="회사 등록 번호" value=""> -->
			</div>
			<div class="form-field">
				<div class="input-add add-right2">
					<sf:input path="repEmail" class="input-text" placeholder="회사 등록 번호"  />
					<sf:hidden path="repEmailCheckYn" />
					<c:if test="${cmpyFm.repEmailCheckYn eq 'Y' }">
						<button class="button bt-blue-text">인증완료 </button>
					</c:if>
					<c:if test="${cmpyFm.repEmailCheckYn eq 'N' }">
						<button class="button bt-blue-text emailSend">인증</button>
					</c:if>

					<button class="button bt-blue-text">인증</button>
				</div>
			</div>
			<div class="form-field select-add">
				<div class="input-add add-right2">
					<div class="custom-select wd-130">
						<select>
							<option value="">+82</option>
							<option value="">+82</option>
							<option value="">+82</option>
						</select>
					</div>
					<sf:input path="repPhone" class="input-text" placeholder="Phone"  />
					<sf:hidden path="repPhoneCheckYn" />
					<c:if test="${cmpyFm.repPhoneCheckYn eq 'Y' }">
						<button class="button bt-blue-text">인증완료 </button>
					</c:if>
					<c:if test="${cmpyFm.repPhoneCheckYn eq 'N' }">
						<button class="button bt-blue-text phoneSend">인증</button>
					</c:if>
				</div>
			</div>
			<div class="form-field">
				<sf:input path="sectors"	class="input-text" placeholder="품목 "  />
			</div>
			<div class="form-field">
				<sf:input path="industry"	class="input-text" placeholder="산업 "  />
			</div>
			<div class="mt-30 bt-right">
				<a href="#" class="cmpyBtn button bt-blue w-140">저장</a>
			</div>
		</div>
	</div>
	</sf:form>

<script>
$( document ).ready(function() {
	$(".sub-img").remove();
	$(".detail-top").hide();

	 <c:if test="${not empty cmpyFm.fileId}">
		var src = "<c:url value='/util/fileDownload.ax'/>?parntsDtaId=${cmpyFm.cmpyId}&fileId=${cmpyFm.fileId}";
		  $("#cmpyImgLst").css({
		      "background-image": "url(" + src + ")",
		      "background-color": "#fff",
		    });

	  </c:if>



	$(".detail-top").hide();

	$("#cmpyFm").validate({
		rules : {
			cmpyNm : {
				required : true
			}
			,repEmail : {
				required : true
			}

		},
		messages : {
			cmpyNm : {
				required : "<code:msg code='validate.msg.common'/>"
			}
			,repEmail : {
				required : "<code:msg code='validate.msg.common'/>"
			}
		},
		errorPlacement : function(error, element) {
			if(element.is(":radio") || element.is(":checkbox")){x
			}else if ( element.is('select') ) {
				element.attr("placeholder",error[0].outerText);
				element.css("border", "red solid 1px");
				element.css("width", "500px");
			}else{
				element.attr("placeholder",error[0].outerText);
			}
		},
		submitHandler : function() {
			var form = $('form')[2]
			var formData = new FormData(form);

			$(".modal_bg_sub").show();
			var url = "<c:url value='/web/mypage/cmpyInfoSubmitDo.ax'/>";
			fn_submitFileAjax(url, formData);
		}
	});

	$(".cmpyBtn").click(function() {
		$("#cmpyFm").submit();
	});

});

</script> --%>

<script src="<c:url value='/resources/js/ui.js'/>"></script>
<script src="<c:url value='/resources/js/main-pc.js' />"></script>
<script src="<c:url value='/resources/js/detail.js'/>"></script>
</div>
