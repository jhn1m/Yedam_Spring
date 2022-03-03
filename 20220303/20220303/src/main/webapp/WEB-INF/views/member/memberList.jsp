<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/memberList.jsp</title>
</head>
<body>
	<div align="center">
		<div>
			<h2>회원리스트</h2>
		</div>
		<div>
			<table border="1">
				<thead>
					<tr>
						<th width="200">아이디</th>
						<th width="200">이름</th>
						<th width="200">전화번호</th>
						<th width="200">주소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${members}" var="member">
						<tr onmouseover="this.style.backgroundColor='yellow'"
							onmouseleave="this.style.backgroundColor=''"
							onclick="selectOne('${member.id}')">
							<td>${member.id}</td>
							<td>${member.name}</td>
							<td>${member.tel}</td>
							<td>${member.address}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table><br>
			<div>
				<form action="memberSelect.do" method="post" id="frm">
					<input type="hidden" id="id" name="id">
				</form>
				<a href="home.do">홈으로</a>
			</div>
		</div>
	</div>
	
	<script>
		function selectOne(id){
			document.forms.frm.id.value=id;
			document.forms.frm.submit();
		}
	</script>
</body>
</html>