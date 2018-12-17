<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/private/upload_form2.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style>
	#picForm{ display: none;}
</style>
</head>
<body>
<div class="container">
<h3>새 이벤트 작성</h3>
<form action="upload.do" method="post" enctype="multipart/form-data">
	<label for="title">제목</label>
	<input type="text" name="title" id="title"/><br/>
	<label for="myFile">첨부파일</label>
	<input type="file" name="file" id="myFile" /><br/>
	<button type="submit">업로드</button>
</form>	
</div>
</body>
</html>

















