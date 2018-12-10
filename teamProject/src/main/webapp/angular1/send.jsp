<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 전송되는 파라미터 읽어오기
	String msg=request.getParameter("msg");
	System.out.println("전송된 msg:"+msg);
	
	String msg2=request.getParameter("msg2");
	System.out.println("전송된 msg:"+msg2);
	
	/* Map<String, String[]> map=request.getParameterMap();
	for(String parameter:map.keySet()){
		System.out.println(parameter);
	} */
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/webapp/angular1/send.jsp</title>
</head>
<body>
	메롱~
</body>
</html>

