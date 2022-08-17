<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
</head>
<body>
	<jsp:useBean id="memberDAO" class="com.repository.MemberDAO" scope="application"></jsp:useBean>
	<jsp:include page="./menu.jsp"/>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="display-3">회원 로그인</h1>
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
			<form action="./loginProcess.do" method="post">
				<div class="form-group">
					<label for="id" class="sr-only">User Name</label>
					<input type="text" name="memberid" class="form-control" placeholder="ID"
					name="id" required autofocus>
				</div>
				<div class="form-group">
					<label for="id" class="sr-only">Password</label>
					<input type="password" name="passwd" class="form-control" placeholder="PASSWORD"
					name="id" required autofocus>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
	</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>