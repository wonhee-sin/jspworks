<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	String passwd = request.getParameter("passwd");
	
	if(userid.equals("admin") && passwd.equals("1234")){
		//Cookie(쿠키이름, 쿠키값)
		Cookie cookieID = new Cookie("userID", userid);
		Cookie cookiePW = new Cookie("userPW", passwd);
	
		//클라이언트 컴퓨터에 쿠키를 발행
/* 		response.addCookie(cookieID);
		response.addCookie(cookiePW); */
		
		//쿠키 유효기간 설정
		cookieID.setMaxAge(24*60*60); //유효기간 - 1일로 설정
		cookiePW.setMaxAge(24*60*60);		
		
		response.addCookie(cookieID);
		response.addCookie(cookiePW);
		
		
		out.print("쿠키쿠키쿠키");
	}else {
		out.print("X!!!");
	}
	
%>