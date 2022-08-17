<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="./resources/CSS/bootstrap.css">
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="display-3">Welcome to my community...</h1>
		</div>
	</div>
	<div class = "container">
		<div class="text-center">
			<img src="./resources/images/cat2.jpg" alt="고양이" width="80%">
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>