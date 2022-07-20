<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int cnt = 10;
	if( request.getParameter("cnt") != null){
		cnt = Integer.parseInt(request.getParameter("cnt"));
	}
	for( int i = 0; i<cnt; i++ ) {
		out.println("안녕 JSP<br>");
	}
	%>
</body>
</html>