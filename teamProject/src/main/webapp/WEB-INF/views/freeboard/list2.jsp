<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Always force latest IE rendering engine -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Meta Keyword -->
<meta name="keywords"
	content="one page, business template, single page, onepage, responsive, parallax, creative, business, html5, css3, css3 animation">
<!-- meta character set -->
<meta charset="utf-8">

<!-- Site Title -->
<title>Kasper One Page Template</title>

<!--
        Google Fonts
        ============================================= -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700"
	rel="stylesheet" type="text/css">

<!--
        CSS   location.href='../file/upload_form.do
        ============================================= -->
<!-- Fontawesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css">
<!-- Bootstrap -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<!-- Fancybox -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery.fancybox.css">
<!-- owl carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.css">
<!-- Animate -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
<!-- Main Stylesheet -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
<!-- Main Responsive -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive.css">


<!-- Modernizer Script for old Browsers -->
<script src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>
<style>
h4 {
	display: inline;
	margin-right: 10px;
}

.btn {
	padding: 0px 2px;
}
</style>
</head>
<body>

	<!--
        Fixed Navigation
        ==================================== -->
	<header id="navigation" class="navbar-fixed-top">
		<div class="container">

			<div class="navbar-header">
				<!-- responsive nav button -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- /responsive nav button -->

				<!-- logo -->
				<h1 class="navbar-brand">
					<a href="#body"> <img src="${pageContext.request.contextPath }/resources/images/logo.png" alt="Kasper Logo">
					</a>
				</h1>
				<!-- /logo -->

			</div>

			<!-- main nav -->
			<nav class="collapse navigation navbar-collapse navbar-right"
				role="navigation">
				<ul id="nav" class="nav navbar-nav">
					<li><a href="./index.html">Home</a></li>
					<li><a href="./MyInfo.html">MyInfo</a></li>
					<li><a href="./event.html">Event</a></li>
					<li><a href="./contact.html">Contact</a></li>
					<li><a href="./list.jsp">boad</a></li>
					<li><a href="./etc.html">Etc</a></li>
				</ul>
			</nav>
			<!-- /main nav -->
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
						<h3 class="col-md-8 col-md-offset-2">게시판 글 목록 </h3>
						<br />
			</div>
			<div class="row">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
					<table class="table table-bordered" > <!-- style="text-align:center; width:880px; height:220px;" -->
						<thead >
							<tr >
								<td style="text-align:center;">번호</td>
								<td style="text-align:center;">작성자</td>
								<td style="text-align:center;">제목</td>
								<td style="text-align:center;">조회수</td>
								<td style="text-align:center;">등록일</td>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list }" var="tmp">
							<tr>
								<td style="text-align:center;">${tmp.num }</td>
								<td style="text-align:center;">${tmp.id }</td>
								<td style="text-align:center;"><a href="detail.do?num=${tmp.num }&condition=${condition}&keyword=${encodedKeyword}">${tmp.title }</a></td>
								<td style="text-align:center;">${tmp.viewCount }</td>
								<td style="text-align:center;">${tmp.regdate }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<a class="btn btn-primary pull-right" href="insertform.do">글쓰기</a>
					<div class="page-display " style="text-align:center;">
						<ul class="pagination">
						<c:choose>
							<c:when test="${startPageNum ne 1}">
								<li>
									<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedKeyword}">&laquo;</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled">
									<a href="javascript:">&laquo;</a>
								</li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="i" begin="${startPageNum}" end="${endPageNum }" >
							<c:choose>
								<c:when test="${pageNum eq i }">
									<li class="active">
										<a href="list.do?pageNum=${i }&condition=${condition}&keyword=${encodedKeyword}">${i }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="list.do?pageNum=${i }&condition=${condition}&keyword=${encodedKeyword}">${i }</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:choose>
							<c:when test="${endPageNum lt totalPageCount }">
								<li>
									<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedKeyword}">&raquo;</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="disabled">
									<a href="javascript:">&raquo;</a>
								</li>
							</c:otherwise>
						</c:choose>
						
						</ul>
					</div>
					<form action="list.do" method="get">
						<label for="condition">검색조건</label>
						<select name="condition" id="condition">
							<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
							<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
							<option value="id" <c:if test="${condition eq 'id' }">selected</c:if>>작성자</option>
						</select>
						<input value="${keyword }" type="text" name="keyword" placeholder="검색어..."/>
						<button type="submit">검색</button>
					</form>
					<c:if test="${not empty keyword }">
						<p> <strong>${keyword }</strong> 라는 키워드로 
							<strong>${totalRow }</strong> 개의 글이 검색되었습니다.</p>
					</c:if>
					</div>
					</div>	
				</div><!-- /.container -->

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
						<img src="${pageContext.request.contextPath }/resources/img/logo.png" alt="logo">
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
	<script src="${pageContext.request.contextPath }/resources/js/vendor/jquery-1.11.1.min.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<!-- jquery.nav -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery.nav.js"></script>
	<!-- Portfolio Filtering -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery.mixitup.min.js"></script>
	<!-- Fancybox -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery.fancybox.pack.js"></script>
	<!-- Parallax sections -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery.parallax-1.1.3.js"></script>
	<!-- jQuery Appear -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery.appear.js"></script>
	<!-- countTo -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery-countTo.js"></script>
	<!-- owl carousel -->
	<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<!-- WOW script -->
	<script src="${pageContext.request.contextPath }/resources/js/wow.min.js"></script>
	<!-- theme custom scripts -->
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
	<script>
            $("#nav>li:eq(4)").attr("class","current");        
        </script>
</body>
</html>






