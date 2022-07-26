<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
<%
	String email = request.getParameter("email");
	boolean result = abDAO.checkLogin(email);
	String name = abDAO.printName(email); 
	if(result){
		session.setAttribute("sessionId", email); 	//세션 발급 (이름 - sessionId)
	}else {
		%>
		<script>
		alert('이메일이 일치하지 않습니다.');
		history.go(-1);
		</script>	
<%
	}
%>

<body>
	<div id="container">
		<h2><%= name %>으로 로그인되었습니다.</h2>
		<p><a href="./addrList.jsp">[목록 보기]</a></p>
	</div>
</body>