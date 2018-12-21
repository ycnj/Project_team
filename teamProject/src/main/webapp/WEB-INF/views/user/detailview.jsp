<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<!-- link 로딩 -->
<jsp:include page="../include/MSC1.jsp" />
	<title>Home</title>
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


        <section id="contact">
            <div class="container">
                <div class="row">

                    <div class="section-title text-center wow fadeInDown">
                        <h2>문의사항을 남겨주세요.</h2>
                        <p></p>
                    </div>
  
                    <div class="section-title text-center wow fadeInDown col-md-4 col-sm-3 ">
                        <jsp:include page="detail.jsp"></jsp:include>
                    </div>   
                </div>
            </div>
        </section>

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
	$("#nav>li:eq(5)").attr("class", "current");
</script>

</body>
</html>




