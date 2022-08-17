<%@page import="com.repository.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 보기</title>
<link rel="stylesheet" href="../resources/css/bootstrap.css">
</head>
<jsp:useBean id="boardDAO" class="com.repository.BoardDAO" scope="application"/>

<body>
	<c:if test="${ empty sessionId }">
		<script>
			alert("로그인을 해주세요");
			location.href="../loginMember.jsp";
		</script>
	</c:if>
	<jsp:include page="../menu.jsp"/>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="display-3">글 보기</h1>
		</div>
	</div>
		<div class="container mb-3">
			<form action="./updateBoard.do" method="post">
			<input type="hidden" name="bnum" value="<c:out value="${ board.bnum }"/>">
			<table class="table">
				<tr>
					<td>제목</td>
					<td><input type="text" class="form-control col-sm-3" name="title" value="<c:out value="${ board.title }" />" required></td>
				</tr>
				<tr>
					<td>글쓴이</td>
					<td><input type="text" class="form-control col-sm-3" name="memberid" value="<c:out value="${ board.memberid }" />" readonly="readonly"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea class="form-control h-25" rows="20" name="content" required><c:out value="${ board.content }" /></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="background:#fff">
					<c:if test="${ sessionId ne null and sessionId eq board.memberid }">
						<input type="submit" value="수정" class="btn btn-success">
						<a href="./deleteBoard.do?bnum=<c:out value="${ board.bnum }"/>"
							onclick="return confirm('정말로 삭제하시겠습니까?')"><input type="button" value="삭제" class="btn btn-danger"></a>
					</c:if>	
						<a href="./boardList.do"><input type="button" value="목록" class="btn btn-primary"></a>
					</td>
				</tr>
			</table>
			</form>
		</div>
	<jsp:include page="../footer.jsp" />
</body>

</html>