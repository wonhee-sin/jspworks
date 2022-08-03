<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>결과 : ${ lotto[0] }입니다.
	
	
	<c:forEach var="lotto" items="${ lotto }">
		${ lotto }<br>
	</c:forEach>
</body>
</html>