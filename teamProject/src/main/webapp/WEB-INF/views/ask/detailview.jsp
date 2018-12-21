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
					<div class="container contFont container2">                  
				         <div class="row">           
							<div class="col-sm-8 col-sm-offset-2 col-xs-offset-2" style="padding-left:150px;">
					            <ul Class="pagination pagination-lg">					             
					             	<li><a href="${pageContext.request.contextPath}/user/userboardview.do">질문게시판<span class="sr-only">(current)</span></a></li>
					             	<li><a href="${pageContext.request.contextPath}/ask/contact_home.do">고객센터<span class="sr-only">(current)</span></a></li>                           
					          		<c:if test="${!empty sessionScope.id }">
					          		<li><a href="${pageContext.request.contextPath}/ask/insertformview.do">1:1문의<span class="sr-only">(current)</span></a></li>
					          		</c:if>     
					          		<li><a href="${pageContext.request.contextPath}/home.do">메인 페이지<span class="sr-only">(current)</span></a></li>					          		
					    		</ul>
				    		</div>
				    	</div>    
				    </div>	
                    <div class="section-title text-center wow fadeInDown">
                        <h2>${dto.num }번 글 입니다.</h2>
                        <p></p>
                    </div>

                        <c:choose>
                        	<c:when test="${dto.writer eq id || id eq 'master' }">
                        		<jsp:include page="detail.jsp"></jsp:include>               
                        	</c:when>
                        	<c:otherwise>
                        	<span id="idw"></span> 	
                        	</c:otherwise>
                        	
                        </c:choose>										               
                              

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
 $("#idw").val(function(){
	alert("${id}님의 문의사항만 볼 수 있습니다.");
	location.href="${pageContext.request.contextPath}/ask/qnalistview.do?num=${tmp.num }";
 });

	$("#nav>li:eq(5)").attr("class", "current");
</script>
				
</body>
</html>





