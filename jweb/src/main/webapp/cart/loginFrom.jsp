<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="../resources/css/cart.css">
</head>
<body>
	<div id="container">
		<h2>로그인</h2>
		<hr>
		
		<form action="./selProduct.jsp" method="post">
			<p>
				<label for="username">이름 : </label>
				<input type="text" name="username">
				<input type="submit" value="로그인">
			</p>
		</form>
	</div>
</body>
</html>