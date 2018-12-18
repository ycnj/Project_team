<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

		<p>
			<strong>${id }</strong>님 로그인중...
		</p>
		<h3>질문하기</h3>
		<form class="form-group" style="align-items: center;" action="insert.do" method="post" id="insertId">
		<label for="title">제목</label>
		<input style="height:30px; width:400px"type="text" name="title" id="title"/>
		<br/>
		<label for="content">내용</label>
		<textarea class="form-control" name="content" id="content" style="width:400px;height:400px;"></textarea>
			<div>
				<input type="button" onclick="submitContents(this);" value="작성완료" />
				<input type="button" onclick="history.back()" value="취소" />
				<input type="button" onclick="location.href='../home.do'" value="돌아가기"/>

			</div>
		</form>













