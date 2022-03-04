<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInsertForm.jsp</title>
</head>
<body>
	<div align = "center">
		<div><h1>회원 등록</h1></div>
		<div>
			<form id = "frm" action = "memberInsert.do" method = "post" enctype="multipart/form-data">
				<div>
					<table border = "1">
						<tr>
							<th>ID</th>
								<td align = "center">
									<input type = "text" id = "id" name = "id" required = "required">
								</td>
						</tr>
						<tr>
							<th>비밀번호</th>
								<td align = "center">
									<input type = "password" id = "password" name = "password" required = "required">
								</td>
						</tr>
						<tr>
							<th>이름</th>
								<td align = "center">
									<input type = "text" id = "name" name = "name" required = "required">
								</td>
						</tr>
						<tr>
							<th>연락처</th>
								<td align = "center">
									<input type = "text" id = "tel" name = "tel" required = "required">
								</td>
						</tr>
						<tr>
							<th>주소</th>
								<td align = "center">
									<input type = "text" id = "address" name = "address" required = "required">
								</td>
						</tr>
						<tr>
							<th>사진등록</th>
								<td>
									<input type = "file" id = "file" name = "file" required="required">
								</td>
						</tr>
					</table>
				</div>
				
				<div>
					<input type = "button" onclick = "location.href='memberList.do'" value = "홈으로"/>
					<input type = "submit" value="등록"/>
					<input type = "reset" value = "취소"/>
				</div>
				
			</form>
		</div>
	</div>
</body>
</html>