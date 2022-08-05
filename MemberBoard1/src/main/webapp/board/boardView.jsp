<%@page import="com.repository.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 보기</title>
<link rel="stylesheet" href="../resources/css/common.css?01239">
</head>
<jsp:useBean id="boardDAO" class="com.repository.BoardDAO" scope="application"/>
<%
	String sessionId = null;
	if(session.getAttribute("sessionId") != null){
		sessionId = (String)session.getAttribute("sessionId");
	}else{
		out.println("<script>");
		out.println("alert('로그인 해주세요')");
		out.println("location.href='../loginMember.jsp'");
		out.println("</script>");
	}
%>
<body>
	<jsp:include page="../menu.jsp"/>
	<div id="container">
		<div class="title">
			<h1>글 보기</h1>
		</div>
		<%
			//bnum가져오기
			int bnum = 0;
			if(request.getParameter("bnum") != null){
				bnum = Integer.parseInt(request.getParameter("bnum"));
				Board board = boardDAO.getBoard(bnum);
		%>
		<div>
			<form action="./updateProcess.jsp" method="post">
			
			<table class="tbl_bo_view">

				<input type="hidden" name="bnum" value="<%= board.getBnum() %>">

				<tr>
					<td>제목</td>
					<td><input type="text" name="title" value="<%=board.getTitle() %>" required></td>
				</tr>
				<tr>
					<td>글쓴이</td>
					<td><input type="text" name="memberid" value="<%=board.getMemberid() %>" readonly="readonly"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea rows="20" cols="60" name="content" required><%=board.getContent() %></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="background:#fff">
					<% if(sessionId !=null && sessionId.equals(board.getMemberid())){%>
						<input type="submit" value="수정">
						<a href="./deleteBoard.jsp?bnum=<%=board.getBnum()%>"
							onclick="return confirm('정말로 삭제하시겠습니까?')"><input type="button" value="삭제"></a>
					<% } %>
						<a href="./boardList.jsp"><input type="button" value="목록"></a>
					</td>
				</tr>
			</table>
			</form>
		</div>
		<% } %>
	</div>
	<jsp:include page="../footer.jsp" />
</body>

</html>