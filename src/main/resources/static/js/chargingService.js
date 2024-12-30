let map;
let markers;

// 지도 초기화 함수
function initMap() {
    // 이미 존재하는 지도 인스턴스 제거
    if (map) {
        map.remove();
        map = null;
    }
    
    // 새 지도 인스턴스 생성
    map = L.map('map', {
        minZoom: 10,
        maxZoom: 18
    }).setView([33.4996, 126.5312], 12);
    
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    
    markers = L.layerGroup().addTo(map);
    
    // 강제로 지도 크기 재계산
    setTimeout(() => {
        map.invalidateSize(true);
    }, 200);
}

function mapRender(data) {
    // 지도 초기화
    initMap();
    
    if (!data || data.length === 0) return;
    
    data.forEach(el => {
        const markerIcon = L.divIcon({
            className: 'custom-marker',
            html: `<div style="font-size: 30px; color: yellow;">⚡</div>`,
            iconSize: [40, 40]
        });
        
        L.marker([el.latitude, el.longitude], { icon: markerIcon })
            .addTo(markers)
            .bindPopup(`<b>${el.chargingPlace}</b>`);
    });
    
    // 모든 마커가 보이도록 지도 뷰 조정
    const bounds = L.latLngBounds(data.map(el => [el.latitude, el.longitude]));
    map.fitBounds(bounds);
}

// 탭이나 모달이 열릴 때 호출되는 이벤트 리스너 추가
// 예: Bootstrap 탭 이벤트
document.addEventListener('shown.bs.tab', function (e) {
    if (e.target.getAttribute('href') === '#map-tab') {
        initMap();
    }
});

// 또는 일반적인 탭 클릭 이벤트
document.querySelectorAll('.tab-button').forEach(button => {
    button.addEventListener('click', function() {
        if (this.dataset.tab === 'map') {
            setTimeout(initMap, 100);
        }
    });
});
//console.log("chargingService.js파일 불러옴.");
//
//let map = L.map('map').setView([33.4996, 126.5312], 12);
//
//var markers = L.layerGroup().addTo(map);
//
//
//
//
//
//
//
//// 지도
//function mapRender(data) {
//
//	L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
//		attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
//	}).addTo(map);
//	
//	markers.clearLayers();
//	
//	// 데이터에서 각 마커의 위치 추가
//	for (el of data) {
//		map.setView([el.latitude, el.longitude], 18);
//		console.log(`${el.latitude}, ${el.longitude}`);
//		
//		const markerIcon = L.divIcon({
//		     className: 'custom-marker',
//		     html: `<div style="font-size: 30px; color: yellow;">⚡</div>`,
//		     iconSize: [40, 40],
//		});
//		
//		L.marker([el.latitude, el.longitude], { icon: markerIcon }).addTo(markers).bindPopup(`<b>${el.chargingPlace}</b>`);
//		
//		/*
//		L.circle([el.latitude, el.longitude], {
//			color: 'red',
//			fillColor: '#ff0000',
//			fillOpacity: 0.5,
//			radius: 500
//		}).addTo(markers)
//			.bindPopup(`<b>${el.chargingPlace}</b>`);
//		*/
//	}
//	
//	
//
//}



// 페이징
function paginationRender(params, totCnt) {
	let currentPage = params.number;  // 현재 페이지 (초기값: 1)
	let perPageContent = params.limit; // 페이지당 표시할 게시물수(초기값: 10)

	let displayPageNum = 10;
	let endPage = Math.ceil(currentPage / displayPageNum) * displayPageNum; // 10, 20, 30...
	let startPage = endPage - displayPageNum + 1; // 1, 11, 21...
	let totalPages = Math.ceil(totCnt / perPageContent); // 올림(5171/10) = 518

	let prev = startPage > 1;
	let next = endPage < totalPages;

	if (endPage > totalPages) {
		endPage = totalPages;
	}
	let tag = `<ul class="pagination">`;
	if (prev) {
		tag += `<li class="page-item"><a class="page-link" href="${startPage - 1}">Prev</a></li>`
	}
	for (let pageNum = startPage; pageNum <= endPage; pageNum++) {
		tag += `<li class="page-item ${currentPage == pageNum ? 'active' : ''}"><a class="page-link" href="${pageNum}">${pageNum}</a></li>`;
	}
	if (next) {
		tag += `<li class="page-item"><a class="page-link" href="${endPage + 1}">Next</a></li>`;
	}
	tag += `</ul>`;

	$("#pagination").html(tag);

	// 페이지 이동 ---- 아직 미완성
	$('#pagination').on('click', 'a', function(event) {
		event.preventDefault();

		let params = {
			number: $(this).attr('href'), // 클릭한 페이지 번호
			limit: 10
		}
		getData(params);
	});
}


// 목록
function chargingStationListRender(data) {
	let tag = `<table class="table table-bordered">
		<thead>
			<tr>
				<th>충전소 위치</th>
				<th>휴점일</th>
				<th>이용 가능 시작 시각</th>
				<th>이용 가능 종료 시각</th>
				<th>급속 충전 타입</th>
				<th>완속 충전기 대수</th>
				<th>급속 충전기 대수</th>
				<th>지번 주소</th>
			</tr>
		</thead>
		<tbody>`;
	for (el of data) {
		tag += `
			<tr>
				<td><a class='chargingPlaceDetailInfo' href='${el.chargingPlace}'>${el.chargingPlace}</a></td>
				<td>${el.holiday}</td>
				<td>${el.startTime}</td>
				<td>${el.endTime}</td>
				<td>${el.quickChargingType}</td>
				<td>${el.chargerCount}</td>
				<td>${el.quickChargerCount}</td>
				<td>${el.addressJibun}</td>
			</tr>`
	}
	tag += `
		</tbody>
	</table>`;

	$(".chargingStationList").html(tag);

	// 충전소 상세정보 모달창 띄우기
	$(".chargingStationList").on("click", ".chargingPlaceDetailInfo", function(event) {
		event.preventDefault();
		let chargingPlace = $(this).attr('href');
		let detailForm = $('#chargingPlaceDetailForm');
		detailForm.find("h1").text(chargingPlace);

		let apiKey = "po6or3j0tjcr3jpr6t6tpjj_2c32e0b3";

		// 쿼리 파라미터 초기값
		let params = {
			number: 1,
			chargingPlace: chargingPlace
		};

		$.ajax({
			url: 'https://open.jejudatahub.net/api/proxy/atDab6t8218btaa122b26DDtbatD86t1/' + apiKey,
			type: 'get',
			data: params,
			dataType: "text",
			success: function(result) {
				let obj = JSON.parse(result);
				let data = obj["data"];

				let tag = `
					<div>충전소 위치 : ${data[0].chargingPlace}</div>
					<div>휴점일 : ${data[0].holiday}</div>
					<div>이용 가능 시작 시각 : ${data[0].startTime}</div>
					<div>이용 가능 종료 시각 : ${data[0].endTime}</div>
					<div>완속 충전 가능 여부 : ${data[0].chargingFlag}</div>
					<div>급속 충전 가능 여부 : ${data[0].quickChargingFlag}</div>
					<div>급속 충전 타입 : ${data[0].quickChargingType}</div>
					<div>완속 충전기 대수 : ${data[0].chargerCount}</div>
					<div>급속 충전기 대수 : ${data[0].quickChargerCount}</div>
					<div>주차료 부과 여부 : ${data[0].parkingFeeFlag}</div>
					<div>도로명 주소 : ${data[0].addressDoro}</div>
				`;

				detailForm.find(".modal-body").find("div").eq(0).html(tag);

				mapRender(data);

				detailForm.modal('show');
				
			}
		});

	})

}



function getData(params) {
	let apiKey = "po6or3j0tjcr3jpr6t6tpjj_2c32e0b3";

	$.ajax({
		url: 'https://open.jejudatahub.net/api/proxy/atDab6t8218btaa122b26DDtbatD86t1/' + apiKey,
		type: 'get',
		data: params,
		dataType: "text",
		success: function(result) {
			let obj = JSON.parse(result);
			let data = obj["data"];
			let totCnt = obj["totCnt"];

			chargingStationListRender(data);
			paginationRender(params, totCnt);
			//mapRender(data);
		}
	});
}



$(function() {

	// 쿼리 파라미터 초기값
	let params = {
		number: 1,  // 페이지 번호
		limit: 10,  // 페이지당 항목 개수
	};
	getData(params);

	// 검색

});