<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align = "center">
	<div><h1>게시글 상세보기</h1></div>
	<c:if test="${empty notice.noticeId }">
		<h1>선택한 게시글이 존재하지 않습니다.</h1>
	</c:if>
	<c:if test="${not empty notice.noticeId}">
		<div>
		<table border="1">
						<tr>
							<th>작성자</th>
							<td>${notice.noticeWriter }</td>
							<th>작성일자</th>
							<td>${notice.noticeDate } </td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="5">${notice.noticeTitle }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="5">
								<textarea rows="10" cols="90">
									${notice.noticeSubject }
								</textarea>
							</td>
						</tr>
					</table>
		</div>
	</c:if>
	<div>
		<button type = "button" onclick="location.href='noticeList.do'">목록가기</button>
	</div>
</div>
</body>
</html>