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
			<h2>회원조회</h2>
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
					<tr>
						<td>${member.id}</td>
						<td>${member.name}</td>
						<td>${member.tel}</td>
						<td>${member.address}</td>
					</tr>
				</tbody>
			</table><br>
			<div>
				<button type="button" onclick="location.href='memberList.do'">회원리스트</button>
				<button type="button" onclick="location.href='memberUpdateForm.do?id=${member.id}'">회원수정1</button>
				<button type="button" onclick="updateFnc('${member.id}')">회원수정2</button>
				<button type="button" onclick="deleteMember('${member.id}')">회원삭제</button>
			</div>
			<div id="showUpdateForm">
				
			</div>
			<div>
				<form action="memberDelete.do" method="post" id="frm">
					<input type="hidden" id="id" name = "id">
				</form>
			</div>
		</div>
	</div>
	<script>
		function deleteMember(id){
			document.forms.frm.id.value=id;
			document.forms.frm.submit();
		}
		
		function makeDiv(item) {
			
		}
		
	</script>
</body>
</html>