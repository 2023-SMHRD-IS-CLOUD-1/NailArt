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
	<div>
		<button id="login">로그인</button>
		<form action="Gojoin.do" method = "get">
			<input type="submit" value="회원가입" id="join">
		</form>
	</div>
	
	<form action="Login.do" method="get">
      <button>회원아이디</button>
      <input type ="text" name="mem_id">
        <br>

      <button>회원 비밀번호</button>
      <input type ="text" name="mem_pw">
        <br>
        <input type ="submit" value = "로그인">
        <input type ="reset">
    </form>

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
		
	</script>

</body>
</html>

