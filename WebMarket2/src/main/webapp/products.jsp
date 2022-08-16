<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market</title>
<link rel="stylesheet" href="./resources/CSS/bootstrap.css">
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<div class = "container">
		<div class="row" align="center">
		<%@ include file ="./dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT * FROM product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
			%>
			<div class="col-md-4">
				<%-- <img src="./resources/images/<%=product.getFilename() %>" style="width:100%"> --%>
				<img src="./upload/<%=rs.getString("p_fimename") %>" style="width: 100%">
				<h3><%=rs.getString("p_name") %></h3>
				<p><%=rs.getString("p_description") %></p>
				<p><%=rs.getInt("p_unitPrice") %></p>
				<p><a href="./product.jsp?id=<%=rs.getString("p_id") %>"
						class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
			</div>
			<%
				}
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			%>
		</div>
	</div>
	<%@ include file = "footer.jsp" %>
</body>
</html>