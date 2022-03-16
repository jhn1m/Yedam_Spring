<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://momentjs.com/downloads/moment.js"></script>
</head>
<body>
<div align = "center">
	<div><h1>게시글 목록</h1></div>
	<div>
		<form>	
			<table>
				<tr>
					<td width = "620">
						<select name = "key" id = "key">
							<option value="전체" selected="selected">전체</option>
							<option value="작성자">작성자</option>
							<option value="제목">제목</option>
						</select>&nbsp;
						<input type="text" size = "15" name="val" id = "val">&nbsp;
						<button type="button" onclick="SearchList()">검색</button> 
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div>
	
		<table border = "1" id = 'contents'>
		<thead>
			<tr>
				<th width="70">순번</th>
				<th width="100">작성자</th>
				<th width="350">제목</th>
				<th width="100">작성일자</th>
				<th width="70">조회수</th>
			</tr>
		</thead>
		<tbody id = "body">
			<c:forEach items = "${notices }" var = "notice">
				<tr onmouseover = 'this.style.background="#fcecae";'
					onmouseleave = 'this.style.background="#FFFFFF";'
					onclick = "searchNotice('${notice.noticeId }')">
					<td align = "center">${notice.noticeId }
					<td align = "center">${notice.noticeWriter }
					<td> ${notice.noticeTitle }
					<td align = "center">${notice.noticeDate }
					<td align = "center">${notice.noticeHit }
				</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>
	<div>
		<form id = "frm" action = "noticeSelect.do" method = "post">
			<input type = "hidden" id = "noticeId" name = "noticeId">
		</form>
	</div>
</div>
<script type="text/javascript">
	function searchNotice(id){
		frm.noticeId.value = id;
		frm.submit();
	}
	
	function SearchList() {
		$.ajax({
			url : "ajaxNoticeSearch.do",
			type : "post",
			data : {"key" : $("#key").val(), "val" : $("#val").val()},
			dataType : "json",
			success : function(result){
				if(result.length > 0){
					jsonHtmlConvert(result);
				}
			}
		})
	}
	
	function jsonHtmlConvert(result) {
		var tb = $("#body");
		$("#body").empty();
		var tr = $("<tr />").attr({
			'onmouseover' : 'this.style.background="#fcecae";',
			'onmouseleave' : 'this.style.background="#FFFFFF";',
			'onclick' : "searchNotice('${notice.noticeId }');"
		})
		$.each(result, function(index, item){
			/* var fomDate = new Date(item.noticeDate);
         	var fomDate = moment(fomDate).format('YYYY-MM-DD') */
			var html = $("<tr />").attr({
				'onmouseover' : 'this.style.background="#fcecae";',
				'onmouseleave' : 'this.style.background="#FFFFFF";',
				'onclick' : 'searchNotice(' + item.noticeId + ')'
			}).append(
				$("<td align = 'center'/>").text(item.noticeId),
				$("<td align = 'center'/>").text(item.noticeWriter),
				$("<td align = 'center'/>").text(item.noticeTitle),
				$("<td align = 'center'/>").text(item.noticeDate),
				$("<td align = 'center'/>").text(item.noticeHit),
			)
			tb.append(html);
		})
		$("#contents").append(tb);
	}

	/*	
	function jsonHtmlConvert(result) {
		$("#listBody").html("");
		var html = "<tbody id = 'body'>";
		$.each(result, function (index, item) {
			html += "<tr onmouseover='this.style.background=\"#fcecae\";'"
		         + "onmouseleave='this.style.background=\"#FFFFFF\";'"
		         + "onclick='noticeDetail(" + item.noticeId + ")'>"
			html += "<td>" + item.noticeWriter + "</td>";
			html += "<td>" + item.noticeTitle + "</td>";
			html += "<td>" + item.noticeDate" + "</td>";
			html += "<td>" + item.noticeHit + "</td></tr>";
		})
		$("#listBody").append(html);
	} 
	*/
	
	 /* 
	 function jsonHtmlConvert(result) {
	      $("#listBody").html("");
	      $.each(result, function(index, item) {
	         var appendList = "<tr onmouseover='this.style.background=\"#fcecae\";'"
	         + "onmouseleave='this.style.background=\"#FFFFFF\";'"
	         + "onclick='noticeDetail(" + item.noticeId + ")'>"
	         + "<td>" + item.noticeId + "</td>"
	         + "<td>" + item.noticeWriter + "</td>"
	         + "<td>" + item.noticeTitle + "</td>"
	         + "<td>" + item.noticeDate + "</td>"
	         + "<td>" + item.noticeHit + "</td>"
	         + "</tr>";
	         $("#listBody").append(appendList);
	      })
	   } 
	*/ 
	
</script>
</body>
</html>