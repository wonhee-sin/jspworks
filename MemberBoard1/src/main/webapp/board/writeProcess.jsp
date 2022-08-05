<%@page import="com.repository.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDAO" class="com.repository.BoardDAO" scope="application" />
<%
	request.setCharacterEncoding("UTF-8");
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String memberid = (String)session.getAttribute("sessionId");
	
	Board board = new Board();
	board.setContent(content);
	board.setMemberid(memberid);
	board.setTitle(title);
	
	boardDAO.insertBoard(board);
	
	response.sendRedirect("/board/boardList.jsp");
%>