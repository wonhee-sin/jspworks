<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String realFolder="C:/dev/jspworks/WebMarket2/src/main/webapp/upload/";
	int maxSize = 5*1024*1024;
	String encType = "UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder,
			maxSize, encType, new DefaultFileRenamePolicy());

	//폼 입력값 받아오기
	String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	int price;
	if(unitPrice.isEmpty()){
		price = 0;
	}else {
		price = Integer.valueOf(unitPrice);
	}
	
	long stock;
	if(unitsInStock.isEmpty()){
		stock = 0;
	}else {
		stock = Long.valueOf(unitsInStock);
	}
	
	
	Enumeration<?> files = multi.getFileNames(); //파일 가져오기 반복
	String fname = (String)files.nextElement(); //파일 이름
	String fileName = multi.getFilesystemName(fname); //이미지 파일
	
	PreparedStatement pstmt = null;
	if(fileName != null){
		String sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_category=?, "
				+ "p_manufacturer=?, p_unitsInStock=?, p_condition=?, p_fimename=? WHERE p_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pname);
		pstmt.setInt(2, price);
		pstmt.setString(3, description);
		pstmt.setString(4, manufacturer);
		pstmt.setString(5, category);
		pstmt.setLong(6, stock);
		pstmt.setString(7, condition);
		pstmt.setString(8, fileName);
		pstmt.setString(9, productId);
		pstmt.executeUpdate();
	}else{
		String sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_category=?, "
				+ "p_manufacturer=?, p_unitsInStock=?, p_condition=? WHERE p_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pname);
		pstmt.setInt(2, price);
		pstmt.setString(3, description);
		pstmt.setString(4, manufacturer);
		pstmt.setString(5, category);
		pstmt.setLong(6, stock);
		pstmt.setString(7, condition);
		pstmt.setString(8, productId);
		pstmt.executeUpdate();
	}
	if(pstmt != null){
		pstmt.close();
	}
	if(conn != null){
		conn.close();
	}

	
	response.sendRedirect("./editProduct.jsp?edit=update");
%>