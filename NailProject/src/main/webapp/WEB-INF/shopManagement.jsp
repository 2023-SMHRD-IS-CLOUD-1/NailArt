<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Design</title>
<link rel="stylesheet" href="assets/css/shopManagement.css" />
<link href="css/font-awesome.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 카카오맵 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4e8fa4b54164e23551ce19f4755a2ce&libraries=services"></script>
	
<!-- 풀캘린더 -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.8.0/main.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<!-- pretendard 폰트 -->
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />



</head>

<body>
	<div class="container">
		<div class="centered">
			<div id="top">
				<!-- 상단바 -->
				<div id="topBar">
					<p>Nail</p>
					<div id="menu">
						<a href="index.html">Home</a> <a href="#">Design</a> <a
							href="shop.html">Shop</a>
					</div>
					<a href="login.html"> <i class="fa fa-user" aria-hidden="true"></i>
					</a>
				</div>
				<hr class="hrwhite">

				<div>
					<div id="thumbnailBox" class="form">
						<input type="file" id="thumbnailInput" accept="image/*"
							style="display: none;"> <img id="thumbnail"
							src="https://png.pngtree.com/png-vector/20190215/ourmid/pngtree-vector-question-mark-icon-png-image_515448.jpg"
							alt="">
						<h2>${shopInfo != null ? shopInfo.getShopName() : '가게 정보 없음'}</h2>
					</div>

					<div id="menu" class="form">
						<a onclick="showHome()">홈</a> <a onclick="showDesignerList()">스타일리스트</a>
						<a onclick="showAppointmentBox()">예약</a> <a
							onclick="showReviewList()">리뷰</a> <a onclick="showMap()">지도</a>
					</div>
					<div id="designerList" class="form">
						<h2>디자이너</h2>
						<hr class="hrpink">
						<button id="designerPlus">디자이너 추가</button>
					</div>
					<div id="appointmentBox" class="form">
						<h2>예약</h2>
						<hr class="hrpink">
						<div id="calendar"></div>

						<script defer
							src='https://static.cloudflareinsights.com/beacon.min.js'
							data-cf-beacon='{"token": "dc4641f860664c6e824b093274f50291"}'></script>
					</div>
					<div id="reviewList" class="form">
						<h2>리뷰</h2>
						<hr class="hrpink">
						<div class="form review">
							서비스 너무 최고였어요!
							<button class="reviewCommentbtn">답글 달기</button>
						</div>
					</div>
					<div id="mapbox" class="form">
						<h2>지도</h2>
						<hr class="hrpink">
						<div id="map" style="width: 100%; height: 350px;"></div>

					</div>

				</div>
			</div>


			<button id="scrollTopButton">위로</button>
		</div>
		<script>

			var designerPlus = document.getElementById("designerPlus");
			var designerList = document.getElementById("designerList");
			var appointmentBox = document.getElementById("appointmentBox");
			var reviewList = document.getElementById("reviewList");
			var mapbox = document.getElementById("mapbox");
			var thumbnail = document.getElementById("thumbnail")
			var thumbnailInput = document.getElementById("thumbnailInput");

			// 썸네일 사진 업로드

			thumbnail.onclick = function () {
				thumbnailInput.click();
			};

			// 파일 업로드 이벤트 처리
			thumbnailInput.addEventListener("change", function (event) {
				var file = event.target.files[0];

				if (file) {
					// 선택된 파일이 있으면 이미지 변경
					var reader = new FileReader();

					reader.onload = function (e) {
						thumbnail.src = e.target.result;
					};

					reader.readAsDataURL(file);

					// 파일 입력란을 비워서 동일한 파일을 다시 업로드할 수 있게 합니다.
					event.target.value = null;
				}
			});







			designerPlus.onclick = function () {
				var div = document.createElement("div");
				div.className = "designerItem";
				div.innerHTML = "designer";
				div.id = "designer";

				

				var buttonContainer = document.createElement("div");
				buttonContainer.className = "buttonContainer";

				var addButton = document.createElement("button");
				addButton.className = "addImageButton";
				addButton.innerHTML = "이미지 추가";



				// 파일 입력란 생성
				var fileInput = document.createElement("input");
				fileInput.type = "file";
				fileInput.accept = "image/*"; // 이미지 파일만 허용
				fileInput.style.display = "none"; // 파일 입력란 숨기기
				buttonContainer.appendChild(fileInput);

				addButton.onclick = function () {
					fileInput.click();
				};

				// 파일 입력 이벤트 처리
				fileInput.addEventListener("change", function (event) {
					var files = event.target.files;

					for (var i = 0; i < files.length; i++) {
						var designImage = document.createElement("img");
						designImage.className = "designImage";
						designImage.src = URL.createObjectURL(files[i]);
						designImage.onclick = function () {
							alert("이미지를 클릭했습니다.");
						};

						imageContainer.appendChild(designImage);
					}

					// 파일 입력란을 비워서 동일한 파일을 다시 업로드할 수 있게 합니다.
					event.target.value = null;
				});

				var deleteButton = document.createElement("button");
				deleteButton.className = "deleteButton";
				deleteButton.innerHTML = "디자이너 삭제";
				deleteButton.onclick = function () {
					deleteDesigner(div.id);
				};





				var imageContainer = document.createElement("div");
				imageContainer.className = "imageContainer";

				buttonContainer.appendChild(addButton);
				buttonContainer.appendChild(deleteButton);

				div.appendChild(buttonContainer);
				div.appendChild(imageContainer);
				designerList.appendChild(div);

				// "디자이너 추가" 버튼 클릭 시 hr 추가
				var hr = document.createElement("hr");
				// hr 요소에 스타일 적용
				hr.style.border = "0";
				hr.style.height = "1px";
				hr.style.background = "rgb(255,191,191)"; // 여기에 원하는 색상을 지정합니다.
				designerList.appendChild(hr);
			};

			function deleteDesigner(designerId) {
				var designerDiv = document.getElementById(designerId);
				designerDiv.parentNode.removeChild(designerDiv);
			}

			function showHome() {
				designerList.style.display = "block";
				appointmentBox.style.display = "block";
				reviewList.style.display = "block";
				mapbox.style.display = "block";
			}

			function showDesignerList() {
				designerList.style.display = "block";
				appointmentBox.style.display = "none";
				reviewList.style.display = "none";
				mapbox.style.display = "none";
			}

			function showAppointmentBox() {
				designerList.style.display = "none";
				appointmentBox.style.display = "block";
				reviewList.style.display = "none";
				mapbox.style.display = "none";
			}

			function showReviewList() {
				designerList.style.display = "none";
				appointmentBox.style.display = "none";
				reviewList.style.display = "block";
				mapbox.style.display = "none";
			}

			function showMap() {
				designerList.style.display = "none";
				appointmentBox.style.display = "none";
				reviewList.style.display = "none";
				mapbox.style.display = "block";
			}


			/////////////////////////////////////////스케쥴표//////////////////////////////////////////////////

			document.addEventListener('DOMContentLoaded', function () {
				var calendarEl = document.getElementById('calendar');

				var calendar = new FullCalendar.Calendar(calendarEl, {
					timeZone: 'UTC',
					initialView: 'resourceTimelineDay',
					aspectRatio: 1.5,
					headerToolbar: {
						left: 'prev,next',
						center: 'title',
						right: 'resourceTimelineDay,resourceTimelineWeek,resourceTimelineMonth'
					},

					editable: true,
					resourceAreaHeaderContent: '디자이너',
					schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source',
					resources: [
						{ "id": "a", "title": "디자이너 A" },
						{ "id": "b", "title": "디자이너 B", "eventColor": "green" },
					],
					events: [
						{ "resourceId": "a", "title": "예약", "start": "2023-11-24T10:00:00", "end": "2023-11-24T11:00:00" },
						{ "resourceId": "a", "title": "예약", "start": "2023-11-24T11:00:00", "end": "2023-11-24T12:00:00" },
						{ "resourceId": "a", "title": "예약", "start": "2023-11-24T12:00:00", "end": "2023-11-24T13:00:00" },
						{ "resourceId": "a", "title": "예약", "start": "2023-11-24T13:00:00", "end": "2023-11-24T14:00:00" },
						{ "resourceId": "a", "title": "예약", "start": "2023-11-24T14:00:00", "end": "2023-11-24T15:00:00" },
						{ "resourceId": "a", "title": "예약", "start": "2023-11-24T15:00:00", "end": "2023-11-24T16:00:00" },
						{ "resourceId": "a", "title": "예약", "start": "2023-11-24T16:00:00", "end": "2023-11-24T17:00:00" },
						{ "resourceId": "a", "title": "예약", "start": "2023-11-24T17:00:00", "end": "2023-11-24T18:00:00" },

						{ "resourceId": "b", "title": "예약", "start": "2023-11-24T10:00:00", "end": "2023-11-24T11:00:00" },
						{ "resourceId": "b", "title": "예약", "start": "2023-11-24T11:00:00", "end": "2023-11-24T12:00:00" },
						{ "resourceId": "b", "title": "예약", "start": "2023-11-24T12:00:00", "end": "2023-11-24T13:00:00" },
						{ "resourceId": "b", "title": "예약", "start": "2023-11-24T13:00:00", "end": "2023-11-24T14:00:00" },
						{ "resourceId": "b", "title": "예약", "start": "2023-11-24T14:00:00", "end": "2023-11-24T15:00:00" },
						{ "resourceId": "b", "title": "예약", "start": "2023-11-24T15:00:00", "end": "2023-11-24T16:00:00" },
						{ "resourceId": "b", "title": "예약", "start": "2023-11-24T16:00:00", "end": "2023-11-24T17:00:00" },
						{ "resourceId": "b", "title": "예약", "start": "2023-11-24T17:00:00", "end": "2023-11-24T18:00:00" },

					],
					// businessHours: {
					//     startTime: '10:00',
					//     endTime: '18:00'
					// },
					slotMinTime: '10:00',
					slotMaxTime: '18:00',
					locale: 'ko'
				});

				calendar.render();
			});
			/////////////////////////////////////////스케쥴표//////////////////////////////////////////////////


			// 지도 시작/////////////////////////

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level: 3 // 지도의 확대 레벨
				};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 위도와 경도 정보
        	var latitude = ${shopInfo.getLat()};
        	var longitude = ${shopInfo.getLng()};

			// 위도와 경도로 LatLng 객체 생성
			var coords = new kakao.maps.LatLng(latitude, longitude);

			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map: map,
				position: coords
			});

			// 인포윈도우로 장소에 대한 설명을 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
				content: '<div style="width:150px;text-align:center;padding:6px 0;">${shopInfo.getShopName()}</div>'
			});
			infowindow.open(map, marker);

			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);

			// 지도 끝///////////////


			// JavaScript로 스크롤 버튼을 누르면 맨 위로 스크롤하는 기능을 추가합니다.
			const scrollTopButton = document.getElementById('scrollTopButton');

			// 버튼을 숨기거나 보이기 위한 함수
			function toggleScrollButton() {
				if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
					scrollTopButton.style.display = 'block';
				} else {
					scrollTopButton.style.display = 'none';
				}
			}

			// 스크롤 이벤트 시 버튼을 보이거나 숨깁니다.
			window.addEventListener('scroll', toggleScrollButton);

			// 버튼 클릭 시 맨 위로 스크롤
			scrollTopButton.addEventListener('click', () => {
				window.scrollTo({ top: 0, behavior: 'smooth' }); // 맨 위로 부드럽게 스크롤
			});

			function handleImageChange(event) {
				const file = event.target.files[0];
				const reader = new FileReader();

				reader.onload = function (e) {
					const imgSrc = e.target.result;
					const handImg = document.getElementById('handImg');
					handImg.innerHTML = `<img src="${imgSrc}" alt="Uploaded Image">`;
				};

				reader.readAsDataURL(file);
			}
		</script>
</body>

</html>