package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.repository.Board;
import com.repository.BoardDAO;
import com.repository.Member;
import com.repository.MemberDAO;


@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberDAO memberDAO;
	BoardDAO boardDAO;

	public void init(ServletConfig config) throws ServletException {
		memberDAO = new MemberDAO();
		boardDAO = new BoardDAO();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		System.out.println(uri);
		String command = uri.substring(uri.lastIndexOf("/"));
		String nextPage = null;
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		if(command.equals("/memberForm.do")) {
			nextPage = "/memberForm.jsp";
		}else if(command.equals("/memberList.do")) {
			ArrayList<Member> memberList = memberDAO.getListAll();
			request.setAttribute("memberList", memberList);
			nextPage = "/memberList.jsp";
		}else if(command.equals("/addMember.do")) {
			String memberid = request.getParameter("memberid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			if(!memberDAO.checkId(memberid)) {
				nextPage = "/joinfail.jsp";
			}else {
			Member member = new Member();
			member.setMemberid(memberid);
			member.setPasswd(passwd);
			member.setName(name);
			member.setGender(gender);
			memberDAO.addMember(member);
			
			request.setAttribute("msg", "register");
			nextPage = "/memberResult.jsp";
			}
		}else if(command.equals("/loginMember.do")) {
			nextPage="loginMember.jsp";
		}else if(command.equals("/loginProcess.do")) {
			String memberid = request.getParameter("memberid");
			String passwd = request.getParameter("passwd");
			String name = memberDAO.getNameByLogin(memberid);
			
			boolean loginResult = memberDAO.checkLogin(memberid, passwd);
			if(loginResult) {
				session.setAttribute("sessionId",memberid);
				request.setAttribute("name", name);
				request.setAttribute("msg", "login");
				nextPage = "/memberResult.jsp";
			}else {
				nextPage = "/loginfail.jsp";
			}
		}else if(command.equals("/logout.do")) {
			session.invalidate();
			request.setAttribute("msg", "logout");
			nextPage = "/memberResult.jsp";
		}else if(command.equals("/memberView.do")) {
			session = request.getSession();
			String sessionId = (String)session.getAttribute("sessionId");
			Member member = memberDAO.getMember(sessionId);
			
			request.setAttribute("member", member);
			nextPage="./memberView.jsp";
		}else if(command.equals("/updateMember.do")) {
			String memberid = request.getParameter("memberid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			
			Member member = new Member();
			member.setMemberid(memberid);
			member.setPasswd(passwd);
			member.setName(name);
			
			memberDAO.memberUpdate(member);
			
			request.setAttribute("member", member);
			request.setAttribute("msg", "update");
			nextPage="/memberResult.jsp";
		}else if(command.equals("/deleteMember.do")) {
			String memberid = request.getParameter("memberid");
			
			memberDAO.deleteMember(memberid);
			
			nextPage = "/memberList.do";
		}else if(command.equals("/boardList.do")) {
			ArrayList<Board> boardList = boardDAO.getListAll();
			
			request.setAttribute("boardList", boardList);
			
			nextPage = "/board/boardList.jsp";
		}else if(command.equals("/writeForm.do")) {
				nextPage = "/board/writeForm.jsp";
		}else if(command.equals("/writeProcess.do")) {
			String memberid = (String)session.getAttribute("sessionId");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Board board = new Board();
			board.setTitle(title);
			board.setContent(content);
			board.setMemberid(memberid);
			
			boardDAO.insertBoard(board);
			
			nextPage = "/boardList.do";
		}else if(command.equals("/boardView.do")) {
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			
			Board board = boardDAO.getBoard(bnum);
			
			request.setAttribute("board", board);
			nextPage = "/board/boardView.jsp";
		}else if(command.equals("/deleteBoard.do")) {
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			
			boardDAO.deleteBoard(bnum);
			
			request.setAttribute("msg", "bo_delete");
			nextPage = "/memberResult.jsp";
		}else if(command.equals("/updateBoard.do")) {
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Board board = new Board();
			board.setBnum(bnum);
			board.setTitle(title);
			board.setContent(content);
			
			boardDAO.updateBoard(board);
			
			request.setAttribute("msg", "bo_update");
			nextPage = "/memberResult.jsp";
		}
		
		//포워딩 - 페이지 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
		
	}

}
