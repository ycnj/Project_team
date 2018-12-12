<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문참여</title>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
</head>
<script>
$(function() {
    $("#joinBtn").click(function(){
  		
    	var radioVal = $('input[id="comm"]:checked').val();
    	//alert(radioVal);
    	
    	var parm = "cd="+radioVal;
		$.ajax({
			type: "POST",
			data: parm,
			url: "/acorn_servlet/rschReSave.do",
			success: function(data) {
				if(data.trim() == "1") {
					alert("참여해주셔서 감사합니다.");
					self.close();
				} else {
					alert("참여실패, 관리자에게 문의바랍니다.");
				}
			},
			error: function () {
				alert("오류발생, 관리자에게 문의바랍니다. ");
			}
		});
    });
});
</script>
<body>
<form id="frm">
<table class="rschTbl">
	<colgroup>
		<col width="70%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th colspan="2">${title}</th>
	</tr>
	<c:forEach var="result" items="${resultList}" varStatus="status">
		<tr>
			<td>
			<input type="radio" name="comm" id="comm" 
										value="${result.cd}"/>
			${result.comm}
			</td>
		</tr>
	</c:forEach>
	<tr>
		<td>
			<button type="button" id="joinBtn">투표하기</button>
			<button type="button" onclick="self.close();">닫기</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>