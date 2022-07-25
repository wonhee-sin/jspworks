<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
img {width : 100px; height:100px; border-radius : 5px;}
</style>
<%
	request.setCharacterEncoding("UTF-8");

	//업로드 폴더 위치
	String realFolder ="C:\\dev\\jspworks\\jweb2\\src\\main\\webapp\\upload";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024,
					"UTF-8", new DefaultFileRenamePolicy());
	
	//요청 파라미터 name 속성과 value 가져오기
	Enumeration<String> params = multi.getParameterNames();
	while(params.hasMoreElements()){//name속성이 있다면 반복
		String name = params.nextElement();	//name을 가져오기
		String value = multi.getParameter(name);	//name을 매개로 value가져오기
		out.println(name + "=" + value + "<br>");
	}
	
	
	//요청한 파라미터중 파일(filename)의 솔성 가져오기
	Enumeration<String> files = multi.getFileNames();
	while(files.hasMoreElements()){
		String name = files.nextElement();
		String fileName = multi.getFilesystemName(name);
		String original = multi.getOriginalFileName(name);
		String type = multi.getContentType(name);
		File file = multi.getFile(name);
		
		out.println("요청 파라미터 이름 : " + name + "<br>");
		out.println("저장 파일 이름 : " + fileName + "<br>");
		out.println("실제 파일 이름 : " + original + "<br>");
		out.println("파일 컨텐츠 유형 : " + type + "<br>");
		
		if(file != null){
			out.println("파일 크기 : " + file.length()+ "B");
		}
	
%>
<p>이미지 보기</p>
<p><img src="../upload/<%=fileName %>">
<% } %>