<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Design</title>
	<link rel="stylesheet" href="css/design.css" />
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
						<a href="shop.html">Shop</a>
					</div>
					<a href="login.html">
						<i class="fa fa-user" aria-hidden="true"></i>
					</a>
				</div>
				<hr style="width: 95%;">
				<!--손 사진 업로드 -->
				<div id="handImg">
					<img src="images/hand.jpeg">
				</div>
				<!--버튼 2개 -->
				<div class="buttons">
					<label for="fileInput" class="btn-hover label-color-1">
						Hand Upload
						<input type="file" id="fileInput" hidden onchange="handleImageChange(event)">
					</label>
					<button class="btn-hover color-2">Select</button>
				</div>
				<div id="tip">
					<p>📌손 사진을 업로드 해주세요</p>
					<p>📌디자인을 선택해주세요</p>
				</div>
			</div>

			<!--디자인 목록 -->
			<div id="bottom">
				<div class="design-list">
					<div class="leftImg">
						<button>
							<img
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwuN5ZfzjATCcyeZnY8hoDvY1jhcsMm2EqEi6fICPKw2TCGhThzHSUw2-XEGcRhFBig7w&usqp=CAU">
						</button>
						<button>
							<img
								src="data:image/jpeg;base64,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">
						</button>
						<button>
							<img
								src="data:image/jpeg;base64,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">
						</button>
					</div>

					<div class="rightImg">
						<button>
							<img
								src="data:image/jpeg;base64,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">
						</button>
						<button>
							<img
								src="data:image/jpeg;base64,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">
						</button>
					</div>
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