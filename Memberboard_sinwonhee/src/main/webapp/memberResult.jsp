<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="display-3">회원 정보</h1>
		</div>
	</div>
		<div class="container">
			<c:choose>
				<c:when test="${ msg eq 'register' }">
					<h2 class="alert alert-danger">회원 가입을 축하합니다.</h2>
				</c:when>
				<c:when test="${ msg eq 'login' }">
					<h2 class="alert alert-danger"><c:out value="${ name }"/>님 환영합니다.</h2>
				</c:when>
				<c:when test="${ msg eq 'update' }">
					<h2 class="alert alert-danger">회원 정보가 수정되었습니다.</h2>
				</c:when>
				<c:when test="${ msg eq 'logout' }">
					<h2 class="alert alert-danger">로그아웃 되었습니다.</h2>
				</c:when>
				<c:when test="${ msg eq 'bo_delete' }">
					<h2 class="alert alert-danger">게시물이 삭제되었습니다.</h2>
				</c:when>
				<c:when test="${ msg eq 'bo_update' }">
					<h2 class="alert alert-danger">게시물이 수정되었습니다.</h2>
				</c:when>
			</c:choose>
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>