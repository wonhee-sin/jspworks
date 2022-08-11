<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<link rel="stylesheet" href="./resources/CSS/bootstrap.css">
<script>
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="sisplay-3"></h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
	%>
	<div class = "container">
		<div class="row" align="center">
			<div class="col-md-5">
				<img src="./upload/<%=product.getFilename() %>" style="width: 100%">
			</div>
			<div class="col-md-6">
				<h3><%=product.getPname() %></h3>
				<p><%= product.getDescription() %></p>
				<p><b>상품 코드</b>: <span class="badge badge-danger"><%=product.getProductId() %></span></p>
				<p><b>제조사</b>: <%=product.getManufacturer() %></p>
				<p><b>분류</b>: <%=product.getCategory() %></p>
				<p><b>재고 수</b>: <%=product.getUnitsInStock() %></p>
				<h4><%=product.getUnitPrice() %>원</h4>
				<p><form name="addForm" action="./addCard.jsp?id=<%=product.getProductId() %>" method="post">
						<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>				
						<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>				
						<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>				
				   </form>
			</div>
		</div>
	</div>
	<%@ include file = "footer.jsp" %>
</body>
</html>