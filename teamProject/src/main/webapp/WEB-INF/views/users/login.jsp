<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>users/Loginform.do</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/loginrsc/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/css/main.css">
<!--===============================================================================================-->
<style>
.btn-success {
  color: #fff;
  background-color: #28a745;
  border-color: #28a745;
}
</style>
</head>

<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
				<c:choose>
					<c:when test="${requestScope.isSuccess }">
						<p>
							${id } 님 로그인 되었습니다.
							<c:if test="${empty param.url }">
								<a href="${pageContext.request.contextPath}/home.do">확인</a>
							</c:if>
							<c:if test="${not empty param.url }">
								<a href="${param.url }">확인</a>
							</c:if>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							아이디 혹은 비밀번호가 틀려요. <a href="loginform.do">다시 로그인 하기</a>
						</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="${pageContext.request.contextPath}/loginrsc/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/loginrsc/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/loginrsc/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/loginrsc/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/loginrsc/js/main.js"></script>

</body>
</html>