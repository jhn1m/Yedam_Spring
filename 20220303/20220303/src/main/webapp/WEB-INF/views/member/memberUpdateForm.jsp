<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/memberUpdateForm.jsp</title>
</head>
<body>
	<div align="center">
		<div>
			<h2>회원수정</h2>
		</div>
		<div>
			<form action="memberUpdate.do?id=${member.id}" method="post">
				<table border="1">
					<tbody>
						<tr>
							<th width="200">이름</th>
							<td><input type="text" name="name" id="name" value="${member.name}" required></td>
						</tr>
						<tr>
							<th width="200">전화번호</th>
							<td><input type="text" name="tel" id="tel" value="${member.tel}" required></td>
						</tr>
						<tr>
							<th width="200">주소</th>
							<td><input type="text" name="address" id="address" value="${member.address}" required></td>
						</tr>
					</tbody>
				</table><br>
				<div>
					<input type="submit" value="전송">
				</div>
			</form>
		</div>
	</div>
</body>
</html>