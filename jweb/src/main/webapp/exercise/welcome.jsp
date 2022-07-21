<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인이 안된 상태에서 url 요청이 들어왔을때 오류!
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
	}else {
		response.sendRedirect("session_out.jsp");
	}
%>
<h3><%=session.getAttribute("userID") %>님 반갑습니다.</h3>
<a href="session_out.jsp">로그아웃</a>