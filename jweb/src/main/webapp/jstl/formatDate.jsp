<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>날짜를 다양한 형식으로 표기</h2>
	<jsp:useBean id="now" class="java.util.Date" />
	<p>현재 날짜 및 시간 :${ now }
	<p><fmt:formatDate value="${ now }" type="date"/>
	<p><fmt:formatDate value="${ now }" type="time"/>
	<p><fmt:formatDate value="${ now }" type="both"/>
	<p><fmt:formatDate value="${ now }" pattern="yyyy:MM:dd"/>
	<p><fmt:formatDate value="${ now }" pattern="yyyy:MM:dd hh:mm:ss"/>
	
	<p>== 타입존 출력 ==
	<p><fmt:timeZone value="Europe/London">
		런던: <fmt:formatDate value="${ now }" type="both"/><br>
		런던: <fmt:formatDate value="${ now }" type="both" dateStyle="full"/><br>
		런던: <fmt:formatDate value="${ now }" type="both" timeStyle="full"/>
		</fmt:timeZone>
	<p><fmt:timeZone value="America/New_York">
		런던: <fmt:formatDate value="${ now }" type="both"/><br>
		런던: <fmt:formatDate value="${ now }" type="both" dateStyle="full"/><br>
		런던: <fmt:formatDate value="${ now }" type="both" timeStyle="full"/>
		</fmt:timeZone>
</body>
</html>