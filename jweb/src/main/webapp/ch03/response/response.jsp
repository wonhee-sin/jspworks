<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response 객체 사용</title>
</head>
<body>

	<%! int count; %>
	<p>이 페이지는 5초마다 새로고침 합니다.</p>
	
	<%
	response.setIntHeader("refresh", 5);
	++count;
	%>
	<h1>새로고침 횟수 <%= count %></h1>
	<p><%= new Date().toLocaleString() %></p>
</body>
</html>