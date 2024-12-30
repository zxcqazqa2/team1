<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 제주도 전기차 충전소</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	background: linear-gradient(rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4)),
				url('/images/jeju-landscape.jpg') center/cover fixed;
	color: #333;
	font-family: 'Noto Sans KR', sans-serif;
	min-height: 100vh;
}

.login-wrapper {
	display: flex;
	max-width: 800px;
	margin: 80px auto;
	background: white;
	border-radius: 15px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.login-image {
	flex: 1;
	position: relative;
	min-height: 500px;
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	background: url('/images/title.jpg') center/cover no-repeat;
}

.image-overlay {
	position: relative;
	z-index: 2;
	background: linear-gradient(to top, rgba(0,0,0,0.8), rgba(0,0,0,0.4), transparent);
	padding: 30px 20px;
	width: 100%;
}

.image-text {
	color: white;
	text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
}

.image-text h3 {
	font-size: 1.8em;
	margin-bottom: 10px;
}

.image-text p {
	font-size: 1em;
	line-height: 1.6;
	margin-bottom: 0;
}

.login-container {
	flex: 1;
	padding: 40px;
	background: white;
}

.login-title {
	color: #0066cc;
	font-weight: 700;
	margin-bottom: 30px;
	text-align: center;
	font-size: 2em;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	color: #555;
	font-weight: 500;
	margin-bottom: 8px;
}

.form-control {
	border-radius: 10px;
	padding: 12px;
	border: 1px solid #ddd;
	transition: all 0.3s ease;
}

.form-control:focus {
	border-color: #0066cc;
	box-shadow: 0 0 0 0.2rem rgba(0, 102, 204, 0.25);
}

.login-btn {
	width: 100%;
	padding: 12px;
	background: #FF9F00;
	border: none;
	border-radius: 10px;
	color: white;
	font-weight: 600;
	margin-top: 20px;
	transition: all 0.3s ease;
}

.login-btn:hover {
	background: #0066cc;
	transform: translateY(-2px);
}

.login-links {
	text-align: center;
	margin-top: 20px;
}

.login-links a {
	color: #666;
	text-decoration: none;
	margin: 0 10px;
	font-size: 0.9em;
	transition: color 0.3s ease;
}

.login-links a:hover {
	color: #FF9F00;
}

@media (max-width: 768px) {
	.login-wrapper {
		flex-direction: column;
		margin: 40px 20px;
	}
	
	.login-image {
		min-height: 200px;
	}
}
</style>

</head>
<body>
	<%@ include file="part/part_header.jsp" %>

	<div class="container">
		<div class="login-wrapper">
			<div class="login-image">
				<div class="image-overlay">
					<div class="image-text">
						<h3>제주도 전기차 충전소</h3>
						<p>친환경 제주도 여행의 시작<br>편리한 전기차 충전소 찾기</p>
					</div>
				</div>
			</div>
			
			<div class="login-container">
				<h2 class="login-title">로그인</h2>
				<form action="/checkLogin" method="post">
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" id="id" name="id" required>
					</div>
					<div class="form-group">
						<label for="pw">비밀번호</label>
						<input type="password" class="form-control" id="pw" name="pw" required>
					</div>
					<button type="submit" class="login-btn">로그인</button>
					
					<div class="login-links">
						<a href="/member/join">회원가입</a>
						<span>|</span>
						<a href="#">아이디 찾기</a>
						<span>|</span>
						<a href="#">비밀번호 찾기</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		function checkLogin() {
			// 기본 form submit 동작 방지
			event.preventDefault();
			
			let username = $('#username').val();
			let password = $('input[name="password"]').val();
			
			// 입력값 검증
			if (!username || !password) {
				alert('아이디와 비밀번호를 모두 입력해주세요.');
				return;
			}
			
			// AJAX 요청
			$.ajax({
				type: 'POST',
				url: 'check/login',
				data: {
					username: username,
					password: password
				},
				success: function(result) {
					if (result.valid) {
						// 로그인 성공 시 메인 페이지로 이동
						window.location.href = '/';
					} else {
						// 로그인 실패 시 알림
						alert('아이디 또는 비밀번호가 올바르지 않습니다.');
						$('#username').focus();
					}
				},
				error: function(xhr, status, error) {
					alert('로그인 처리 중 오류가 발생했습니다.');
					console.error('Error:', error);
				}
			});
		}

		// form submit 이벤트에 checkLogin 함수 연결
		$(document).ready(function() {
			$('#loginForm').on('submit', function(e) {
				checkLogin();
			});
		});
	</script>
</body>
</html>
