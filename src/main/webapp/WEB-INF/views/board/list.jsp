<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록 화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%@ include file="../part/part_header.jsp" %>

<div class="container">
	<div class="board-title">
		<h2><spring:message code="board"/></h2>
	</div>
	
	<div class="board_list">
		<table class="table">
			<thead>
				<tr>
					<th><spring:message code="board.id"/></th>
					<th><spring:message code="board.title"/></th>
					<th><spring:message code="board.writer"/></th>
					<th><spring:message code="board.writeDate"/></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList}" var="dto">
					<tr>
						<td>${dto.id}</td>
						<td><a href="/board/read/${dto.id}">${dto.title}[${dto.replyList.size()}]</a></td>
						<td>${dto.writer}</td>
						<td>${dto.writeDate}</td>
					</tr>
				</c:forEach>
			</tbody>		
		</table>
		<a href="${cateName}" class="write btn"><spring:message code="button.board.write"/></a>
	</div>
	
	<div class="d-flex justify-content-center">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="${p.startPage - 1}">Prev</a></li>
			
				<li class="page-item ${p.currentPage == pageNum ? 'active' : ''}"><a class="page-link" href="${pageNum}">${pageNum}</a></li>
			
			<li class="page-item"><a class="page-link" href="${p.endPage + 1}">Next</a></li>
		</ul>
	</div>
</div>

<script type="text/javascript" src="/js/boardService.js"></script>
</body>
</html>