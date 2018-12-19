<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/findpwd.jsp</title>
</head>
<body>
<h3>비밀번호 찾기</h3>
<form action="findpwd.do">
	<label for="id">아이디</label>
	<input type="text" id="id" name="name" />
	<label for="email">이메일</label>
	<input type="email" id="email" name="email"/>
	<label for="name">이름</label>
	<input type="text" id="name" name="name" />
	<label for="rrn">생년월일</label>	
</form>
</body>
</html>