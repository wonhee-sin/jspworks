<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>구구단</h2>
	<table>
		<%
			for(int i=1; i<10; i++){
		%>	
		<tr>
			<% for(int j=2; j<10; j++){ %>
				<td width="80"><%=j + "x" + i + "=" + (i*j) %></td>
			<% } %>
		</tr>
		<%} %>
	</table>
	
	<h2>구구단</h2>
	<table>
		<c:forEach var="i" begin="1" end="9">
			<tr>
				<c:forEach var="j" begin="2" end="9">
					<td width="80">${ j }x${ i }=${ i*j }</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>