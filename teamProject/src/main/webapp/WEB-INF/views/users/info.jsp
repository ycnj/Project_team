<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>

<html  class="no-js">
<!--<![endif]-->
<head>
<!-- link 로딩 -->
<jsp:include page="../include/MSC1.jsp" />
	<title>users/info.do</title>
<style>
	.table{
		width: 95%;
		color: black;

	}
	.table th{
		width: 200px;
		text-align: center;
	}
	.table td{
		text-align: center;
		color: blue;
	}
	.section-center{
	margin : 0 auto 50px;
	width: 600px;
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
	
</style>
</head>

    <body>

        <!--
        Fixed Navigation
        ==================================== -->

        <header id="navigation" class="navbar-fixed-top">
            <div class="container">
				<jsp:include page="../include/header.jsp" />
            </div>
        </header>

        <!--
        End Fixed Navigation
        ==================================== -->
        <!--
        Home Slider
        ==================================== -->
         <section id="service-bottom" style="height: 200px;" >
            <div class="container" >
                    
            </div>
        </section>
        <!--
        End #home Slider
        ========================== -->
		<br /><br />
		<!--
		Selection Menu
		==================================== -->
		<div class="container contFont">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3 col-xs-offset-2">
					<ul class="pagination pagination-lg">
					  <li class="active"><a href="${pageContext.request.contextPath }/users/info.do">개인정보 <span class="sr-only">(current)</span></a></li>
					  <li><a href="${pageContext.request.contextPath }/users/resDetail.do">예매내역 <span class="sr-only">(current)</span></a></li>
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
            <div class="container" >
            	<div class="row">
            	

                    <div class="section-title text-center wow fadeInUp">
                        <h2><strong>${id }</strong> 님 개인정보입니다.</h2>    
                    </div>
                    <div class="section-center text-center">
						<table class="table table-bordered" >						
							<tr>
								<th>이름</th>
								<td>${dto.name }</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>${dto.rrn }</td>
							</tr>		
							<tr>
								<th>아이디</th>
								<td>${dto.id }</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${dto.email }</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${dto.phon }</td>
							</tr>
							<tr>
								<th>지번</th>
								<td>${dto.addr1 }</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>${dto.addr2 } ${dto.addr3 } </td>
							</tr>
							<tr>
								<th>성별</th>
								<c:if test="${dto.gender eq 'M' }">
								<td>남자</td>
								</c:if>
								<c:if test="${dto.gender eq 'F' }">
								<td>여자</td>
								</c:if>			
							</tr>								
							<tr>
								<th>가입일</th>
								<td>${dto.rdate }</td>
							</tr>
						</table>
                    	<a class="btn btn-info" href="updateform.do" >회원정보 수정</a>
						<a class="btn btn-warning" href="javascript:deleteConfirm()">회원 탈퇴</a>
                    </div>
                    <div class="about-us text-center wow fadeInDown">

                    </div>
                </div>
            </div>
        </section>
        <!--
        End #about
        ========================== -->




        <!--
        #quotes
        ========================== -->
        <section id="quotes">
            <div class="container">
                <div class="row wow zoomIn">
                    <div class="col-lg-12">
                        <div class="call-to-action text-center">
                            <p>“ACCUMSAN ID CURABITUR ET PORTITOR MAURIS BLANDIT DOLOR LOREM SOME EST OUR DONEC STIN LORTIOS”</p>
                            <span>John Doe</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--
        End #quotes
        ========================== -->


        <!--
        #footer
        ========================== -->
        <footer id="footer" class="text-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="footer-logo wow fadeInDown">
                            <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo">
                        </div>

                        <div class="footer-social wow fadeInUp">
                            <h3>We are social</h3>
                            <ul class="text-center list-inline">
                                <li><a href="http://goo.gl/RqhEjP"><i class="fa fa-facebook fa-lg"></i></a></li>
                                <li><a href="http://goo.gl/hUfpSB"><i class="fa fa-twitter fa-lg"></i></a></li>
                                <li><a href="http://goo.gl/r4xzR4"><i class="fa fa-google-plus fa-lg"></i></a></li>
                                <li><a href="http://goo.gl/k9zAy5"><i class="fa fa-dribbble fa-lg"></i></a></li>
                            </ul>
                        </div>

                        <div class="copyright">
                           
                           Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>

                        </div>

                    </div>
                </div>
            </div>
        </footer>
        <!--
        End #footer
        ========================== -->


<!-- js파일 로딩 -->
<jsp:include page="../include/MSC2.jsp" />
<!-- javascript	 -->
<script>
	function deleteConfirm(){
		var isDelete=confirm("${id} 회원님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath}/users/delete.do";
		}
	}

	$("#nav>li:eq(6)").attr("class", "current");

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
</script>
</body>
</html>
