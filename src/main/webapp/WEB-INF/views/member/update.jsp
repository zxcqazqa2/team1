<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%@ include file="../part/part_header.jsp" %>

<div class="container">
	<div>
		<h2>회원정보 수정</h2>
	</div>

	<div>
		<form id="member_update_updateForm" action="/member/update" method="post" enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<th rowspan="2"><spring:message code="member.profileImg"/></th>
					<td id="member_update_preview">
						<img id="previewImg" data-orgImg="/member/imgDisplay?fullFileName=${memberResponse.profileImg}" width="100" height="100" src="/member/imgDisplay?fullFileName=${memberResponse.profileImg}"/>
					</td>
				</tr>
				<tr>
					<td>
						<input type="file" id="member_update_attach" name="profileImg">
					</td>
				</tr>
				<tr>
					<th><spring:message code="member.username"/></th>
					<td><input type="hidden" name="username" value="${memberResponse.username}">${memberResponse.username}</td>
				</tr>
				<tr>
					<th><spring:message code="member.name"/></th>
					<td>
						<input name="name" value="${memberResponse.name}">
					</td>
				</tr>
			</table>
			<button class="btn btn-outline-primary"><spring:message code="button.update"/></button>
			<a href="/member/list" class="btn btn-outline-primary"><spring:message code="button.toList"/></a>
		</form>
	</div>
</div>

<script type="text/javascript" src="/js/memberService.js"></script>
</body>
</html>