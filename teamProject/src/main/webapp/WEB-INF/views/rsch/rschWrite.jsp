<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문등록</title>

<link rel="stylesheet" href="../resources/css/jquery-ui.css"/>
<script src="../resources/js/jquery-3.3.1.min.js"></script>
<script src="../resources/js/jquery-ui.js"></script>
</head>

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
	width:95%;
	
}
</style>

<script>
$(function() {
    $("#sdate,#edate").datepicker();
    
    $("#saveBtn").click(function(){
    	if($("#title").val().trim() == "") {
    		alert("설문제목을 입력해주세요.");
    		$("#title").val("");
    		$("#title").focus();
    		return false;
    	}
			success: function(data) {
				if(data.trim() == "1") {
					alert("저장하였습니다.");
					location = "${pageContext.request.contextPath }/rsch/rschList.do";
				} else {
					alert("저장 실패했습니다. 다시 시도해 주세요.");
				}
			},
			error: function () {
				alert("오류발생 ");
			}
			document.submit();
		}); 
    });

});
</script>
<body>
<form id="frm">
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
			${i}. <input type="text" name="comm" id="comm" class="rsch_input"/> <br>
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
		<button type="button" id="saveBtn">저장</button>
		<button type="reset" id="resetBtn">취소</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>



