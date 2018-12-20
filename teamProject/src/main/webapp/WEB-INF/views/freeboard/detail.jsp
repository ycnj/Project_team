<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<!--<![endif]-->
<head>

<!-- link 로딩 -->
<jsp:include page="../include/MSC1.jsp" />
	<tlte>detail</tlte>

<style>
/* 글내용의 경계선 표시 */
.content {
	border: 1px dotted #cecece;
}
/* 글안에 있는 첨부 이미지의 폭 제한 */
.content img {
	max-width: 100%;
}
/* 댓글에 관련된 css */
.comments ul {
	padding: 0;
	margin: 0;
	list-style-type: none;
}

.comments ul li {
	border-top: 1px solid #888; /* li 의 윗쪽 경계선 */
}

.comments dt {
	margin-top: 5px;
}

.comments dd {
	margin-left: 26px;
}

.comments form textarea, .comments form button {
	float: left;
}

.comments li {
	clear: left;
}

.comments form textarea {
	width: 85%;
	height: 100px;
}

.comments form button {
	width: 15%;
	height: 100px;
}
/* 댓글에 댓글을 다는 폼과 수정폼을 일단 숨긴다. */
.comment form {
	display: none;
}

.comment {
	position: relative;
}

.comment .reply_icon {
	width: 8px;
	height: 8px;
	position: absolute;
	top: 10px;
	left: 30px;
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
        #service-bottom
        ========================== -->

	<section id="service-bottom">
		<div class="container">
			<div class="mobile-device">
				<img data-wow-delay="0.2s"
					class="img-responsive black  wow fadeInLeftBig"
					src="${pageContext.request.contextPath }/resources/images/icons/iphone-black.png"
					alt="iPhone Black"> <img data-wow-delay="0.5s"
					class="img-responsive white  wow fadeInLeftBig"
					src="${pageContext.request.contextPath }/resources/images/icons/iphone-white.png"
					alt="iPhone White">
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


	<!--
        #service
        ========================== -->
	<section id="service">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-title text-center wow fadeInDown">
						<h2>자유게시판</h2>
					</div>
				</div>
				<h3 class="col-md-8 col-md-offset-2">게시판 글</h3>
				<br />
			</div>
		</div>

		<!--여기다! 22222222222222222222222222222222222222222222222222222222222  -->

		<div class="row">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<c:if test="${not empty keyword }">
							<p>
								<strong>${keyword }</strong> 검색어로 검색된 결과 입니다.
							</p>
						</c:if>
						<br /> <br />
						<c:if test="${dto.prevNum ne 0 }">
							<a
								href="detail.do?num=${dto.prevNum }&condition=${condition}&keyword=${encodedKeyword}">이전글</a>
						</c:if>
						<c:if test="${dto.nextNum ne 0 }">
							<a
								href="detail.do?num=${dto.nextNum }&condition=${condition}&keyword=${encodedKeyword}">다음글</a>
						</c:if>
						<br />
						<table class="table table-bordered table-condensed">
							<tr>
								<td style="text-align: center;">글번호</td>
								<td>${dto.num }</td>
							</tr>
							<tr>
								<td style="text-align: center;">작성자</td>
								<td>${dto.id }</td>
							</tr>
							<tr>
								<td style="text-align: center;">파일명</td>
								<td><a href="download.do?num=${dto.num }">${dto.orgFileName }</a></td>
							</tr>
							<tr>
								<td style="text-align: center;">조회수</td>
								<td>${dto.viewCount }</td>
							</tr>
							<tr>
								<td style="text-align: center;">등록일</td>
								<td>${dto.regdate }</td>
							</tr>
						</table>
						<div class="content">${dto.content }</div>
						<!-- 로그인된 아이디와 글작성자가 같을때만 수정, 삭제 링크 제공 -->
						<a class="btn btn-primary" href="list.do">목록</a>
						<c:if test="${ sessionScope.id eq dto.id }">
							<a class="btn btn-success" href="updateform.do?num=${dto.num }">수정</a>
							<a class="btn btn-warning"
								href="javascript:deleteConfirm(${dto.num })">삭제</a>
						</c:if>
						<!-- 댓글 목록 -->
						<div class="comments">
							<ul>
								<c:forEach items="${commentList }" var="tmp">
									<c:choose>
										<c:when test="${tmp.deleted ne 'yes' }">
											<li class="comment" id="comment${tmp.num }"
												<c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if>>
												<c:if test="${tmp.num ne tmp.comment_group }">
													<img class="reply_icon"
														src="${pageContext.request.contextPath}/resources/images/re.gif" />
												</c:if>
												<dl>
													<dt>
														<img
															src="${pageContext.request.contextPath}/resources/images/user_image.gif" />
														<span>${tmp.id }</span>
														<c:if test="${tmp.num ne tmp.comment_group }">
									to <strong>${tmp.target_id }</strong>
														</c:if>
														<span>${tmp.regdate }</span> <a href="javascript:"
															class="reply_link">답글</a>
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
												<form class="comment-insert-form" action="comment_insert.do"
													method="post">
													<!-- 덧글 그룹 -->
													<input type="hidden" name="ref_group" value="${dto.num }" />
													<!-- 덧글 대상 -->
													<input type="hidden" name="target_id" value="${tmp.id }" />
													<input type="hidden" name="comment_group"
														value="${tmp.comment_group }" />
													<textarea name="content"><c:if
															test="${empty id }">로그인이 필요합니다.</c:if></textarea>
													<button type="submit">등록</button>
												</form> <!-- 로그인한 아이디와 댓글의 작성자와 같으면 수정폼 출력 --> <c:if
													test="${id eq tmp.id }">
													<form class="comment-update-form"
														action="comment_update.do">
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
							<!-- 원글에 댓글을 작성할수 있는 폼 -->
							<div class="comment_form">
								<form action="comment_insert.do" method="post">
									<!-- 댓글의 그룹번호는 원글의 글번호 -->
									<input type="hidden" name="ref_group" value="${dto.num }" />
									<!-- 댓글의 대상자는 원글의 작성자 -->
									<input type="hidden" name="target_id" value="${dto.id }" />
									<textarea name="content"><c:if test="${empty id }">로그인이 필요합니다.</c:if></textarea>
									<button type="submit">등록</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end .row -->
		</div>
		<!-- end .container -->
	</section>
	<!--
        End #service
        ========================== -->

	<!--
        #count
        ========================== -->

	<section id="count">
		<div class="container">
			<div class="row">
				<div class="counter-section clearfix">

					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"
						data-wow-delay="0.5s">
						<div class="fact-item text-center">
							<div class="fact-icon">
								<i class="fa fa-check-square fa-lg"></i>
							</div>
							<span data-to="120">0</span>
							<p>Completed Projects</p>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"
						data-wow-delay="0.8s">
						<div class="fact-item text-center">
							<div class="fact-icon">
								<i class="fa fa-users fa-lg"></i>
							</div>
							<span data-to="152">0</span>
							<p>Satisfied Clients</p>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"
						data-wow-delay="1.1s">
						<div class="fact-item text-center last">
							<div class="fact-icon">
								<i class="fa fa-clock-o fa-lg"></i>
							</div>
							<span data-to="2500">0</span>
							<p>Working Hours</p>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"
						data-wow-delay="1.3s">
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
	</section>
	<!--
        End #count
        ========================== -->



	<!--
        #footer
        ========================== -->
	<footer id="footer" class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">

					<div class="footer-logo wow fadeInDown">
						<img
							src="${pageContext.request.contextPath }/resources/img/logo.png"
							alt="logo">
					</div>

					<div class="footer-social wow fadeInUp">
						<h3>We are social</h3>
						<ul class="text-center list-inline">
							<li><a href="http://goo.gl/RqhEjP"><i
									class="fa fa-facebook fa-lg"></i></a></li>
							<li><a href="http://goo.gl/hUfpSB"><i
									class="fa fa-twitter fa-lg"></i></a></li>
							<li><a href="http://goo.gl/r4xzR4"><i
									class="fa fa-google-plus fa-lg"></i></a></li>
							<li><a href="http://goo.gl/k9zAy5"><i
									class="fa fa-dribbble fa-lg"></i></a></li>
						</ul>
					</div>

					<div class="copyright">

						Shared by <i class="fa fa-love"></i><a
							href="https://bootstrapthemes.co">BootstrapThemes</a>

					</div>

				</div>
			</div>
		</div>
	</footer>
	<!--
        End #footer
        ========================== -->


	<!--
        JavaScripts
        ========================== -->

	<!-- main jQuery -->
<jsp:include page="../include/MSC2.jsp" />

	<script>
	
		//댓글 수정 링크를 눌렀을때 호출되는 함수 등록
	$(".comment-update-link").click(function(){
		$(this)
		.parent().parent().parent()
		.find(".comment-update-form")
		.slideToggle(200);
	});
	
	//댓글 수정 폼에 submit 이벤트가 일어났을때 호출되는 함수 등록
	$(".comment-update-form").on("submit", function(){
		// "comment_update.do"
		var url=$(this).attr("action");
		//폼에 작성된 내용을 query 문자열로 읽어온다.
		// num=댓글번호&content=댓글내용
		var data=$(this).serialize();
		//이벤트가 일어난 폼을 선택해서 변수에 담아 놓는다.
		var $this=$(this);
		$.ajax({
			url:url,
			method:"post",
			data:data,
			success:function(responseData){
				// responseData : {isSuccess:true}
				if(responseData.isSuccess){
					//폼을 안보이게 한다 
					$this.slideUp(200);
					//폼에 입력한 내용 읽어오기
					var content=$this.find("textarea").val();
					//pre 요소에 수정 반영하기 
					$this.parent().find("pre").text(content);
				}
			}
		});
		//폼 제출 막기 
		return false;
	});
	
	//댓글 삭제를 눌렀을때 호출되는 함수
	function deleteComment(num){
		var isDelete=confirm("확인을 누르면 댓글이 삭제 됩니다.");
		if(isDelete){
			$.ajax({
				url:"comment_delete.do",
				method:"post",
				data:{"num":num},
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
		if(isLogin==false){
			alert("로그인 페이지로 이동 합니다.");
			location.href="${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/cafe/detail.do?num=${dto.num}";
			return false;//폼 전송 막기 
		}
	});

	//답글 달기 링크를 클릭했을때 실행할 함수 등록
	$(".comment .reply_link").click(function(){
		$(this)
		.parent().parent().parent()
		.find(".comment-insert-form")
		.slideToggle(200);
		
		if($(this).text()=="답글"){
			$(this).text("취소");
		}else{
			$(this).text("답글");
		}
	});

	function deleteConfirm(num){
		var isDelete=confirm(num+" 번 글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.do?num="+num;
		}
	}
	
	$("#nav>li:eq(3)").attr("class","current");	
	</script>
</body>
</html>






