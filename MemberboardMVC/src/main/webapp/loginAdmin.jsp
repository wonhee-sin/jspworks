<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link rel="stylesheet" href="./resources/css/common.css?fe14514">
</head>
<body>
	<jsp:useBean id="memberDAO" class="com.repository.MemberDAO" scope="application"></jsp:useBean>
	<jsp:include page="./menu.jsp"/>
	<div id="container">
		<div class="title">
			<h1>관리자 로그인</h1>
		</div>
	</div>
	<div>
		<form action="j_security_check" method="post">
		<table class="tbl">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="j_username" placeholder="ID" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="j_password" placeholder="PASSWORD" required></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
		</form>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>