<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
	request.setCharacterEncoding("UTF-8");
	session.getAttribute("userName");

	//세션 유지
	ArrayList<String> productList = (ArrayList)session.getAttribute("productList");
	
	if(productList == null){
		productList = new ArrayList<>();
		session.setAttribute("productList",productList);
	}
	
	String product = request.getParameter("product");
	
	productList.add(product); //상품 저장
%>

<script>
	alert("<%=product %> 가(이) 추가되었습니다.");
	history.back();
</script>
