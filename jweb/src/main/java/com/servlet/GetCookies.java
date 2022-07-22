package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/getCookies")
public class GetCookies extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out =response.getWriter();
			
			Cookie[] cookies = request.getCookies();
			
			for(int i=0; i<cookies.length; i++) {
				boolean name = cookies[i].getName().equals("cookieTest");
				if(name) {
					String value = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
					out.println("<h3>쿠키 갑 가져오기 : " + value + "</h3>");
				}
			}
	}

}
