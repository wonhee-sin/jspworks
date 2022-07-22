package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;

@WebServlet("/cookie")
public class SetCookies extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		Date date = new Date();
		
		PrintWriter out = response.getWriter();
		
		//쿠키 객체 생성
		Cookie cookie = new Cookie ("cookieTest",URLEncoder.encode("JSP프로그래밍","UTF-8"));
		
		cookie.setMaxAge(24*60*60);
		
		response.addCookie(cookie);
		
		out.println("쿠키쿠키쿠키<br>");
		out.println("현재 시간 " + date);
		
		
	}

}
