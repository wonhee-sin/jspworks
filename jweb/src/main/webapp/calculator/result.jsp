<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bean.Calculator2" %>
<%@ page import="java.lang.Exception" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산 결과</title>
<link rel="stylesheet" href="../resources/css/calc.css">
</head>
<body>
	<div id="container">
		<h2>계산기</h2>
		<hr>
		<%
		//입력된 문자를 숫자로 변환
			double num1 = 0.0;
			double num2 = 0.0;
			if(request.getParameter("num1").equals("") || request.getParameter("num2").equals("")){
				out.print("숫자를 입력하세요!!");
				} else {
				try{
				num1 = Double.parseDouble(request.getParameter("num1"));
				num2 = Double.parseDouble(request.getParameter("num2"));
				}catch(Exception e){
					out.print("문자 사용 금지!!");
				}
			}
			
			
			String op = request.getParameter("op");
			
			Calculator2 calc = new Calculator2();
			calc.setNum1(num1);
			calc.setNum2(num2);
			calc.setOp(op);
			if (calc.getOp().equals("/") && calc.getNum2() == 0){
				out.println("계산할 수 없음!!");
			}else{
				calc.calculate();
				out.print("<p>계산 결과 : " + calc.getResult());
			}
			
		%>
		
	</div>
</body>
</html>