<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
		String driverClass = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&serverTimezone=Asia/Seoul";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		
		try{
		Class.forName(driverClass);
		conn = DriverManager.getConnection(url, username, password);
		out.println("mysql DB 연결 성공!!");
		}catch(Exception e){
			out.println("mysql DB 연결 실패!!<br>");
			out.println(e.getMessage());
		}finally{
			if(conn != null){
				conn.close();
			}
		}
	%>
</body>
</html>