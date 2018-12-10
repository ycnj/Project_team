<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>/webapp/angular1/http3.jsp</title>
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
<script>
	angular.module("myApp", [])
	.controller("myCtrl", function($scope, $http){
		$scope.send=function(){
			
			$http({
				url:"send.jsp",
				method:"post",
				headers:{
					"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"
				},
				data:"msg="+$scope.msg+"&msg2=ㅇㅇ"
			}).success(function(responseData){
				console.log(responseData);
			});
		};
	});
</script>
</head>
<body ng-controller="myCtrl">
	<h3>$http post 방식 요청 테스트</h3>
	<input type="text" ng-model="msg" placeholder="전송할 문자열 입력..." />
	{{msg}}
	<button ng-click="send()">서버로 ajax 전송</button>
	<a href="http4.jsp">다음예제</a>
</body>
</html>

