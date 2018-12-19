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
</head>

    <body>

        <!--
        Fixed Navigation
        ==================================== -->
        <header id="navigation" class="navbar-fixed-top" >
            <div class="container">

                <div class="navbar-header" >
                    <!-- responsive nav button -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- /responsive nav button -->

                    <!-- logo -->
                    <h1 class="navbar-brand">
                        <a href="#body">
                            <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Kasper Logo">
                        </a>
                    </h1>
                    <!-- /logo -->

				</div>

                    <!-- main nav -->
                    <nav class="collapse navigation navbar-collapse navbar-right " role="navigation"  >
                        <ul id="nav" class="nav navbar-nav" >
                            <li><a href="${pageContext.request.contextPath}/home.do">Home</a></li>
<!--                             <li><a href="./MyInfo.html"></a></li>
                            <li><a href="./event.html"></a></li>                
                            <li><a href="./contact.html"></a></li>
                            <li><a href="./etc.html"></a></li> -->
                        <c:choose>
                        	<c:when test="${empty sessionScope.id }">
                            <li><a href="users/loginform.do">Login</a></li>
                            </c:when>
                            <c:otherwise>
                            
                            <li class="dropdown">
								<a href="info.do">
								${id } for Info<b class="caret"></b></a>
<!-- 								<ul class="dropdown-menu">
									<li><a href="#">3-1번 메뉴</a></li>
									<li><a href="#">3-2번 메뉴</a></li>
									<li><a href="#">3-3번 메뉴</a></li>
								</ul> -->
							</li>
							
                            <li><a href="logout.do">logout</a></li>
                            </c:otherwise>
                        </c:choose>
                        
                        </ul>
                    </nav>
                    <!-- /main nav -->

            </div>
        </header>
        <!--
        End Fixed Navigation
        ==================================== -->
        <!--
        Home Slider
        ==================================== -->
          
        <section id="service-bottom" style="background-color: black;">
            <div class="container">
                    <div class="section text-center wow fadeInUp">
                        <h2><strong>${id }</strong> 님 개인정보입니다.</h2>    
                    </div>
            </div>
        </section>
        <!--
        End #home Slider
        ========================== -->

   
 
        <!--
        #about
        ========================== -->
        <section id="about" style="background-image: url('${pageContext.request.contextPath}/resources/images/pnight.jpg')">
            <div class="container" >
                <div class="row">
					<div class="about-us text-center wow fadeInDown">              
              		<div class="col-sm-3" style="margin-left: auto;">
						<ul>
							<li>11111111111</li>
							<li>222222222222</li>
						</ul>
					</div>
                
					<div class="col-sm-9" style="a">

		
							<table class="table table-hover" style="width: 800px; text-align: center;">								
								<thead>
									<tr align="center">
										<th align="center">항목</th>
										<th align="center">정보</th>
									</tr>
								</thead>
								<tbody>
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
								</tbody>
							</table>
							<a class="btn btn-primary" href="updateform.do">회원정보 수정</a>
							<a class="btn btn-warning" href="javascript:deleteConfirm()">회원 탈퇴</a>
	                    </div>	                    
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

	$("#nav>li:eq(1)").attr("class", "current");

</script>
</body>
</html>
