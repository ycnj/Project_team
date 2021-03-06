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
		
		.form-group{
			display:inline-block;
		}
		
		.pagination-lg > li > a,
		.pagination-lg > li > span {
		  padding: 40px 40px;
		  font-size: 18px;
		  line-height: 1.3333333;
		}
		
		#about{
			padding-top: 10px;
		}
		
		.section-title{
			margin-bottom: 55px;
		}
		.col-xs-offset-3 {
		    margin-left: 15%;
		}
		.row{
			text-align: center;
		}
		.img-responsive{
			max-height: 160px;
		}
		.col-sm-10{
			margin-bottom: 20px; 
		}
		.table-hover{
			margin-top: 20px;
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

	<section id="service-bottom" style="height: 200px;" >
            <div class="container" >
                    
            </div>
        </section>
	<!--
        End #service-bottom
        ========================== -->
    	<br /><br />
	 	<!--
		Selection Menu
		==================================== -->
		<div class="container contFont">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3 col-xs-offset-2">
					<ul class="pagination pagination-lg">
					  <li><a href="${pageContext.request.contextPath }/users/info.do">개인정보 <span class="sr-only">(current)</span></a></li>
					  <li class="active"><a href="${pageContext.request.contextPath }/users/resDetail.do">예매내역 <span class="sr-only">(current)</span></a></li>
					</ul>
				</div>				
			</div>
		</div>
		<!--
       Selection Menu
       ========================== -->
       <br /><br />
        
        
		        <!--
        #about
        ========================== -->
        <section id="about">
			<div class="container contFont container2">
				<div class="row">
	            	<div class="col-sm-10 col-sm-offset-1">
	            		<div class="section-title text-center wow fadeInUp">
		                    <h2><strong>${id }</strong>님의 예매 내역</h2>    
		                    <p>지난 <span style="color:red">1개월</span>까지의 예매내역을 확인하실 수 있습니다.</p>
		                </div>                    		
						<h4><strong>회원등급 : ${grade}</strong></h4>
						<hr style="height: 3px;" color="black" />
					</div>
					<c:if test="${empty list }">
						<div class="col-sm-10 col-sm-offset-1">	
							<p>- 예매 내역이 없습니다 -</p>
						</div>
					</c:if>
					<c:forEach items="${list }" var="tmp" varStatus="status">
						<div class="col-sm-10 col-sm-offset-1">								
							<div class="col-sm-3">
								<img class="img-responsive" src="${pageContext.request.contextPath }/upload/${tmp.saveFileName }"/>					
							</div>
							<div class="col-sm-7">			
								<table class="table table-hover table-bordered text-center">
									<tr>
										<td><strong>${tmp.movieName}</strong></td>
										<td><strong>예매번호</strong> : ${tmp.num }</td>
									</tr>
									<tr>
										<td><strong>관람일시</strong>: 2018.12.15 상영관 6관</td>
										<td><strong>관람극장</strong>: M&P 용산 관람좌석 E11</td>
									</tr>
									<tr>
										<td><strong>결제날짜</strong>: 
											<fmt:parseDate value="${tmp.regdate}" var="dateFmt2" pattern="yyyy-MM-dd HH:mm:ss" />
											<fmt:formatDate value="${dateFmt2 }" pattern="yyyy-MM-dd" />
										</td>
										<td><strong>결제내역</strong>: ${tmp.paymentWay}, ${tmp.price }원, 일반1</td>
									</tr>
								</table>
							</div>
						</div>
						<br /><br />
					</c:forEach>
							
						
	            	
				
				</div><!-- .row -->
			</div><!-- .container -->		
			<div>
				<p>${msg }</p>
			</div>
        </section>
        <!--
        End #about
        ========================== -->
        
	<!--
	
        <!-- #quotes -->
        <br />
        <br />
        <br />
        <br />
        <section id="quotes">
	        <div class="container">
	            <div class="row wow zoomIn">
	                <div class="col-lg-12">
	                    <div class="call-to-action text-center">
	                        <p>M&P VIP에 도전하세요!</p>
	                        <span>M&P</span>
	                    </div>
	                </div>
	            </div>
	        </div>
        </section>
        
        <!-- End #quotes -->
        
		<!--
        #pricing
        ========================== -->
        <section id="pricing">
            <div class="container">
                <div class="row">

                    <div class="section-title text-center wow fadeInUp">
                        <h2>회원 등급 혜택</h2>    
                        <p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Mauris blandit aliquet elit, eget tincidunt.</p>
                    </div>

                    <div class="col-sm-4 col-xs-12 wow fadeInUp">
                        <div class="pricing-table text-center">
                            <div class="price">
                                <span class="plan">VIP</span>
                                <span class="value"><strong>10k</strong></span>
                                <br>
                                <span class="value">POINT/YEAR</span>
                            </div>
                            <ul class="text-center">
                                <li>일반 2D/3D 무료 관람 --- 4장</li>
                                <li>MX 무료 관람</li>
                                <li>콤보 4천원 할인 3장</li>
                                <li>#</li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-sm-4 col-xs-12 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="pricing-table text-center">
                            <div class="price">
                                <span class="plan">VIP PREMIUM</span>
                                <span class="value"><strong>20k</strong></span>
                                <br>
                                <span class="value">POINT/YEAR</span>
                            </div>
                            <ul class="text-center">
                                <li>일반 2D/3D 무료 관람 --- 7장</li>
                                <li>MX 무료 관람</li>
                                <li>스위트룸 평일 무료 관람</li>
                                <li>콤보 4천원 할인 5장</li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-sm-4 col-xs-12 wow fadeInUp" data-wow-delay="0.6s">
                        <div class="pricing-table text-center">
                            <div class="price">
                                <span class="plan">VVIP</span>
                                <span class="value"><strong>30k</strong></span>
                                <br>
                                <span class="value">POINT/YEAR</span>
                            </div>
                            <ul class="text-center">
                                <li>일반 2D/3D 무료 관람 --- 10장</li>
                                <li>MX 무료 관람</li>
                                <li>스위트룸 평일 무료 관람</li>
                                <li>콤보 4천원 할인 7장</li>
                            </ul>
                        </div>
                    </div>

                    
                </div>           
            </div>
        </section>
        <!--
        End #pricing
        ========================== -->
        
        
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



        <!-- #footer -->
        <footer id="footer" class="text-center">
   			<jsp:include page="../include/footer.jsp" />
        </footer>
        <!-- End #footer -->



<!-- js파일 로딩 -->
<jsp:include page="../include/MSC2.jsp" />
<!-- javascript	 -->
<script>
	
	$(function(){
	
	    jQuery(window).scroll(function () {
	        if (jQuery(window).scrollTop() > 100) {
	            jQuery("#navigation").css("background-color","#00C7FC");
	            jQuery("#navigation").addClass("animated-nav");
	        } else {
	            jQuery("#navigation").css("background-color","transparent");
	            jQuery("#navigation").removeClass("animated-nav");
	        }
	    });
	});
	
	$("#nav>li:eq(7)").attr("class", "current");
</script>

</body>
</html>





