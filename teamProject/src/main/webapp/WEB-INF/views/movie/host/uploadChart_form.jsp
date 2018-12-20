<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<!-- link 로딩 -->
<jsp:include page="../../include/MSC1.jsp" />

	<title>Home</title>
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
				<jsp:include page="../../include/header.jsp" />
            </div>			
        </header>
	<!--
        End Fixed Navigation
        ==================================== -->


	<!--
        #service-bottom
        ========================== -->

	<section id="service-bottom">
		<div class="top-img">
		</div>
		<div class="container">
			
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
	<!-- 메인 -->
		<br /><br /><br /><br />		
        <div class="container contFont container2">
        	<div class="section-title text-center wow fadeInUp">
	            <h2><strong>파일 업로드</strong></h2>    
	        </div>
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">
					<form action="uploadChart.do" method="post" enctype="multipart/form-data">
						<div class="form-group has-feedback">
							<label class="control-label" for="title">영화제목</label>
							<input class="form-control" type="text" name="title" id="title" autocomplete="off"/>
						</div><br />
						<div class="form-group has-feedback">
							<label class="control-label" for="content">영화주요내용</label>
							<textarea class="form-control" name="content" id="content" style="width:100%;height:300px;"/></textarea>
						</div><br />
						<div class="form-group has-feedback">
							<label class="control-label" for="opendate">개봉날짜</label>
							<input class="form-control" type="text" name="opendate" id="opendate" autocomplete="off"/>
						</div><br />
						<div class="form-group has-feedback">
							<label class="control-label" for="myFile">첨부파일</label>
							<input class="form-control" type="file" name="file" id="myFile"/>
						</div><br />
						<button class="btn btn-success" type="submit">업로드</button>
						<button class="btn btn-warning" type="reset">취소</button>
						<a class="btn btn-primary" href="${pageContext.request.contextPath}/movie/listChart.do">목록</a>
					</form>
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
	
	
	<!-- 메인끝 -->



        <!-- #quotes -->
        <section id="quotes">
			<jsp:include page="../../include/quotes.jsp" />
        </section>
        
        <!-- End #quotes -->


        <!-- #footer -->
        <footer id="footer" class="text-center">
   			<jsp:include page="../../include/footer.jsp" />
        </footer>
        <!-- End #footer -->



<!-- js파일 로딩 -->
<jsp:include page="../../include/MSC2.jsp" />
<!-- javascript	 -->
<script>
	$("#nav>li:eq(1)").attr("class", "current");
	
	$(function(){

	    jQuery(window).scroll(function () {
	        if (jQuery(window).scrollTop() > 50) {
	            jQuery("#navigation").css("background-color","#00C7FC");
	            jQuery("#navigation").addClass("animated-nav");
	        } else {
	            jQuery("#navigation").css("background-color","transparent");
	            jQuery("#navigation").removeClass("animated-nav");
	        }
	    });	    
	});
	
</script>

</body>
</html>





