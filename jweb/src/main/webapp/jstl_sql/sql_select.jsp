<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sql:setDataSource var="dataSource"
		driver = "com.mysql.cj.jdbc.Driver"
		url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&serverTimezone=Asia/Seoul"
		user = "root"
		password = "12345"
	 />
	<sql:query var="resultSet" dataSource="${ dataSource }">
		SELECT * FROM engineer;
	</sql:query>
	
	<table border="1">
		<tr>
			<c:forEach items="${ resultSet.columnNames }" var="columnName">
				<th width="100"><c:out value="${ columnName }"/></th>
			</c:forEach>
		</tr>
		<c:forEach items="${ resultSet.rowsByIndex }" var="row">
		<tr>
			<c:forEach items="${ row }" var="column">
				<td>
					<c:if test="${ column != null }">
						<c:out value="${ column }" />
					</c:if>
					<c:if test="${ column == null }">
						&nbsp;
					</c:if>
				</td>
			</c:forEach>
		</tr>
		</c:forEach>
	</table>
</body>
</html>