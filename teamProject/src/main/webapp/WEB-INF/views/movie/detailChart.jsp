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
		.detail_table td{
			text-align: left;
			padding : 3px 3px 3px 7px
		}
		.container2{
			margin-bottom: 100px;
		}
		#liketo_form{
			display: inline;
		}
		.font-size1{
			font-size: 17px;
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
				<div class="col-sm-3">
					<img class="img-responsive" src="${pageContext.request.contextPath }/upload/${dto.saveFileName }"/>
				</div>
				<div class="col-sm-7">
					<table class="detail_table">
						<tr>
							<td><h1><b>${dto.title }</b></h1></td>
						</tr>							
						<tr>
							<td></td>
						</tr>
						<tr class="font-size1">
							<td>
								<b>개봉일</b> :
								<fmt:parseDate value="${dto.opendate }" var="dateFmt2" pattern="yyyy-MM-dd HH:mm:ss" />
								<fmt:formatDate value="${dateFmt2 }" pattern="yyyy-MM-dd" />
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr class="font-size1">
							<td><b>추천</b>
								<form id="liketo_form">									 
									<span class="glyphicon glyphicon-heart"></span>
									<input type="hidden" name="movieInfoNum" value="${dto.num }" />
								</form>	: <span class="liketo">${dto.liketo }</span> 
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr class="font-size1">
							<td><b>영화개요</b> : ${dto.content }</td>
						</tr>
					</table>
				</div>						
			</div>
		</div>
		<div class="clearfix"></div>
		<!-- 댓글 목록 -->
		<div class="comments">
			<ul>
			<c:forEach items="${commentList }" var="tmp">
				<c:choose>
	<%-- 			<c:when test="${tmp.deleted eq 'no '}">	no가 3칸으로들어가버려서.. --%>
					<c:when test="${tmp.deleted ne 'yes'}">					
						<li class="comment" id="comment${tmp.num }" <c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if> >
							<c:if test="${tmp.num ne tmp.comment_group }">
								<img class="reply_icon" src="${pageContext.request.contextPath }/resources/images/re.gif" />
							</c:if>
							<dl>
								<dt>
									<img src="${pageContext.request.contextPath }/resources/images/user_image.gif" />
									<span>${tmp.id }</span>
									<c:if test="${tmp.num ne tmp.comment_group }">
										to <strong>${tmp.target_id }</strong>
									</c:if>
									<span>${tmp.regdate }</span>
									<!-- 반복문 도는곳에 아이디 넣지않기! -->						
									<a href="javascript:" class="reply_link">답글</a>
									<c:choose>
										<c:when test="${id eq tmp.id }">
											<a href="javascript:" class="comment-update-link">수정</a>&nbsp;&nbsp;
											<a href="javascript:deleteComment(${tmp.num })">삭제</a>
										</c:when>
										<c:otherwise>
											<a href="javascript:">신고</a>
										</c:otherwise>
									</c:choose>
								</dt>
								<dd>
									<pre>${tmp.content }</pre>
								</dd>
							</dl>
							<form class="comment-insert-form" action="${pageContext.request.contextPath }/movie/comment_insert.do" method="post">
								<!-- 덧글 그룹 -->
								<input type="hidden" name="ref_group" value="${dto.num }" />
								<!-- 덧글 대상 -->
								<input type="hidden" name="target_id" value="${tmp.id }" />
								<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
								<textarea name="content"><c:if test="${empty id }">로그인이 필요합니다.</c:if></textarea>
								<button type="submit">등록</button>
							</form>
							<!-- 로그인한 아이디와 댓글의 작성자와 같으면 수정폼 출력 -->
							<c:if test="${id eq tmp.id }">
								<form class="comment-update-form" action="${pageContext.request.contextPath }/movie/comment_update.do">
									<input type="hidden" name="num" value="${tmp.num }" />
									<textarea name="content">${tmp.content }</textarea>
									<button type="submit">수정</button>
								</form>
							</c:if>
						</li>
					</c:when>
					<c:otherwise>
						<li>삭제된 댓글 입니다.</li>
					</c:otherwise>
				</c:choose>			
			</c:forEach>			
			</ul>
			<div class="clearfix"></div>
			<!--  원글에 댓글을 작성할수 있는 폼 -->
			<div class="comment_form">
				<form action="${pageContext.request.contextPath }/movie/comment_insert.do" method="post">
				<!--  댓글의 그룹번호는 원글의 글번호 -->
				<input type="hidden" name="ref_group" value="${dto.num }" />
				<!--  댓글의 대상자는 원글의 작성자 -->
				<input type="hidden" name="target_id" value="${dto.id }" />
				<textarea name="content"><c:if test="${empty id }">로그인이 필요합니다.</c:if></textarea>
				<button type="submit">등록</button>
				</form>
			</div>
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
	
	//댓글 수정을 눌렀을때 호출되는 함수
	$(".comment-update-link").click(function(){
		$(this)
		.parent().parent().parent()
		.find(".comment-update-form")
		.slideToggle(200);/* 0.2초 */
	});
	//댓글 수정폼에 submit 이벤트가 일어났을때 호출되는 함수 등록
	$(".comment-update-form").on("submit", function(){
		var url=$(this).attr("action");
		//폼에 작성된 내용을 query 문자열로 읽어온다.
		// serialize하면 이렇게됨 : num=x&content=xxx
		var data=$(this).serialize();
		//이벤트가 일어난 폼을 선택해서 변수에 담아 놓는다.
		var $this=$(this);
		$.ajax({
			url:url,
			method:"post", 
			data:data,
			success:function(responseData){
				if(responseData.isSuccess){
					//폼을 안보이게 한다.
					$this.slideUp(200);
					//폼에 입력한 내용 읽어오기
					var content=$this.find("textarea").val();
					//pre 요소에 수정 반영하기
					$this.parent().find("pre").text(content);
				}
			}
		});
		//폼 제출 막긱
		return false;
		
	});
	//댓글 삭제를 눌렀을때 호출되는 함수
	function deleteComment(num){
		var isDelete=confirm("확인을 누르면 댓글이 삭제 됩니다.");
		if(isDelete){
			$.ajax({
				url:"${pageContext.request.contextPath }/movie/comment_delete.do",
				method:"post",
				data:{num:num},/* data:{"num":num}, 원래 방이름은 따옴표가맞음. 근데없어도 진행됨.*/
				success:function(responseData){
					if(responseData.isSuccess){
						var sel="#comment"+num;
						$(sel).text("삭제된 댓글 입니다.");
					}
				}
			});
		}
	}
	//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록
	$(".comments form").on("submit", function(){
		//로그인 여부
		var isLogin=${not empty id};
		if(!isLogin){
			alert("로그인 페이지로 이동 합니다.");
			location.href="${pageContext.request.contextPath }/users/loginform.do?url=${pageContext.request.contextPath }/movie/detail.do?num=${dto.num}";
			return false;
		}
	});

	//답글 달기 링크를 클릭했을때 실행할 함수
	$(".comment .reply_link").click(function(){
		$(this)
		.parent().parent().parent()
		.find(".comment-insert-form")
		.slideToggle(200);/* 0.2초 */
		
		var text = $(this).text();
		$(this).text(
			text == "답글" ? "닫기" : "답글"
		);
		
	});
</script>

</body>
</html>





