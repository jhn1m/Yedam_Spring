<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileList.jsp</title>
</head>
<body>
	<div align = "center">
		<div><h1>파일 목록 확인</h1></div>
		<div>
			<table border = "1">
				<tr>
					<th>아이디</th>
					<th>원본 이름</th>
					<th>수정된 이름</th>
					<th>작성자</th>
					<th>작성일시</th> 
				</tr>
				
				<c:forEach items="${files }" var="file">
					<tr onmouseover='this.style.background="#fcecae";'
				    onmouseleave='this.style.background="#FFFFFF";'
				    onclick="memberSearch('${member.id}')"
				    >
					<td align = "center">${file.id }</td>
					<td align = "center">${file.fname }</td>
					<td align = "center">${file.rname }</td>
					<td align = "center">${file.writer}</td>
					<td align = "center">${file.enterDate }</td>
					
				</tr>
				</c:forEach>
			</table>
		</div>
		<div>
			<button type="button" onclick="location.href='fileUploadForm.do'">파일등록화면</button>
			<button type="button" onclick="location.href='home.do'">홈으로</button>
		</div>
	</div>
</body>
</html>