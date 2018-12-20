<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
<link rel="stylesheet" href="../resources/css/jquery-ui.css"/>
<script src="../resources/js/jquery-3.3.1.min.js"></script>
<script src="../resources/js/jquery-ui.js"></script>
</head>
<body>
<style>
.rschTbl { 
	width:500px; 
	border:1px solid;
	padding:5px;
}
.rsch_td {
	line-height:1.5em;
}
.rsch_input {
	width:95%;
	
}
</style>
<div class="container">
	<h3>설문조사목록</h3>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>시작날짜</th>
				<th>끝나는날짜</th>
				<th>글작성시간</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="tmp">
			<tr>
				<td>${tmp.cd }</td>
				<td><a href="rschJoinList?num=${tmp.num }&condition=${condition}&keyword=${encodedKeyword}">${tmp.title }</a></td>
				<td>${tmp.sdate }</td>
				<td>${tmp.edate }</td>
				<td>${tmp.rdate }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	

</div>
<div>
<a href="rschWrite.do">새글작성</a>
</div>

</body>
</html>