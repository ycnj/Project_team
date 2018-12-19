<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/info.jsp</title>
</head>
<body>
<h3>개인정보 페이지 입니다.</h3>
<h3>개인 정보 입니다.</h3>
<table>
	<thead>
		<tr>
			<th>항목</th>
			<th>정보</th>
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
<a href="updateform.do">회원정보 수정</a>
<a href="javascript:deleteConfirm()">회원 탈퇴</a>
<script>
	function deleteConfirm(){
		var isDelete=confirm("${id} 회원님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath}/users/delete.do";
		}
	}
</script>
</body>
</html>
















