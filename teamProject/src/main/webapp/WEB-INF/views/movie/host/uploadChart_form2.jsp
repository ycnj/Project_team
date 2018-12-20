<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/movie/movieChart.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-xs-6 cos-sm-4">
			<h3>파일 업로드</h3>
			<form action="uploadChart.do" method="post" enctype="multipart/form-data">
				<div class="form-group has-feedback">
					<label class="control-label" for="title">영화제목</label>
					<input class="form-control" type="text" name="title" id="title" autocomplete="off"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="content">영화주요내용</label>
					<textarea class="form-control" name="content" id="content" style="width:100%;height:300px;"/></textarea>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="opendate">개봉날짜</label>
					<input class="form-control" type="date" name="opendate" id="opendate" autocomplete="off"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="myFile">첨부파일</label>
					<input class="form-control" type="file" name="file" id="myFile"/>
				</div>
				<button class="btn btn-success" type="submit">업로드</button>
				<button class="btn btn-warning" type="reset">취소</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>