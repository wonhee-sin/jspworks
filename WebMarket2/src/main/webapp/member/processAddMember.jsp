<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("birthyy");
	String month = request.getParameterValues("birthmm")[0];
	String day = request.getParameter("birthdd");
	String birth = year + "-" + month + "-" + day;
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameterValues("mail2")[0];
	String mail = mail1 + "@" + mail2;
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	String currentDateTime = formatter.format(new Date());
%>

<body>
	<sql:setDataSource var="dataSource"
		driver = "com.mysql.cj.jdbc.Driver"
		url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&serverTimezone=Asia/Seoul"
		user = "root"
		password = "12345"
	 />
	 
	 <sql:update dataSource="${ dataSource }" var="resultSet">
	 	INSERT INTO member VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)
	 	<sql:param value="<%=id %>" />
	 	<sql:param value="<%=password %>" />
	 	<sql:param value="<%=name %>" />
	 	<sql:param value="<%=gender %>" />
	 	<sql:param value="<%=birth %>" />
	 	<sql:param value="<%=mail %>" />
	 	<sql:param value="<%=phone %>" />
	 	<sql:param value="<%=address %>" />
	 	<sql:param value="<%=currentDateTime %>" />
	 </sql:update>
	 <c:if test="${ resultSet >= 1 }">
	 	<c:redirect url="resultMember.jsp?msg=1" />
	 </c:if>
</body>