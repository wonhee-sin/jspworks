<%@ page import="java.util.Calendar, java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>param 액션 태그</h2>
	<jsp:include page="param2_data.jsp">
		<jsp:param value='<%= URLEncoder.encode("오늘의 날짜와 시각") %>' name="title" />
		<jsp:param value='<%= Calendar.getInstance().getTime() %>' name="date" />
	</jsp:include>
	
	<!-- 영어인 경우 인코딩 필요 없음.
		 value 값은 반드시 홀따움표로 감싸야 함(내부 문자열인 경우 쌍따옴표) -->
	<%-- <jsp:param value= '<%= "Date & TIme" %>' name="title"/> --%>
</body>
</html>