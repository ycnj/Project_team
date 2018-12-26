<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.css"/>
<style>
.rschTbl { 
	width:800px; 
	border:1px solid;
	padding:5px;
}
.rsch_td {
	line-height:1.5em;
}
.rsch_input {
	width:85%;
	
}
</style>
</head>
<body>

<form action="insert.do" method="post" id="frm">
	<table class="rschTbl">
		<colgroup>
			<col width="20%"/>
			<col width="*"/>
		</colgroup>
		<tr>
			<th>설문제목</th>
			<td style="text-align:right">
			<textarea name="title" id="title" style="width:95%; height:50px;"></textarea>
			</td>
		</tr>
		<tr>
			<th>항목</th>
			<td class="rsch_td">
			
			<c:forEach var="i" begin="1" end="10" step="1">
				<c:if test="${i<10}">&nbsp;</c:if>
				${i}. <input type="text" name="comm+${i}" id="comm" class="rsch_input"/> <br>
			</c:forEach>
			
			</td>
		</tr>
		<tr>
			<th>설문기간</th>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="sdate" id="sdate"> ~
				<input type="text" name="edate" id="edate"> 
			</td>
		</tr>
		<tr>
			<th>사용여부</th>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="use" id="use" value="Y" checked>사용,
			<input type="radio" name="use" id="use" value="N">미사용
			</td>
		</tr>
		<tr>
			<th colspan="2" height="50">
				<button onclick="submitContents()">저장</button>
				<button type="reset" id="resetBtn">취소</button>
			</th>
		</tr>
	</table>
</form>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.js"></script>
<script>	
$(function() {   
	$("#sdate,#edate").datepicker();
    	
    function submitContents() {
		//oEditors.getById["comm"].exec("UPDATE_COMM_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		$("#frm").submit();
	}
});
</script>
</body>
</html>




