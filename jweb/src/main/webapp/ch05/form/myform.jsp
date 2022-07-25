<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사</title>
<script type="text/javascript">
	function checkform(){
		//document.폼이름.입력항목이름.value
		
		let form = document.loginform;
		alert("아이디: " + form.id.value + "\n" + 
			  "비밀번호: " + form.passwd.value);
			
		form.submit();
	}
</script>
</head>
<body>
	<form action="loginProcess2.jsp" method="post" name ="loginform">
		<p>
			<label for="id">아이디 : </label>
			<input type="text" id="id" name="id">
		</p>
		
		<p>
			<label for="passwd">비밀번호 : </label>
			<input type="password" id="passwd" name="passwd">
		</p>
		<p><input type="button" value="전송" onclick="checkform()"></p>
	</form>
</body>
</html>