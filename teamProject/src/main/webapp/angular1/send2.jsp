<%@page import="java.util.Map"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 전송되는 파라미터 읽어오기
	String name=request.getParameter("name");
	System.out.println("전송된 name:"+name);
	
	String addr=request.getParameter("addr");
	System.out.println("전송된 addr:"+addr);
	
	/* Map<String, String[]> map=request.getParameterMap();
	for(String parameter:map.keySet()){
		System.out.println(parameter);
	} */
	
%>
{"isSuccess":true}

