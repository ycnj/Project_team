<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/ask/detail.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style>
	/* 글내용의 경계선 표시 */
	.content{
		border: 1px dotted #cecece;
	}
	/* 글안에 있는 첨부 이미지의 폭 제한 */
	.content img{
		max-width: 100%;
	}
	/* 댓글에 관련된 css */
	.comments ul{
		padding: 0;
		margin: 0;
		list-style-type: none;
	}
	.comments ul li{
		border-top: 1px solid #888; /* li 의 윗쪽 경계선 */
	}
	.comments dt{
		margin-top: 5px;
	}
	.comments dd{
		margin-left: 26px;
	}
	.comments form textarea, .comments form button{
		float: left;
	}
	.comments li{
		clear: left;
	}
	.comments form textarea{
		width: 85%;
		height: 100px;
	}
	.comments form button{
		width: 15%;
		height: 100px;
	}
	/* 댓글에 댓글을 다는 폼과 수정폼을 일단 숨긴다. */
	.comment form{
		display: none;
	}
	.comment{
		position: relative;
	}
	.comment .reply_icon{
		width: 8px;
		height: 8px;
		position: absolute;
		top: 10px;
		left: 30px;
	}
</style>
</head>
<body>
<div class="container contFont">
	<c:if test="${not empty keyword }">
		<p> <strong>${keyword }</strong> 검색어로 검색된 결과 입니다.</p>
	</c:if>
	<c:if test="${dto.prevNum ne 0 }">
		<a class="btn btn-warning" href="detail.do?num=${dto.prevNum }&condition=${condition}&keyword=${encodedKeyword}">이전글</a>
	</c:if>
	<c:if test="${dto.nextNum ne 0 }">
		<a class="btn btn-success" href="detail.do?num=${dto.nextNum }&condition=${condition}&keyword=${encodedKeyword}">다음글</a>
	</c:if>
	<table class="table table-bordered table-condensed">
		<tr>
			<th>글번호</th>
			<td>${dto.num }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${dto.viewCount }</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${dto.regdate }</td>
		</tr>
	</table>
	<div class="content">${dto.content }</div>
	<!-- 로그인된 아이디와 글작성자가 같을때만 수정, 삭제 링크 제공 -->
	<c:if test="${ sessionScope.id eq dto.writer || sessionScope.id eq 'master' }">
		<a class="btn btn-info" href="updateformview.do?num=${dto.num }">수정</a>
		<a class="btn btn-danger" href="javascript:deleteConfirm(${dto.num })">삭제</a>
	</c:if>
</div>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script>
	function deleteConfirm(num){
		var isDelete=confirm(num+" 번 글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.do?num="+num;
		}
	}
</script>
</body>
</html>

















