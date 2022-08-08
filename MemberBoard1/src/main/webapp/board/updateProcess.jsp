<%@page import="com.repository.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDAO" class="com.repository.BoardDAO" scope="application" />
<%
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	
	Board board = new Board();
	board.setBnum(bnum);
	board.setContent(content);
	board.setTitle(title);
	
	boardDAO.updateBoard(board);
	
	out.println("<script>");
	out.println("alert('수정이 완료되었습니다.')");
	out.println("location.href='./boardList.jsp'");
	out.println("</script>");

%>