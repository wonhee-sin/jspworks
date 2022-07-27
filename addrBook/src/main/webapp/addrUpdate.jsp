<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 프로그램</title>
<link rel="stylesheet" href="./resources/css/Addrbook.css">
</head>
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
<jsp:useBean id="addrBook" class="com.dao.AddrBook" scope="application"/>
<body>
     <div id="container">
		<h2>주소록 등록</h2>
		<hr>

		
		<form action="addrUpdateProcess.jsp" method="post">
               <table id="tbl_view">
               <%
               		int num = Integer.parseInt(request.getParameter("num"));
               		if(session.getAttribute("sessionId") != null){
            			addrBook = abDAO.getOne(num);   			
            
               %>
                    <tr>
                         <td>번호</td>
                         <td><input type="text" name="num" value=<%=addrBook.getNum()%> readOnly></td>
                    </tr>
                    <tr>
                         <td>이름</td>
                         <td><input type="text" name="username" maxlength="20" size="20"></td>
                    </tr>
                    <tr>
                         <td>전화번호</td>
                         <td><input type="text" name="tel" maxlength="20" size="20"></td>
                    </tr>
                    <tr>
                         <td>이메일</td>
                         <td><input type="text" name="email" maxlength="20" size="20"></td>
                    </tr>
                    <tr>
                         <td>성별</td>
                         <td>
                              <select name="gender">
                                   <option selected>남</option>
                                   <option>여</option>
                              </select>
                         </td>
                    </tr>
                    <tr>
                         <td>가입일</td>
                         <td><input type="text" name="joinDate" value=<%=addrBook.getJoinDate() %>></td>
                    </tr>
                    <tr>
                         <td colspan="2">
                              <input type="submit" value="저장">
                              <input type="reset" value="취소">
                              <a href="./addrList.jsp"><button type="button">목록</button></a>
                         </td>
                    </tr>
                    <%
               		}else {
               			response.sendRedirect("./loginForm.jsp");
               		}
                    %>
               </table>
          </form>
	</div>
</body>
</html>