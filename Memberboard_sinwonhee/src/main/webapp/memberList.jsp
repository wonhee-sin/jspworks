<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
</head>
<body>
	<jsp:useBean id="memberDAO" class="com.repository.MemberDAO" scope="application"></jsp:useBean>
	<jsp:include page="./menu.jsp"/>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="display-3">회원 목록</h1>
		</div>
	</div>
	<div class="container mb-3">
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>성별</th>
						<th>가입일</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="member" items="${ memberList }">
				<tr>
					<td><c:out value="${ member.memberid }" /></td>
					<td><c:out value="${ member.passwd }" /></td>
					<td><c:out value="${ member.name }" /></td>
					<td><c:out value="${ member.gender }" /></td>
					<td><c:out value="${ member.joinDate }" /></td>
					<td>
						<a href="./deleteMember.do?memberid=<c:out value="${ member.memberid }" />"
							onclick="return confirm('정말로 삭제하시겠습니까?')">
							<button type="button" class="btn btn-danger">삭제</button>
						</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		<div style="margin-bottom: 20px; text-align: center;">
		<p><a href="./logout.do" class="btn btn-secondary">&laquo; 관리자 로그아웃</a>
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>