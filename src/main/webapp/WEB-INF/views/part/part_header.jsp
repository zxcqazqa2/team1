<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="container-fluid">
    <div class="d-flex">
        <!-- 로고 영역 -->
        <div class="p-2 logo-container">
            <a href="/"><img src="/images/logo.png" width="200px" height="100px" alt="로고"></a>
        </div>
        
        <!-- 메뉴 영역 -->
        <div class="flex-grow-1">
            <ul class="d-flex justify-content-center main-menu">
                <li class="menu-item">
                    <a href="/process">개요</a>
                    <!-- 서브메뉴 -->
                    <div class="submenu">
                        <a href="/process">개발 과정</a>

                    </div>
                </li>
                <li class="menu-item">
                    <a href="/tourist">제주 관광지</a>
                    <div class="submenu">
                        <a href="/tourist">제주 관광지</a>
                    </div>
                </li>
                <li class="menu-item">
                    <a href="/board/list"><spring:message code="board"/></a>
                    <div class="submenu">
                        <a href="/board/list/notice"><spring:message code="board.notice"/></a>
                        <a href="/board/list/free"><spring:message code="board.free"/></a>
                        <a href="#">서브메뉴 4-3</a>
                    </div>
                </li>
                <li class="menu-item">
                    <a href="/chargingStation"><spring:message code="chargingStation"/></a>
                    <div class="submenu">
                        <a href="#">서브메뉴 5-1</a>
                        <a href="#">서브메뉴 5-2</a>
                        <a href="/member/list">회원목록</a>
                    </div>
                </li>
            </ul>
        </div>
        
        <!-- 언어 선택 영역 -->
        <div class="p-2 d-flex justify-content-center align-items-center language-selector">
            <a href="?lang=ko" class="mx-2">한국어</a>
            <a href="?lang=en" class="mx-2">English</a>
        </div>

        <!-- 로그인/회원가입 버튼 영역 -->
        <div class="p-2 d-flex justify-content-center align-items-center auth-buttons">
            <a class="btn btn-outline-primary mx-2" href="/login"><spring:message code="login"/></a>
            <a class="btn btn-outline-primary mx-2" href="/member/join"><spring:message code="join"/></a>
        </div>
    </div>
</div>

<style>
/* 전체 컨테이너 스타일 */
.container-fluid {
    background: linear-gradient(rgba(101, 199, 247, 0.9), rgba(0, 102, 204, 0.9)),
                url('/images/jeju-background.jpg') center/cover;
    padding: 0;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

/* 로고 컨테이너 */
.logo-container {
    padding: 10px 20px;
}

.logo-container img {
    transition: transform 0.3s ease;
}

.logo-container img:hover {
    transform: scale(1.05);
}

/* 메인 메뉴 스타일 */
.main-menu {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
}

.menu-item {
    list-style: none;
    flex-grow: 1;
    text-align: center;
    position: relative;
}

.menu-item > a {
    text-decoration: none;
    display: block;
    height: 100%;
    line-height: 100px;
    color: white;
    font-weight: bold;
    font-size: 1.1em;
    transition: all 0.3s ease;
    text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
}

.menu-item > a:hover {
    color: #ffd700;
    transform: translateY(-2px);
}

/* 서브메뉴 스타일 */
.submenu {
    display: none;
    position: absolute;
    left: 0;
    top: 100%;
    width: 100%;
    background: rgba(255, 255, 255, 0.95);
    border-radius: 0 0 10px 10px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    padding: 15px 0;
    border-top: 3px solid #FF9F00;
    z-index: 1000;
}

.submenu a {
    text-decoration: none;
    display: block;
    padding: 10px 15px;
    color: #333;
    transition: all 0.3s ease;
    font-size: 0.95em;
}

.submenu a:hover {
    background-color: #FF9F00;
    color: white;
    transform: translateX(5px);
}

/* 언어 선택 영역 */
.language-selector a {
    color: white;
    text-decoration: none;
    font-weight: 500;
    transition: all 0.3s ease;
    padding: 5px 10px;
    border-radius: 15px;
}

.language-selector a:hover {
    color: #ffd700;
    background: rgba(255,255,255,0.1);
}

/* 로그인/회원가입 버튼 */
.auth-buttons .btn-outline-primary {
    color: white;
    border-color: white;
    border-radius: 20px;
    padding: 8px 20px;
    transition: all 0.3s ease;
    font-weight: 500;
}

.auth-buttons .btn-outline-primary:hover {
    background-color: #FF9F00;
    border-color: #FF9F00;
    color: white;
    transform: translateY(-2px);
}

/* 반응형 디자인 */
@media (max-width: 992px) {
    .menu-item > a {
        font-size: 1em;
        line-height: 80px;
    }
    
    .logo-container img {
        width: 150px;
        height: 75px;
    }
    
    .auth-buttons .btn-outline-primary {
        padding: 6px 15px;
        font-size: 0.9em;
    }
}

@media (max-width: 768px) {
    .menu-item > a {
        font-size: 0.9em;
        line-height: 60px;
    }
    
    .language-selector {
        display: none;
    }
    
    .auth-buttons {
        flex-direction: column;
    }
    
    .auth-buttons .btn {
        margin: 5px 0;
    }
}

.container-fluid.scrolled {
    background: rgba(0, 102, 204, 0.95);
    transition: background 0.3s ease;
}
</style>

<script>
$(document).ready(function() {
    // 메뉴 항목에 마우스를 올리면 서브메뉴 보이기
    $('.menu-item').mouseenter(function() {
        $(this).find('.submenu').stop().slideDown(200);
    });

    // 메뉴 항목에서 마우스를 떼면 서브메뉴 숨기기
    $('.menu-item').mouseleave(function() {
        $(this).find('.submenu').stop().slideUp(200);
    });
    
    // 스크롤 시 헤더 스타일 변경
    $(window).scroll(function() {
        if ($(this).scrollTop() > 50) {
            $('.container-fluid').addClass('scrolled');
        } else {
            $('.container-fluid').removeClass('scrolled');
        }
    });
});
</script>