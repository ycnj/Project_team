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
	.top-img{
            position: relative;
            height: 400px;
            padding: 0;
            background: url(${pageContext.request.contextPath }/resources/images/movie/배경화면/단순배경1.jpg) 50% 0 no-repeat;
            background-size: cover;
        }
        .service-features {
	    background-color: #6e94b599;
	}
  }
</style>
</head>
<body>

	<!--
        Fixed Navigation
        ==================================== -->
        <header id="navigation" class="navbar-fixed-top" >
        	<div class="container contFont">
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
		<div class="top-img">
			</div>
		<div class="container contFont">
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
            <div class="container contFont">
                <div class="row">
					<div class="container contFont container2">                  
				         <div class="row">           
							<div class="col-md-8 col-md-offset-2" style="margin-left: 460px">
					            <ul Class="pagination pagination-lg">
					             	<li class="active"><a href="${pageContext.request.contextPath}/user/userboardview.do">질문게시판<span class="sr-only">(current)</span></a></li>					             	                          
					          		<c:if test="${!empty sessionScope.id }">
					          		<li><a href="${pageContext.request.contextPath}/ask/qnalistview.do">1:1문의목록<span class="sr-only">(current)</span></a></li>
					          		</c:if>     					          						          		
					    		</ul>
				    		</div>
				    	</div>    
				    </div>	
                   
                    <div class="section-title text-center wow fadeInDown" style="padding: 50px; padding-right: 1px;">
                        <h2>질문게시판</h2>                                   
                    </div>
                    
              				    
						                                	             
                    </div> <!-- .col-md-2 -->
                    <div class="col-md-10 col-sm-10">
					<div class="container">
						<div class="center-block" >
							 <jsp:include page="userboard.jsp" />
						</div>
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
	$("#nav>li:eq(6)").attr("class", "current");
</script>

</body>
</html>