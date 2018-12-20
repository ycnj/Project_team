<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="navbar-header">
	<!-- responsive nav button -->
	<button type="button" class="navbar-toggle" data-toggle="collapse"
		data-target=".navbar-collapse">
		<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
		<span class="icon-bar"></span> <span class="icon-bar"></span>
	</button>
	<!-- /responsive nav button -->

	<!-- logo -->
	<h1 class="navbar-brand">
		<a href="${pageContext.request.contextPath}/home.do"> <img
			src="${pageContext.request.contextPath}/resources/images/logo.png"
			alt="Kasper Logo">
		</a>
	</h1>
	<!-- /logo -->

</div>

<!-- main nav -->
<nav class="collapse navigation navbar-collapse navbar-right "
	role="navigation">
	<ul id="nav" class="nav navbar-nav">
		<li><a href="${pageContext.request.contextPath}/home.do">홈</a></li>
		<li><a
			href="${pageContext.request.contextPath}/movie/listChart.do">영화정보</a></li>
		<li><a href="">영화검색</a></li>
		<li><a
			href="${pageContext.request.contextPath}/freeboard/list.do">자유게시판</a></li>
		<li><a href="${pageContext.request.contextPath}/event/list.do">이벤트</a></li>
		<li><a
			href="${pageContext.request.contextPath}/ask/contact_home.do">문의</a></li>
		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<li><a
					href="${pageContext.request.contextPath}/users/loginform.do">Login</a></li>
			</c:when>
			<c:otherwise>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown"
					href="${pageContext.request.contextPath}/users/info.do"> ${id }
						for Info <span class="caret"></span>
				</a>
					<ul class="dropdown-menu"
						style="font-family: fantasy; background-color: white;">
						<li><a
							href="${pageContext.request.contextPath}/users/info.do">내정보</a></li>
						<li><a
							href="${pageContext.request.contextPath}/users/resDetail.do">예매내역</a></li>
						<li><a
							href="${pageContext.request.contextPath}/users/logout.do">logout</a></li>
					</ul></li>
				<c:if test="${sessionScope.id eq 'master' }">
					<li><a href="${pageContext.request.contextPath}/users/list.do">관리자page</a></li>
				</c:if>
			</c:otherwise>
		</c:choose>

	</ul>
</nav>
<!-- /main nav -->