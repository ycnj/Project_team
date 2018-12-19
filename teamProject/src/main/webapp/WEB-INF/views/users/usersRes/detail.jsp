<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/usersResDetail.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<div class="row">
		<h3><strong>${dto.id }</strong>님의 예매내역</h3>		
		<h4><strong>회원등급 : ${grade}</strong></h4>
		<p>지난 <span style="color:red">1개월</span>까지의 예매내역을 확인하실 수 있습니다.</p>
		<hr style="height: 3px;" color="black" />
		<div class="col-sm-10">			
			<table class="table table-hover table-bordered text-center">
				<tr>
					<td rowspan="4"><img style="display:inline-block;max-width:80px;" src="${pageContext.request.contextPath }/resources/images/kim1.png"/></td>
				</tr>
				<tr>
					<td>${dto.movieName}</td>
					<td><strong>예매번호 : ${dto.num }</strong></td>
				</tr>
				<tr>
					<td>관람일시 2018.12.15 상영관 6관(x)</td>
					<td>관람극장 CGV 용산 관람좌석 E11(x)</td>
				</tr>
				<tr>
					<td>결제날짜 ${dto.regdate} 매수 일반1</td>
					<td>결제수단 ${dto.paymentWay}:${dto.price }</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>