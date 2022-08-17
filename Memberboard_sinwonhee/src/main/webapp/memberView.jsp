<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보</title>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<script>
	function checkMember(){
		let form = document.regForm;
		let pwd = form.passwd.value;
		let pwd_cf = form.passwd_confirm.value;
		let name = form.name.value;
		

		let regExpPwd =/^(?=.*[a-zA-Z0-9])(?=.*\W).{8,12}$/
		let regExpName = /^[a-zA-Z가-힣]+$/;
		

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
			<h1 class="display-3">나의 정보</h1>
		</div>
	</div>
	<div>
		<form action="./updateMember.do" method="post" name="regForm">
		<div class="form-group row">
			<label class="col-sm-2">아이디</label>
			<div class="col-sm-3">
				<input type="text" name="memberid" placeholder="ID" value="${ member.memberid }" readonly="readonly" class="form-control" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">비밀번호</label>
			<div class="col-sm-3">
				<input type="password" name="passwd" placeholder="PASSWORD" value="${ member.passwd }" class="form-control" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">비밀번호 확인</label>
			<div class="col-sm-3">
				<input type="password" name="passwd_confirm" placeholder="PASSWORD_CONFIRM" value="${ member.passwd }" class="form-control" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">성명</label>
			<div class="col-sm-3">
				<input type="text" name="name" placeholder="name" value="${ member.name }" class="form-control" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">가입일</label>
			<div class="col-sm-3">
				<input type="text" name="joinDate" placeholder="name" value="${ member.joinDate }" readonly="readonly" class="form-control" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">성별</label>
			<div class="col-sm-3">
				<c:if test="${ member.gender eq '남'}">
					<input type="radio" name="gender" value="남" checked>남
				</c:if>
				<c:if test="${ member.gender eq '여'}">
					<input type="radio" name="gender" value="여" checked>여
				</c:if>	
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-3">
				<input type="button" onclick="checkMember()" class="btn btn-primary" value="수정">
				<input type="reset" class="btn btn-primary" value="취소">
			</div>
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>