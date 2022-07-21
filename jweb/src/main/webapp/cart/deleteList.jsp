<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<% 
	

	session.getAttribute("userName");
	request.setCharacterEncoding("UTF-8");
	
	ArrayList<String> productList = (ArrayList)session.getAttribute("productList");
	
	if(productList.size() != 0){	
	productList.remove(0);
	}
	response.sendRedirect("./selProduct.jsp");
%>