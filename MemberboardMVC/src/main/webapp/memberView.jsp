<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보</title>
<link rel="stylesheet" href="./resources/css/common.css?fe14514">
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
	<div id="container">
		<div class="title">
			<h1>회원 가입</h1>
		</div>
	</div>
	<div>
		<form action="./updateMember.do" method="post" name="regForm">
		<table class="tbl">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberid" value="${ member.memberid }" readonly="readonly" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd" value="${ member.passwd }" required></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="passwd_confirm" value="${ member.passwd }" required></td>
			</tr>

			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${ member.name }" required></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><input type="text" name="joinDate" value="${ member.joinDate }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
				<c:if test="${ member.gender eq '남'}">
					<input type="radio" name="gender" value="남" checked>남
				</c:if>
				<c:if test="${ member.gender eq '여'}">
					<input type="radio" name="gender" value="여" checked>여
				</c:if>	
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" onclick="checkMember()" value="수정">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
		</form>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>