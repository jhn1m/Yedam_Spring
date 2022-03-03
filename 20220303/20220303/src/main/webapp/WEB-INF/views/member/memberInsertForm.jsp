<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h2>회원등록</h2>
		</div>
		<div>
			<form action="memberInsert.do" method="post">
				<table border="1">
					<tbody>
						<tr>
							<th width="200">아이디</th>
							<td><input type="text" name="id" id="id"></td>
						</tr>
						<tr>
							<th width="200">비밀번호</th>
							<td><input type="password" name="password" id="password"></td>
						</tr>
						<tr>
							<th width="200">이름</th>
							<td><input type="text" name="name" id="name"></td>
						</tr>
						<tr>
							<th width="200">전화번호</th>
							<td><input type="text" name="tel" id="tel"></td>
						</tr>
						<tr>
							<th width="200">주소</th>
							<td><input type="text" name="address" id="address"></td>
						</tr>
						<tr>
							<th width="200">권한</th>
							<td><input type="text" name="author" id="author" value="user" readonly="readonly"></td>
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