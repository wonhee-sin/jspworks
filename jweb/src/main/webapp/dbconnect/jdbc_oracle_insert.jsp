<%@page import="java.sql.PreparedStatement"%>
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
		String driverClass = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username = "c##jweb";
		String password = "54321";
		
		Connection conn = null;
		PreparedStatement pstmt = null;	//sql 객체
		
		try{
		Class.forName(driverClass);
		conn = DriverManager.getConnection(url, username, password);
		//out.println("oracle DB 연결 성공!!");
		String sql = "INSERT INTO t_student VALUES (102, '김산')";
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		}catch(Exception e){
			out.println("Oracle DB 연결 실패!!");
			out.println(e.getMessage());
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
	%>
</body>
</html>