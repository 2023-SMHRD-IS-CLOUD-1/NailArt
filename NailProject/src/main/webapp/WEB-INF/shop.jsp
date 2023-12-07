<%@page import="com.smhrd.model.ShopVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Shop</title>
<link rel="stylesheet" href="assets/css/shop.css" />
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
#pagination {
	margin: auto;
}

#pagination button {
	background-color: white;
	border-radius: 5px;
	border-color: white;
	width: 50px;
	height: 30px;
}

#sort {
	background-color: white;
	border-radius: 5px;
	border-color: white;
}
</style>
<body>
	<div class="container">
		<div class="centered">
			<div id="top">
				<!-- 상단바 -->
				<div id="topBar">
					<p>Nail</p>
					<div id="menu">
						<a href="Gomain.do">Home</a> <a href="Godesign.do">Design</a> <a
							href="#">Shop</a>
					</div>
					<c:if test="${result==null}">
						<a href="Gosign.do"> <i class="fa fa-user" aria-hidden="true"></i></a>
					</c:if>
					<c:if test="${result!=null}">
						<a href="Gomypage.do"> <i class="fa fa-user"
							aria-hidden="true"></i></a>
					</c:if>
					</a>
				</div>
				<hr style="width: 95%;">

				<!--검색창 -->
				<form id="searchForm">
					<div class="search">
						<input type="text" id="searchInput" name="query" value="">
						<button type="button" onclick="searchShop()">
							<img
								src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
						</button>
					</div>
				</form>

			</div>

			<div id="bottom">
				<!-- 정렬선택 -->
				<div class="subTop">
					<div id="sortRange">
						<label for="sort">정렬: </label> <select id="sort" name="sort"
							onchange="sortShopList()">
							<option>선택하세요</option>
							<option value="score">평점순</option>
						</select>
					</div>
				</div>

				<!-- shop 리스트 -->
				<div class="shops">
					<ol id="shop">
						<c:set var="google" value="https://drive.google.com/uc?export=view&id=" />
						<c:forEach var="shop" items="${shopList}">
							<li onclick="navigateToPage(event)" id="${shop.getMemId()}">
								<div class="left">
									<c:set var="imgSrc" value="${google}${shop.getShop_img()}"/>
									<img src="${imgSrc}">
								</div>
								<div class="right">
									<div class="shopName">
										<span> ${shop.getShopName()} </span>
									</div>
									<div class="location">
										<i class="fa fa-location-arrow"></i> <span>${shop.getShop_addr1() }</span>
									</div>
									<div class="shopNumber">
										<i class="fa fa-phone"></i> <span>${shop.getShopTel() }</span>
									</div>
									<div class="openingtime">
										<i class=" fa fa-clock-o"></i>
										<div>
											<span>영업중</span>
										</div>
										<div>
											<span>${shop.getOpenTime()}:00 ~</span>
										</div>
										<div>
											<span>${shop.getCloseTime()}:00</span>
										</div>
									</div>
									<div class="averScore">
										<i class="fa fa-phone"></i> <span>${shop.getReview_rating() }</span>
									</div>
								</div>
							</li>
						</c:forEach>

					</ol>
				</div>

				<script type="text/javascript">
                  function searchShop() {
                      const input = document.getElementById('searchInput').value.toLowerCase();
                      const shops = document.getElementById('shop').getElementsByTagName('li');
                      const pagination = document.getElementById('pagination');
      
                      pagination.style.display = 'block';
                      for (let i = 0; i < shops.length; i++) {
                          const shopName = shops[i].getElementsByClassName('shopName')[0].innerText.toLowerCase();
      
                          if (shopName.includes(input)) {
                              shops[i].style.display = 'block';
                          } else {
                              shops[i].style.display = 'none';
                          }
                      }
      
                      pagination.style.display = 'none';
                  }

                  // 평점순 내림차순 정렬
                  function sortShopList() {
                   var selectedOption = document.getElementById('sort').value;
                   if (selectedOption == 'score') {
                       $.ajax({
                           type: 'POST',
                           url: 'ShopSelectSort.do', 
                           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                           dataType : 'json', 
                           success: function (result) {
                              console.log("결과값>>",result);
                               $('#shop').empty(); // 현재 상점 목록을 지웁니다
                              //$('#shop').append(result); // 서버로부터 받은 업데이트된 상점 목록을 추가합니다
               
                              result.forEach(function(item) {
                              // li 태그 생성
                                  const newLi = document.createElement('li');
                                  newLi.id = item.mem_id; // 가게 ID 설정
                                  
                                  newLi.addEventListener('click', ()=>{
                                	  navigateToPage(event);
                                  })
                                  
                                  // newLi.onclick = function(event) {};
                               
                                  // left div
                                  const leftDiv = document.createElement('div');
                                  leftDiv.classList.add('left');
                                  const img = document.createElement('img');
                                  img.src = "https://drive.google.com/uc?export=view&id="+item.shop_img; // 이미지 소스 설정
                                  leftDiv.appendChild(img);
                                  
                                  // right div
                                  const rightDiv = document.createElement('div');
                                  rightDiv.classList.add('right');

                                  // shopName div
                                  const shopNameDiv = document.createElement('div');
                                  shopNameDiv.classList.add('shop_name');
                                  const shopNameSpan = document.createElement('span');
                                  shopNameSpan.textContent = item.shop_name; // 가게 이름 설정
                                  shopNameDiv.appendChild(shopNameSpan);

                                  // location div
                                  const locationDiv = document.createElement('div');
                                  locationDiv.classList.add('shop_addr1');
                                  const locationIcon = document.createElement('i');
                                  locationIcon.classList.add('fa', 'fa-location-arrow');
                                  const locationSpan = document.createElement('span');
                                  locationSpan.textContent = item.shop_addr1; // 가게 주소 설정
                                  locationDiv.appendChild(locationIcon);
                                  locationDiv.appendChild(locationSpan);

                                  // shopNumber div
                                  const shopNumberDiv = document.createElement('div');
                                  shopNumberDiv.classList.add('shop_tel');
                                  const phoneIcon = document.createElement('i');
                                  phoneIcon.classList.add('fa', 'fa-phone');
                                  const phoneSpan = document.createElement('span');
                                  phoneSpan.textContent = item.shop_tel; // 가게 전화번호 설정
                                  shopNumberDiv.appendChild(phoneIcon);
                                  shopNumberDiv.appendChild(phoneSpan);

                                  // openingtime div
                                  const openingTimeDiv = document.createElement('div');
                                  openingTimeDiv.classList.add('open_time');
                                  const clockIcon = document.createElement('i');
                                  clockIcon.classList.add('fa', 'fa-clock-o');
                                  const openSpan = document.createElement('span');
                                  openSpan.textContent = item.open_time + ':00 ~'; // 영업 시작 시간 설정
                                  const closeSpan = document.createElement('span');
                                  closeSpan.textContent = item.close_time + ':00'; // 영업 종료 시간 설정
                                  openingTimeDiv.appendChild(clockIcon);
                                  openingTimeDiv.appendChild(openSpan);
                                  openingTimeDiv.appendChild(closeSpan);
                                  
                                  // openingtime div
                                  const shopScoreDiv = document.createElement('div');
                                  shopScoreDiv.classList.add('review_rating');
                                  const scoreIcon = document.createElement('i');
                                  scoreIcon.classList.add('fa', 'fa-phone');
                                  const scoreSpan = document.createElement('span');
                                  scoreSpan.textContent = item.review_rating; // 가게 전화번호 설정
                                  shopScoreDiv.appendChild(scoreIcon);
                                  shopScoreDiv.appendChild(scoreSpan);

                                  // rightDiv에 추가
                                  rightDiv.appendChild(shopNameDiv);
                                  rightDiv.appendChild(locationDiv);
                                  rightDiv.appendChild(shopNumberDiv);
                                  rightDiv.appendChild(openingTimeDiv);
                                  rightDiv.appendChild(shopScoreDiv);

                                  // li 태그에 left, right div 추가
                                  newLi.appendChild(leftDiv);
                                  newLi.appendChild(rightDiv);

                                  // #shop에 li 태그 추가
                                  $('#shop').append(newLi);
                           })
                              
                               updatePageButtons(); // 페이지 버튼 업데이트
                           },
                           error: function () {
                               alert('데이터를 불러오는 중 오류가 발생했습니다'); // AJAX 호출이 실패한 경우 오류 처리
                           }
                       });
                   }
               }
            </script>

				<div id="pagination">
					<button onclick="firstPage()"><<</button>
					<button onclick="prevPage()"><</button>

					<c:forEach var="page" begin="1" end="${totalPages}">
						<button onclick="gotoPage(${page})">${page}</button>
					</c:forEach>

					<button onclick="nextPage()">></button>
					<button onclick="lastPage()">>></button>
					<span id="currentPage">1</span>
				</div>


				<script>
             const shops = document.getElementById('shop');
             const currentPageElement = document.getElementById('currentPage');
             let currentPage = 1;
             const itemsPerPage = 5;  
             const totalPages = Math.ceil(shops.children.length / itemsPerPage);
             
             function updatePageButtons() {
                 const pagination = document.getElementById('pagination');
                 pagination.innerHTML = '';                 
                 
                 const prevButton = document.createElement('button');
                 prevButton.textContent = '<';
                 prevButton.onclick = function () {
                    prevSetOfPages();
                 };
                 pagination.appendChild(prevButton);

                 const startPage = (Math.ceil(currentPage / 5) - 1) * 5 + 1;
                 const endPage = Math.min(totalPages, startPage + 4);

                 for (let page = startPage; page <= endPage; page++) {
                     const button = document.createElement('button');
                     button.textContent = page;
                     button.onclick = function () {
                         gotoPage(page);
                     };

                     if (page === currentPage) {
                         button.classList.add('active');
                     }

                     pagination.appendChild(button);                 
                 }
             
             const nextButton = document.createElement('button');
              nextButton.textContent = '>';
              nextButton.onclick = function () {
                 nextSetOfPages();
              };
              pagination.appendChild(nextButton);
              }
             
             function showPage(page) {
                 const start = (page) * itemsPerPage;
                 const end = start + itemsPerPage;

                 for (let i = 0; i < shops.children.length; i++) {
                     shops.children[i].style.display = 'none';
                 }
         
                 for (let i = start; i < end; i++) {
                     if (shops.children[i]) {
                         shops.children[i].style.display = 'block';
                     }
                 }
         
                 currentPageElement.textContent = page;
                 updatePageButtons();
             }
         
             function prevSetOfPages() {
                 const startPage = Math.max(1, (Math.ceil(currentPage / 5) - 2) * 5 + 1);
                 const endPage = startPage + 4;
                 currentPage = startPage;
                 showPage(currentPage);
             }

             function nextSetOfPages() {
                 const startPage = (Math.ceil(currentPage / 5) * 5) + 1;
                 const endPage = Math.min(totalPages, startPage + 4);
                 currentPage = startPage;
                 showPage(currentPage);
             }
             
             function gotoPage(selectedPage) {
                 currentPage = parseInt(selectedPage);
                 showPage(currentPage);
             }
             
             function firstPage() {
                 currentPage = 1;
                 showPage(currentPage);
             }

             function lastPage() {
                 currentPage = totalPages;
                 showPage(currentPage);
             }
             
             showPage(currentPage);
         </script>

				<script>
            function navigateToPage(event) {
               const mem_id = event.currentTarget.id;
               
               console.log(mem_id);
               
                window.location.href = 'ShopPage.do?mem_id=' + mem_id;
             }
         
         
            /*
            const scrollTopButton = document.getElementById('scrollTopButton');

            function toggleScrollButton() {
               if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                  scrollTopButton.style.display = 'block';
               } else {
                  scrollTopButton.style.display = 'none';
               }
            }
            window.addEventListener('scroll', toggleScrollButton);

            scrollTopButton.addEventListener('click', () => {
               window.scrollTo({ top: 0, behavior: 'smooth' }); // 맨 위로 부드럽게 스크롤
            });
            */

            
         </script>
</body>

</html>