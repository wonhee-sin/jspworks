<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="com.repository.MemberDAO" scope="application" />

<%
	String memberid = request.getParameter("memberid");
	
	memberDAO.deleteMember(memberid);
	
	response.sendRedirect("./memberList.jsp");
%>