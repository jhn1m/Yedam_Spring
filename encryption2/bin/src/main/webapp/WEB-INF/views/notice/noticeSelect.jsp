<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div align = "center">
	<div><h1>게시글 상세</h1></div>
	<div>
		작성자 : ${notice.noticeWriter } | 작성일자 : ${notice.noticeDate } |
		조회수 : ${notice.noticeHit } | 제목 : ${notice.noticeTitle }<br>
		내용 = ${notice.noticeSubject }<hr> 
	</div>
	<div id = "wrap">
		
	</div>
	<div>
		<form id = "frm">
			<input type = "hidden" id = "noticeId" value="${notice.noticeId }">
			<input type = "text" id = "replyMessage" size = "60">&nbsp;&nbsp;
			<button type = "button" onclick="aJaxCall()">등록</button>
		</form>
	</div>
</div>

<script type="text/javascript">
	function aJaxCall() {
		$.ajax({
			url : "ajaxReplyInsert.do",
			type : "post",
			data : {"a" : $("#replyMessage").val(), "b" : ${notice.noticeId}},
			dataType : "text",
			success : function(data) {
				if(data.length > 0){
					var str = $replyMessage.val();
					$replyMessage.val(""); // input box 초기화
					$(".wrap").append(str); // 화면에 추가
					}
				}
		})
	}
</script>
</body>
</html>