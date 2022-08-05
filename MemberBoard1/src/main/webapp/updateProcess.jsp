<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="com.repository.MemberDAO" scope="application" />
<%
	request.setCharacterEncoding("UTF-8");

	String memberid = request.getParameter("memberid");
	String passwd = request.getParameter("passwd");
	String pw_cf = request.getParameter("passwd_confirm");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	
	if(!passwd.equals(pw_cf)){
		out.println("<script>");
		out.println("alert('비밀번호를 확인해주세요')");
		out.println("location.href='/memberView.jsp'");
		out.println("</script>");
	}else{
	
	Member member = new Member();
	member.setMemberid(memberid);
	member.setPasswd(passwd);
	member.setName(name);
	member.setGender(gender);
	
	memberDAO.memberUpdate(member);
	
	out.println("<script>");
	out.println("alert('수정이 완료되었습니다.')");
	out.println("location.href='/main.jsp'");
	out.println("</script>");
	}
	
%>