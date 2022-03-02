<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList.jsp</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>게시글 목록</h1>
		</div>
		<div>
			<table border="1">
				<tr >
					<th>글 번호</th>
					<th>작성자</th>
					<th width = "300">제목</th>
					<th>작성일자</th>
					<th>조회수</th>
				</tr>

				<c:forEach items="${notices}" var="notice">
					<tr onmouseover='this.style.background="#fcecae";'
				    	onmouseleave='this.style.background="#FFFFFF";'
				    	onclick="noticeSearch('${notice.noticeId}')">
						<td align = "center">${notice.noticeId}</td>
						<td align = "center">${notice.noticeWriter}</td>
						<td>${notice.noticeSubject}</td>
						<td align = "center">${notice.noticeDate}</td>
						<td align = "center">${notice.noticeHit}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div>
			<form id = "frm" action = "noticeSelect.do" method = "post">
				<input type = "hidden" id = "noticeId" name = "noticeId">
			</form>
		</div>

		<div>
			<a href="noticeInsertForm.do">등록화면</a>
		</div>
	</div>
	
<script type="text/javascript">
	function noticeSearch(n) {
		frm.noticeId.value = n;
		frm.submit();
	}
</script>
	
</body>
</html>