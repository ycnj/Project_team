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
</style>
	 
</head>
<body>
<div class="container">	
	<h1>무비차트</h1>
	<a href="uploadChart_form.do"><button class="btn btn-info upbtn">업로드 하러 가기</button></a>
	<hr style="height: 3px;" color="black" />
	<br />
	<div class="row">
		<c:forEach items="${list }" var="tmp" varStatus="status">	
			<div class="col-xs-6 col-sm-3">
				<div class="panel panel-primary">
					<div class="panel-heading"
					 style="<c:if test="${status.count gt 4 }">color: #fff; background-color: black; border-color: black;</c:if>" >
						<h4>NO.${status.count}</h4>
						<a class="btn pull-right" href="${pageContext.request.contextPath }/movie/delete.do?num=${tmp.num }">
							<span class="glyphicon glyphicon-remove"></span>
						</a>
					</div>
					<div class="panel-body">
						<img class="img-responsive" src="${pageContext.request.contextPath }/upload/${tmp.saveFileName }"/>
					</div>
					<div class="panel-footer">
						<div class="textFit">${tmp.title }</div>
						<fmt:parseDate value="${tmp.opendate }" var="dateFmt2" pattern="yyyy-MM-dd HH:mm:ss" />
						<fmt:formatDate value="${dateFmt2 }" pattern="yyyy-MM-dd" /> &nbsp;개봉 <br />
						<form id="liketo_form">
						${tmp.liketo } <a href="#" id="liketo"><span class="glyphicon glyphicon-heart"></span></a>
							<input type="hidden" name="movieInfoNum" value="${tmp.num }" />
							<input type="hidden" name="name" value="${tmp.writer }" />
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
		
	</div><!-- .row -->
</div><!-- .container -->
<div>
	<p>${msg }</p>
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/textFit.min.js"></script>
<script>
	textFit(document.getElementsByClassName('textFit'));
	
	$("#liketo").click(function(){
		var data=$("#liketo_form").serialize();
		var name='${id}';
		$.ajax({
			url:url,
			method:"post",
			data:data,
			success:function(responseData){
				// responseData : {isSuccess:true}
				if(responseData.isSuccess){
					//폼을 안보이게 한다 
					$this.slideUp(200);
					//폼에 입력한 내용 읽어오기
					var content=$this.find("textarea").val();
					//pre 요소에 수정 반영하기 
					$this.parent().find("pre").text(content);
				}
			}
		});
	})
	$(".like-update-form").on("submit", function(){		
		var data=$(this).serialize();
		var name='${name}';
		if(name==null || name==""){
			alert("로그인하세요.");
			return;
		}
		$.ajax({
			url: "${pageContext.request.contextPath }/cafe/private/like.do",
			method:"post",
			data:data,
			success:function(responseData){
				if(responseData.isSuccess){
					$(this)
					.find("button")
					.text(${dto.likeCnt+1}+" 좋아요!");
				}else{					
					$(this)
					.find("button")
					.text(${dto.likeCnt-1}+" 좋아요!");
				}
			}
		});
		//폼 제출 막긱
		return false;
	});
</script>
</body>
</html>



