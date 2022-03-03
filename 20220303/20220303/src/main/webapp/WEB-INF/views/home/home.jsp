<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h2>처음페이지입니다!</h2>
		</div>
		<div>
			<c:choose>
				<c:when test="${empty sessionId}">
					<a href="memberInsertForm.do">회원가입하기</a>
					<a href="memberLoginForm.do">로그인하기</a>
				</c:when>
				<c:otherwise>
					<a href="memberList.do">회원리스트보기</a>
					<a href="memberLogout.do">로그아웃하기</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>