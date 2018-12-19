<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
	<title>users/Loginform.do</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/loginrsc/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/loginrsc/css/main.css">
<!--===============================================================================================-->
<style>
.btn-success {
  color: #fff;
  background-color: #28a745;
  border-color: #28a745;
}
</style>
<!-- bootstrap -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<!-- angular -->
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
<!-- Google reCaptcha 에 관련된 자바 스크립트 로딩 -->
<script src='https://www.google.com/recaptcha/api.js'></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- myApp -->
<script>
// "myApp" 이라는 이름의 모듈 만들기 
angular.module("myApp", [])
.controller("myCtrl", function($scope, $http){//"myCtrl" 이라는 이름의 컨트롤러 만들기
	//id 사용 가능여부를 관리할 모델
	$scope.canUseId=false;
	//두개의 비밀번호 일치여부를 관리할 모델
	$scope.pwdEqual=false;
	//비밀번호 입력란에 입력할때 마다 호출되는 함수 
	$scope.isPwdEqual=function(){
		//비밀번호가 일치하는지여부를 pwdEqual 에 대입한다. 
		$scope.pwdEqual = $scope.pwd == $scope.pwd2;
	};

	//id 입력란이 포커스를 잃었을때 호출되는 함수
	$scope.idCheck=function(){
		//입력한 아이디를 ajax 요청을 통해서 서버에 보내기 
		$http({
			url:"checkid.do",
			method:"get",
			params:{inputId:$scope.id}
		})
		.success(function(responseData){
			//responseData 는 {canUse:true} or {canUse:false}
			$scope.canUseId=responseData.canUse;
		});
	};
});
</script>
</head>

<body ng-controller="myCtrl">

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-50 p-b-30">
				<!-- 			<span class="login100-form-title p-b-55">
				M & P SIGNUP
				</span> -->
				<h3 style="text-align: center;">M & P SIGNUP</h3><br />
				<form action="signup.do" method="post" id="signupForm" name="f" novalidate>
				
					<div class="form-group has-feedback" 
					ng-class="{'has-success':f.name.$valid,'has-error':f.name.$invalid && f.name.$dirty}">
					<label for="name">이름</label>
					<input ng-model="name" ng-required="true" class="form-control" type="text" name="name" id="name" /><br />
					<span ng-show="f.name.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
					<span ng-show="f.name.$invalid && f.name.$dirty" class="glyphicon glyphicon-remove form-control-feedback"></span>
					<p ng-show="f.name.$invalid && f.name.$dirty" class="help-block">이름을 반드시 입력하세요.</p>
					</div>
		
					<div class="form-group has-feedback" 
					ng-class="{'has-success':f.rrn.$valid,'has-error':f.rrn.$invalid && f.rrn.$dirty}">
					<label for="rrn">생년월일</label>
					<input ng-model="rrn" ng-required="true" class="form-control" type="date" name="rrn" id="rrn" /><br />
					<span ng-show="f.rrn.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
					<span ng-show="f.rrn.$invalid && f.rrn.$dirty" class="glyphicon glyphicon-remove form-control-feedback"></span>
					<p ng-show="f.rrn.$invalid && f.rrn.$dirty" class="help-block">생년월일을 반드시 입력하세요.</p>
					</div>			
		
					<div class="form-group has-feedback"
					ng-class="{'has-success': canUseId ,'has-error': !canUseId && f.id.$dirty}">
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" name="id" id="id"
						ng-model="id" ng-blur="idCheck()" ng-required="true"/>
					<span ng-show="f.id.$valid && canUseId" class="glyphicon glyphicon-ok form-control-feedback"></span>
					<span ng-show="(f.id.$invalid || !canUseId) && f.id.$dirty" class="glyphicon glyphicon-remove form-control-feedback"></span>
					<p ng-show="f.id.$error.required && f.id.$dirty" class="help-block">반드시 입력해야 합니다.</p>
					<p ng-show="!canUseId && f.id.$dirty" class="help-block">이미 등록된 아이디 입니다.</p>
					</div>
							
					<div class="form-group has-feedback"
						ng-class="{'has-success':f.pwd.$valid,'has-error':f.pwd.$invalid && f.pwd.$dirty}">
						<label class="control-label" for="pwd">비밀번호</label>
						<input ng-keyup="isPwdEqual()" ng-required="true" ng-model="pwd" ng-pattern="/^[a-zA-Z0-9]{5,10}$/" class="form-control" type="password" name="pwd" id="pwd"/>
						<span ng-show="f.pwd.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
						<span ng-show="f.pwd.$invalid && f.pwd.$dirty" class="glyphicon glyphicon-remove form-control-feedback"></span>
						<p ng-show="f.pwd.$invalid && f.pwd.$dirty" class="help-block">특수문자 제외 5자 이상 10자 내로 입력하세요.</p>
						<p ng-show="!pwdEqual && f.pwd.$dirty" class="help-block">비밀번호를 아래와 같게 입력하세요.</p>
					</div>
					<div class="form-group">
						<label for="pwd2">비밀번호 확인</label>
						<input ng-keyup="isPwdEqual()" class="form-control" type="password" id="pwd2" name="pwd2" ng-model="pwd2"/>
					</div>
						
					<div class="form-group has-feedback" 
						ng-class="{'has-success':f.email.$valid,'has-error':f.email.$invalid && f.email.$dirty}">
						<label class="control-label" for="email">이메일</label>
						<input ng-model="email" ng-required="true" ng-pattern="/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i" class="form-control" type="text" name="email" id="email" />
						<span ng-show="f.email.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
						<span ng-show="f.email.$invalid && f.email.$dirty" class="glyphicon glyphicon-remove form-control-feedback"></span>
						<p ng-show="f.email.$invalid && f.email.$dirty" class="help-block">이메일 형식에 맞게 입력하세요.</p>
					</div>
						 
					<div class="form-group has-feedback" 
					ng-class="{'has-success':f.phon.$valid,'has-error':f.phon.$invalid && f.phon.$dirty}">
					<label for="phon">전화번호</label>
					<input ng-model="phon" ng-required="true" class="form-control" type="text" name="phon" id="phon" /><br />
					<span ng-show="f.phon.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
					<span ng-show="f.phon.$invalid && f.phon.$dirty" class="glyphicon glyphicon-remove form-control-feedback"></span>
					<p ng-show="f.phon.$invalid && f.phon.$dirty" class="help-block">전화번호를 입력해 주세요.</p>
					</div>
		
					<div class="form-group">
						<input class="form-control" style="width: 40%; display: inline;"
							placeholder="우편번호" name="addr1" id="addr1" type="text"
							readonly="readonly">
						<button type="button" class="btn btn-default"
							onclick="execPostCode();">
							<i class="fa fa-search"></i> 우편번호 찾기
						</button>
					</div>
					<div class="form-group">
						<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
							name="addr2" id="addr2" type="text" readonly="readonly" />
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="상세주소" name="addr3"
							id="addr3" type="text" />
					</div>
					
					<div class="form-group">
					<label for="gender">성별</label>
					<label class="btn btn-primary">
					<input class="" type="radio" name="gender"
						id="gender1" value="M" checked="checked" />남 
					</label>
					<label class="btn btn-primary">
					<input type="radio"
						name="gender" id="gender2" value="F" />여
					</label>
					</div>
					<div align="center">
				<button style="width: 90%; height: 50px;" ng-disabled="f.$invalid || !canUseId || !pwdEqual" class="btn btn-primary" type="submit">작성 완료
				</button>
				<a href="loginform.do">
				<button style="width: 90%; height: 50px;" class="btn btn-warning" type="button">뒤로가기</button>
				</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="${pageContext.request.contextPath}/loginrsc/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/loginrsc/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/loginrsc/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/loginrsc/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/loginrsc/js/main.js"></script>

<script>

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





















