<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script src="<c:url value='/resources/js/main-pc.js'/>"></script>
  <!-- 팝업: Category Groups -->
  <!-- 팝업: Category Groups -->

    <div class="modal-dialog modal-dialog-centered modal-category">
      <div class="modal-content">
        <button class="btn-close" data-dismiss="modal" title="닫기"></button>
        <h2 class="wn-modal-header">
          Category Groups
          <a href="javascript:void(0)" class="ml-10"><img src="/resources/images/Icon-feather-settings.png" alt="" style="width:21px;"></a>
        </h2>
        <div class="wn-modal-body">


          <c:forEach items="${cateLst}" var="row" varStatus="cnt">
	          <div class="group-category">
	            <div class="group-title">
	              <div class="bold">${row.productCateNm}</div>
	              <div class="ml-auto d-flex align-items-center">
	                <a href="javascript:void(0)" class="mr-15 buyer-groupBt"	data-id="${row.productCateId}"><img src="/resources/images/Icon-feather-edit-3.png" alt="" style="width:16px;"></a>
	                <a href="javascript:void(0)" class="mr-15 popDelete"  data-id="${row.productCateId}"><img src="/resources/images/Icon-feather-trash-2.png" alt="" style="width:17px;"></a>
	              </div>
	              <!-- <div class="updown">
	                <a href="javascript:void(0)"><img src="/resources/images/icon-up.png" alt="" style="width:20px;"></a>
	                <a href="javascript:void(0)"><img src="/resources/images/icon-down.png" alt="" style="width:20px;"></a>
	              </div> -->
	            </div>
	            <div class="group-content" id="content${row.productCateId}">

	            </div>
	          </div>
          </c:forEach>


          <div class="mt-20 text-center">
            <a href="javascript:void(0)" class="button bt-blue w-100" data-dismiss="modal">확인</a>
          </div>
        </div>
      </div>
    </div>
<!-- 팝업: 삭제안내 -->
  <section class="modal fade wn-modal" id="popDelete">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="wn-modal-body">
          <div class="text-center mt-50">
            <b class="gray-9">삭제하시겠습니까?</b>
          </div>
          <div class="mt-30 mb-20 text-center">
            <a href="javascript:void(0)" class="button bt-gray bt-s wd-100 delCancel" data-dismiss="modal">취소</a>
            <a href="javascript:void(0)" class="button bt-blue bt-s wd-100 delAgree" data-dismiss="modal">확인</a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- // 팝업: 삭제안내 -->
    <script>

	    $(".popDelete").click(function(){
			$(".delAgree").attr("data-id",$(this).attr("data-id"));
			$('#popDelete').modal('show');
		});

		$(".delAgree").click(function(){
			var url = "<c:url value='/web/buyer/delProductCateSubmitDo.ax' />";
			var sendData = {
				"productCateId" : $(this).data("id")
			};

			$.ajax({
				url: url,
				data: sendData,
				type: 'POST',
				success: function(data) {
					location.reload();
					// $("#content"+id).html(data);
				},
				error: function(e) {
					console.log(JSON.stringify(e));
				}
			});

		});


    	$(".buyer-groupBt").click(function() {
    		var id =$(this).data("id");
    		$(".group-content").html("").hide();
	 		  $(this).parents('.group-title').next('.group-content').slideToggle();
    		var url = "<c:url value='/web/buyer/productCateFormPop.bt' />";
			var sendData = {
				"productCateId" : $(this).data("id")
			};

			$.ajax({
				url: url,
				data: sendData,
				type: 'POST',
				success: function(data) {
					$("#content"+id).html(data);
				},
				error: function(e) {
					console.log(JSON.stringify(e));
				}
			});
		});


 </script>
  <!-- // 팝업: Category Groups -->