<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String password = request.getParameter("passwd");
%>

<p>name is <%= name %>
<p>password is <%= password %>