<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/user/userboard.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
		<div class="col-md-9 col-md-offset-1">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th width="10%" >번호</th>
				<th width="20%">작성자</th>
				<th width="30%">제목</th>
				<th width="20%">조회수</th>
				<th width="20%">등록일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="tmp">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.writer }</td>
				<td><a href="detail.do?num=${tmp.num }&condition=${condition}&keyword=${encodedKeyword}">${tmp.title }</a></td>
				<td>${tmp.viewCount }</td>
				<td>${tmp.regdate }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="page-display" style="text-align:center;">
		<ul class="pagination">
		<c:choose>
			<c:when test="${startPageNum ne 1}">
				<li>
					<a href="userlistboard.do?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedKeyword}">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum}" end="${endPageNum }" >
			<c:choose>
				<c:when test="${pageNum eq i }">
					<li class="active">
						<a href="userboardview.do?pageNum=${i }&condition=${condition}&keyword=${encodedKeyword}">${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="userboardview.do?pageNum=${i }&condition=${condition}&keyword=${encodedKeyword}">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li>
					<a href="userlistboard.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedKeyword}">&raquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		</ul>
	</div>
	<form action="userlistboard.do" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
			<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
			<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
		</select>
		<input value="${keyword }" type="text" name="keyword" placeholder="검색어..."/>
		<button type="submit">검색</button>
	</form>
	<c:if test="${not empty keyword }">
		<p> <strong>${keyword }</strong> 라는 키워드로 
			<strong>${totalRow }</strong> 개의 글이 검색되었습니다.</p>
	</c:if>	
</div><!-- /.container -->
</div>
</body>
</html>