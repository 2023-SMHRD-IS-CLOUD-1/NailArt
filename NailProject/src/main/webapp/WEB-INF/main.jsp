<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" class="alt"> <a href="index.html"
			class="logo"><strong>Forty</strong> <span>by HTML5 UP</span></a> <nav>

		<c:if test="${result == null}">
			<a href="#menu">로그인</a>
		</c:if> <c:if test="${result != null}">
			<c:if test="${result.email == 'admin'}">
				<a href="SelectAll.do">전체회원조회</a>
			</c:if>
			<c:if test="${result.email != 'admin'}">
				<a href="Goupdate.do">개인정보수정</a>
			</c:if>
			<a href="Logout.do">로그아웃</a>
		</c:if> <!-- 로그인 후 Logout.로 이동할 수 있는'로그아웃'링크와 '개인정보수정'링크를 출력하시오. --> </nav> </header>

		<!-- Menu -->
		<nav id="menu">
		<ul class="links">
			<li><h5>로그인</h5></li>
			<form action="Login.do" method="post">
				<li><input type="text" name="email" placeholder="Email을 입력하세요"></li>
				<li><input type="password" name="pw" placeholder="PW를 입력하세요"></li>
				<li><input type="submit" value="LogIn" class="button fit"></li>
			</form>
		</ul>
		<ul class="actions vertical">
			<li><h5>회원가입</h5></li>
			<form action="Join.do" method="post">
				<li><input type="text" placeholder="Email을 입력하세요" name="email"></li>
				<li><input type="password" placeholder="PW를 입력하세요" name="pw"></li>
				<li><input type="text" placeholder="전화번호를 입력하세요" name="tel"></li>
				<li><input type="text" placeholder="집주소를 입력하세요" name="address"></li>
				<li><input type="submit" value="JoinUs" class="button fit"></li>
			</form>
		</ul>
		</nav>
		<!-- Banner -->
		<section id="banner" class="major">
		<div class="inner">
			<header class="major"> <c:if test="${result == null}">
				<h1>로그인 한 세션아이디를 출력해주세요</h1>
			</c:if> <c:if test="${result != null}">
				<h1>${result.email}님환영합니다.</h1>
			</c:if> <!-- 로그인 후 로그인 한 사용자의 세션아이디로 바꾸시오.
									 ex)smart님 환영합니다 --> </header>
			<div class="content">
				<p>
					아래는 지금까지 배운 웹 기술들입니다.<br>
				</p>
				<ul class="actions">
					<li><a href="#one" class="button next scrolly">확인하기</a></li>
				</ul>
			</div>
		</div>
		</section>

		<!-- Main -->
		<div id="main">

			<!-- One -->
			<section id="one" class="tiles"> <article> <span
				class="image"> <img src="images/pic01.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">HTML</a>
			</h3>
			<p>홈페이지를 만드는 기초 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic02.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">CSS</a>
			</h3>
			<p>HTML을 디자인해주는 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic03.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">Servlet/JSP</a>
			</h3>
			<p>Java를 기본으로 한 웹 프로그래밍 언어/스크립트 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic04.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">JavaScript</a>
			</h3>
			<p>HTML에 기본적인 로직을 정의할 수 있는 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic05.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">MVC</a>
			</h3>
			<p>웹 프로젝트 중 가장 많이 사용하는 디자인패턴</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic06.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">Web Project</a>
			</h3>
			<p>여러분의 최종프로젝트에 웹 기술을 활용하세요!</p>
			</header> </article> </section>
			<!-- Two -->
			<section id="two">
			<div class="inner">
				<header class="major">
				<h2>나에게 온 메세지 확인하기</h2>
				</header>
				<p></p>
				<ul class="actions">
					<li>로그인을 하세요.</li>
					<li><a href="#" class="button next scrolly">전체삭제하기</a></li>
				</ul>
			</div>
			</section>

		</div>

		<!-- Contact -->
		<section id="contact">
		<div class="inner">
			<section>
			<form>
				<div class="field half first">
					<label for="name">Name</label> <input type="text" id="name"
						placeholder="보내는 사람 이름" />
				</div>
				<div class="field half">
					<label for="email">Email</label> <input type="text" id="email"
						placeholder="보낼 사람 이메일" />
					<ul id = "check">
					
					</ul>
				</div>

				<div class="field">
					<label for="message">Message</label>
					<textarea id="message" rows="6"></textarea>
				</div>
				<ul class="actions">
					<li><input disabled="disabled" type="submit"
						value="Send Message" class="special" /></li>
					<li><input type="reset" value="Clear" /></li>
				</ul>
			</form>
			</section>

			<section class="split"> <section>
			<div class="contact-method">
				<span class="icon alt fa-envelope"></span>
				<h3>Email</h3>
				<c:if test="${result == null}">
					<a href="#">로그인 한 사람의 이메일을 출력</a>
				</c:if>
				<c:if test="${result != null}">
					<c:if test="${result.email != null}">
						<span>${result.email}</span>
					</c:if>
				</c:if>

				<!-- 로그인 한 사용자의 이메일을 출력하시오 -->
			</div>
			</section> <section>
			<div class="contact-method">
				<span class="icon alt fa-phone"></span>
				<h3>Phone</h3>
				<c:if test="${result == null}">
					<span>로그인 한 사람의 전화번호를 출력</span>
				</c:if>
				<c:if test="${result != null}">
					<c:if test="${result.tel != null}">
						<span>${result.tel}</span>
					</c:if>
				</c:if>
				<!-- 로그인 한 사용자의 전화번호를 출력하시오 -->
			</div>
			</section> <section>
			<div class="contact-method">
				<span class="icon alt fa-home"></span>
				<h3>Address</h3>
				<c:if test="${result == null}">
					<span>로그인 한 사람의 집주소를 출력</span>
				</c:if>
				<c:if test="${result != null}">
					<c:if test="${result.address != null}">
						<span>${result.address}</span>
					</c:if>
				</c:if>
				<!-- 로그인 한 사용자의 집주소를 출력하시오 -->
			</div>
			</section> </section>
		</div>
		</section>

		<!-- Footer -->
		<footer id="footer">
		<div class="inner">
			<ul class="icons">
				<li><a href="#" class="icon alt fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon alt fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon alt fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon alt fa-github"><span
						class="label">GitHub</span></a></li>
				<li><a href="#" class="icon alt fa-linkedin"><span
						class="label">LinkedIn</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled</li>
				<li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
		</footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

	<!-- 템플릿이 로드한 스크립트 아래에 자신의 코드를 작성하기. 불러오기 전에 함수를 실행하는 오류 발생할 수 잇음 -->
	<script type="text/javascript">
		// 1. jquery 라이브러리 로딩되어 있는지 확인
		// -- 라이브러리 로드하고 잇는 코드보다 아래쪽에 script 태그 열어줌
		// 보내는 사람 이름 input id = name
		// 보낼 사람 이메일 input id = email
		// message feild input id = message
		var name = document.getElementById("name");
		var email = document.getElementById("email");
		var message = document.getElementById("message");

		// email.addEventListener("keydown", function (event) {
		// 	console.log("집에가고싶어");
		// })

		$("#email").on("keyup", function() {
			var inputData = $(this).val();
			var obj = {
				receive_email : inputData
			};

			// 비동기 통신방식으로 servlet 데이터 보내기
			// ---> 이메일 존재하는지 여부룰 db에서 체크

			$.ajax({
				// 1. 어떤 url로 데이터를 전송(요청url)
				url : "EmailCheck.do",

				// 2. 어떤 데이터를 보내줄 건지(선택사항)
				// ** 데이터를 보내줄 때는 항상 key와 value 한쌍으로 묶어서 보내줘야한다!
				// key와 value 한쌍으로 묶어서 표현할 수 있는 js 자료형은? 객!체!
				data : obj,

				// 5. 응답받아온 데이터의 형식을 지정
				dataType : "json",

				// 3. 성공했을 때 실행할 함수 --> 콜백함수
				success : function(res) {
					// 데이터 통신이 성공한다면, 자동으로 해당하는 함수 실행

					// 이름만 꺼내오려면?
					if (res.emailCheck == "true") {
						$(".special").attr("disabled", false);
						$("#check").empty();
						$("#check").append("<li>일치하는 이메일이 있습니다.</li>");
						$("#check").css("color", "green");
						
					} else {
						$(".special").attr("disabled", true);
						$("#check").empty();
						$("#check").append("<li>일치하지 않습니다.</li>");
						$("#check").css("color", "red");
					}

				},

				// 4. 실패했을 때 
				error : function() {

				}
			})
		})
	</script>

</body>
</html>

