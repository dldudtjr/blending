<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<sf:form commandName="srchFm" cssClass="form-horizontal">
	<sf:hidden path="totalRecordCount" />
	<sf:hidden path="currentPageNo" />
</sf:form>

<div class="sidebar-main">
	<div class="buyerCard-wrap">
		<c:forEach items="${srchLst}" var="row" varStatus="cnt">
			<div class="buyerCard-form">
				<div class="buyerCard-img">
					${row.cmpyNm}
					<%-- <c:if test="${not empty row.fileId}" >
						<img src="<c:url value="/util/fileDownload.ax"/>?parntsDtaId=${row.cmpyId}&fileId=${row.fileId}">
					</c:if>
					<c:if test="${empty row.fileId}" >
						<img src="/resources/images/bt_logo@2x.png" alt="">
					</c:if> --%>
				</div>
				 <div class="buyerCard-text">
					<a href="#" class="buyerCard-title mt-15"><b>${row.firstNm} ${row.lastNm}</b></a>
					<a href="#" class="buyerCard-more mt-10"><b>${row.position}</b></a>
	       			<a href="#" class="buyerCard-send active mt-15 mb-15">제안서 보내기</a>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<script type="text/javascript" th:inline="javascript">
      /*<![CDATA[*/
      function getDocumentHeight() {
        const body = document.body;
        const html = document.documentElement;

        return Math.max(
          body.scrollHeight,
          body.offsetHeight,
          html.clientHeight,
          html.scrollHeight,
          html.offsetHeight
        );
      }

      function getScrollTop() {
        return window.pageYOffset !== undefined
          ? window.pageYOffset
          : (
              document.documentElement ||
              document.body.parentNode ||
              document.body
            ).scrollTop;
      }

	$(".main-content").addClass("buyer");
	$(".global-nav-bar").addClass("buyer");
	$(".detail-top").hide();
	$(".sidebar").hide();

	$(".buyerCard-send").click(function(){
		alert("제안서를 발송했습니다. ");
	});



	$(document).ready(function(){
	    //스크롤 발생 이벤트 처리
	    window.onscroll = function () {
	    	console.log(">>>>>getDocumentHeight()="+getDocumentHeight());
	    	console.log(">>>>>window.height()="+window.innerHeight);
	    	console.log(">>>>>getScrollTop()="+getScrollTop());
	    	console.log(parseInt(getDocumentHeight()) -parseInt( window.innerHeight));
        if (getScrollTop() < getDocumentHeight() - window.innerHeight - 5) return;
        // 스크롤이 페이지 하단에 도달할 경우 새 페이지 로드
	        $("#currentPageNo").val(parseInt($("#currentPageNo").val())+1);
	        console.log("currentPageNo="+$("#currentPageNo").val());
	        submitDo();
	    };

	});

	function submitDo() {

    	var urls = "<c:url value='/web/brandN/buyerLst.ax'/>";
    	$.ajax({
			url : urls,
			data : $("#srchFm").serialize(),
			type : 'POST',
			success : function(result) {
				$('.buyerCard-wrap').append(result)
			},
			error : function(request, status, error) {
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
			}
		});

    }



</script>