<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>noticeInsert.jsp</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>게시글 작성</h1>
		</div>
		<div>
			<form id = "frm" action="noticeInsert.do" method="post">
				<div>
					<table border="1">
						<tr>
							<th>작성자</th>
							<td align="center"><input type="text" id="noticeWriter"
								name="noticeWriter" required="required" /></td>
							<th>작성일자</th>
							<td align="center"><input type="date" id="noticeDate"
								name="noticeDate" required="required" /></td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="5" align="center"><input type="text"
								id="noticeTitle" name="noticeTitle" required="required"
								size="80" /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="5"><textarea rows="10" cols="90"
									id="noticeSubject" name="noticeSubject" required="required"></textarea>
							</td>
						</tr>
					</table>
				</div>
				<div>
					<input type="button" onclick="location.href='noticeList.do'" value = "목록"/> 
					<input type="submit" value="등록">
					<input type= "reset" value = "취소"/>
				</div>
			</form>
		</div>
	</div>
	
</body>
</html>
