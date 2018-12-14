<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록화면</title>
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
		if($("#empno").val()=="")(function(){
			alert("사원번호를 입ㄹ겨해주세요.");
			return false;
		});
		var formData = $("#frm").serialize();
		$.ajax({
			type: "POST",
			data: formData,
			url: "/acorn_servlet/insertEmp.do",
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
});

</script>
<body>
<form name="frm" id="frm" method="post" action="">
<div  style="width:600px;text-align:right;margin-bottom:5px;">
	<button type="button" onclick="location.href='/acorn_servlet/empList.do'">목록</button>
</div>
<table border="1" style="width:600px;">
	<colgroup>
		<col width="20%"/>
		<col width="*" />
	</colgroup>
	<tr>
		<th>사원번호</th>
		<td><input type="text" name="empno" id="empno"></td>
	</tr>
	<tr>
		<th>사원이름</th>
		<td><input type="text" name="ename" id="ename"></td>
	</tr>
	<tr>
		<th>급여</th>
		<td><input type="text" name="sal" id="sal"></td>
	</tr>
	<tr>
		<th>입사일</th>
		<td><input type="text" name="hiredate" id="hiredate"></td>
	</tr>
	<tr>
		<th>부서번호</th>
		<td><input type="text" name="deptno" id="deptno">
		</td>
	</tr>
<!-- 	<tr>
		<th>job</th>
		<td><input type="text" name="job" id="job">
		</td>
	</tr>
	<tr>
		<th>mgr</th>
		<td><input type="text" name="mgr" id="mgr">
		</td>
	</tr>
	<tr>
		<th>COMM</th>
		<td><input type="text" name="comm" id="comm">
		</td>
	</tr> -->
	<tr>
		<th colspan="2" height="40">
			<button type="button" id="saveBtn">저장</button>
			<button type="button" onclick="document.frm.reset()">취소</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>