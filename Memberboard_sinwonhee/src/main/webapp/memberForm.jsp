<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<script>
	function checkMember(){
		let form = document.regForm;
		let id = form.memberid.value;
		let pwd = form.passwd.value;
		let pwd_cf = form.passwd_confirm.value;
		let name = form.name.value;
		
		let regExpId =/^[a-zA-Z0-9_-]{4,12}$/;
		let regExpPwd =/^(?=[a-zA-Z0-9])(?=.*\W).{8,12}$/
		let regExpName = /^[a-zA-Z가-힣]+$/;
		
		if(id=="" || !regExpId.test(id)){
			alert("아이디는 영문자, 숫자만 입력해주세요! (4~12자)");
			return false;
		}
		if(pwd == "" || !regExpPwd.test(pwd)){
			alert("비밀번호는 특수문자를 포함한 8~12자리를 입력해주세요!");
			return false;
		}
		if(name == "" || !regExpName.test(name)){
			alert("이름은 문자만 입력 가능합니다.");
			return false;
		}
		if(pwd != pwd_cf) {
			alert("비밀번호 확인과 일치하지 않습니다.");
			return false;
		}
		
		form.submit();
	}
</script>
</head>
<body>
	<jsp:useBean id="memberDAO" class="com.repository.MemberDAO" scope="application"></jsp:useBean>
	<jsp:include page="./menu.jsp"/>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>
	<div class="container">
		<form action="./addMember.do" method="post" name="regForm">
			<%
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("이미 존재하는 아이디입니다.");
					out.println("</div>");
				}
			%>
		<div class="form-group row">
			<label class="col-sm-2">아이디</label>
			<div class="col-sm-3">
				<input type="text" name="memberid" placeholder="ID" class="form-control" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">비밀번호</label>
			<div class="col-sm-3">
				<input type="password" name="passwd" placeholder="PASSWORD" class="form-control" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">비밀번호 확인</label>
			<div class="col-sm-3">
				<input type="password" name="passwd_confirm" placeholder="PASSWORD_CONFIRM" class="form-control" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">성명</label>
			<div class="col-sm-3">
				<input type="text" name="name" placeholder="name" class="form-control" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">성별</label>
			<div class="col-sm-3">
				<input type="radio" name="gender" value="남" checked>남
				<input type="radio" name="gender" value="여" >여
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-3">
				<input type="button" onclick="checkMember()" class="btn btn-primary" value="등록">
				<input type="reset" class="btn btn-primary" value="취소">
			</div>
		</div>
		</form>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>