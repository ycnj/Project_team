<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
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
		<br />
		<p>
		<c:if test="${sessionScope.id eq 'gura' }">
			<a href="users/userslist.do">관리자page</a>
		</c:if> </p>
	</c:otherwise>
</c:choose>

<h4>오늘의 공지사항</h4>
<ul>
	<li><a href="users/signup_form.do">회원가입</a></li>
	<c:forEach items="${noticeList }" var="tmp">
		<li>${tmp }</li>
	</c:forEach>

</ul>
</body>
</html>
