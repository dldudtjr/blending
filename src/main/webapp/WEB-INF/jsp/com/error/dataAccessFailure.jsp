<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page isErrorPage="true"%>
<%
	response.setStatus(200);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>Error Page</title>
<link href="<c:url value='/resources/cmsm/css/error.css'/>" rel="stylesheet" type="text/css">
</head>
<body>
	<div>
		<ul class="empty">
			<li><img alt="" src="<c:url value='/resources/cmsm/images/request.jpg'/>" border="0">
				<p>
					<span>데이터 처리 중 오류가 발생하였습니다.(dataAccessFailure)</span>홈페이지 관리자에게 문의 하시기 바랍니다.
				</p></li>
		</ul>
	</div>
</body>
</html>