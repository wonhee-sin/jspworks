<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market</title>
<link rel="stylesheet" href="./resources/CSS/bootstrap.css">
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
	<%@ include file = "menu.jsp" %>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="display-3">상품 편집</h1>
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
				<p><% if(edit.equals("update")){ %>
				
					<a href="./updateProduct.jsp?id=<%=rs.getString("p_id") %>"
						class="btn btn-success" role="button">수정 &raquo;</a>
						<% } else if(edit.equals("delete")){ %>
					<a href="./deleteProduct.jsp?id=<%=rs.getString("p_id") %>"
						class="btn btn-danger" role="button" onclick="return confirm('해당상품을 삭제하시겠습니까?')">삭제 &raquo;</a>
						<% } %>
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