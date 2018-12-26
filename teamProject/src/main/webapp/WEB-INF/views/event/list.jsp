<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<!-- link 로딩 -->
<jsp:include page="../include/MSC1.jsp" />
	<title>event/list.jsp</title>
	<style>
		.top-img{
             position: relative;
             height: 400px;
             padding: 0;
             background: url(${pageContext.request.contextPath }/resources/images/movie/배경화면/단순배경2.jpg) 50% 0 no-repeat;
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
		<div class="container">
			
			<div class="service-features wow fadeInRight">
				<h3>이벤트페이지란 무엇인가...</h3>
				<ul>
					<li>1</li>
					<li>2</li>
					<li>3</li>
					<li>4</li>
				</ul>
			</div>
		</div>
	</section>
	<!--
        End #service-bottom
        ========================== -->

	<!-- 본문 -->
	
<section id="portfolio">
<div class="section-title text-center wow fadeInDown">
	<h2>event</h2>
	<br />
	<c:if test="${id eq 'master' }">
	<h1><a class="btn btn-info" href="${pageContext.request.contextPath}/event/uploadform.do">이벤트 업로드</a></h1>
	</c:if>
</div>	
	<div id="projects" class="clearfix">
	<c:forEach items="${list }" var="tmp">
		<figure class="mix portfolio-item" style="display: inline-block;">					
			<a href="detail.do?num=${tmp.num }"><img style="width:372px;height:290px;"  class="img-responsive" src="${pageContext.request.contextPath}/upload/${tmp.saveFileName}"/></a>
			<figcaption class="mask">
	            <h3 style="width:330px">${tmp.title }</h3>
	        </figcaption>			
       	</figure>		
	</c:forEach>
	</div>
	<!-- 페이징 처리 -->
	<div class="page-display text-center">
		<ul class="pagination">
		<c:choose>
			<c:when test="${startPageNum ne 1}">
				<li>
					<a href="list.do?pageNum=${startPageNum-1 }">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum}" end="${endPageNum }" >
			<c:choose>
				<c:when test="${pageNum eq i }">
					<li class="active">
						<a href="list.do?pageNum=${i }">${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="list.do?pageNum=${i }">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li>
					<a href="list.do?pageNum=${endPageNum+1 }">&raquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>			
		</ul>
	</div>	
</section>
	
	<!-- 본문 끝 -->



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





