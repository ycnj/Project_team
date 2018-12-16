<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/event/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style>
	#picForm{ display: none;}
</style>
</head>
<body>
<div class="container">	
	<h3> 새 이벤트 작성 폼 입니다.</h3>
	<div class="row">
	<form action="insert.do" method="post" id="uploadForm">
		<input type="hidden" name="saveFileName" />
		<div class="form-group">
		<label for="title">제목</label>
		<input type="text" name="title" id="title"/>
		<br/>
		<label for="content">내용</label>
		<textarea name="content" id="content" style="width:100%;height:400px;"></textarea>
		</div>
		<div class="form-group">
			<button id="picBtn"><i class="glyphicon glyphicon-picture"></i></button>
			<br/>
			<img id="uploadedImg" class="img-responsive"/>
		</div>		
		<button type="submit" class="btn btn-primary">업로드</button>	
	</form>
	</div>
</div>
<form id="picForm" action="ajax_upload.jsp" method="post" enctype="multipart/form-data">
	<label for="image">이미지</label>
	<input class="form-control" type="file" 
		name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
</form>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.min.js"></script>
<script>
//이미지를 선택했을때 실행할 함수 등록 
$("#image").on("change", function(){
	//선택된 파일명을 얻어온다.
	var fileName=$(this).val();
	// 마지막 . 의 인덱스
	var lastIndex=fileName.lastIndexOf(".");
	// 확장자 얻어오기
	var extension=fileName.substr(lastIndex, fileName.length);
	if( extension == ".jpg" || extension == ".jpeg" || extension == ".png"){
		//이미지 파일을 제대로 선택한 것이다. 
		//폼 강제 제출
		$("#picForm").submit();
	}else{
		//잘못된 파일을 선택한 것이다.
		alert("이미지 파일을 선택하세요.");
	}
});
//이미지 폼 submit 이벤트 처리 
$("#uploadForm").on("submit", function(){
	if(formValid==false){
		return false; //폼 전송 막기 
	}
});
//사진 버튼을 눌렀을때 실행할 함수 등록
$("#picBtn").on("click", function(){
	// input type=file 에 강제 click 이벤트 발생시켜서
	// 파일을 선택할수 있도록 한다. 
	$("#image").click();
	//이벤트 막기
	return false;
});

// 사진을 선택한 폼이 ajax 요청을 통해서 제출되도록 플러그인을 사용한다.
$("#picForm").ajaxForm(function(responseData){
	// responseData =>  {saveFileName:"저장된파일명"}
	console.log(responseData);
	//img 요소에 src 에 이미지 경로 지정해서 이미지가 보이도록 한다.
	var src="${pageContext.request.contextPath}/upload/"+responseData.saveFileName;
	$("#uploadedImg").attr("src", src);
	//저장된 파일명이 폼 전송될때 같이 전송되도록 value 값을 넣어준다.
	$("input[name=saveFileName]").val(responseData.saveFileName);
});	
</script>
</body>
</html>