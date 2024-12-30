<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>충전소 위치</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
<link rel="stylesheet" href="/css/style.css">
<style type="text/css">
body {
    background: linear-gradient(rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.4)),
                url('/images/jeju-landscape.jpg') center/cover fixed;
    color: #333;
    font-family: 'Noto Sans KR', sans-serif;
    min-height: 100vh;
}

.container {
    padding: 50px 20px;
    margin-top: 30px;
}

.container h2 {
    text-align: center;
    color: #0066cc;
    font-size: 2.5em;
    font-weight: 700;
    margin-bottom: 40px;
}

.search {
    background: white;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
}

.chargingStationList {
    background: white;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
}

.map {
    width: 100%;
    height: 500px;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

/* 모달 스타일링 */
.modal-content {
    border-radius: 15px;
    border: none;
}

.modal-header {
    background: #0066cc;
    color: white;
    border-radius: 15px 15px 0 0;
    padding: 20px;
}

.modal-title {
    font-weight: 600;
    color: white;
}

.modal-body {
    padding: 30px;
}

.btn-secondary {
    background: #FF9F00;
    border: none;
    padding: 10px 25px;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.btn-secondary:hover {
    background: #0066cc;
    transform: translateY(-2px);
}

#pagination {
    margin-top: 30px;
}

.pagination .page-link {
    color: #0066cc;
    border: 1px solid #0066cc;
    margin: 0 5px;
    border-radius: 5px;
    transition: all 0.3s ease;
}

.pagination .page-link:hover {
    background: #0066cc;
    color: white;
}

@media (max-width: 768px) {
    .container {
        padding: 20px 10px;
    }
    
    .container h2 {
        font-size: 2em;
    }
    
    .map {
        height: 300px;
    }
}
</style>
</head>
<body>
<%@ include file="part/part_header.jsp" %>

<div class="container">
	<div>
		<h2><spring:message code="chargingStation"/></h2>
	</div>

	<div class="container">

		<!-- 검색 -->
		<div class="search">
		
		</div>

		<!-- 목록 -->
		<div class="chargingStationList"></div>
		
		<!-- <div id="map" class="map"></div> -->
		
		<!-- 페이징 -->
		<div id="pagination" class="d-flex justify-content-center"></div>

	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="chargingPlaceDetailForm" tabindex="-1">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5"></h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>

			<div class="modal-body">
				<div></div>
				<!-- 지도 -->
				<jsp:include page="test.jsp"/>
			</div>

				<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- <script type="text/javascript" src="/js/chargingService.js"></script> -->
</body>
</html>