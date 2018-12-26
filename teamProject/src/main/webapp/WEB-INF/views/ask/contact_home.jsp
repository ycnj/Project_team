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
                
					<div class="container contFont">                  
				         <div class="row">           
							<div class="col-sm-8 col-sm-offset-3 col-xs-offset-2" style="padding-left: 65px;">
					            <ul Class="pagination pagination-lg">
					             	<li class="active"><a href="${pageContext.request.contextPath}/ask/contact_home.do">고객센터<span class="sr-only">(current)</span></a></li>
					          		<li><a href="${pageContext.request.contextPath}/ask/insertformview.do">문의작성</a></li>					             	
					             	<li><a href="${pageContext.request.contextPath}/user/userboardview.do">질문게시판<span class="sr-only">(current)</span></a></li>					             	                          					          		
					          		<c:if test="${empty id }">
					          		<li><a href="${pageContext.request.contextPath}/users/loginform.do">로그인</a></li>
					          		</c:if>
					          		<c:if test="${not empty id }">
					          		<li><a href="${pageContext.request.contextPath}/ask/qnalistview.do">문의 목록보기<span class="sr-only">(current)</span></a></li>					          	
					          		</c:if>
									<li><a href="${pageContext.request.contextPath}/home.do">메인 페이지<span class="sr-only">(current)</span></a></li>					          		
					    		</ul>
				    		</div>
				    	</div>    
				    </div>
					
					
                    <div class="section-title text-center wow fadeInDown" style="padding: 50px; padding-right: 1px;">
                        <h2>고객센터</h2>                                   
                    </div>
                    
              


                        <div id="testimonial">

                            <div class="tst-item clearfix">
                                <div class="tst-single clearfix">
                                    <img src="${pageContext.request.contextPath}/resources/images/qna.jpg" alt="Client" class="img-circle">
                                    <div class="tst-content">
                                        <a class="btn btn-success" href="${pageContext.request.contextPath}/user/userboardview.do">질문게시판</a>                   
                                    </div>
                                </div>

                            </div>

                            <div class="tst-item">
                            
                                <div class="tst-single clearfix">
                                    <img src="${pageContext.request.contextPath}/resources/images/qna2.jpg" alt="Client" class="img-circle">
                                    <div class="tst-content">
                                    <c:if test="${not empty sessionScope.id }">
                                        <a class="btn btn-danger" href="${pageContext.request.contextPath}/ask/qnalistview.do">1:1문의목록보기</a>                             
                            		</c:if>
                                        <span>로그인이 필요합니다.</span>
                                    </div>
                                </div>
							
                            </div>

                            <div class="tst-item">
                                <div class="tst-single clearfix">
                                    <img src="${pageContext.request.contextPath}/resources/images/qna3.jpg" alt="Client" class="img-circle">
                                    <div class="tst-content">
                                        <a class="btn btn-info" href="${pageContext.request.contextPath}/ask/insertformview.do">1:1문의</a>
                                    
                                    </div>
                                </div>
                            </div>
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





