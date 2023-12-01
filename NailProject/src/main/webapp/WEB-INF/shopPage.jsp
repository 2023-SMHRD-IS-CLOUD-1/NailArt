<%@page import="com.smhrd.model.ShopDAO"%>
<%@page import="com.smhrd.model.ShopVO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Design</title>
<link rel="stylesheet" href="assets/css/shopPage.css" />
<link href="css/font-awesome.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 카카오맵 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4e8fa4b54164e23551ce19f4755a2ce&libraries=services"></script>

<!-- pretendard 폰트 -->
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />

<!-- 모달창 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


</head>

<body>
	<%
	// 파라미터에서 가게 ID 추출
	String mem_id = request.getParameter("mem_id");
	//System.out.println(storeName); //--> shopName이름을 가진 녀석의 밸류값

	// 가게 ID를 사용하여 데이터베이스에서 가게 정보 조회
	ShopVO vo = new ShopVO();
	vo.setMemId(mem_id);
	ShopDAO shopDAO = new ShopDAO();
	ShopVO shopInfo = shopDAO.getShopInfo(vo);

	if (shopInfo != null) {
		session.setAttribute("shopInfo", shopInfo);
		System.out.println("가게 정보 가져오기 성공");
		System.out.println(shopInfo.getShopName());
	} else {
		System.out.println("가게 정보 가져오기 실패");

	}
	%>



			<div id="top">
				<!-- 상단바 -->
				<div id="topBar">
					<p>Nail</p>
					<div id="menu">
						<a href="Gomain.do">Home</a> <a href="God	esign.do">Design</a> <a
							href="ShopSelectAll.do">Shop</a>
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
								</div>
								<hr class="hrpink">
							</div>
						</c:forEach>
					</div>
					<div id="appointmentBox" class="form">
						<h2>예약</h2>
						<hr class="hrpink">
						<div id="appointment">

							<!-- 모달창 -->
							<div class="appointment_content">
								<div style="position: relative; margin-bottom: 7px;">
								<label style="font-size: 20px">디자이너 선택:</label> <select id="designerSelect">
									<option value="선택하세요">선택하세요</option>
									<c:forEach var="staff" items="${staffList}">
										<option value="${staff.getStaffSeq()}">${staff.getStaffName()}</option>
									</c:forEach>
								</select>
								</div>
								<div id="calendar-container"></div>
								<br> <label>오전</label> <br>
								<div class="time-buttons">
									<button onclick="selectTime('09:00')" data-time="09:00">09시</button>
									<button onclick="selectTime('10:00')" data-time="10:00">10시</button>
									<button onclick="selectTime('11:00')" data-time="11:00">11시</button>
									<button onclick="selectTime('12:00')" data-time="12:00">12시</button>
									</div>
									<br> <label>오후</label> <br>
									<div class="time-buttons">
									<button onclick="selectTime('13:00')" data-time="13:00">01시</button>
									<button onclick="selectTime('14:00')" data-time="14:00">02시</button>
									<button onclick="selectTime('15:00')" data-time="15:00">03시</button>
									<button onclick="selectTime('16:00')" data-time="16:00">04시</button>
									<br>
									<br>
									<button onclick="selectTime('17:00')" data-time="17:00">05시</button>
								</div>
								<br>
								<button type="button" onclick="submitReservation()">예약
									신청하기</button>
							</div>


							<!-- 모달창 끝 -->
						</div>


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


				<button id="scrollTopButton">위로</button>
			</div>
			<script>

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


			/////////////////////////////////////////예약창//////////////////////////////////////////////////
			var time = ''
			var designer =''
			function selectTime(time) {
				// 기존에 선택된 버튼이 있다면 클래스 제거
			    var selectedButton = document.querySelector('.time-buttons button.selected');
			    if (selectedButton) {
			        selectedButton.classList.remove('selected');
			    }


			    // 선택된 버튼에 클래스 추가
			    var selectedTimeButton = document.querySelector('.time-buttons button[data-time="' + time + '"]');
			    if (selectedTimeButton) {
			        selectedTimeButton.classList.add('selected');
			    }
				this.time = time;
			    
			}
			function submitReservation() {
			    var designerSelect = document.getElementById('designerSelect');
			    var designer = designerSelect.value;
			    var designerName = designerSelect.options[designerSelect.selectedIndex].text;
			    var date = document.getElementById('calendar-container').value;
				
			    if (designer =='선택하세요' || date ==undefined || time =='' ){
			    	alert("모두 골라주세요");
			    }else{
			    	console.log(time);
			    	console.log(designer);
			    	console.log(date);
			    	console.log(designerName);
			    	if (confirm("디자이너 : " + designerName + "이(가) 맞습니까?") == true){    //확인
			    		alert("예약 완료");

			    	}else{   //취소
			    	      return;
			    	  }
			    	
			    }
			    
			    
			}
			
			flatpickrInstance = flatpickr("#calendar-container", {
            dateFormat: "Y-m-d",
            inline: true,
       		 });
			/////////////////////////////////////////예약창//////////////////////////////////////////////////


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