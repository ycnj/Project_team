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
<jsp:include page="../include/MSC1.jsp" />
	<title>Home</title>
	<style>
		h1{
			display: inline-block;
		}
		button:first-child{
			float: right;
			margin-right: 10px;
			margin-top: -50px;
		}
		th,td {
		    text-align: center;
		}
		.panel-body{
			padding: 0;
		}
		.panel-heading{		
			padding-left: 99px;
		}
		.panel-heading h4{
			display: inline-block;
			font-weight: bold;
			margin-top: 10px;
		}
		.panel-heading a{	
			margin-top: 5px;
		}
		.panel-heading > a{
			color: #a94442;
		}
		.panel-heading{
			height: 60px;
		}
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
		.textFit{
			font-weight: bold;
		}
		.panel-primary > .panel-heading {
		    background-color: #3F4084;
		    border-color: #3F4084;
		}
		.panel-footer a:link, a:visited {
		 	color: red; text-decoration: none;
		 }
		.panel-footer  a:hover {
		 	color: blue; text-decoration: none;
		 }
		 .font-sizeUp{
		 	font-size: 20px;
	    	font-weight: bold; 
		 }
		 .glyphicon-heart{
		 	color: red;
		 }
		 .glyphicon-heart:hover{
		 	color: blue;
		 	cursor: pointer;
		 }
		 #condition, #keyword{
		 	width:200px;	
		 	display:inline-block; 	
		 }
		 #condition{
			padding-top: 3px;
		 }
		 .form-group{
		 	display:inline-block;
		 }
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
		#liketo_form{
			display: inline;
		}
		.panel-footer button{
			float: right;
			padding: 3px 10px;
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
	<!-- 메인 -->

		<br /><br /><br />			
        <div class="container contFont container2">
			<div class="section-title text-center wow fadeInUp">
	            <h2><strong>무비차트</strong></h2>    
	        </div>
	        <div class="section-center text-center">
	        </div>
			<c:if test="${id eq 'master' }">
				<a href="uploadChart_form.do"><button class="btn btn-info">업로드 하러 가기</button></a>
			</c:if>
			<hr style="height: 3px;" color="black" />
			<br />
			<div class="row">
				<c:forEach items="${list }" var="tmp" varStatus="status">	
					<div class="col-xs-6 col-sm-3">
						<div class="panel panel-primary">
							<div class="panel-heading"
							 style="<c:if test="${status.count gt 4 }">color: #fff; background-color: black; border-color: black;</c:if>" >
								<h4>NO.${status.count}</h4>
								<c:if test="${id eq 'master' }">
									<a class="btn pull-right" href="${pageContext.request.contextPath }/movie/delete.do?num=${tmp.num }">
										<span class="glyphicon glyphicon-remove"></span>
									</a>
								</c:if>						
							</div>
							<div class="panel-body">
								<a href="detailChart.do?num=${tmp.num }"><img class="img-responsive" src="${pageContext.request.contextPath }/upload/${tmp.saveFileName }"/></a>
							</div>
							<div class="panel-footer">
								<div class="font-sizeUp">
									<c:choose>
										<c:when test="${fn:length(tmp.title) > 12}">
											<c:out value="${fn:substring(tmp.title, 0, 11)}..."/>
		         							</c:when>
										<c:otherwise>
											<c:out value="${tmp.title}" />
										</c:otherwise>
									</c:choose>
								</div>
								<fmt:parseDate value="${tmp.opendate }" var="dateFmt2" pattern="yyyy-MM-dd HH:mm:ss" />
								<fmt:formatDate value="${dateFmt2 }" pattern="yyyy-MM-dd" /> &nbsp;개봉 <br />
								<form id="liketo_form">
									<span class="liketo">${tmp.liketo }</span>  
									<span class="glyphicon glyphicon-heart"></span>
									<input type="hidden" name="movieInfoNum" value="${tmp.num }" />
								</form>
								<button class="btn btn-warning btn-sm" onclick="reserve(${tmp.num })">예매</button>
								<form action="${pageContext.request.contextPath }/users/reserve.do" method="post" id="reserve_form${tmp.num }">
									<input type="hidden" name="saveFileName" value="${tmp.saveFileName }" />
									<input type="hidden" name="movieInfoNum" value="${tmp.num }" />
									<input type="hidden" name="movieName" value="${tmp.title }" />
									<input type="hidden" name="paymentWay" value="카드결제" />	
								</form>
							</div>
						</div>
					</div>			
				</c:forEach>
			</div>
		</div>
			<!-- ------------------------------------페이지 처리1-------------------------------------->
		<div class="container contFont">	
			<div class="row">
				
				<div class="text-center">
					<ul class="pagination">
					<c:if test="${startPageNum ne 1 }">
						<li>
							<a href="listChart.do?pageNum=${startPageNum-1}&condition=${condition }&keyword=${encodedKeyword }">&laquo;</a>
						</li>
					</c:if>
					<c:if test="${startPageNum eq 1 }">
						<li class="disabled">
							<a href="javascript:">&laquo;</a>
						</li>
					</c:if>
						<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
							<c:if test="${pageNum eq i }">
								<li>
									<a href="listChart.do?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a>
								</li>
							</c:if>
							<c:if test="${pageNum ne i }">
								<li>					
									<a href="listChart.do?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${endPageNum lt totalPageCount}">
							<li>
								<a href="listChart.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedKeyword }">&raquo;</a>
							</li>
						</c:if>
						<c:if test="${endPageNum ge totalPageCount}">
							<li class="disabled">
								<a href="javascript:">&raquo;</a>
							</li>
						</c:if>
					</ul>
				</div>
				
				<!-- ------------------------------------페이지 처리2------------------------------------ -->				
				<div class="col-sm-6 col-sm-offset-3">
					<!-- keyword 검색어 form -->
					<form action="${pageContext.request.contextPath }/movie/listChart.do" method="post">
						<div class="form-group">
							<label for="condition">검색조건</label>
							<select class="form-control" name="condition" id="condition">
								<option value="titlename" <c:if test="${condition eq 'titlename' }"> selected</c:if>>제목+파일명</option>
								<option value="title" <c:if test="${condition eq 'title' }"> selected</c:if>>제목</option>
								<option value="id" <c:if test="${condition eq 'id' }"> selected</c:if>>작성자</option>
							</select>
						</div>
						<div class="form-group">						
							<input class="form-control" type="text" value="${keyword }" name="keyword" id="keyword" placeholder="검색어..." />		
						</div>
						<button class="btn btn-sm" type="submit">검색</button>
					</form>
					<c:choose>
						<c:when test="${not empty keyword }">
							<p><strong>${keyword }</strong> 검색어로 검색된 
							<strong>${totalRow }</strong>개의 파일이 있습니다.</p>
						</c:when>
						<c:otherwise>
							<p><strong>${totalRow }</strong>개의 파일이 있습니다.</p>
						</c:otherwise>
					</c:choose>
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
        <%-- <section id="quotes">
			<jsp:include page="../include/quotes.jsp" />
        </section> --%>
        
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
	    
	    
	    $(".glyphicon-heart").click(function(){
			var $this=$(this);
			var data=$this.parent().serialize();
			var id='${id}';
			if(id==null || id==""){
				alert("로그인하세요.");
				return;
			}		
			$.ajax({
				url:"${pageContext.request.contextPath }/movie/liketo.do",
				method:"post",
				data:data,
				success:function(responseData){
					$this
					.parent()
					.find('.liketo')
					.text(responseData.liketo);			
				}
			});
			return false;
		})		
		
	});
	
	function reserve(num){
    	$("#reserve_form"+num).submit();
    }
	
	
</script>

</body>
</html>





