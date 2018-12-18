<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/event/updateform.jsp</title>
</head>
<body>
<div class="container">
	<p><strong>${id}</strong>님이 작성한글</p>
	<h3>컨텐츠 업로드 폼입니다.</h3>
	<form action="upload.do" method="post" enctype="multipart/form-data">
		<label for="title">제목</label>
		<input type="text" name="title" id="title"/><br/>
		<label for="content">내용</label>
		<textarea name="content" id="content" cols="30" rows="10"></textarea>
		<label for="myFile">첨부파일</label>
		<input type="file" name="file" id="myFile" /><br/>
		<button type="submit">업로드</button>
	</form>
</div>
</body>
</html>