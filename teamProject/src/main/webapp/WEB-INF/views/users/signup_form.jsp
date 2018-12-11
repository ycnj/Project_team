<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>
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
<div class="container">
	<h3>회원 가입 폼 입니다.</h3>
	<!-- novalidate 는 웹브라우저의 기본 validate 를 막는다 -->
	<form action="signup.do" method="post" name="f" id="signupForm" novalidate>
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
			<input ng-model="email" ng-required="true" ng-pattern="/@/" class="form-control" type="text" name="email" id="email" />
			<span ng-show="f.email.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
			<span ng-show="f.email.$invalid && f.email.$dirty" class="glyphicon glyphicon-remove form-control-feedback"></span>
			<p ng-show="f.email.$invalid && f.email.$dirty" class="help-block">이메일 형식에 맞게 입력하세요.</p>
		</div>
		<button ng-disabled="f.$invalid || !canUseId || !pwdEqual" class="btn btn-primary" type="submit">가입</button>
	</form>
</div>
</body>
</html>


















