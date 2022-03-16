<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div align = "center">
	<div><h1>게시글 목록</h1></div>
	<div>
		<table border = "1">
			<tr>
				<th width="70">순번</th>
				<th width="100">작성자</th>
				<th width="250">제목</th>
				<th width="100">작성일자</th>
				<th width="70">조회수</th>
			</tr>
			<c:forEach items = "${notices }" var = "notice">
				<tr onmouseover = 'this.style.background="#fcecae";'
					onmouseleave = 'this.style.background="#FFFFFF";'
					onclick = "searchNotice('${notice.noticeId }')">
					<td align = "center">${notice.noticeId }
					<td align = "center">${notice.noticeWriter }
					<td> ${notice.noticeTitle }
					<td align = "center">${notice.noticeDate }
					<td align = "center">${notice.noticeHit }
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<form id = "frm" action = "noticeSelect.do" method = "post">
			<input type = "hidden" id = "noticeId" name = "noticeId">
		</form>
	</div>
</div>
<script type="text/javascript">
	function searchNotice(id){
		frm.noticeId.value = id;
		frm.submit();
	}
</script>
</body>
</html>