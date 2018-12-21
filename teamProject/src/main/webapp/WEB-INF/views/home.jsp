<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>

<html  class="no-js">
<!--<![endif]-->
<head>
<!-- link 로딩 -->
<jsp:include page="include/MSC1.jsp" />
	<title>Home</title>
<style>
	h4 {
		display: inline;
	}
	.btn-res{
		padding: 0 2px;
	}
</style>
</head>

    <body>

        <!--
        Fixed Navigation
        ==================================== -->
        <header id="navigation" class="navbar-fixed-top">
            <div class="container">
				<jsp:include page="include/header.jsp" />
            </div>
        </header>
        <!--
        End Fixed Navigation
        ==================================== -->


        <!--
        Home Slider
        ==================================== -->
        <section id="home">     
            <div id="home-carousel" class="carousel slide" data-interval="false">
                <ol class="carousel-indicators">
                    <li data-target="#home-carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#home-carousel" data-slide-to="1"></li>
                    <li data-target="#home-carousel" data-slide-to="2"></li>
                </ol>
                <!--/.carousel-indicators-->

                <div class="carousel-inner">

                    <div class="item active" style="background-image: url('${pageContext.request.contextPath}/resources/images/slider/베놈2.jpg')" >
                        <div class="carousel-caption">
                            <div class="animated bounceInRight">
                                <h2>베놈</h2>
                                <h4>현재 상영중!</h4>&nbsp;&nbsp;<a class="btn btn-danger btn-sm btn-res" href="#">예매</a>
                                <p>진실을 위해서라면 몸을 사리지 않고 사회의 부조리를 취재하는 정의로운 열혈 기자 에디 브록(톰 하디). 거대 기업 라이프 파운데이션의 생체실험에 의혹을 품고 뒤를 쫓던 그는 이들의 사무실에 잠입했다가 실험실에서 외계 생물체 심비오트의 기습 공격을 받게 된다. 심비오트가 숙주의 몸과 정신을 지배할 때 능력을 발휘하는 베놈은 에디의 몸에 기생하며 갖가지 소동을 일으킨다. 한편 비밀리에 인간과 심비오트를 결합해 새로운 생명체를 만들려는 시도를 계속하던 라이프 파운데이션의 회장 드레이크(리즈 아메드) 또한 심비오트의 숙주가 된다.</p>
                            </div>
                        </div>
                    </div>              

                    <div class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/slider/보헤미안 랩소디.jpg')">                
                        <div class="carousel-caption">
                            <div class="animated bounceInDown">
                                <h2>보헤미안 랩소디</h2><br>
                                <h4>현재 상영중!</h4>&nbsp;&nbsp;<a class="btn btn-danger btn-sm btn-res" href="#">예매</a>
                                <p>공항에서 수하물 노동자로 일하며 음악의 꿈을 키우던 이민자 출신의 아웃사이더 ‘파록버사라’ 보컬을 구하던 로컬 밴드에 들어가게 되면서 ‘프레디 머큐리’라는 이름으로 밴드 ‘퀸’을 이끌게 된다. 시대를 앞서가는 독창적인 음악과 화려한 퍼포먼스로 관중들을 사로잡으며 성장하던 ‘퀸’은 라디오와 방송에서 외면을 받을 것이라는 음반사의 반대에도 불구하고 무려 6분 동안 이어지는 실험적인 곡 ‘보헤미안 랩소디’로 대성공을 거두며 월드스타 반열에 오른다. 그러나 독보적인 존재감을 뿜어내던 ‘프레디 머큐리’는 솔로 데뷔라는 유혹에 흔들리게 되고 결국 오랜 시간 함께 해왔던 멤버들과 결별을 선언하게 되는데… 세상에서 소외된 아웃사이더에서 전설의 록밴드 ‘퀸’ 되기까지, 우리가 몰랐던 그들의 진짜 이야기가 시작된다!</p>
                            </div>
                        </div>
                    </div>

                    <div class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/slider/스타이즈본.jpg')">                 
                         <div class="carousel-caption">
                            <div class="animated bounceInUp">
                                <h2>스타이즈본</h2><br>
                                <h4>현재 상영중!</h4>&nbsp;&nbsp;<a class="btn btn-danger btn-sm btn-res" href="#">예매</a>
                                <p>노래에 놀라운 재능을 가졌지만 외모에는 자신이 없는 무명가수 앨리(레이디 가가)는 공연을 하던 바에서 우연히 톱스타 잭슨 메인(브래들리 쿠퍼)을 만나게 된다. 자신의 모든 것을 사랑해주는 잭슨의 도움으로 앨리는 자기 안의 열정을 폭발시키며 최고의 스타로 거듭나지만, 잭슨은 어린 시절의 상처와 예술가적 고뇌 속에서 점점 무너져가는데…</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/.carousel-inner-->
                <nav id="nav-arrows" class="nav-arrows hidden-xs hidden-sm visible-md visible-lg">
                    <a class="sl-prev hidden-xs" href="#home-carousel" data-slide="prev">
                        <i class="fa fa-angle-left fa-3x"></i>
                    </a>
                    <a class="sl-next" href="#home-carousel" data-slide="next">
                        <i class="fa fa-angle-right fa-3x"></i>
                    </a>
                </nav>

            </div>
        </section>
        <!--
        End #home Slider
        ========================== -->

        
 
        <!--
        #about
        ========================== -->
        <section id="about">
            <div class="container">
                <div class="row">

                    <div class="section-title text-center wow fadeInUp">
                        <h2>About Us</h2>
					<a href="movie/uploadChart_form.do">영화등록하기</a> 
					<a href="movie/listChart.do">리스트보기</a> 
					<a href="users/usersRes/detail.do">디테일</a>
				</div>
                    
                    <div class="about-us text-center wow fadeInDown">
                        <img src="${pageContext.request.contextPath}/resources/images/movie1.png" alt="About Us" class="img-responsive">
                    </div>
                </div>
            </div>
        </section>
        <!--
        End #about
        ========================== -->




        <!-- #quotes -->
        <section id="quotes">
			<jsp:include page="include/quotes.jsp" />
        </section>
        
        <!-- End #quotes -->


        <!-- #footer -->
        <footer id="footer" class="text-center">
   			<jsp:include page="include/footer.jsp" />
        </footer>
        <!-- End #footer -->



<!-- js파일 로딩 -->
<jsp:include page="include/MSC2.jsp" />
<!-- javascript	 -->
<script>
	$("#nav>li:eq(0)").attr("class", "current");
</script>

</body>
</html>

