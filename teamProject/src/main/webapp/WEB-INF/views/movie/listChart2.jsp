<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	h1{
		display: inline-block;
	}
	button:first-child{
		float: right;
		margin-right: 10px;
		margin-top: 25px;
	}
	th,td {
	    text-align: center;
	}
	img{
		width: 250px;
    	height: auto;
	}
</style>
</head>
<body>
<div class="container">	
	<h1>무비차트</h1>
	<a href="uploadChart_form.do"><button class="btn btn-info upbtn">업로드 하러 가기</button></a>
	<hr style="height: 3px;" color="black" />
	<br />
	<img src="${pageContext.request.contextPath }/upload/1545104915880fantastic-beasts-the-crimes-of-grindelwald.jpg"/>
	<div class="row">
		<div class="col-xs-12">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th style="width: 5%">번호</th>
						<th style="width: 6%">작성자</th>
						<th style="width: 20%">영화제목</th>
						<th style="width: 20%">주요정보</th>
						<th style="width: 10%">개봉날짜</th>
						<th style="width: 6%">추천수</th>						
						<th style="width: 10%">파일명</th>
						<th style="width: 8%">파일크기</th>
						<th style="width: 10%">등록일</th>
						<th style="width: 5%">삭제</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list }" var="tmp">								
					<tr>						
						<td>${tmp.num }${tmp.saveFileName}</td>
						<td>${tmp.writer }</td>
						<td>${tmp.title }</td>
						<td><c:out value="${fn:substring(tmp.content, 0, 33)}..."/></td>
						<td>
							<fmt:parseDate value="${tmp.opendate }" var="dateFmt2" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${dateFmt2 }" pattern="yyyy-MM-dd" />
						</td>
						<td>${tmp.liketo }</td>
						<td><a href="download.do?num=${tmp.num }">${tmp.orgFileName }</a></td>
						<td><fmt:formatNumber value="${tmp.fileSize }" /></td>			
						<td>
							<fmt:parseDate value="${tmp.regdate }" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${dateFmt }" pattern="yyyy-MM-dd HH:mm" />
						</td>
						<td><a href="${pageContext.request.contextPath }/movie/delete.do?num=${tmp.num }">삭제</a></td>
					</tr>				
				</c:forEach>
				</tbody>
			</table>
			<div class="text-center">
				<ul class="pagination">
				<c:if test="${startPageNum ne 1 }">
					<li>
						<a href="list.do?pageNum=${startPageNum-1}&condition=${condition }&keyword=${encodedKeyword }">&laquo;</a>
					</li>
				</c:if>
				<c:if test="${startPageNum eq 1 }">
					<li class="disabled">
						<a href="javascript:">&laquo;</a>
					</li>
				</c:if>
					<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
						<c:if test="${pageNum eq i }">
							<li>
								<a href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a>
							</li>
						</c:if>
						<c:if test="${pageNum ne i }">
							<li>					
								<a href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedKeyword }">${i }</a>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${endPageNum lt totalPageCount}">
						<li>
							<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedKeyword }">&raquo;</a>
						</li>
					</c:if>
					<c:if test="${endPageNum ge totalPageCount}">
						<li class="disabled">
							<a href="javascript:">&raquo;</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>		
	</div>
	<!-- keyword 검색어 form -->
	<form action="${pageContext.request.contextPath }/file/list.do" method="post">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="titlename" <c:if test="${condition eq 'titlename' }"> selected</c:if>>제목+파일명</option>
			<option value="title" <c:if test="${condition eq 'title' }"> selected</c:if>>제목</option>
			<option value="writer" <c:if test="${condition eq 'writer' }"> selected</c:if>>작성자</option>
		</select>
		<input type="text" value="${keyword }" name="keyword" placeholder="검색어..." />
		<button type="submit">검색</button>
	</form>
	<c:choose>
		<c:when test="${not empty keyword }">
			<p><strong>${keyword }</strong> 검색어로 검색된 
			<strong>${totalRow }</strong>개의 파일이 있습니다.</p>
		</c:when>
		<c:otherwise>
			<p><strong>${totalRow }</strong>개의 파일이 있습니다.</p>
		</c:otherwise>
	</c:choose>	
</div>
<div>
	<p>${msg }</p>
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>

</body>
</html>



