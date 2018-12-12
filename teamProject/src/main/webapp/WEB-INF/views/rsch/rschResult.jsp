<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문결과</title>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
</head>
<style>
.rschTbl { 
	width:400px; 
	border:1px solid;
	padding:5px;
}
.rsch_td {
	line-height:1.5em;
}

</style>
<body>
<form id="frm">
<table class="rschTbl">
	<colgroup>
		<col width="130"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th colspan="2" height="50">
		${title} (총득표:${total})
		</th>
	</tr>
	<c:forEach var="result" items="${resultList}" varStatus="status">
		
		<c:set var="width" value="${result.cnt*300/total}" />
		<tr>
			<td>${result.comm} (${result.cnt})</td>
			<td>
	<div style="width:${width}px;height:10px;background:red"></div>
			</td>
		</tr>
	</c:forEach>
	<tr>
		<th colspan="2" height="40">
			<button type="button" onclick="self.close();">닫기</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>