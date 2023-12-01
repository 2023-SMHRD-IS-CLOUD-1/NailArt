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

<!-- 리뷰페이지 별모양 링크-->
<style type="text/css">
@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

@import
	url("https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Open+Sans:wght@400;600;700&display=swap")
	;
</style>


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
						<c:forEach var="staff" items="${staffList}">
							<div class="designer">
								<div style="height: 40px">
									<span> ${staff.getStaffName()} </span>
									<div class="designerButton">
										<button class="addImageButton">이미지 추가</button>
										<button class="deleteButton" id="${staff.getStaffSeq()}">디자이너
											삭제</button>
									</div>
								</div>


								<hr class="hrpink">
							</div>
						</c:forEach>
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




						<!-- 23.11.30~12.01 리뷰폼 -->
						<div class='table_layout'>
							<form action="Review" method="post" enctype="multipart/form-data">
								<table border="0">
									<tr class='review_tr'>
										<td class='re_td' colspan="2">
											<button class='no_outline_btn'>디자이너 선택</button> <select>
												<option>김씨</option>
												<option>이씨</option>
												<option>정씨</option>
										</select>
											<button class='no_outline_btn'>네일이름</button> <select>
												<option>김씨</option>
												<option>이씨</option>sss
												<option>정씨</option>
										</select>
										</td>
									</tr>
									<tr class='review_tr'>
										<td>
											<button class='no_outline_btn' id='star1'>별점</button>
										</td>

										<td class="left-align">
											<fieldset class="rate"
												style="position: relative; width: 142px; border: 0px;">

												<input type="radio" id="rating10" name="rating" value="10">
												<label for="rating10" title="5점"></label> <input
													type="radio" id="rating9" name="rating" value="9">
												<label class="half" for="rating9" title="4.5점"></label> <input
													type="radio" id="rating8" name="rating" value="8">
												<label for="rating8" title="4점"></label> <input type="radio"
													id="rating7" name="rating" value="7"> <label
													class="half" for="rating7" title="3.5점"></label> <input
													type="radio" id="rating6" name="rating" value="6">
												<label for="rating6" title="3점"></label> <input type="radio"
													id="rating5" name="rating" value="5"> <label
													class="half" for="rating5" title="2.5점"></label> <input
													type="radio" id="rating4" name="rating" value="4">
												<label for="rating4" title="2점"></label> <input type="radio"
													id="rating3" name="rating" value="3"> <label
													class="half" for="rating3" title="1.5점"></label> <input
													type="radio" id="rating2" name="rating" value="2">
												<label for="rating2" title="1점"></label> <input type="radio"
													id="rating1" name="rating" value="1"> <label
													class="half" for="rating1" title="0.5점"></label>

											</fieldset>
										</td>

									</tr>
									<tr class='review_tr'>
										<td>
											<button class='upload' style="width: 78px">사진첨부</button>
										</td>
										<td>
											<button class='no_outline_btn'>리뷰작성</button>
										</td>

									</tr>
									<tr>
										<td>
											<input type="file" class="real-upload" accept="image/*" required multiple>
											<ul class="image-preview" style="padding: 0px;"></ul>
											<script>
    											function getImageFiles(e) {
      											   const uploadFiles = [];
   												   const files = e.currentTarget.files;
      											   const imagePreview = document.querySelector('.image-preview');
      											   const docFrag = new DocumentFragment();

     											if ([...files].length >= 7) {
        											alert('이미지는 최대 6개 까지 업로드가 가능합니다.');
       												return;
    										     }

      											// 파일 타입 검사
      											[...files].forEach(file => {
        										if (!file.type.match("image/.*")) {
          											alert('이미지 파일만 업로드가 가능합니다.');
          											return
        										}

       											 // 파일 갯수 검사
       										    if ([...files].length < 7) {
          											uploadFiles.push(file);
          											const reader = new FileReader();
         										    reader.onload = (e) => {
            										const preview = createElement(e, file);
            										imagePreview.appendChild(preview);
          											};
          											reader.readAsDataURL(file);
        										   }
      											 });
    											}

    											function createElement(e, file) {
      											   const li = document.createElement('li');
      											   const img = document.createElement('img');
    											   img.setAttribute('src', e.target.result);	
      											   img.setAttribute('data-file', file.name);
      											   li.appendChild(img);

      												return li;
    											}

    												const realUpload = document.querySelector('.real-upload');
   												    const upload = document.querySelector('.upload');
	
    												upload.addEventListener('click', () => realUpload.click());

   												    realUpload.addEventListener('change', getImageFiles);
  												</script>
  										</td>
										<td>
											<input type="text" name="review" id="revi">
										</td>
									</tr>

									<tr align="center">
										<td colspan="2">
											<input id="sig1" type="submit" value="등록하기">
										</td>
									</tr>
								</table>
							</form>
							
							
							
							
							
							
							
							
							
							    <!-- 실제로 보여질 새로운 테이블 -->
    <table class="new-table" border="1">
      <thead>
        <tr>
          <th>디자이너</th>
          <th>네일이름</th>
          <th>별점</th>
          <th>이미지</th>
          <th>리뷰</th>
        </tr>
      </thead>
      <tbody id="newTableBody">
        <!-- 여기에 동적으로 추가될 행이 표시됩니다 -->
      </tbody>
    </table>

    <script>
      let rowCount = 0;

      function addNewTableRow(event) {
        // 폼의 기본 제출 동작 막기
        event.preventDefault();

        // 새로운 행을 생성
        const newRow = document.createElement('tr');
        const designerCell = document.createElement('td');
        const nailNameCell = document.createElement('td');
        const ratingCell = document.createElement('td');
        const imageCell = document.createElement('td');
        const reviewCell = document.createElement('td');

        // 행에 열 추가 (폼에서 선택한 값들을 가져와서 추가)
        designerCell.textContent = document.querySelector('select[name="designer"]').value;
        nailNameCell.textContent = document.querySelector('select[name="nailName"]').value;
        ratingCell.textContent = getSelectedRating();
        imageCell.textContent = '이미지';  // 이미지 업로드 부분은 실제 파일 업로드로 변경 필요
        reviewCell.textContent = document.getElementById('revi').value;

        newRow.appendChild(designerCell);
        newRow.appendChild(nailNameCell);
        newRow.appendChild(ratingCell);
        newRow.appendChild(imageCell);
        newRow.appendChild(reviewCell);

        // 새로운 행을 테이블의 맨 위에 추가
        const newTableBody = document.getElementById('newTableBody');
        newTableBody.insertBefore(newRow, newTableBody.firstChild);

        // 새로운 테이블을 보이도록 설정
        const newTable = document.querySelector('.new-table');
        newTable.style.display = 'block';

        // 폼 초기화
        document.querySelector('form').reset();

        // 최대 5개까지만 추가
        rowCount++;
        if (rowCount >= 5) {
          document.querySelector('input[type="submit"]').disabled = true;
        }

        return false; // 폼 제출 방지
      }

      // 선택된 별점 가져오기
      function getSelectedRating() {
        const selectedRating = document.querySelector('input[name="rating"]:checked');
        return selectedRating ? selectedRating.value : 'N/A';
      }
    </script>

						</div>
					</div>
				</div>
				<!-- 23.12.01 여기까지 -->











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
			var deleteButtons = document.getElementsByClassName("deleteButton");

			
			// 디자이너 추가 코드

			designerPlus.onclick = function () {
			    var designerName = prompt("디자이너 이름을 입력하세요");

			    if (designerName) {
			        // 사용자가 이름을 입력하고 확인을 누르면 AJAX를 이용해 서버로 전송
			        addDesignerToDatabase(designerName);
			    }
			};

			function addDesignerToDatabase(designerName) {
			    // AJAX를 이용한 서버로의 요청
			    $.ajax({
			        type: "POST",
			        url: "AddDesigner.do", // 서블릿 매핑 이름
			        data: {
			            designerName: designerName
			            // 여기에 다른 필요한 데이터도 추가 가능
			        },
			        success: function (response) {
			            // 서버에서의 응답에 따른 처리
			            console.log("디자이너 추가 성공:", response);
			            // 추가적으로 화면 갱신 등을 수행할 수 있음
			        },
			        error: function (error) {
			            // 오류 발생 시 처리
			            console.error("디자이너 추가 실패:", error);
			        }
			    });
			}
			
			// 디자이너 삭제 코드
			for (var i = 0; i < deleteButtons.length; i++) {
   				deleteButtons[i].onclick = function () {
			    var staff_seq = this.id; // 삭제 버튼이 속한 디자이너 div의 id
			    $.ajax({
			        type: "POST",
			        url: "DeleteDesigner.do", // 서블릿 매핑 이름
			        data: {
			        	staff_seq: staff_seq // 디자이너의 고유한 seq를 서버로 전송
			            // 여기에 다른 필요한 데이터도 추가 가능
			        },
			        success: function (response) {
			            // 서버에서의 응답에 따른 처리
			            console.log("디자이너 삭제 성공:", response);
			            // 추가적으로 화면 갱신 등을 수행할 수 있음
			            location.reload(); // 또는 비동기 방식으로 화면을 업데이트하는 함수 호출
			        },
			        error: function (error) {
			            // 오류 발생 시 처리
			            console.error("디자이너 삭제 실패:", error);
			        }
			    });
			};
			}
			
			

			
			
			

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