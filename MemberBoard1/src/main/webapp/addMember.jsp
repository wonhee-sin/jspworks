<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="com.repository.MemberDAO" scope="application" />

<%
	request.setCharacterEncoding("UTF-8");
	
	String memberid = request.getParameter("memberid");
	String passwd = request.getParameter("passwd");
	String passwd_cf = request.getParameter("passwd_confirm");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	
	if(!memberDAO.checkId(memberid)){
%>		
		<script>
			alert("이미 존재하는 아이디 입니다.");
			location.href="./memberForm.jsp";
		</script>
<%		
	}else if(!passwd.equals(passwd_cf)) {
%>		
		<script>
			alert("비밀번호가 일치하지 않습니다.");
			location.href="./memberForm.jsp";
		</script>
<%	
	} else{
		Member member = new Member();
		member.setMemberid(memberid);
		member.setPasswd(passwd);
		member.setName(name);
		member.setGender(gender);
		memberDAO.addMember(member);
		response.sendRedirect("./loginMember.jsp");
	}
%>