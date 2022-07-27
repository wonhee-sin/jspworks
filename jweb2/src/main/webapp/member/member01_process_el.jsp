<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<style>
	#container {width : 400px; margin : 0 auto; text-align : center;}
	table{width : 400px; margin : 0 auto;}
	table, td, th{border: 1px solid #ccc; border-collapse : collapse;}
	table td, th{height:40px}
	table input{height : 25px}
</style>
</head>
<body>
	<div id="container">
		<h2>회원 정보</h2>
		<hr>
		<table>
			<tr>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이 름</th>
			</tr>
			<tr>
				<td>${ param.id }</td>
				<td>${ param.pw }</td>
				<td>${ param.name }</td>
			</tr>
		</table>
	</div>
</body>
</html>