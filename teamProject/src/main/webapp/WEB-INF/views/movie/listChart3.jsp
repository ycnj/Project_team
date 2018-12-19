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
	.panel-body{
		padding: 0;
	}
	.panel-heading{		
		padding-left: 99px;
	}
	.panel-heading h4{
		display: inline-block;
		font-weight: bold;
	}
	.panel-heading a{
		margin-top: 5px;
	}
	.panel-heading > a{
		color: #a94442;
	}
	@media (min-width: 768px) {
	  .container {
	    width: 1100px;
	  }
	}
	@media (min-width: 992px) {
	  .container {
	    width: 1100px;
	  }
	}
	@media (min-width: 1200px) {
	  .container {
	    width: 1100px;
	  }
	}
	.textFit{
		font-weight: bold;
	}
	.panel-primary > .panel-heading {
	    background-color: #3F4084;
	    border-color: #3F4084;
	}
	.panel-footer a:link, a:visited {
	 	color: red; text-decoration: none;
	 }
	.panel-footer  a:hover {
	 	color: blue; text-decoration: none;
	 }
	 .font-sizeUp{
	 	font-size: 20px;
    	font-weight: bold; 
	 }
	 .glyphicon-heart{
	 	color: red;
	 }
	 .glyphicon-heart:hover{
	 	color: blue;
	 	cursor: pointer;
	 }
	 #condition, #keyword{
	 	width:200px;	
	 	display:inline-block; 	
	 }
	 #condition{
		padding-top: 3px;
	 }
	 .form-group{
	 	display:inline-block;
	 }
</style>
	 
</head>
<body>

<div class="container">	
	<h1>무비차트</h1>
	<c:if test="${id eq 'master' }">
		<a href="uploadChart_form.do"><button class="btn btn-info upbtn">업로드 하러 가기</button></a>
	</c:if>
	<hr style="height: 3px;" color="black" />
	<br />
	<div class="row">
		<c:forEach items="${list }" var="tmp" varStatus="status">	
			<div class="col-xs-6 col-sm-3">
				<div class="panel panel-primary">
					<div class="panel-heading"
					 style="<c:if test="${status.count gt 4 }">color: #fff; background-color: black; border-color: black;</c:if>" >
						<h4>NO.${status.count}</h4>
						<c:if test="${id eq 'master' }">
							<a class="btn pull-right" href="${pageContext.request.contextPath }/movie/delete.do?num=${tmp.num }">
								<span class="glyphicon glyphicon-remove"></span>
							</a>
						</c:if>						
					</div>
					<div class="panel-body">
						<img class="img-responsive" src="${pageContext.request.contextPath }/upload/${tmp.saveFileName }"/>
					</div>
					<div class="panel-footer">
						<div class="font-sizeUp">
							<c:choose>
								<c:when test="${fn:length(tmp.title) > 12}">
									<c:out value="${fn:substring(tmp.title, 0, 11)}..."/>
         							</c:when>
								<c:otherwise>
									<c:out value="${tmp.title}" />
								</c:otherwise>
							</c:choose>
						</div>
						<fmt:parseDate value="${tmp.opendate }" var="dateFmt2" pattern="yyyy-MM-dd HH:mm:ss" />
						<fmt:formatDate value="${dateFmt2 }" pattern="yyyy-MM-dd" /> &nbsp;개봉 <br />
						<form id="liketo_form">
							<span class="liketo">${tmp.liketo }</span>  
							<span class="glyphicon glyphicon-heart"></span>
							<input type="hidden" name="movieInfoNum" value="${tmp.num }" />
						</form>	
					</div>
				</div>
			</div>			
		</c:forEach>
	</div>
</div>
	<!-- ------------------------------------페이지 처리1------------------------------------ -->
<div class="container">	
		<div class="row">
			
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
			
			<!-- ------------------------------------페이지 처리2------------------------------------ -->				
		<div class="col-sm-6 col-sm-offset-3">
			<!-- keyword 검색어 form -->
			<form action="${pageContext.request.contextPath }/file/list.do" method="post">
				<div class="form-group">
					<label for="condition">검색조건</label><br />
					<select class="form-control" name="condition" id="condition">
						<option value="titlename" <c:if test="${condition eq 'titlename' }"> selected</c:if>>제목+파일명</option>
						<option value="title" <c:if test="${condition eq 'title' }"> selected</c:if>>제목</option>
						<option value="id" <c:if test="${condition eq 'id' }"> selected</c:if>>작성자</option>
					</select>
				</div>
				<div class="form-group">						
					<input class="form-control" type="text" value="${keyword }" name="keyword" id="keyword" placeholder="검색어..." />		
				</div>
				<button class="btn btn-sm" type="submit">검색</button>
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
		
	</div><!-- .row -->
</div><!-- .container -->
<div>
	<p>${msg }</p>
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<script>
	
	$(".glyphicon-heart").click(function(){
		var $this=$(this);
		var data=$this.parent().serialize();
		var id='${id}';
		if(id==null || id==""){
			alert("로그인하세요.");
			return;
		}		
		$.ajax({
			url:"${pageContext.request.contextPath }/movie/liketo.do",
			method:"post",
			data:data,
			success:function(responseData){
				$this
				.parent()
				.find('.liketo')
				.text(responseData.liketo);			
			}
		});
		return false;
	})

</script>
</body>
</html>



