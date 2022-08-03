<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>점수를 입력해 주세요</h2>
	<form action="scoreTest.jsp" method="get" name="scoreForm">
		<p>점수 : <input type="text" name="score">
			<input type="button" onclick="checkScore()" value="학점출력"></p>
	</form>
	
	<script type="text/javascript">
		function checkScore(){
			let score = document.scoreForm.score.value;
			if(score == "" || score < 0 || score > 100){
				alert("점수를 제대로 입력해 주세요");
				return false;
			}
			document.scoreForm.submit();
		}
	</script>
</body>
</html>