<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="member" class="bean.MemberBean" scope="request" />
	<!-- member는 MemberBean 클래스의 객체(인스턴스)와 같다. -->
	<p>아이디 : <%=member.getId() %>
	<p>이 름 : <%=member.getName() %>
	
	<p>아이디 : <jsp:getProperty property="id" name="member" />
	<p>이 름 : <jsp:getProperty property="name" name="member" />
	
	<jsp:setProperty property="id" name="member" value="2021102" />
	<jsp:setProperty property="name" name="member" value="안영이" />
	<p>아이디 : <jsp:getProperty property="id" name="member" />
	<p>이 름 : <jsp:getProperty property="name" name="member" />
</body>
</html>