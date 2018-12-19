<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<title>/views/event/list.jsp</title>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Always force latest IE rendering engine -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Meta Keyword -->
<meta name="keywords" content="one page, business template, single page, onepage, responsive, parallax, creative, business, html5, css3, css3 animation">
<!-- meta character set -->
<meta charset="utf-8">

<!-- Site Title -->
<title>Kasper One Page Template</title>

<!--
Google Fonts
============================================= -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css">

<!--
CSS
============================================= -->
<!-- Fontawesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<!-- Bootstrap -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<!-- Fancybox -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.css">
<!-- owl carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
<!-- Animate -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
<!-- Main Stylesheet -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<!-- Main Responsive -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">


<!-- Modernizer Script for old Browsers -->
<script src="${pageContext.request.contextPath}/resources/js/vendor/modernizr-2.6.2.min.js"></script>
<style>
 h4{
     display : inline;
     margin-right: 10px;
 }
 .btn{
     padding: 0px 2px;
 }
</style>
</head>
<body>
<!-- header part -->
<header id="navigation" class="navbar-fixed-top">
    <div class="container">

        <div class="navbar-header">
            <!-- responsive nav button -->
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
          </button>
          <!-- /responsive nav button -->\
          <!-- logo -->
          <h1 class="navbar-brand">
              <a href="#body">
                  <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Kasper Logo">
              </a>
          </h1>
          <!-- /logo -->
		
          </div>

          <!-- main nav -->
          <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
              <ul id="nav" class="nav navbar-nav">
                  <li><a href="./index.html">Home</a></li>
                  <li><a href="./MyInfo.html">MyInfo</a></li>
                  <li><a href="list.do">Event</a></li>
                  <li><a href="updateform.do">Updateform</a></li> 
                  <li><a href="uploadform.do">Uploadform</a></li>                              
                  <li><a href="./contact.html">Contact</a></li>
                  <li><a href="./etc.html">Etc</a></li>
                  <li><a href="uploadform.do">이벤트 관리자</a></li>
              </ul>
          </nav>
          <!-- /main nav -->
        </div>
</header>
<!--
#service-bottom
========================== -->

<section id="service-bottom">
    <div class="container">
            <div class="mobile-device">
               <img data-wow-delay="0.2s" class="img-responsive black  wow fadeInLeftBig" src="${pageContext.request.contextPath}/resources/img/icons/iphone-black.png" alt="iPhone Black">
                <img data-wow-delay="0.5s" class="img-responsive white  wow fadeInLeftBig" src="${pageContext.request.contextPath}/resources/img/icons/iphone-white.png" alt="iPhone White">
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
<section id="portfolio">
<div class="section-title text-center wow fadeInDown container">
	<h2>이벤트 수정</h2>
	<form class="text-center" action="update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${dto.num }" />
		<label for="title">${dto.title }</label>
		<input type="text" name="title" id="title"/><br/>
		<label for="content"></label>
		<textarea name="content" id="content" cols="30" rows="10">{dto.content}</textarea>
		<label for="myFile">첨부파일</label>
		<input type="file" name="file" id="myFile" /><br/>
		<button type="submit">업데이트</button>
	</form>
</div>	
</section>
<!--
#footer
========================== -->
<footer id="footer" class="text-center">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">

                <div class="footer-logo wow fadeInDown">
                    <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo">
                </div>

                <div class="footer-social wow fadeInUp">
                    <h3>We are social</h3>
                    <ul class="text-center list-inline">
                        <li><a href="http://goo.gl/RqhEjP"><i class="fa fa-facebook fa-lg"></i></a></li>
                        <li><a href="http://goo.gl/hUfpSB"><i class="fa fa-twitter fa-lg"></i></a></li>
                        <li><a href="http://goo.gl/r4xzR4"><i class="fa fa-google-plus fa-lg"></i></a></li>
                        <li><a href="http://goo.gl/k9zAy5"><i class="fa fa-dribbble fa-lg"></i></a></li>
                    </ul>
                </div>

                <div class="copyright">
                   
                   Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>

                </div>

            </div>
        </div>
    </div>
</footer>
<!--
End #footer
========================== -->
<!-- main jQuery -->
<script src="${pageContext.request.contextPath}/resources/js/vendor/jquery-1.11.1.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- jquery.nav -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.nav.js"></script>
<!-- Portfolio Filtering -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.mixitup.min.js"></script>
<!-- Fancybox -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.pack.js"></script>
<!-- Parallax sections -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.parallax-1.1.3.js"></script>
<!-- jQuery Appear -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.appear.js"></script>
<!-- countTo -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-countTo.js"></script>
<!-- owl carousel -->
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<!-- WOW script -->
<script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
<!-- theme custom scripts -->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script>
	$("#nav>li:eq(3)").attr("class","current");        
</script>
</body>
</html>