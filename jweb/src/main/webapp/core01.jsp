<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl 예제</title>
</head>
<body>
<%-- <%
	int num = 11;
	
	if(num % 2 == 0){
		out.println("짝수");
	}else {
		out.println("홀수");
	}
%> --%>

<c:set var="num" value="1" />
<c:choose>
	<c:when test="${ num==0 }">
		${ num } 입니다.
	</c:when>
	<c:when test="${ num%2==0 }">
		${ num }은 짝수입니다.
	</c:when>
	<c:when test="${ num%2==1 }">
		${ num }은 홀수입니다.
	</c:when>
</c:choose>


</body>
</html>