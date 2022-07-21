<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
<%
	String uname = request.getParameter("username");
	
	abDAO.delete(uname);
	
	response.sendRedirect("./addrList.jsp");
%>