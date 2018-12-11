<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/updateform.jsp</title>
</head>
<body>
<h3>회원정보 수정 페이지 입니다</h3>
<form action="update.do" method="post" id="updateForm">
	<input type="hidden" name="id" value="${dto.id }"/>
	<label for="id">아이디</label>
	<input type="text" id="id" value="${dto.id }" 
		disabled="disabled"/><br/>
	<label for="email">이메일 주소</label>
	<input type="text" name="email" id="email" 
		value="${dto.email }"/><br/>
	<button type="submit">수정 확인</button>
</form>
<a href="pwd_updateform.do">비밀번호 수정</a>
</body>
</html>








