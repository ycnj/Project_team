<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<!-- link 로딩 -->
<jsp:include page="../include/MSC1.jsp" />
	<title>movie/findmovie.jsp</title>
	
<style>
	.top-img{
        position: relative;
        height: 400px;
        padding: 0;
        background: url(${pageContext.request.contextPath }/resources/images/movie/배경화면/모털엔진.jpg) 50% 0 no-repeat;
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
				<h3>영화란 무엇인가...</h3>
				<ul>
					<li>멜로</li>
					<li>액션</li>
					<li>공포</li>
					<li>코미디</li>
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
	<h2>영화검색</h2>

</div>	

	<!-- 페이징 처리 -->
	<div class="container">
		<form action="findmovie.do">
		<input id="query" name="query" type="text" value="제목" />
		<button class="btn btn-info" type="submit">전송
		</button>
		</form>
		<table class="table" style="width: 1000px;">
		<thead>
			<tr>
				<th>No.</th>
				<th>이미지</th>
				<th>제목</th>
				<th>제작년도</th>
				<th>평점</th>
				<th>감독</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="tmp" begin="0" varStatus="status">
		<tr >
			<td rowspan="2" width="30px" align="center">${status.index+1 }</td>
			<td rowspan="2" width="170px"><img style="height: 95%" src="${tmp.image }"/></td>
			<td width="400px">
				<a href="${tmp.link }">
					<strong>${tmp.title }</strong></a> <c:if test="${!empty tmp.subtitle  }">(${tmp.subtitle })</c:if></td>
			<td>${tmp.pubDate }</td>
			<td>${tmp.userRating }</td>
			<td>${tmp.director }</td>
		</tr>
		<tr>
			<td>출연배우 : ${tmp.actor }</td>
		</tr>

		</c:forEach>

		</tbody>
		</table>
	</div>
	
	
<%-- 	<div class="page-display text-center">
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
	<div class="container">
		<a class="btn btn-info" href="${pageContext.request.contextPath}/event/uploadform.do">이벤트 업로드</a>
	</div> --%>
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
$("#nav>li:eq(1)").attr("class", "current");

</script>

</body>
</html>





