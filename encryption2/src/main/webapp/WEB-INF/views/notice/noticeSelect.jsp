<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CDN방식 -->
<script src="resources/js/jquery.min.js"></script>
</head>
<body>
   <div align="center">
      <div><h1>게시글 상세보기</h1></div>
      <div>
      	<table border = "1">
      		<tr>
      			<th width = "100">작성자</th>
      				<td width = "150" align = "center">${notice.noticeWriter }</td>
      			<th width = "100">작성일자</th>
      				<td width = "150" align = "center">${notice.noticeDate }</td>
      			<th width = "70">조회수</th>
      				<td width = "150" align = "center">${notice.noticeHit }</td>
      		</tr>
      		
      		<tr>
      			<th>제목</th>
      			<td colspan="5">${notice.noticeTitle }</td>
      		</tr>
      		
      		<tr>
      			<th>내용</th>
   				<td colspan = "5"><textarea rows="6" cols="100" readonly="readonly">${notice.noticeSubject }</textarea>
      			</td>
      		</tr>
      	</table>
       </div>
       
       <div id = "wrap">
       		<c:if test = "${empty replys }">
       			<table id = "rtable" border = "1"></table>
       		</c:if>
       		<c:if test = "${not empty replys }">
       			<table id = "rtable" border = "1">
       				<c:forEach items = "${replys }" var = "reply">
       					<tr>
       						<td width = "400">${reply.replyContents }</td>
       						<td width = "45 " align = "center">
       							<button type="button" onclick="deleteReply('${reply.replyNo}')">삭제</button>
       						</td>
       					</tr>
       				</c:forEach>
       			</table>
       		</c:if>
       </div>
       <div>
          <form id = "frm">
             <input type="text" id="replyContents" size="60"> &nbsp;&nbsp;
             <button type="button" onclick="aJaxCall(${notice.noticeId})">등록</button>
          </form>
       </div>
   </div>
<script src="resources/js/noticeSelect.js"></script>
</body>
</html>