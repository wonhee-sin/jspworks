<%@page import="com.repository.Member"%>
<%@page import="com.repository.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="../resources/css/bootstrap.css">
</head>
<jsp:useBean id="boardDAO" class="com.repository.BoardDAO" scope="application"/>
<body>
	<jsp:include page="../menu.jsp"/>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="display-3">게시판 목록</h1>
		</div>
	</div>
		<div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>글번호</th>
						<th style="width: 50%; text-align:center;">제목</th>
						<th>작성일</th>
						<th>글쓴이</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${ boardList }">
					<tr>
						<td><c:out value="${ board.bnum }"/></td>
						<td style="width: 50%; text-align:center;"><a href="/boardView.do?bnum=${ board.bnum }"><c:out value="${ board.title }"></c:out></a></td>
						<td><fmt:formatDate value="${ board.regDate }" pattern="yyyy-MM-dd"/></td>
						<td><c:out value="${ board.memberid }"/></td>
						<td><c:out value="${ board.hit }"/></td>
					</tr>	
					</c:forEach>
				</tbody>
			</table>
			<div class="writeBtn">
				<a href="/writeForm.do"><button type="button" class="btn btn-primary float-right" style="margin-right:15px;">글쓰기</button></a>
			</div>
		</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>