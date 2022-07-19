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

	<%
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf8");
	%>
	
	<p> 문자 인코딩 : <%= response.getCharacterEncoding() %>
	<p> 문자 인코딩 : <%= response.getContentType() %>
</body>
</html>