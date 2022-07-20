<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("UTF-8");

	String[] fruit = request.getParameterValues("fruit");
%>

<p>선택한 과일
<p> <% 
		for(String fru : fruit){
			out.println(fru);
		}
	%>