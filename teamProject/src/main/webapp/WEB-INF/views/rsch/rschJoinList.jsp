<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문목록</title>

<link rel="stylesheet" href="../resources/css/jquery-ui.css"/>
<script src="../resources/js/jquery-3.3.1.min.js"></script>
<script src="../resources/js/jquery-ui.js"></script>
</head>

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

<script>
function fn_join(cd) {
	url = "rschReply.do?cd="+cd;
	window.open(url,"pop1","width=400,height=400");
}

function fn_result(cd) {
	url = "rschResult.do?cd="+cd;
	window.open(url,"pop1","width=400,height=400");
}

</script>

<body>
<form id="frm">
<table class="rschTbl">
	<colgroup>
		<col width="70%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th colspan="2">설문목록</th>
	</tr>	
	<c:forEach var="result" items="${resultList}" varStatus="status">
		<tr>
			<td>${result.title}</td>
			<td>
			<button type="button" onclick="fn_join('${result.cd}')">응모</button>
			<button type="button" onclick="fn_result('${result.cd}')">결과</button>
			</td>
		</tr>
	</c:forEach>
</table>
</form>
</body>
</html>




