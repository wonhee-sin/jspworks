<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market</title>
<link rel="stylesheet" href="../resources/CSS/bootstrap.css">
<script type="text/javascript">
	function checkForm(){
		let form = document.newMember;
		let id = form.id.value;
		let pw1 = form.password.value;
		let pw2 = form.password_confirm.value;
		
		if(id==""){
			alert("아이디를 입력하세요");
			form.id.focus();
			return false;
		}
		if(pw1==""){
			alert("비밀번호를 입력하세요");
			form.password.focus();
			return false;
		}
		if(pw1 != pw2){
			alert("비밀번호를 동일하게 입력하세요");
			form.password_confirm.select();
			return false;
		}
		if(form.name.values==""){
			alert("이름을 입력하세요");
			form.name.focus();
			return false;
		}
	}
</script>
</head>
<sql:setDataSource var="dataSource"
	driver = "com.mysql.cj.jdbc.Driver"
	url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&serverTimezone=Asia/Seoul"
	user = "root"
	password = "12345"
/>
<sql:query dataSource="${ dataSource }" var="resultSet">
	SELECT * FROM member WHERE id = ?
	<sql:param value="${ sessionId }" />
</sql:query>
<body>
	<%@ include file = "../menu.jsp" %>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="display-3">회원 정보 수정</h1>
		</div>
	</div>
	<c:forEach items="${ resultSet.rows }" var="row">
		<c:set var="mail" value="${ row.mail }" />
		<c:set var="mail1" value="${ mail.split('@')[0] }" />
		<c:set var="birth" value="${ row.birth }" />
		<c:set var="year" value="${ birth.split('/')[0] }" />
		<c:set var="day" value="${ birth.split('/')[2] }" />
		<div class="container">
			<form action="./processUpdateMember.jsp" method="post" onsubmit="return checkForm()">
					<div class="form-group row">
						<label class="col-sm-2">아이디</label>
						<div class="col-sm-3">
							<input type="text" value="${ row.id }" name="id" placeholder="id" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">비밀번호</label>
						<div class="col-sm-3">
							<input type="password" value="${ row.password }" name="password" placeholder="password" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">비밀번호 확인</label>
						<div class="col-sm-3">
							<input type="password" value="${ row.password }" name="password_confirm" placeholder="password" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">성명</label>
						<div class="col-sm-3">
							<input type="text" name="name" value="${ row.name }" placeholder="name" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">성별</label>
						<div class="col-sm-3">
							<c:set var="gender" value="${ row.gender }" />
							<input type="radio" name="gender" value="남" 
									<c:if test="${ gender.equals('남') }">checked</c:if>>남
							<input type="radio" name="gender" value="여" 
									<c:if test="${ gender.equals('여') }">checked</c:if>>여
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">생일</label>
						<div class="col-sm-3">
							<input type="text" name="birthyy" value="${ year }" placeholder="년(4자)" maxlength="4" size="6">
							<select name="birthmm">
								<option>월</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
							<input type="text" name="birthdd" value="${ day }" placeholder="일" maxlength="2" size="4">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">생일</label>
						<div class="col-sm-4">
							<input type="text" name="mail1" value="${ mail1 }" maxlength="30">@
							<select name="mail2" id="mail2">
								<option value="naver.com">naver.com</option>
								<option value="daum.com">daum.com</option>
								<option value="gmail.com">gmail.com</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">전화번호</label>
						<div class="col-sm-3">
							<input type="text" name="phone" value="${ row.phone }" placeholder="phone" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">주소</label>
						<div class="col-sm-3">
							<input type="text" name="address" value="${ row.address }" placeholder="address" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-3">
							<input type="submit" class="btn btn-primary" value="등록">
							<a href="./deleteMember.jsp" class="btn btn-primary">회원 탈퇴</a>
						</div>
					</div>
				</form>
			</div>
		</c:forEach>
	<%@ include file = "../footer.jsp" %>
</body>
</html>