<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/event/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<a href="insertform.do">관리자용 페이지</a>
	<h3>이벤트 목록 입니다~</h3>
	<div class="row">
	<c:forEach items="${list }" var="tmp">
		<div class="col-xs-6 col-sm-3">
			<p>${tmp.content }</p>
			<p><a href="detail.do?num=${tmp.num }">내용 : ${tmp.title }</a></p>	
		</div>		
	</c:forEach>
	</div>
</div>
</body>
</html>