<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/cart.css">
</head>
<body>
	<div id="container">
		<h2>계산하기</h2>
		<p>선택한 상품 목록</p>
		<hr>
		<%
			//세션 유지
			ArrayList<String> productList = (ArrayList)session.getAttribute("productList");
		
			if(session.getAttribute("userName") == null){
				response.sendRedirect("./loginFrom.jsp");
			}else {
				//상품 목록
				for(String prod : productList){
				out.println(prod + "<br>");
				}
			}

		

		%>
		
		<form action="./deleteList.jsp">
			<p><input type="submit" value="목록 비우기">
		</form>
	</div>
</body>
</html>