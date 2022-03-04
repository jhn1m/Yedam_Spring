<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberSelect.jsp</title>
</head>
<body>
<div align = "center">
	<div><h1>회원 상세보기</h1></div>
	
		<div>
			<form id = "frm" action = "memberUpdate.do" method = "post">
				<div>
					<table border="1">
						<tr>
							<th>ID</th>
								<td><input type = "text" id = "id" name = "id" value = "${member.id }" required="required" readonly="readonly">	</td>
						</tr>
						
						<tr>	
							<th>이름</th>
								<td><input type = "text" id = "name" name = "name" value = "${member.name }" required="required">	</td>
						</tr>
						
						<tr>
							<th>연락처</th>
								<td><input type = "text" id = "tel" name = "tel" value = "${member.tel }" required="required">	</td>
						</tr>
						
						<tr>
							<th>주소</th>
								<td><input type = "text" id = "address" name = "address" value = "${member.address }" required="required">	</td>
						</tr>
						
						<tr>
							<th>권한</th>
								<td>${member.author }</td>
						</tr>
						
						<tr>
							<th>사진</th>
								<td>
								${member.picture }
								<button type = "button" onclick="location.href='memberList.do'">다운로드</button>					
								</td>
						</tr>
					</table>
				</div>
			
			<div>
				<input type = "submit"  value = "회원수정"/>
				<button type = "button" onclick="location.href='memberList.do'">목록가기</button>
				<button type = "button" onclick="location.href='memberDelete.do?id=${member.id}'">삭제</button>
			</div>
			
			</form>
		</div>
</div>
</body>


</html>