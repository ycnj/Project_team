<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<!-- Google reCaptcha 에 관련된 자바 스크립트 로딩 -->
<script src='https://www.google.com/recaptcha/api.js'></script>
<script>
function validate() {
    var re = /^[a-zA-Z0-9]{4,12}$/
    // 아이디와 패스워드가 적합한지 검사할 정규식
    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    // 이메일이 적합한지 검사할 정규식

    var id = document.getElementById("id");
    var pw = document.getElementById("pw");
    var email = document.getElementById("email");
    if(!check(re,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }
    if(join.pw.value != join.pw2.value) {
        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
        join.checkupw.value = "";
        join.checkupw.focus();
        return false;
    }

    if(email.value=="") {
        alert("이메일을 입력해 주세요");
        email.focus();
        return false;
    }

    if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
        return false;
    }

    if(join.name.value=="") {
        alert("이름을 입력해 주세요");
        join.uname.focus();
        return false;
    }
}
</script>
</head>
<body>
<h3>회원 가입 페이지 입니다.</h3>
	<form action="signup.do" onsubmit="return validate();" name="join" method="post" id="signupForm" novalidate>
		<label for="name">이름</label>
		<input type="text" name="name" id="name" /><br />
		<label for="rrn">생년월일</label>
		<input type="date" name="rrn" id="rrn" /><br/>
		<label for="id">아이디</label>
		<input type="text" name="id" id="id"/>
		<button id="checkBtn">중복확인</button>
		<span id="checkResult"></span><br/>
		<label for="pwd">비밀번호</label>
		<input type="password" name="pwd" id="pwd"/><br/>
		<label for="pwd2">비밀번호 확인</label>
		<input type="password" name="pwd2" id="pwd2"/><br/>
		<label for="email">이메일</label>
		<input type="email" name="email" id="email" /><br/>
		<label for="phon">폰</label>
		<input type="tel" name="phon" id="phon" /><br/>
		
<div class = "row">
        <div class = "col-md-4">
            <div class = "input-group">
                <span class = "input-group-addon">우편번호</span>
                <input type = "text" class = "form-control" id = "zip_code" name = "zip_code">
                <span class = "input-group-addon">
                <a href = "${pageContext.request.contextPath}/zip_codeList.do" id = "zip_codeBtn" data-toggle="modal" data-target="#zip_codeModal">검색하기</a>
                </span>                
            </div>
        </div>
    </div>
    <div class = "row">
        <div class = "col-md-4">
            <div class = "input-group">
                <span class = "input-group-addon">주소</span>
                <input type = "text" class = "form-control" id = "address1">                
            </div>
        </div>
    </div>        
    <div class = "row">
        <div class = "col-md-4">
            <div class = "input-group">
                <span class = "input-group-addon">상세주소</span>
                <input type = "text" class = "form-control" id = "address2">        
            </div>
        </div>
    </div>    



		<label for="gender">성별</label>
		<input type="radio" name="gender" id="gender1" value="M" checked="checked" />남
		<input type="radio" name="gender" id="gender2" value="F" />여		

	<button type="submit" 
	 	class='g-recaptcha'
        data-sitekey='6LfpjHYUAAAAAGOFF-ysLI67xF8MIXiBCgglrTw9'
        data-callback='onSubmit'>가입</button>
</form>
<div class="modal fade" id="zip_codeModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h3 class="modal-title" id="myModalLabel">우편번호</h3>
            </div>    
            <div class="modal-body text-center">
                 <form id = "zip_codeForm">
                         <div class = "input-group">
                            <span class = "input-group-addon">동 입력</span>
                            <input type="text" class = "form-control" name="query" id="query">
                            <span class = "input-group-btn">                                                
                                <input type="submit" class = "btn btn-warning" value="검색" id="searchBtn" onkeydown="javascript:if(event.keyCode==13)">                                            
                            </span>
                        </div>
                </form>
                <p>
                </p>
                <div>
                <div style="width:100%; height:200px; overflow:auto">
                       <table class = "table text-center">
                        <thead>
                            <tr>
                                <th style="width:150px;">우편번호</th>
                                <th style="width:600px;">주소</th>
                                </tr>
                        </thead>
                        <tbody id="zip_codeList"></tbody>
                    </table>
                </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script>
//폼의 유효성 여부 
var formValid=false;

//아이디 중복 확인 버튼을 눌렀을때 실행할 함수 등록
$("#checkBtn").click(function(){
	//입력한 아이디를 읽어와서 
	var inputId=$("#id").val();
	//ajax 요청을 통해서 서버에 보내서 사용가능 여부를 json 으로 응답받기
	$.ajax({
		url:"checkid.do",
		method:"get",
		data:{inputId:inputId},
		success:function(responseData){
			if(responseData.canUse){//사용 가능한 아이디라면
				$("#checkResult").text("사용가능");
				formValid=true;
			}else{
				$("#checkResult").text("사용불가");
				formValid=false;
			}
		}
	});
	return false;// 폼 제출 막기 
});
//폼에 submit 이벤트가 일어났을때 실행할 함수 등록
$("#signupForm").on("submit", function(){
	if(!formValid){//폼이 유효 하지 않다면
		return false; //폼 전송 막기
	}
});

//우편번호
$(function(){
    // 검색버튼 눌렸을 때 함수 실행
    $("#searchBtn").click(function(e){
        e.preventDefault();
        // ajax
        $.ajax({
            // zip_codeList controller 진입 url
            url : "zip_codeList.do",
            // zip_codeForm을 serialize 해줍니다.
            data : $("#zip_codeForm").serialize(),
            type : "POST",
            // dataType 은 json형태로 보냅니다.
            dataType : "json",
            success : function(result){
                $("#zip_codeList").empty();
                var html = "";
                if(result.errorCode != null && result.errorCode != ""){
                    html += "<tr>";
                    html += "    <td colspan='2'>";
                    html +=            result.errorMessage;
                    html += "    </td>";
                    html += "</tr>";
                }
                else{
                    // 검색결과를 list에 담는다.
                    var list = result.list;
                    
                    for(var i = 0; i < list.length; i++){
                        html += "<tr>";
                        html += "    <td>";
                        // 우편번호
                        var zipcode = list[i].zipcode;
                        // 주소
                        var address = list[i].address;
 
                        html +=         list[i].zipcode;
                        html += "    </td>";
                        html += "    <td>";
                        html +=     '<a href="#" onclick="put(\'' + list[i].address + '\',\'' + zipcode + '\')">' + address + '</a>';
                        html += "    </td>";
                        html += "</tr>";
                    }
                }
                // 완성된 html(우편번호 list)를 zip_codeList밑에 append
                $("#zip_codeList").append(html);
            }
        });
    });
});
 
// 원하는 우편번호 선택시 함수 실행
function put(address,zipcode){
    var address = address;
    var zipcode = zipcode;
    // 모달창 닫기
    $("#zip_codeModal").modal("hide");
    $("#zip_code").val(zipcode);
    $("#address1").val(address);
}


</script>
</body>
</html>





















