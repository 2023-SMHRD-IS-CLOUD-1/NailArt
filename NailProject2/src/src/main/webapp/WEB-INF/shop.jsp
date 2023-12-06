<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Shop</title>
	<link rel="stylesheet" href="assets/css/shop.css" />
	<link href="css/font-awesome.min.css" rel="stylesheet" />
</head>

<body>
	<div class="container">
		<div class="centered">
			<div id="top">
				<!-- 상단바 -->
				<div id="topBar">
					<p>Nail</p>
					<div id="menu">
						<a href="index.html">Home</a>
						<a href="#">Design</a>
						<a href="#">Shop</a>
					</div>
					<a href="login.html">
						<i class="fa fa-user" aria-hidden="true"></i>
					</a>
				</div>
				<hr style="width: 95%;">

				<!--검색창 -->
				<form action="https://search.naver.com/search.naver">
					<div class="search">
						<input type="text" name="query" value="">
						<button type="submit">
							<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
						</button>
					</div>
				</form>
			</div>

			<!--가게 목록 -->
			<div id="bottom">
				<div class="shops">
					<ol id="shop">
						<div class="subTop">
							<div id="ment">원하는 가게를 선택해주세요</div>
							<div id="sortRange">
								<select name="sort">
									<option value="distance">거리순</option>
									<option value="score">평점순</option>
								</select>
							</div>
						</div>
						<li onclick="navigateToPage('#')">
							<div class="left">
								<img
									src="data:image/png;base64,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">
							</div>
							<div class="right">
								<div class="shopName">
									<span>달달네일</span>
								</div>
								<div class="location">
									<i class="fa fa-location-arrow"></i>
									<span>광주 남구</span>
								</div>
								<div class="shopNumber">
									<i class="fa fa-phone"></i>
									<span>062-123-4567</span>
								</div>
								<div class="openingtime">
									<i class=" fa fa-clock-o"></i>
									<div>
										<!---->
										<span>영업중</span>
									</div>
									<div>
										<span>10:30 ~</span>
									</div>
									<div>
										<span>20:00</span>
									</div>
								</div>
							</div>
						</li>
						<li onclick="navigateToPage('#')">
							<div class="left">
								<img
									src="data:image/png;base64,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">
							</div>
							<div class="right">
								<div class="shopName">
									<span>달달네일</span>
								</div>
								<div class="location">
									<i class="fa fa-location-arrow"></i>
									<span>광주 남구</span>
								</div>
								<div class="shopNumber">
									<i class="fa fa-phone"></i>
									<span>062-123-4567</span>
								</div>
								<div class="openingtime">
									<i class=" fa fa-clock-o"></i>
									<div>
										<!---->
										<span>영업중</span>
									</div>
									<div>
										<span>10:30 ~</span>
									</div>
									<div>
										<span>20:00</span>
									</div>
								</div>
							</div>
						</li>
						<li onclick="navigateToPage('#')">
							<div class="left">
								<img
									src="data:image/png;base64,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">
							</div>
							<div class="right">
								<div class="shopName">
									<span>달달네일</span>
								</div>
								<div class="location">
									<i class="fa fa-location-arrow"></i>
									<span>광주 남구</span>
								</div>
								<div class="shopNumber">
									<i class="fa fa-phone"></i>
									<span>062-123-4567</span>
								</div>
								<div class="openingtime">
									<i class=" fa fa-clock-o"></i>
									<div>
										<!---->
										<span>영업중</span>
									</div>
									<div>
										<span>10:30 ~</span>
									</div>
									<div>
										<span>20:00</span>
									</div>
								</div>
							</div>
						</li>
						<li onclick="navigateToPage('#')">
							<div class="left">
								<img
									src="data:image/png;base64,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">
							</div>
							<div class="right">
								<div class="shopName">
									<span>달달네일</span>
								</div>
								<div class="location">
									<i class="fa fa-location-arrow"></i>
									<span>광주 남구</span>
								</div>
								<div class="shopNumber">
									<i class="fa fa-phone"></i>
									<span>062-123-4567</span>
								</div>
								<div class="openingtime">
									<i class=" fa fa-clock-o"></i>
									<div>
										<!---->
										<span>영업중</span>
									</div>
									<div>
										<span>10:30 ~</span>
									</div>
									<div>
										<span>20:00</span>
									</div>
								</div>
							</div>
						</li>
					</ol>
				</div>
				<button id="scrollTopButton">위로</button>
			</div>
			<script>
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


			</script>

</body>

</html>