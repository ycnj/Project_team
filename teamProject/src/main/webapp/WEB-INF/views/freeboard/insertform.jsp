<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/freeboard/insertform.jsp</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script
	src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
</head>
<body>
	<div class="container">
		<p>
			<strong>${id }</strong>님 로그인중...
		</p>
		<h3>게시판 새 글</h3>
		<form action="insert.do" method="post">
		<label for="title">제목</label>
		<input type="text" name="title" id="title"/>
		<br/>
		<label for="content">내용</label>
		<textarea name="content" id="content" style="width:100%;height:400px;display:none;"></textarea>
			<div>
				<input type="button"
					onclick="location.href='../file/upload_form.do'" value="파일업로드" />
				<input type="button" onclick="submitContents(this);" value="확인" />
				<input type="button" onclick="history.back()" value="취소" />

			</div>
		</form>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script>

		var oEditors = [];

		//추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

		nhn.husky.EZCreator
				.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "content",
					sSkinURI : "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",
					htParams : {
						bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
						fOnBeforeUnload : function() {
							//alert("완료!");
						}
					}, //boolean
					fOnAppLoad : function() {
						//예제 코드
						//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
					},
					fCreator : "createSEditor2"
				});

		function submitContents(elClickedObj) {
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
			var title=$("#title").val();
			var content=$("#content").val();
			if (title== "" || title == null) {
				alert("제목을 입력하세요");
				return false;
			}
			if (content == '<p>&nbsp;</p>') {
				alert("내용을 입력하세요");
				return false;
			}
			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}
	</script>
</body>
</html>












