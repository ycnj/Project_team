<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd_updateform.jsp</title>
</head>
<body>
<h3>비밀 번호 수정폼</h3>
<form action="update_pwd.do" method="post" id="pwdForm">
	<label for="pwd">비밀번호</label>
	<input type="password" name="pwd" id="pwd"/><br/>
	<label for="pwd2">비밀번호 확인</label>
	<input type="password" name="pwd2" id="pwd2"/><br/>
	<button>저장</button>
</form>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script>
	$("#pwdForm").on("submit", function(){
		//입력한 두 비밀번호가 일치하는지 확인해서 일치하지 않으면 폼전송 막기
		var pwd=$("#pwd").val();
		var pwd2=$("#pwd2").val();
		if(pwd != pwd2){
			alert("비밀번호를 확인 하세요!");
			return false;//폼전송 막기
		}
	});
</script>
</body>
</html>








