<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/list.jsp</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/home.do">홈으로</a>
<h3>회원 목록입니다.</h3>
<c:choose>
	<c:when test="${sessionScope.id eq 'gura' }">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>아이디</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>지번</th>
					<th>주소</th>
					<th>성별</th>
					<th>가입일</th>
					<th>회원구분</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list }" var="tmp">
				<tr>
					<td>${tmp.rnum }</td>
					<td>${tmp.name }</td>
					<td>${tmp.rrn }</td>
					<td>${tmp.id }</td>
					<td>${tmp.email }</td>
					<td>${tmp.phon }</td>
					<td>${tmp.addr1 }</td>
					<td>${tmp.addr2 } ${tmp.addr3 }</td>
					<td>${tmp.gender }</td>
					<td>${tmp.rdate }</td>
					<td>${tmp.gubun }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
</c:when>
			<c:otherwise>
			<p>볼수 없는 페이지입니다.</p>
			</c:otherwise>
</c:choose>
</body>
</html>











