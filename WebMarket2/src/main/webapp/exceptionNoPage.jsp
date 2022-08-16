<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market</title>
<link rel="stylesheet" href="./resources/CSS/bootstrap.css">
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h1>
		</div>
	</div>
	
	<div class="container">
		<p><%=request.getRequestURL() %><%=request.getQueryString() %>
		<p><a href="./products.jsp" class="btn btn-secondary">상품 목록</a>
	</div>
</body>
</html>