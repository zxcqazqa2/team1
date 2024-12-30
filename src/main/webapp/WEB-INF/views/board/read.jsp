<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%@ include file="../part/part_header.jsp" %>

<div class="container">
	<div>
		<h2>글 상세보기</h2>
	</div>
	
	<div>
		<table class="table table-bordered">
			<tr>
				<th><spring:message code="board.id"/></th>
				<td>${boardResponse.id}</td>
				<th><spring:message code="board.title"/></th>
				<td>${boardResponse.title}</td>
			</tr>
			<tr>
				<th><spring:message code="board.writer"/></th>
				<td>${boardResponse.writer}</td>
				<th><spring:message code="board.writeDate"/></th>
				<td>${boardResponse.writeDate}</td>
			</tr>
			<tr>
				<td colspan="4">
					<div id="editableDiv" contenteditable="false">${boardResponse.content}</div>
					<%-- <textarea class="form-control" rows="30" style="resize: none;" readonly="readonly">${boardResponse.content}</textarea> --%>
				</td>
			</tr>
		</table>
		<div class="board_read_btns">
			<a href="/board/list" class="btn btn-outline-primary"><spring:message code="button.toList"/></a>
			<a href="/board/update/${boardResponse.id}" class="btn btn-outline-primary"><spring:message code="button.toUpdate"/></a>
			<a href="${boardResponse.id}" class="btn btn-outline-danger"><spring:message code="button.delete"/></a>
		</div>
	</div>
	
	<hr>
	<div class="reply">
		<h2><spring:message code="reply"/><span id="replyCnt"></span></h2>
		<hr>
		<div class="board_read_replyForm">
			<div>
				작성자 : <input name="writer">
			</div>
			<div>
				<textarea rows="3" name="content"></textarea>
				<button id="reply_btn_insert">등록</button>
			</div>
		</div>
		<hr>
		<div class="replyList"></div>
	</div>
	

</div>

<script type="text/javascript" src="/js/boardService.js"></script>
<script type="text/javascript" src="/js/replyService.js"></script>
</body>
</html>