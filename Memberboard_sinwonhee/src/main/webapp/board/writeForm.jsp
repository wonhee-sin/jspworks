<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="../resources/css/bootstrap.css">
</head>
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
			<h1 class="display-3">글쓰기</h1>
		</div>
	</div>
		<div class="container mb-3">
			<form action="/writeProcess.do" method="post" name="writeForm">
			<table class="table">
				<tr>
					<td><input class="form-control col-sm-3" type="text" name="title" placeholder="글 제목" required></td>
				</tr>
				<tr>
					<td>
						<textarea class="form-control h-25" rows="20" name="content" placeholder="글 내용" required></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="글쓰기" class="btn btn-success">
						<input type="reset" value="취소" class="btn btn-danger">
					</td>
				</tr>
			</table>
			</form>
		</div>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>