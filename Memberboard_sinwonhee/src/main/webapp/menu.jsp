<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="/index.jsp">Home</a>
		</div>
		<div>
			<c:choose>
				<c:when test="${ empty sessionId }">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item"><a href="/main.jsp" class="nav-link">Home</a></li>
						<li class="nav-item"><a href="/memberForm.do" class="nav-link">회원가입</a></li>
						<li class="nav-item"><a href="/boardList.do" class="nav-link">게시판</a></li>
						<li class="nav-item"><a href="/loginMember.do" class="nav-link">로그인</a></li>
						<li class="nav-item"><a href="/memberList.do" class="nav-link">회원목록</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="navbar-nav mr-auto">
						<li class="nav-item"><a href="/main.jsp" class="nav-link">Home</a></li>
						<li class="nav-item"><a href="/boardList.do" class="nav-link">게시판</a></li>
						<li class="nav-item"><a href="/memberView.do" class="nav-link">나의 정보</a></li>
						<li class="nav-item"><a href="/logout.do" class="nav-link">${ sessionId }(님)로그아웃</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</nav>

</html>