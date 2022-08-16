<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market</title>
<link rel="stylesheet" href="./resources/CSS/bootstrap.css">
</head>
<%
	String shipping_cartId ="";
	String shipping_shippingDate = "";
	
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			Cookie cookie = cookies[i];
			String name = cookie.getName();
			if(name.equals("Shipping_cartId")){
				shipping_cartId = URLDecoder.decode(cookie.getValue(), "UTF-8");
			}
			if(name.equals("Shipping_shippingDate")){
				shipping_shippingDate = URLDecoder.decode(cookie.getValue(), "UTF-8");
			}
		}
	}
%>
<body>
	<%@ include file = "menu.jsp" %>
	<div class="jumbotron">
		<div class = "container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해 주셔서 감사합니다.</h2>
		<p> 상품은 <%=shipping_shippingDate %>에 배송될 예정입니다.
		<p> 주문번호: <%=shipping_cartId %>
	</div>
	<div class="container">
		<p><a href="./products.jsp">&laquo; 상품 목록</a>
	</div>
</body>
</html>

<%
	//모든 세션 삭제
	session.invalidate();

	//모든 쿠키 삭제
	for(int i=0; i<cookies.length; i++){
		Cookie cookie = cookies[i];
		String name = cookie.getName();
		if(name.equals("Shipping_cartId")){
			cookie.setMaxAge(0);	
		}
		if(name.equals("Shipping_name")){
			cookie.setMaxAge(0);	
		}
		if(name.equals("Shipping_shippingDate")){
			cookie.setMaxAge(0);	
		}
		if(name.equals("Shipping_country")){
			cookie.setMaxAge(0);	
		}
		if(name.equals("Shipping_zipCode")){
			cookie.setMaxAge(0);	
		}
		if(name.equals("Shipping_addressName")){
			cookie.setMaxAge(0);	
		}
		
		response.addCookie(cookie);
	} 
%>