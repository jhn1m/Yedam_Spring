<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileUploadForm.jsp</title>
</head>
<body>
	<div align = "center">
		<div><h1>파일 관리</h1></div>
		<div>
			<form id = "frm" action = "fileUpload.do" enctype="multipart/form-data" method = "post">
				<table border = "1">
						<tr>
							<th width = "100">등록자</th>
								<td width = "150">
									<input type = "text" id = "writer" name = "writer">
								</td>
						</tr>
			
						<tr>
							<th width = "100">등록일자</th>
								<td width = "150">
									<input type = "date" id = "enterDate" name = "enterDate" required="required">
								</td>
						</tr>

						<tr>
							<th colspan = "4">
								<input type = "file" id = "file" name = "file">
							</th>
						</tr>
				</table><br>
				<input type = "submit" value = "등록"> &nbsp;&nbsp;&nbsp;
				<input type = "reset" value = "초기화">
			</form>
		</div>
	</div>
</body>
</html>