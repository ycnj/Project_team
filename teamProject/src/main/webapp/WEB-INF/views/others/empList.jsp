<%@page import="com.team.spring.apple.EmpList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div  style="width:600px;text-align:right;margin-bottom:5px;">
	<button type="button" onclick="location.href='/acorn_servlet/empWrite.do'">쓰기</button>
</div>
<table border="1">
	<tr>
		<th>번호</th><th>사원번호</th><th>사원이름</th><th>부서이름</th><th>연봉</th><th>입사일</th>
	</tr>
<c:forEach  var="result" items="${resultList}" varStatus="status">
    <tr>
         <td>${status.count}</td>
         <td>
  <a href="/teamProject/empModify.do?empno=${result.empno}">${result.empno}</a></td>
         <td>${result.ename}</td>
         <td>${result.dname}</td>
         <td>${result.sal}</td>
         <td>${result.hiredate}</td>
    </tr>
</c:forEach>
</table>
</body>
</html>


