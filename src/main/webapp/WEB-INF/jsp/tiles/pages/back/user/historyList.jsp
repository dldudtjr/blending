<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div class="sidebar-main">
            <header class="sidebar-main-header">
              <h3 class="tit">회원관리</h3>
            </header>
            <div class="d-flex mb-15">
            <sf:form commandName="srchFm" cssClass="form-horizontal" >
	              <div class="search-box">
	              	<sf:input path="srchTxt"  cssClass="input-text input-search"  placeholder="검색" />
	                <button title="검색" class="btn-search-icon" type="submit"></button>
	              </div>
	              <input type="hidden" name="tokenR" value="${tokenR}" />
				<sf:hidden path="totalRecordCount" />
				<sf:hidden path="currentPageNo" />
			</sf:form>
            </div>
            <table class="board-table">
              <thead>
                <tr>
                  <th>No</th>
                  <th>이름</th>
                  <th>ID(email)</th>
                  <th>Status</th>
                  <th>Date</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${srchLst}" var="row" varStatus="cnt">
					<c:set value="${srchFm.totalRecordCount - (srchFm.recordCountPerPage* (srchFm.currentPageNo - 1)) - cnt.index}" var="listCnt" />
	                <tr class="<c:if test="${cnt.count%2 == 0 }">board-bgc</c:if>">
	                  <td>${listCnt}</td>
	                  <td>${row.userNm}</td>
	                  <td>${row.userId}</td>
	                  <td>${row.statusTxt}</td>
	                  <td>${row.registDt}</td>
	                </tr>
               	</c:forEach>
              </tbody>
            </table>
            <footer class="board-footer">
	          <ui:pagination paginationInfo="${srchFm}" jsFunction="fn_Lst" type="bootstrapk" />
              <!-- <div class="wn-pagination">
                <a href="#" class="wn-pg-prev">&lt;</a>
                <a href="#" class="wn-pg-num active">1</a>
                <a href="#" class="wn-pg-num">2</a>
                <a href="#" class="wn-pg-num">3</a>
                <a href="#" class="wn-pg-num">4</a>
                <a href="#" class="wn-pg-num">5</a>
                <a href="#" class="wn-pg-next">&gt;</a>
              </div> -->
            </footer>
          </div>
          <script>

          function fn_Lst(page) {
  			$('#currentPageNo').val(page);
  			$('#srchFm').submit();
	  		}

	  		$(".btn_search").click(function() { // 조회버튼
	  			$('#currentPageNo').val("1");
	  			$("#srchFm").submit();
	  		});

	  		$(".lnbchk").eq(1).addClass("active");


          </script>