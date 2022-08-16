<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="./resources/CSS/bootstrap.css">
</head>
<body>
	<%@ include file = "menu.jsp" %>
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
				<form action="j_security_check" method="post">
					<div class="form-group">
						<label for="inputUserName" class="sr-only">User Name</label>
						<input type="text" class="form-control" placeholder="ID"
						name="j_username" required autofocus>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="sr-only">Password</label>
						<input type="password" class="form-control" placeholder="Password"
						name="j_password" required autofocus>
					</div>
					<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
				</form>
			</div>
		</div>
</body>
</html>