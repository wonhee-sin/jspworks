<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market</title>
<link rel="stylesheet" href="../resources/CSS/bootstrap.css">
</head>
<body>
	<%@ include file = "../menu.jsp" %>

	<div class="jumbotron">
		<div class = "container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4">
			<h3>Please sign in</h3>
			<%
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해주세요");
					out.println("</div>");
				}
			%>
			<form action="./processLoginMember.jsp" method="post">
				<div class="form-group">
					<label for="id" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="ID"
					name="id" required autofocus>
				</div>
				<div class="form-group">
					<label for="Password" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password"
					name="password" required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
		</div>
	</div>
	<%@ include file = "../footer.jsp" %>
</body>
</html>