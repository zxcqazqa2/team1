<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/css/style.css">

<style type="text/css">
#editableDiv {
            width: 100%;
            height: 200px;               /* 높이 설정 */
            padding: 15px;               /* 내부 여백 */
            border: 1px solid #ccc;      /* 테두리 */
            border-radius: 5px;          /* 테두리 둥글게 */
            background-color: #f9f9f9;   /* 배경색 */
            font-family: Arial, sans-serif; /* 글꼴 */
            font-size: 16px;             /* 글꼴 크기 */
            line-height: 1.5;            /* 줄 간격 */
            color: #333;                 /* 텍스트 색상 */
            box-sizing: border-box;      /* 박스 모델 */
            white-space: pre-wrap;       /* 줄바꿈 처리 */
            overflow-y: auto;            /* 내용이 넘치면 스크롤바 추가 */
        }

        /* 커서 스타일 */
        #editableDiv:empty {
            color: #888;                 /* 텍스트가 없을 때 회색 텍스트 */
        }

        /* 커서 스타일 */
        #editableDiv:focus {
            border-color: #0066cc;      /* 포커스 시 테두리 색상 */
            outline: none;              /* 기본 포커스 아웃라인 제거 */
        }

        /* 기본 스타일이 지정되지 않으면, 텍스트 영역에 기본 텍스트 삽입 */
        #editableDiv[contenteditable="true"]:empty:before {
            content: "여기에 텍스트를 입력하세요.";  /* 기본 안내 텍스트 */
            color: #aaa;                /* 안내 텍스트 색상 */
        }

        /* 이미지 스타일 */
        #editableDiv img {
            max-width: 100%;             /* 이미지 크기 자동 조정 */
            height: auto;                /* 이미지 비율 유지 */
            display: block;              /* 이미지 아래 여백 제거 */
            margin: 10px 0;              /* 이미지 위아래 여백 추가 */
        }

</style>
</head>
<body>
<%@ include file="../part/part_header.jsp" %>

<div class="container">
	<div>
		<h2><spring:message code="board.write"/></h2>
	</div>
	
	<div>
		<form class="board_insertForm" action="/board/insert" method="post" enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<th>카테고리</th>
					<td>
						<c:if test="${not empty cateName}">
							<input type="hidden" name="cateName" value="${cateName}">
							<spring:message code="board.${cateName}"/>
						</c:if>
						<c:if test="${empty cateName}">
							<select class="form-select" name="cateName">
								<option value="notice"><spring:message code="board.notice"/></option>
								<option value="free"><spring:message code="board.free"/></option>
							</select>
						</c:if>
					</td>
					<th><spring:message code="board.title"/></th>
					<td><input class="form-control" name="title"></td>
					<th><spring:message code="board.writer"/></th>
					<td><input class="form-control" name="writer"></td>
				</tr>
				<tr>
					<td colspan="6">
						<input type="hidden" name="content">
						<!-- <textarea class="form-control" name="content" rows="30" style="resize: none;"></textarea> -->
						<div id="editableDiv" contenteditable="true"></div>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<input class="form-control" type="file" name="attach">
					</td>
				</tr>
			</table>
			<button type="button" class="btn btn-outline-primary"><spring:message code="button.board.write"/></button>
		</form>
	</div>
</div>

<script type="text/javascript" src="/js/boardService.js"></script>
</body>
</html>