<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market</title>
<link rel="stylesheet" href="./resources/CSS/bootstrap.css">
<script src="./resources/js/validation.js"></script>
</head>
<body>

	<%@ include file = "menu.jsp" %>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	<div class = "container">
		<div class="row">
			<%@ include file ="./dbconn.jsp" %>
			<%
				String productId = request.getParameter("id");
			
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "SELECT * FROM product WHERE p_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,productId);
				rs = pstmt.executeQuery();
				if(rs.next()){
			%>
			<div class="col-md-5">
				<img alt="image" src="./upload/<%=rs.getString("p_fimename") %>" style="width: 100%">
			</div>
			<div class="col-md-7">
				<form name="newProduct" action="./processUpdateProduct.jsp"
					  method="post" encType="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">상품 코드</label>
						<div class="col-sm-3">
							<input type="text" id="productId" name="productId" class="form-control" value="<%=rs.getString("p_id") %>" readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품명</label>
						<div class="col-sm-3">
							<input type="text" id="pname" name="pname" class="form-control" value="<%=rs.getString("p_name") %>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=rs.getInt("p_unitPrice") %>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품 설명</label>
						<div class="col-sm-3">
							<textarea id="description" name="description" rows="2" cols="50" class="form-control"><%=rs.getString("p_description") %></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">제조사</label>
						<div class="col-sm-3">
							<input type="text" id="manufacturer" name="manufacturer" class="form-control" value="<%=rs.getString("p_manufacturer") %>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품 분류</label>
						<div class="col-sm-3">
							<input type="text" id="category" name="category" class="form-control" value="<%=rs.getString("p_category") %>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">재고수</label>
						<div class="col-sm-3">
							<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=rs.getLong("p_unitsInStock") %>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"></label>
						<div class="col-sm-5">
							<% if(rs.getString("p_condition").equals("New")){ %>
							<input type="radio" name="condition" value="New" checked="checked"> 신제품
							<input type="radio" name="condition" value="Old"> 중고제품
							<input type="radio" name="condition" value="Refurbished"> 재생제품
							<% } %>
							<% if(rs.getString("p_condition").equals("Old")){ %>
							<input type="radio" name="condition" value="New" > 신제품
							<input type="radio" name="condition" value="Old" checked="checked"> 중고제품
							<input type="radio" name="condition" value="Refurbished"> 재생제품
							<% } %>
							<% if(rs.getString("p_condition").equals("Refurbished")){ %>
							<input type="radio" name="condition" value="New" checked="checked"> 신제품
							<input type="radio" name="condition" value="Old"> 중고제품
							<input type="radio" name="condition" value="Refurbished" checked="checked"> 재생제품
							<% } %>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">제품 이미지</label>
						<div class="col-sm-5">
							<input type="file" name="fileName" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="button" onclick="checkAddProduct()" class="btn btn-primary" value="등록">
						</div>
					</div>
				</form>
			</div>
			<%
					}
					if(rs != null){
						rs.close();
					}
					if(pstmt != null){
						pstmt.close();
					}
					if(conn != null){
						conn.close();
					}
			%>
		</div>
	</div>
	<%@ include file = "footer.jsp" %>
</body>
</html>