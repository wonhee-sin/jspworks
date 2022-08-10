<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 커넥션 풀 예제</title>
<style type="text/css">
*{
	box-sizing: border-box;
	outline: none;
}
body{background: green;}
#container{
	text-align: center;
	margin: 0 auto;
}
input[type=text] {background: crimson; border: none; height: 25px; color: #fff; font-weight: bold;}
form p {display: inline;  margin:0 20px;}
hr + p {float: left; text-align: left; margin-top: 70px;}
hr {margin:50px 0;}
</style>
</head>
<%
	request.setCharacterEncoding("UTF-8"); //한글 인코딩 요청
	
	DataSource ds = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env"); //객체 참조(url)
		ds = (DataSource)envContext.lookup("jdbc/oracle"); //"java:/comp/env/jdbc/oracle"
		
		//자료 추가
		conn = ds.getConnection();
		String sql = "INSERT INTO dbcp_test(name, email) VALUES (?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setString(2, request.getParameter("email"));
		pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
%>
<body>
	<div id="container">
		<h2>이벤트 등록</h2>
		<hr>
		<form action="" method="post">
			<p>이름 : <input type="text" name="name" required="required"></p>
			<p>이메일 : <input type="text" name="email" required="required"></p>
			<p> <input type="submit" value="등록">
		</form>
		<hr>
		<p>== 등록 목록 ==
		<br>
		<%	try{
				String sql = "SELECT name, email FROM dbcp_test";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					out.println(rs.getString("name"));
					out.println(rs.getString("email") + "<br>");
				}
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		
		%>
		</p>
	</div>
</body>
</html>