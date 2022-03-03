<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/memberLoginForm.jsp</title>
</head>
<body>
	<div align="center">
		<div>
			<h2>회원 로그인</h2>
		</div>
		<div>
			<form action="memberLogin.do" method="post">
				<table border="1">
					<tbody>
						<tr>
							<th width="200">아이디</th>
							<td><input type="text" id="id" name="id" required></td>
						</tr>
						<tr>
							<th width="200">비밀번호</th>
							<td><input type="password" id="password" name="password" required></td>
						</tr>
					</tbody>
				</table><br>
				<div><br>
					<input type="submit" value="로그인">
					<button type="button" onclick="location.href='myIdCheckForm.do'">아이디찾기</button>
					<button type="button" onclick="location.href='home.do'">홈으로</button>
				</div>
			</form><br>
		</div>
	</div>
</body>
</html>