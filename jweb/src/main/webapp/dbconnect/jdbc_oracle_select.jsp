<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
		ResultSet rs = null;	//결과(얻어온) 객체
		
		try{
		Class.forName(driverClass);
		conn = DriverManager.getConnection(url, username, password);
		//out.println("oracle DB 연결 성공!!");
		String sql = "SELECT * FROM t_student";
		out.println("<h2>학생 명단</h2>");
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=1 width=200>");
		out.println("<tr><td>학번</td><td>이름</td></tr>");
		while(rs.next()){
			out.println("<tr><td>" + rs.getInt("stdid") + "</td>");
			out.println("<td>" + rs.getString("name") + "</td></tr>");
		}
		out.println("</table>");
		}catch(Exception e){
			out.println("Oracle DB 연결 실패!!");
			out.println(e.getMessage());
		}finally{
			if(rs != null){
				rs.close();
			}
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