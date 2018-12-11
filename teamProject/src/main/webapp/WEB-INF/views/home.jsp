<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h4>오늘의 공지사항</h4>
<ul>
	<c:forEach items="${noticeList }" var="tmp">
		<li>${tmp }</li>
	</c:forEach>
<li><a href="freeboard/list.do">게시판 목록보기</a></li>
</ul>
</body>
</html>
