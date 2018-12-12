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
	<a href="eventinsertform.do">새글 작성</a>
	<h3>이벤트 목록 입니다~</h3>
	<div class="row">
	<c:forEach items="${list }" var="tmp">
		<div class="col-xs-6 col-sm-3">
			<p>번호(임시) : ${tmp.num }</p>
			<img src="${pageContext.request.contextPath}${tmp.imagePath}" class="img-responsive" />
			<p>캡션 : ${tmp.caption }</p>
			
		</div>
		
	</c:forEach>
	</div>
</div>
</body>
</html>