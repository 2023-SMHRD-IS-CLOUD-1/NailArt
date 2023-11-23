<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="assets/js/jquery-3.7.1.min.js"></script>
</head>
<body>

	<form action="Join.do" method="get">
		<label for="id">아이디:</label> 
		<input type="text" id = mem_id name="mem_id">
		 <input type="button" id="id" value="중복확인">
		<br>

		<label for="id">비밀번호:</label> 
		<input type="text" name="mem_pw">
		<br>
		
		<label for="id">이름:</label> 
		<input type="text" name="mem_name">
		<br>
		
		<label for="id">전화번호:</label> 
		<input type="text" name="mem_phone">
		<br>
			
		<label for="id">이메일:</label> 
		<input type="text" name="mem_email">
		<br>
			
		<label for="id">주소:</label> 
		<input type="text" name="mem_addr1">
		<br>
		
		<label for="id">상세주소:</label> 
		<input type="text" name="mem_addr2">
		<br>
				
		<input type="submit" value = "회원가입">
		<input type="reset">
	</form>
	
	<script>
        $("#id").on('click', () => {
            $.ajax({
                url: "idduple",
                data:'id=' + $('#mem_id').val(),

                success : function (res) {
                    console.log("요청성공");
                    console.log("응답받은 데이터 >>" , res);
                    
                },
                error : function(){
                    console.log("error");
                }

            })
        })





    </script>

</body>
</html>