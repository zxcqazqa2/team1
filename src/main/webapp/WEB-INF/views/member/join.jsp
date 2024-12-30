<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>



<link rel="stylesheet" href="/css/style.css">
<style>
.container {
    max-width: 1000px;
    margin: 50px auto;
    padding: 0 20px;
}

.join-card {
    background: white;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 102, 204, 0.1);
    overflow: hidden;
    display: flex;
    margin-top: 30px;
}

/* 왼쪽 이미지 섹션 */
.image-section {
    width: 40%;
    background: linear-gradient(135deg, #0066cc, #003366);
    padding: 40px;
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    color: white;
    min-height: 750px;
}

.image-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: url('/images/jeju-pattern.png') center/cover;
    opacity: 0.1;
}

.image-section h3 {
    font-size: 1.5em;
    margin: 20px 0;
    text-align: center;
    position: relative;
}

#preview {
    width: 340px;
    height: 620px;
    border-radius: 15px;
    background: rgba(255, 255, 255, 0.1);
    border: 2px dashed rgba(255, 255, 255, 0.3);
    margin: 20px 0;
    transition: all 0.3s ease;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
}

#preview img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

#preview:hover {
    border-color: #FF9F00;
    background: rgba(255, 255, 255, 0.2);
    transform: translateY(-5px);
}

/* 오른쪽 폼 섹션 */
.form-section {
    flex: 1;
    padding: 40px 50px;
    background: white;
}

.container h2 {
    color: #0066cc;
    font-size: 2.2em;
    margin-bottom: 30px;
    font-weight: 600;
    text-align: center;
}

.form-group {
    margin-bottom: 25px;
    position: relative;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    color: #444;
    font-size: 0.95em;
    font-weight: 500;
}

/* 입력 필드 디자인 */
.input-wrapper {
    position: relative;
    display: flex;
    gap: 10px;
}

form input[type="text"],
form input[type="password"] {
    flex: 1;
    padding: 12px 15px;
    border: 2px solid #e1e1e1;
    border-radius: 10px;
    font-size: 1em;
    transition: all 0.3s ease;
    background: #f8f9fa;
}

form input:focus {
    border-color: #0066cc;
    background: white;
    box-shadow: 0 0 0 4px rgba(0, 102, 204, 0.1);
    outline: none;
}

/* 버튼 스타일 */
#member_join_btn_checkId {
    background: #0066cc;
    color: white;
    border: none;
    padding: 0 20px;
    border-radius: 10px;
    font-weight: 500;
    font-size: 0.9em;
    transition: all 0.3s ease;
    white-space: nowrap;
}

#member_join_btn_submit {
    width: 100%;
    background: linear-gradient(135deg, #0066cc, #0052a3);
    color: white;
    border: none;
    padding: 15px;
    border-radius: 10px;
    font-size: 1.1em;
    font-weight: 500;
    margin-top: 30px;
    transition: all 0.3s ease;
}

button:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0, 102, 204, 0.2);
}

#member_join_btn_checkId:hover {
    background: #FF9F00;
}

#member_join_btn_submit:hover {
    background: linear-gradient(135deg, #FF9F00, #FF8C00);
}

/* 파일 입력 스타일링 */
.file-input-wrapper {
    margin-top: 20px;
    text-align: center;
}

input[type="file"] {
    background: rgba(255, 255, 255, 0.1);
    padding: 10px;
    border-radius: 8px;
    color: white;
    width: 100%;
    cursor: pointer;
}

/* 에러 메시지 */
.errorblock {
    background: #fff5f5;
    color: #e53e3e;
    padding: 15px;
    border-radius: 10px;
    font-size: 0.9em;
    margin-bottom: 20px;
    border-left: 4px solid #e53e3e;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .join-card {
        flex-direction: column;
    }

    .image-section {
        width: 100%;
        padding: 30px;
        min-height: auto;
    }

    .form-section {
        padding: 30px;
    }

    .input-wrapper {
        flex-direction: column;
    }

    #member_join_btn_checkId {
        width: 100%;
        padding: 12px;
    }

    #preview {
        width: 280px;
        height: 510px;
    }
}

/* 애니메이션 효과 */
@keyframes slideIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.join-card {
    animation: slideIn 0.6s ease-out;
}
</style>
</head>
<body>
<%@ include file="../part/part_header.jsp" %>

<div class="container">
	<div>
		<h2><spring:message code="join"/></h2>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-4">
				<div class="border 1" style="width: 200px; height: 200px;" id="preview">
				</div>
				<div>
				</div>
			</div>
			<div class="col-8">
				<form:form id="member_join_insertForm" modelAttribute="memberForm" action="/member/save" method="post" enctype="multipart/form-data">
					<form:errors path="*" cssClass="errorblock" element="div"></form:errors>
					<div>
						<spring:message code="member.profileImg"/> : <input type="file" name="profileImg">
					</div>
					<div>
						<form:label path="username"><spring:message code="member.username"/></form:label>
						<form:input path="username"/>
						<button type="button" id="member_join_btn_checkId"><spring:message code="member.checkId"/></button>
						<span></span>
					</div>
					
					<div>
						<form:label path="password"><spring:message code="member.password"/></form:label>
						<form:input path="password"/>
						<span></span>
					</div>
					
					<div>
						<form:label path="password2"><spring:message code="member.password2"/></form:label>
						<form:input path="password2"/>
						<span></span>
					</div>
					
					<div>
						<form:label path="name"><spring:message code="member.name"/></form:label>
						<form:input path="name"/>
					</div>
					
					<div>
						<button type="button" id="member_join_btn_submit"><spring:message code="join"/></button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	
</div>

<script type="text/javascript" src="/js/memberService.js"></script>
</body>
</html>