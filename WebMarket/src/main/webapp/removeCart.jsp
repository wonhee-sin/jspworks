<%@page import="java.util.ArrayList"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	if(id==null || id.trim().equals("")){
		response.sendRedirect("cart.jsp");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
	Product goodQnt = new Product();
	
	for(int i=0; i<cartList.size(); i++){
		goodQnt = cartList.get(i);
		if(goodQnt.getProductId().equals(id)){
			cartList.remove(goodQnt);
		}
	}
	response.sendRedirect("cart.jsp");
%>