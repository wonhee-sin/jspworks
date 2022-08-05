<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="./resources/css/common.css">
</head>
<body>
	<jsp:include page="./menu.jsp"/>
	<div id="container">
		<div class="title">
			<h1>Welcome to my community...</h1>
		</div>
		<div>
			<img src="./resources/images/cat2.jpg" alt="고양이" width="38%">
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>