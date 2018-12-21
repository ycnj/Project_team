<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<!-- link 로딩 -->
<jsp:include page="../include/MSC1.jsp" />
<title>event/uploadform.jsp</title>
<style>
	@media (min-width: 768px) {
	  .container2 {
	    width: 1100px;
	  }
	}
	@media (min-width: 992px) {
	  .container2 {
	    width: 1100px;
	  }
	}
	@media (min-width: 1200px) {
	  .container2 {
	    width: 1100px;
	  }
	}
	.top-img{
            position: relative;
            height: 400px;
            padding: 0;
            background: url(${pageContext.request.contextPath }/resources/img/배경화면/모털엔진.jpg) 50% 0 no-repeat;
            background-size: cover;
        }
        .service-features {
	    background-color: #6e94b599;
	}
</style>
</head>
<body>

	<!--
        Fixed Navigation
        ==================================== -->
        <header id="navigation" class="navbar-fixed-top" >
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
					src="${pageContext.request.contextPath }/resources/images/icons/iphone-black.png" alt="iPhone Black"> <img
					data-wow-delay="0.5s"
					class="img-responsive white  wow fadeInLeftBig"
					src="${pageContext.request.contextPath }/resources/images/icons/iphone-white.png" alt="iPhone White">
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

	<!-- 본문 -->
	<br /><br /><br /><br />
	<div class="container contFont container2">
       	<div class="section-title text-center wow fadeInUp">
		<h2>event</h2>
	</div>
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">			
				<form action="upload.do" method="post" enctype="multipart/form-data">
				<div class="form-group has-feedback">
				<label for="title">제목</label>
				<input class="form-control" type="text" name="title" id="title"/><br/>
				</div><br />
				<div class="form-group has-feedback">
				<label class="control-label" for="content">내용</label>
				<textarea class="form-control" name="content" id="content" style="width:100%;height:300px;"></textarea>
				</div><br />
				<div class="form-group has-feedback">
				<label for="myFile">첨부파일</label>
				<input type="file" name="file" id="myFile" />
				</div><br/>
				<button class="btn btn-success" type="submit">업로드</button>
				<button class="btn btn-warning" type="reset">취소</button>
				<a class="btn btn-primary" href="${pageContext.request.contextPath}/event/list.do">목록</a>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 본문 끝 -->

        <!-- #quotes -->
        <section id="quotes">
			<jsp:include page="../include/quotes.jsp" />
        </section>
        
        <!-- End #quotes -->


        <!-- #footer -->
        <footer id="footer" class="text-center">
   			<jsp:include page="../include/footer.jsp" />
        </footer>
        <!-- End #footer -->



<!-- js파일 로딩 -->
<jsp:include page="../include/MSC2.jsp" />
<!-- javascript	 -->
<script>
	$("#nav>li:eq(4)").attr("class", "current");
</script>

</body>
</html>





