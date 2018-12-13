<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/login.jsp</title>
</head>
<body>
<c:choose>
	<c:when test="${requestScope.isSuccess }">
		<p> ${id } 님 로그인 되었습니다. 
			<c:if test="${empty param.url }">
				<a href="${pageContext.request.contextPath}/home2.do">확인</a>
			</c:if>
			<c:if test="${not empty param.url }">
				<a href="${param.url }">확인</a>
			</c:if>
		</p>
	</c:when>
	<c:otherwise>
		<p> 아이디 혹은 비밀번호가 틀려요. <a href="loginform.do">다시 로그인 하기</a></p>
	</c:otherwise>
</c:choose>
</body>
</html>











