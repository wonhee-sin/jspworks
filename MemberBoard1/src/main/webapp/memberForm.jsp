<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" href="./resources/css/common.css?fe14514">
</head>
<body>
	<jsp:useBean id="memberDAO" class="com.repository.MemberDAO" scope="application"></jsp:useBean>
	<jsp:include page="./menu.jsp"/>
	<div id="container">
		<div class="title">
			<h1>회원 가입</h1>
		</div>
	</div>
	<div>
		<form action="./addMember.jsp" method="post" name="regForm">
		<table class="tbl">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberid" placeholder="ID" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd" placeholder="PASSWORD" required></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="passwd_confirm" placeholder="PASSWORD_CONFIRM" required></td>
			</tr>

			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<select name="gender">
						<option selected>남</option>
						<option>여</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
		</form>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>