<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head><title> InsertTitle </title></head>
<body>
<%
String abc = (String) request.getAttribute("result");
out.print(abc);
%>
</body>
</html>