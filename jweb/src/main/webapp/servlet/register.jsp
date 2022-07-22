<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>태그로 서블릿에 요청하기</title>
</head>
<body>
	<form action="../register" method="get">
		<p>
			<label for="id">아이디 : </label>
			<input type="text" id ="id" name="userid">
		</p>
		<p>
			<label for="pwd">비밀번호 : </label>
			<input type="password" id ="pwd" name="passwd">
		</p>
		<p>
			<label for="subj">과목 : </label>
			<input type="checkbox" name="subject" value="java" checked>java
			<input type="checkbox" name="subject" value="jsp" checked>jsp
			<input type="checkbox" name="subject" value="spring" checked>spring
			<input type="checkbox" name="subject" value="android" checked>android
		</p>
		<p>
			<input type="submit" value="신청하기">
			<input type="reset" value="다시입력">
		</p>
	</form>
</body>
</html>