<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%@ include file="../part/part_header.jsp" %>

<div class="container">
	<div>
		<h2>회원정보 상세보기</h2>
	</div>

	<div>
		<table class="table table-bordered">
			<tr>
				<th><spring:message code="member.profileImg"/></th>
				<td>
					<img width="100" height="100" src="/member/imgDisplay?fullFileName=${memberResponse.profileImg}"/>
				</td>
			</tr>
			<tr>
				<th><spring:message code="member.username"/></th>
				<td>${memberResponse.username}</td>
			</tr>
			<tr>
				<th><spring:message code="member.name"/></th>
				<td>${memberResponse.name}</td>
			</tr>
			<tr>
				<th><spring:message code="member.createDate"/></th>
				<td>${memberResponse.createDate}</td>
			</tr>
		</table>
		<a href="/member/update/${memberResponse.username}" class="btn btn-outline-primary"><spring:message code="button.toUpdate"/></a>
		<a id="member_read_btn_delete" href="${memberResponse.username}" class="btn btn-outline-danger"><spring:message code="button.delete"/></a>
		<a href="/member/list" class="btn btn-outline-primary"><spring:message code="button.toList"/></a>		
	</div>
</div>

<script type="text/javascript" src="/js/memberService.js"></script>
</body>
</html>