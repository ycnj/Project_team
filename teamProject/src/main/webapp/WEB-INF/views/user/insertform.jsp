<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

	<div class="container" style="padding-left:40px;">

		<form action="insert.do" method="post" id="insertId">
		<label for="title">제목</label>
		<input style="height:30px; width:400px"type="text" name="title" id="title" placeholder="제목을 입력하세요."/>
		<br/>
		<label for="content">내용</label>
		<textarea name="content" id="content" style="width:880px;height:400px;display:none;margin:center;"></textarea>
			<div>
				<input type="button" onclick="submitContents(this);" value="작성완료" />
				<input type="button" onclick="history.back()" value="취소" />	
			</div>
		</form>
	</div>













