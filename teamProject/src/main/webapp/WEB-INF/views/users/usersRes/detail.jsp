<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h3><strong>${id }</strong>님의 예매내역</h3>
		<p>지난 <span style="color:red">1개월</span>까지의 예매내역을 확인하실 수 있습니다.</p>
		<hr color="black" />
		<div class="col-sm-8">
			<img src="${pageContext.request.contextPath }/resources/images/kim.jpg"/>
			<table class="table table-hover">
				<tr>
					<td>${movieName}</td>
					<td class="pull-right"><strong>예매번호 : ${num }</strong></td>
				</tr>
				<tr>
					<td>관람일시 2018.12.15 상영관 6관</td>
					<td>관람극장 CGV 용산 관람좌석 E11</td>
				</tr>
				<tr>
					<td>결제날짜 ${regdate} 매수 일반1</td>
					<td>결제수단 ${paymentWay}:${moviePrice }</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>