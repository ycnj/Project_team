<%@ page language="java" contentType="text/html; charset=UTF-8"  
											pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> emp수정 </title>
<script src="/acorn_servlet/js/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/acorn_servlet/css/main.css">
<link rel="stylesheet" href="/acorn_servlet/css/jquery-ui.css">
<script src="/acorn_servlet/js/jquery-1.12.4.js"></script>
<script src="/acorn_servlet/js/jquery-ui.js"></script>
</head>
<script>	
  $( function() {
    $( "#hiredate" ).datepicker();
  } );
</script>
<script>

$(function(){
	$("#saveBtn").click(function(){
		var formData = $("#frm").serialize();
		$.ajax({
			type: "POST",
			data: formData,
			url: "/acorn_servlet/updateEmp.do",
			success: function(data) {
				if(data.trim() == "1") {
					alert("저장");
					location = "/acorn_servlet/empList.do";
				} else {
					alert("실패");
				}
			},
			error: function () {
				alert("오류발생 ");
			}
		});
	});
	
	$("#delBtn").click(function(){
		var formData = $("#frm").serialize();
		$.ajax({
			type: "POST",
			data: formData,
			url: "/acorn_servlet/deleteEmp.do",
			success: function(data) {
				if(data.trim() == "1") {
					alert("삭제성공");
					location = "/acorn_servlet/empList.do";
				} else {
					alert("삭제실패");
				}
			},
			error: function () {
				alert("오류발생 ");
			}
		});
	});
});

</script>
<body>
<form name="frm" id="frm" method="post" action="">
<div  style="width:600px;text-align:right;margin-bottom:5px;">
	<button type="button" onclick="location.href='/acorn_servlet/empList.do'">목록</button>
	<button id="saveBtn">저장</button>
	<button type="reset">취소</button>
	<button id="delBtn">삭제</button>
</div>

<input type="hidden" name="empno" value="${resultList.empno}" >

<table border="1" width="600px">
	<colgroup>
		<col width="20%"/>
		<col width="*" />
	</colgroup>
   <tr>
        <td>사원번호</td>
        <td>${resultList.empno}</td>
   </tr>
   <tr>
         <td>사원이름</td>
         <td><input type="text" name="ename" value="${resultList.ename}"></td>
   </tr>
   <tr>
         <td>급여</td>
         <td><input type="text" name="sal" value="${resultList.sal}"></td>
   </tr>
   <tr>
         <td>입사일</td>
         <td><input type="text" name="hiredate" id="hiredate" value="${resultList.hiredate}"></td>
   </tr>
   <tr>
         <td>부서</td>
         <td><input type="text" name="deptno" id="deptno" value="${resultList.deptno}"></td>
   </tr>
</table>
</form>
</body>
</html>