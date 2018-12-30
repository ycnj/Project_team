<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container contFont">
	<h3>수정 </h3>
	<form action="update.do" method="post">
		<input type="hidden" name="num" value="${dto.num }" />
		<label for="title">제목</label>
		<input type="text" name="title" id="title" value="${dto.title }"/>
		<br/>
		<label for="content">내용</label>
		<textarea name="content" id="content" style="width:880px;height:400px;display:none;">${dto.content }</textarea>
		<div>
				<input type="button" onclick="submitContents(this);" value="작성완료" />
				<input type="button" onclick="history.back()" value="취소" />
		</div>	
	</form>
</div>







