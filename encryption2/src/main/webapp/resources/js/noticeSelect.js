//공지사항 리스트 가져올 때 쓰는 JS

function aJaxCall(n) {
	$.ajax({
		url: "ajaxReplyInsert.do",
		type: "post",
		data:{ 'notice_id': n, 'replyId' : '홍길동', 'replyContents' : $('#replyContents').val()},
		dataType: "text",
		success : function(data) {
		if (data.length > 0) {
			htmlConvert(data);
			}
		}
  	});
}

function htmlConvert(data) {
	var button = "<button id = 'delet' onclick = 'deleteReply(" + data + " )'>삭제</button>";
	var tb = $("#rtable");
	var row = $("<tr />").append(
		$("<td width = '400'/>").text($("#replyContents").val()),
		$("<td align = 'center' width = '70'/>").append(button) // 삭제버튼 넣어야 함
	);
	tb.append(row);
	$("#replyContents").val(""); // input box 초기화
	$("#wrap").append($("#rtable")); //화면에 추가
}

function deleteReply(n) { // 전달받은 replyNo
	var replyNo = n;
	$.ajax({
		url: "ajaxReplyDelete.do",
		type: "post",
		data: { "replyNo": n },
		async: false, // 전역변수를 동기화해서 같이 사용
		dataType: "text",
		success: function(data) {
			if (data.length > 0) {
				del = true;
			}
		}
	})
	if (del) {
		$(event.target).parent().parent().remove();
	} else {
		alert(del + "삭제 실패.");
	}
	//event.target.parentElement.parenElement.remove();
}