<%@page import="vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	//해당 아이디와 일치하는 목록에 있는 상품 객체
	
	ArrayList<Product> goodList = dao.getAllProducts();
	Product good = new Product();
	for(int i=0; i<goodList.size(); i++){
		good = goodList.get(i);
		if(good.getProductId().equals(id)){ //저장된 상품 아이디와 넘어온 아이디가 같으면
			break;
		}
	}
	
	//장바구니에 저장할 리스트 생성하고 세션 발급
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
	if(list == null){
		list = new ArrayList<>();
		session.setAttribute("cartlist", list); //세션 발급
	}
	
	int cnt = 0; //장바구니 품목의 개수
	Product goodQnt = new Product();
	
	for(int i=0;i<list.size(); i++){
		goodQnt = list.get(i);
		if(goodQnt.getProductId().equals(id)){
			cnt++;
			int orderQuantity = goodQnt.getQuantity() + 1; //주문 수량 합계
			goodQnt.setQuantity(orderQuantity);
		}
	}
	
	if(cnt == 0){ //추가 수량이 없으면
		good.setQuantity(1);
		list.add(good);
	}
	
	response.sendRedirect("./product.jsp?id=" + id);
%>