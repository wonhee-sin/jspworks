<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="process.jsp">
		<p>
			<label>오랜지<input type="checkbox" name="fruit" value="Orange" chaeckd></label>
			<label>사과<input type="checkbox" name="fruit" value="Apple"></label>
			<label>바나나<input type="checkbox" name="fruit" value="banana"></label>
			<input type="submit" value="전송">
		</p>
	</form>
</body>
</html>