<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market</title>
<link rel="stylesheet" href="./resources/CSS/bootstrap.css">
<script src="./resources/js/validation.js"></script>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<%@ include file = "menu.jsp" %>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="display-3"><fmt:message key="title" /></h1>
		</div>
	</div>
	<div class = "container">
		<div class="text-right">
			<a href="?language=ko">Korean</a> | <a href="?language=en">English</a> | <a href="./logout.jsp" class="btn btn-sm btn-success">logout</a>
		</div>
		<form name="newProduct" action="./processAddProduct.jsp"
			  class="form-horizontal" method="post" encType="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productId" /></label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="pname" /></label>
				<div class="col-sm-3">
					<input type="text" id="pname" name="pname" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description" /></label>
				<div class="col-sm-3">
					<textarea id="description" name="description" rows="2" cols="50" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="manufacturer" /></label>
				<div class="col-sm-3">
					<input type="text" id="manufacturer" name="manufacturer" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category" /></label>
				<div class="col-sm-3">
					<input type="text" id="category" name="category" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New"> <fmt:message key="condition_New" />
					<input type="radio" name="condition" value="Old"> <fmt:message key="condition_Old" />
					<input type="radio" name="condition" value="Refurbished"> <fmt:message key="condition_Refurbished" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="filename" /></label>
				<div class="col-sm-5">
					<input type="file" name="fileName" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" onclick="checkAddProduct()" class="btn btn-primary" value="<fmt:message key="button" />">
				</div>
			</div>
		</form>
	</div>
	</fmt:bundle>
	<%@ include file = "footer.jsp" %>
</body>
</html>