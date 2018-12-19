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
                        <h2>CONTACT PAGE</h2>                                   
                    </div>
                    
              
                    <div class="col-md-12 wow fadeInLeft">

                        <div class="subtitle text-center">
                            <h3>문의 게시판 목록</h3>
								<a href="${pageContext.request.contextPath}/user/userboardview.do"><span>질문게시판</span></a>
							<c:if test="${not empty sessionScope.id }">
								<a href="qnalistview.do"><span>1:1문의목록보기</span></a>
							</c:if>
								<a href="qnainsertform.do"><span>1:1문의</span></a>
                        </div>

                        <div id="testimonial">

                            <div class="tst-item clearfix">
                                <div class="tst-single clearfix">
                                    <img src="${pageContext.request.contextPath}/resources/images/qna.jpg" alt="Client" class="img-circle">
                                    <div class="tst-content">
                                        <a href="../user/userboardview.do">질문게시판</a>                   
                                    </div>
                                </div>

                            </div>

                            <div class="tst-item">
                            
                                <div class="tst-single clearfix">
                                    <img src="${pageContext.request.contextPath}/resources/images/qna2.jpg" alt="Client" class="img-circle">
                                    <div class="tst-content">
                                    <c:if test="${not empty sessionScope.id }">
                                        <a href="qnalistview.do">1:1문의목록보기</a>
                            		</c:if>
                                        <span>로그인이 필요합니다.</span>
                                    </div>
                                </div>
							
                            </div>

                            <div class="tst-item">
                                <div class="tst-single clearfix">
                                    <img src="${pageContext.request.contextPath}/resources/images/qna3.jpg" alt="Client" class="img-circle">
                                    <div class="tst-content">
                                        <a href="../ask/qnainsertform.do">1:1문의</a>
                                    
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
	$("#nav>li:eq(5)").attr("class", "current");
</script>

</body>
</html>





