<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>/webapp/angular1/http.jsp</title>
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
<script>
	angular.module("myApp", [])
	.controller("myCtrl", function($scope, $http){
		$scope.result="";
		//정보 가져오기 버튼을 눌렀을때 실행되는 함수
		$scope.getData=function(){
			$http({
				url:"info.jsp",
				method:"get",
				params:{num:1}
			}).success(function(data){
				console.log(data);
				$scope.result=data;
			});
		}
	});
</script>
</head>
<body ng-controller="myCtrl">
	<h3>angular $http 서비스 테스트</h3>
	<button ng-click="getData()">정보 가져오기</button>
	<p>{{result}}</p>
	<a href="http2.jsp">다음예제</a>
</body>
</html>

