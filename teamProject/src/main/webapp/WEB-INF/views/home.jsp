<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
</head>
<body>

<c:choose>
	<c:when test="${empty sessionScope.id }">
		<a href="users/loginform.do">로그인</a>
	</c:when>
	<c:otherwise>
		<p> 
			<a href="users/info.do">${id }</a> 님 로그인중 ...
			<a href="users/logout.do">로그아웃</a>
		</p>
	</c:otherwise>
</c:choose>

<h3>페이지1</h3>
<ul>
	<li><a href="users/signup_form.do">회원가입</a></li>
	<li><a href="ask/list.do">QnA게시판 바로가기 관리자</a></li>
	<li><a href="ask/list2.do">QnA게시판 바로가기 사용자</a></li>
	<li><a href="ask/insertform.do">질문하러 가기</a></li>
</ul>
</body>
</html>


