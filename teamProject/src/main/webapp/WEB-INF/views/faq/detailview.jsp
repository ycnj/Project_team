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


       <section id="contact contFont ">
            <div class="container">
                <div class="row">
					<div class="container contFont container2">                  
				         <div class="row">           
							<div class="col-sm-8 col-sm-offset-2 col-xs-offset-2" style="padding-left:260px;">
					            <ul Class="pagination pagination-lg">					             
					             	<li><a href="${pageContext.request.contextPath}/user/userboardview.do">질문게시판<span class="sr-only">(current)</span></a></li>					             	                          
					          		<c:if test="${!empty sessionScope.id }">
					          		<li><a href="${pageContext.request.contextPath}/ask/qnalistview.do">1:1문의목록<span class="sr-only">(current)</span></a></li>
					             	<li class="active"><a href="${pageContext.request.contextPath}/faq/faqlistview.do">FAQ 목록</a></li>								    
					          		</c:if>     					          							          		
					    		</ul>
				    		</div>
				    	</div>    
				    </div>	
                    <div class="section-title text-center wow fadeInDown">
                        <h2>FAQ 게시판</h2>                 
                    </div>
                        <jsp:include page="detail.jsp"></jsp:include>               
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
	$("#nav>li:eq(6)").attr("class", "current");
</script>
				
</body>
</html>





