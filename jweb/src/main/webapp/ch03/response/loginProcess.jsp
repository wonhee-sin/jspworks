<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% 
    	request.setCharacterEncoding("UTF-8");
    
    	String id = request.getParameter("id");
    	String pwd = request.getParameter("passwd");
    	
    	if(id.equals("admin") && pwd.equals("1234")){
    		response.sendRedirect("loginSuccess.jsp");
    	} else {
    		response.sendRedirect("loginFail.jsp");
    	}
    %>