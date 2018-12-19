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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


</head>
<body>
<h3>회원 가입 페이지 입니다.</h3>
	<form action="signup.do" method="post" id="signupForm" novalidate>
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
		<input type="text" name="phon" id="phon" /><br/>
<div class="form-group">                   
<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
</div>
<div class="form-group">
    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
</div>
<div class="form-group">
    <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
</div>		

		<label for="gender">성별</label>
		<input type="radio" name="gender" id="gender1" value="M" checked="checked" />남
		<input type="radio" name="gender" id="gender2" value="F" />여		

	<button type="submit" >가입</button>

</form>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>

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
			console.log($("#id").val());
			console.log(responseData);
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
	var pwd=$("#pwd").val();
	var pwd2=$("#pwd2").val();
	if(!formValid){//폼이 유효 하지 않다면
		return false; //폼 전송 막기
	}
	if(pwd != pwd2){
		alert("비밀번호를 확인 하세요!");
		return false;//폼전송 막기
	}
});

//다음에서 제공하는 주소검색
function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=addr1]").val(data.zonecode);
                $("[name=addr2]").val(fullRoadAddr);
                
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr2').value = fullRoadAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr3").focus();
            }
         }).open();
     }


</script>
</body>
</html>





















