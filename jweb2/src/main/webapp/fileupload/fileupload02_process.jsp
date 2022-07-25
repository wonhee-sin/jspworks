<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String realFolder ="C:\\dev\\jspworks\\jweb2\\src\\main\\webapp\\upload";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "UTF-8",
					new DefaultFileRenamePolicy());
	
	String name1 = multi.getParameter("name1");
	String title1 = multi.getParameter("title1");
	
	String name2 = multi.getParameter("name2");
	String title2 = multi.getParameter("title2");
	
	String name3 = multi.getParameter("name3");
	String title3 = multi.getParameter("title3");
	
	//파일 정보 가져오기(스택 자료구조)
	Enumeration<String> files = multi.getFileNames();
	
	String file3 = files.nextElement();
	String filename3 = multi.getFilesystemName(file3);
	
	String file2 = files.nextElement();
	String filename2 = multi.getFilesystemName(file2);
	
	String file1 = files.nextElement();
	String filename1 = multi.getFilesystemName(file1);
%>
<style type="text/css">
	table{width:300px}
	table, th, td{
		border:1px solid #ccc;
		border-collapse: collapse;
		padding: 10px;
	}
	img{width:250px; height : 250px}
</style>

<table>
	<tr>
		<th>이 름</th>
		<th>제 목</th>
		<th>파 일</th>
	</tr>

<%
	out.print("<tr><td>" + name1 + "</td>");
	out.print("<td>" + title1 + "</td>");
	out.print("<td>" + filename1 + "</td></tr>");
	
	out.print("<tr><td>" + name2 + "</td>");
	out.print("<td>" + title2 + "</td>");
	out.print("<td>" + filename2 + "</td></tr>");
	
	out.print("<tr><td>" + name3 + "</td>");
	out.print("<td>" + title3 + "</td>");
	out.print("<td>" + filename3 + "</td></tr>");
%>
</table>

<img src="../upload/<%=filename1%>">
<img src="../upload/<%=filename2%>">
<img src="../upload/<%=filename3%>">