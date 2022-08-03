<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="com.repository.MemberDAO" scope="application" />
<%
	String memberid = request.getParameter("memberid");
	String passwd = request.getParameter("passwd");
	
	boolean result = memberDAO.checkLogin(memberid, passwd);
	
	if(result){
		session.setAttribute("sessionId", memberid);
		response.sendRedirect("./main.jsp");
	}else{
		out.println("<script>");
		out.println("alert('아이디나 비밀번호를 확인해주세요')");
		out.println("history.go(-1)");
		out.println("</script>");
	}
%>