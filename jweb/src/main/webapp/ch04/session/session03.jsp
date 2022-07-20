<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>======== 세션 삭제 전 ========</h3>
<%
	String id = (String)session.getAttribute("userID");
	String pw = (String)session.getAttribute("passwd");
	
	out.println("설정된 세션의 속성 값[1] " + id + "<br>");
	out.println("설정된 세션의 속성 값[2] " + pw + "<br>");
	
	
	session.removeAttribute("userID");
	
	
%>

<h3>======== 세션 삭제 후 ========</h3>

<%
	id = (String)session.getAttribute("userID");
	pw = (String)session.getAttribute("passwd");
	
	out.println("설정된 세션의 속성 값[1] " + id + "<br>");
	out.println("설정된 세션의 속성 값[2] " + pw + "<br>");
	
	
	session.invalidate(); //세션 삭제
	
	
%>
