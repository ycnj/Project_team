<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<!-- link 로딩 -->
<jsp:include page="../include/MSC1.jsp" />
	<title>event/detail.jsp</title>
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

	<!-- 본문 -->
	
<section id="portfolio">
<div class="section-title text-center wow fadeInDown" style="width:700px;">
	<h2>event</h2>
	<h3>${dto.title }</h3>
	<div id="projects" class="clearfix">	
	<c:forEach var="tmp" items="${imageList }">
		<img class="img-responsive" src="${pageContext.request.contextPath}/upload/${tmp.saveFileName}"/>
	</c:forEach>			
	</div><div><h2>${dto.content }</h2></div>   
	<br />
	<br />      
	<ul  class="list-inline" style="display: inline;">
		<li><a class="btn btn-info" href="list.do">목록</a></li>
		<c:if test="${id eq 'master' }">
		<li><a class="btn btn-success" href="imageUploadform.do?num=${dto.num }">상세이미지 관리</a></li>
		<!-- <li><a class="btn btn-warning" href="updateform.do?num=${dto.num }">수정</a></li> -->
		<li><a class="btn btn-danger" href="delete.do?num=${dto.num }">삭제</a></li>
		</c:if>
	</ul>
</div>	
</section>
	
	<!-- 본문 끝 -->

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
	$("#nav>li:eq(4)").attr("class", "current");
</script>

</body>
</html>





