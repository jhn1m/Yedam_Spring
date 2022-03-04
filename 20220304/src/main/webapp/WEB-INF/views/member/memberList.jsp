<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList.jsp</title>
</head>
<style>
</style>
<body>
	<div align = "center">
		<div><h1>멤버 목록을 출력합니다.</h1></div>
		<div >
			<table id = "tb"> 
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>권한</th>
				</tr>
				
				<c:forEach items="${members }" var="member">
				<tr onmouseover='this.style.background="#fcecae";'
				    onmouseleave='this.style.background="#FFFFFF";'
				    onclick="memberSearch('${member.id}')">
					<td align = "center">${member.id }</td>
					<td align = "center">${member.name }</td>
					<td align = "center">${member.tel }</td>
					<td align = "center">${member.address }</td>
					<td align = "center">${member.author }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div>
			<form id = "frm" action = "memberSelect.do" method = "post">
				<input type = "hidden" id = "id" name = "id">
			</form>
		</div>
		
		<div>
			<button type="button" onclick="location.href='memberInsertForm.do'">등록화면</button>
			<button type="button" onclick="location.href='home.do'">홈으로</button>
		</div>
	</div>

<script type="text/javascript">
	function memberSearch(n) {
		frm.id.value = n;
		frm.submit();
	}
</script>

</body>
</html>