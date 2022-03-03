<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>아이디찾기</h3>
	<div align="center">
		<form action="myIdCheck.do" method="post">
			<div>
				<table border="1">
					<tbody>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" id="name">
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="tel" id="tel">
						</tr>
					</tbody>
				</table><br>
				<div>
					<button type="submit">아이디찾기</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>