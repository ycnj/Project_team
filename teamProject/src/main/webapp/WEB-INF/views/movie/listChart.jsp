<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html lang="en" class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html lang="en" class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html lang="en" class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Always force latest IE rendering engine -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Meta Keyword -->
        <meta name="keywords" content="one page, business template, single page, onepage, responsive, parallax, creative, business, html5, css3, css3 animation">
        <!-- meta character set -->
        <meta charset="utf-8">

        <!-- Site Title -->
        <title>/movie/movieChart.jsp</title>
        
        <!--
        Google Fonts
        ============================================= -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css">
        
        <!--
        CSS
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
		h1{
			display: inline-block;
		}
		button:first-child{
			float: right;
			margin-right: 10px;
			margin-top: 25px;
		}
		th,td {
		    text-align: center;
		}
		.panel-body{
			padding: 0;
		}
		.panel-heading{		
			padding-left: 99px;
		}
		.panel-heading h4{
			display: inline-block;
			font-weight: bold;
		}
		.panel-heading a{
			margin-top: 5px;
		}
		.panel-heading > a{
			color: #a94442;
		}
		@media (min-width: 768px) {
		  .container {
		    width: 1100px;
		  }
		}
		@media (min-width: 992px) {
		  .container {
		    width: 1100px;
		  }
		}
		@media (min-width: 1200px) {
		  .container {
		    width: 1100px;
		  }
		}
		.textFit{
			font-weight: bold;
		}
		.panel-primary > .panel-heading {
		    background-color: #3F4084;
		    border-color: #3F4084;
		}
		.panel-footer a:link, a:visited {
		 	color: red; text-decoration: none;
		 }
		.panel-footer  a:hover {
		 	color: blue; text-decoration: none;
		 }
		 .font-sizeUp{
		 	font-size: 20px;
	    	font-weight: bold; 
		 }
		 .glyphicon-heart{
		 	color: red;
		 }
		 .glyphicon-heart:hover{
		 	color: blue;
		 	cursor: pointer;
		 }
		 #condition, #keyword{
		 	width:200px;	
		 	display:inline-block; 	
		 }
		 #condition{
			padding-top: 3px;
		 }
		 .form-group{
		 	display:inline-block;
		 }
		 .contFont{
			font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
			font-size: 14px;
			line-height: 1.42857143;
			color: #333;
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
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- /responsive nav button -->

                    <!-- logo -->
                    <h1 class="navbar-brand">
                        <a href="#body">
                            <img src="${pageContext.request.contextPath }/resources/images/logo.png" alt="Kasper Logo">
                        </a>
                    </h1>
                    <!-- /logo -->

				</div>

                <!-- main nav -->
                <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
                    <ul id="nav" class="nav navbar-nav">
                        <li><a href="./index.html">Home</a></li>
                        <li><a href="./MyInfo.html">MyInfo</a></li>
                        <li><a href="./event.html">Event</a></li>                            
                        <li><a href="./contact.html">Contact</a></li>
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
                       <img data-wow-delay="0.2s" class="img-responsive black  wow fadeInLeftBig" src="${pageContext.request.contextPath }/resources/images/icons/iphone-black.png" alt="iPhone Black">
                        <img data-wow-delay="0.5s" class="img-responsive white  wow fadeInLeftBig" src="${pageContext.request.contextPath }/resources/images/icons/iphone-white.png" alt="iPhone White">
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
        <br />
        <br />
        <!--
        End #service-bottom
        ========================== -->

       <!--
        #service
        ========================== -->
        <div class="container contFont">	
			<h1>무비차트</h1>
			<c:if test="${id eq master }">
				<a href="uploadChart_form.do"><button class="btn btn-info upbtn">업로드 하러 가기</button></a>
			</c:if>
			<hr style="height: 3px;" color="black" />
			<br />
			<div class="row">
				<c:forEach items="${list }" var="tmp" varStatus="status">	
					<div class="col-xs-6 col-sm-3">
						<div class="panel panel-primary">
							<div class="panel-heading"
							 style="<c:if test="${status.count gt 4 }">color: #fff; background-color: black; border-color: black;</c:if>" >
								<h4>NO.${status.count}</h4>
								<c:if test="${id eq master }">
									<a class="btn pull-right" href="${pageContext.request.contextPath }/movie/delete.do?num=${tmp.num }">
										<span class="glyphicon glyphicon-remove"></span>
									</a>
								</c:if>						
							</div>
							<div class="panel-body">
								<img class="img-responsive" src="${pageContext.request.contextPath }/upload/${tmp.saveFileName }"/>
							</div>
							<div class="panel-footer">
								<div class="font-sizeUp">
									<c:choose>
										<c:when test="${fn:length(tmp.title) > 12}">
											<c:out value="${fn:substring(tmp.title, 0, 11)}..."/>
		         							</c:when>
										<c:otherwise>
											<c:out value="${tmp.title}" />
										</c:otherwise>
									</c:choose>
								</div>
								<fmt:parseDate value="${tmp.opendate }" var="dateFmt2" pattern="yyyy-MM-dd HH:mm:ss" />
								<fmt:formatDate value="${dateFmt2 }" pattern="yyyy-MM-dd" /> &nbsp;개봉 <br />
								<form id="liketo_form">
									<span class="liketo">${tmp.liketo }</span>  
									<span class="glyphicon glyphicon-heart"></span>
									<input type="hidden" name="movieInfoNum" value="${tmp.num }" />
								</form>	
							</div>
						</div>
					</div>			
				</c:forEach>
			</div>
		</div>
			<!-- ------------------------------------페이지 처리1------------------------------------ -->
		<div class="container contFont">	
			<div class="row">
				
				<div class="text-center">
					<ul class="pagination">
					<c:if test="${startPageNum ne 1 }">
						<li>
							<a href="list.do?pageNum=${startPageNum-1}&condition=${condition }&keyword=${encodedKeyword }">&laquo;</a>
						</li>
					</c:if>
					<c:if test="${startPageNum eq 1 }">
						<li class="disabled">
							<a href="javascript:">&laquo;</a>
						</li>
					</c:if>
						<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
							<c:if test="${pageNum eq i }">
								<li>
									<a href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a>
								</li>
							</c:if>
							<c:if test="${pageNum ne i }">
								<li>					
									<a href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${endPageNum lt totalPageCount}">
							<li>
								<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedKeyword }">&raquo;</a>
							</li>
						</c:if>
						<c:if test="${endPageNum ge totalPageCount}">
							<li class="disabled">
								<a href="javascript:">&raquo;</a>
							</li>
						</c:if>
					</ul>
				</div>
				
				<!-- ------------------------------------페이지 처리2------------------------------------ -->				
				<div class="col-sm-6 col-sm-offset-3">
					<!-- keyword 검색어 form -->
					<form action="${pageContext.request.contextPath }/file/list.do" method="post">
						<div class="form-group">
							<label for="condition">검색조건</label><br />
							<select class="form-control" name="condition" id="condition">
								<option value="titlename" <c:if test="${condition eq 'titlename' }"> selected</c:if>>제목+파일명</option>
								<option value="title" <c:if test="${condition eq 'title' }"> selected</c:if>>제목</option>
								<option value="id" <c:if test="${condition eq 'id' }"> selected</c:if>>작성자</option>
							</select>
						</div>
						<div class="form-group">						
							<input class="form-control" type="text" value="${keyword }" name="keyword" id="keyword" placeholder="검색어..." />		
						</div>
						<button class="btn btn-sm" type="submit">검색</button>
					</form>
					<c:choose>
						<c:when test="${not empty keyword }">
							<p><strong>${keyword }</strong> 검색어로 검색된 
							<strong>${totalRow }</strong>개의 파일이 있습니다.</p>
						</c:when>
						<c:otherwise>
							<p><strong>${totalRow }</strong>개의 파일이 있습니다.</p>
						</c:otherwise>
					</c:choose>
				</div>
			
			</div><!-- .row -->
		</div><!-- .container -->
		
		<div>
			<p>${msg }</p>
		</div>
		<br />
		<br />
        <!--
        End #service
        ========================== -->
                <!--
        #count
        ========================== -->
       <!--  
        <section id="count">
            <div class="container">
                <div class="row">
                    <div class="counter-section clearfix">

                        <div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft" data-wow-delay="0.5s">
                            <div class="fact-item text-center">
                                <div class="fact-icon">
                                    <i class="fa fa-check-square fa-lg"></i>
                                </div>
                                <span data-to="120">0</span>
                                <p>Completed Projects</p>
                            </div>
                        </div>
                        
                        <div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft" data-wow-delay="0.8s">
                            <div class="fact-item text-center">
                                <div class="fact-icon">
                                    <i class="fa fa-users fa-lg"></i>                                    
                                </div>
                                <span data-to="152">0</span>
                                <p>Satisfied Clients</p>
                            </div>
                        </div>
                        
                        <div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft" data-wow-delay="1.1s">
                            <div class="fact-item text-center last">
                                <div class="fact-icon">
                                    <i class="fa fa-clock-o fa-lg"></i>
                                </div>
                                <span data-to="2500">0</span>
                                <p>Working Hours</p>
                            </div>
                        </div>
                        
                        <div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft" data-wow-delay="1.3s">
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
        </section> -->
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
                            <img src="${pageContext.request.contextPath }/resources/images/logo.png" alt="logo">
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
            
            $(".glyphicon-heart").click(function(){
        		var $this=$(this);
        		var data=$this.parent().serialize();
        		var id='${id}';
        		if(id==null || id==""){
        			alert("로그인하세요.");
        			return;
        		}		
        		$.ajax({
        			url:"${pageContext.request.contextPath }/movie/liketo.do",
        			method:"post",
        			data:data,
        			success:function(responseData){
        				$this
        				.parent()
        				.find('.liketo')
        				.text(responseData.liketo);			
        			}
        		});
        		return false;
        	})
        </script>
    </body>
</html>


