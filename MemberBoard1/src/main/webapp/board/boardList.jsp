<%@page import="com.repository.Member"%>
<%@page import="com.repository.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="../resources/css/common.css?f1">
</head>
<jsp:useBean id="boardDAO" class="com.repository.BoardDAO" scope="application"/>
<body>
	<jsp:include page="../menu.jsp"/>
	<div id="container">
		<div class="title">
			<h1>게시판 목록</h1>
		</div>
		<div>
			<table class="tbl_list">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>글쓴이</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(int i=0; i < boardDAO.getListAll().size(); i++){
						Board board = boardDAO.getListAll().get(i);
				%>
					<tr>
						<td><%= board.getBnum() %></td>
						<td><a href="/board/boardView.jsp?bnum=<%= board.getBnum() %>"><%= board.getTitle() %></a></td>
						<td><%= board.getRegDate() %></td>
						<td><%= board.getMemberid() %></td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
			<div class="writeBtn">
				<a href="./writeForm.jsp"><button type="button" >글쓰기</button></a>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>