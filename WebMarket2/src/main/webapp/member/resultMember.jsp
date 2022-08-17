<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market</title>
<link rel="stylesheet" href="../resources/CSS/bootstrap.css">
</head>
<body>
	<%@ include file = "../menu.jsp" %>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="display-3">회원 정보</h1>
		</div>
	</div>
	<div class="container">
		<%
			String msg = request.getParameter("msg");
			if(msg != null){
				if(msg.equals("0")){
					out.println("<h2 class='alert alert-danger'>회원 정보가 수정되었습니다. </h2>");
				}else if(msg.equals("1")){
					out.println("<h2 class='alert alert-danger'>회원 가입을 축하합니다. </h2>");
				}else if(msg.equals("2")){
					String loginId = (String)session.getAttribute("sessionId");
					out.println("<h2 class='alert alert-danger'>" + loginId + "님 환영합니다.</h2>");
				}
			}else{
				out.println("<h2 class='alert alert-danger'>회원 정보가 삭제되었습니다. </h2>");
			}
		%>
	</div>
	<%@ include file = "../footer.jsp" %>
</body>
</html>