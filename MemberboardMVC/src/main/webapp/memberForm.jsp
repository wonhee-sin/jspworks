<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" href="./resources/css/common.css?fe14514">
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
	<div id="container">
		<div class="title">
			<h1>회원 가입</h1>
		</div>
	</div>
	<div>
		<form action="./addMember.do" method="post" name="regForm">
		<table class="tbl">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberid" placeholder="ID" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd" placeholder="PASSWORD" required></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="passwd_confirm" placeholder="PASSWORD_CONFIRM" required></td>
			</tr>

			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<select name="gender">
						<option selected>남</option>
						<option>여</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" onclick="checkMember()" value="등록">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
		</form>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>