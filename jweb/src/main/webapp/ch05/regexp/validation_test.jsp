<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkMember(){
		let form = document.Member;
		let id = form.id.value;
		let pw = form.passwd.value;
		let name = form.name.value;
		
	
		
		if(id == "" || pw == ""){
			alert("아이디(또는 비밀번호)를 입력해주세요");
			return false;
		}
		if(pw.search(id) > -1 ) {
			alert("비밀번호는 아이디를 포함할 수 없습니다");
			return false;
		}
		if(name == "") {
			alert("이름을 입력해주세요");
			return false;
		}
		
		form.submit();
	}


</script>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="test_process02.jsp" method="post" name="Member">
		<p>아이디 : <input type="text" name="id">
		<p>비밀번호 : <input type="password" name="passwd">
		<p>이 름 : <input type="text" name="name">
		<p><button type="button" onclick="checkMember()">가입하기</button>
	</form>
</body>
</html>