<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<!--<![endif]-->
<head>

<!-- link 로딩 -->
<jsp:include page="../include/MSC1.jsp" />
	<tlte>insertform</tlte>


<script
	src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>


<script>
	var test = 0;
	function fileUpload() {

		if (test == 0) {
			$('#uploadBtn').show();
			test = 1;
		}else if (test == 1) {
			$('#uploadBtn').hide();
			test = 0;
		} 
	}
</script>

<style>

#uploadBtn {
	display: none;
}
</style>
</head>
<body>

	<!--
        Fixed Navigation
        ==================================== -->
	<header id="navigation" class="navbar-fixed-top">
		<div class="container">
			<jsp:include page="../include/header.jsp" />
		</div>
	</header>
	<!--
        End Fixed Navigation
        ==================================== -->


	<!--
        #service-bottom
        ========================== -->

	<section id="service-bottom">
		<div class="container">
			<div class="mobile-device">
				<img data-wow-delay="0.2s"
					class="img-responsive black  wow fadeInLeftBig"
					src="${pageContext.request.contextPath }/resources/images/icons/iphone-black.png"
					alt="iPhone Black"> <img data-wow-delay="0.5s"
					class="img-responsive white  wow fadeInLeftBig"
					src="${pageContext.request.contextPath }/resources/images/icons/iphone-white.png"
					alt="iPhone White">
			</div>
			<div class="service-features wow fadeInRight">
				<h3>OUR DESIGNS COMES WITH...</h3>
				<ul>
					<li>Responsive Design</li>
					<li>Modern And Clean Design</li>
					<li>Clean Code</li>
					<li>Browser Friendly</li>
				</ul>
			</div>
		</div>
	</section>
	<!--
        End #service-bottom
        ========================== -->


	<!--
        #service
        ========================== -->
	<section id="service">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-title text-center wow fadeInDown">
						<h2>자유게시판</h2>

					</div>
				</div>
				<h3 class="col-md-8 col-md-offset-2">새 글 작성</h3>
				<br />
			</div>

			<!--여기다! 22222222222222222222222222222222222222222222222222222222222  -->

			<div class="row">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<p>
								<strong>${id }</strong>님 로그인중...
							</p>
							<br />
							<form action="upload.do" method="post"
								enctype="multipart/form-data">
								<label for="title">제목</label> <input type="text" name="title"
									id="title" /> <br /> <label for="content">내용</label>
								<textarea name="content" id="content"
									style="width: 100%; height: 400px; display: none;"></textarea>
								<div>
									<!-- <input type="button" onclick="location.href='../file/upload_form.do'" value="파일업로드" /> -->
									<input type="button" onclick="javascript:fileUpload();"
										value="파일업로드" /> <input type="button"
										onclick="submitContents(this);" value="확인" /> <input
										type="button" onclick="history.back()" value="취소" />
								</div>
								<br />
								<div class="row" id="uploadBtn">
									<div class="container">
										<label for="myFile">첨부파일</label> <input type="file"
											name="file" id="myFile" />
									</div>
								</div>
							</form>

						</div>

					</div>
				</div>
			</div>
			<!-- end .row -->
		</div>
		<!-- end .container -->
	</section>
	<!--
        End #service
        ========================== -->

	<!--
        #count
        ========================== -->

	<section id="count">
		<div class="container">
			<div class="row">
				<div class="counter-section clearfix">

					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"
						data-wow-delay="0.5s">
						<div class="fact-item text-center">
							<div class="fact-icon">
								<i class="fa fa-check-square fa-lg"></i>
							</div>
							<span data-to="120">0</span>
							<p>Completed Projects</p>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"
						data-wow-delay="0.8s">
						<div class="fact-item text-center">
							<div class="fact-icon">
								<i class="fa fa-users fa-lg"></i>
							</div>
							<span data-to="152">0</span>
							<p>Satisfied Clients</p>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"
						data-wow-delay="1.1s">
						<div class="fact-item text-center last">
							<div class="fact-icon">
								<i class="fa fa-clock-o fa-lg"></i>
							</div>
							<span data-to="2500">0</span>
							<p>Working Hours</p>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"
						data-wow-delay="1.3s">
						<div class="fact-item text-center last">
							<div class="fact-icon">
								<i class="fa fa-trophy fa-lg"></i>
							</div>
							<span data-to="150">0</span>
							<p>Award Won</p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!--
        End #count
        ========================== -->



	<!--
        #footer
        ========================== -->
	<footer id="footer" class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">

					<div class="footer-logo wow fadeInDown">
						<img
							src="${pageContext.request.contextPath }/resources/img/logo.png"
							alt="logo">
					</div>

					<div class="footer-social wow fadeInUp">
						<h3>We are social</h3>
						<ul class="text-center list-inline">
							<li><a href="http://goo.gl/RqhEjP"><i
									class="fa fa-facebook fa-lg"></i></a></li>
							<li><a href="http://goo.gl/hUfpSB"><i
									class="fa fa-twitter fa-lg"></i></a></li>
							<li><a href="http://goo.gl/r4xzR4"><i
									class="fa fa-google-plus fa-lg"></i></a></li>
							<li><a href="http://goo.gl/k9zAy5"><i
									class="fa fa-dribbble fa-lg"></i></a></li>
						</ul>
					</div>

					<div class="copyright">

						Shared by <i class="fa fa-love"></i><a
							href="https://bootstrapthemes.co">BootstrapThemes</a>

					</div>

				</div>
			</div>
		</div>
	</footer>
	<!--
        End #footer
        ========================== -->


	<!--
        JavaScripts
        ========================== -->

	<!-- main jQuery -->
<jsp:include page="../include/MSC2.jsp" />


	<script>
		$("#nav>li:eq(3)").attr("class", "current");
	</script>
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
			var title = $("#title").val();
			var content = $("#content").val();
			if (title == "" || title == null) {
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






