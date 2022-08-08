package com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class AuthenFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

		System.out.println("Filter01 초기화...");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter writer = response.getWriter();
		
		String name = request.getParameter("name");
		String message = "";
		
		if(name == null || name.equals("")) {
			message = "입력된 name 값은 null입니다.";
			writer.print(message);
			return;
		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("Filter01 해제");
	}



}
