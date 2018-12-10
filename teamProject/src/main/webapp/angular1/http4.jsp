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
		//전달된 object 의 내용을 serialize 문자열로 반환하는 함수
		function getSerialize(obj){
			var query;
			var isFirst=true;
			for(var key in obj){
				if(isFirst){
					query=key+"="+obj[key];
					isFirst=false;
				}else{
					query+="&"+key+"="+obj[key];
				}
			}
			return query;
		}
		//폼에 입력한 내용을 object 로 관리하기 위해
		$scope.formData={};		
		
		//폼에 submit 이벤트가 일어났을때 호출되는 함수
		$scope.send=function(){			
			$http({
				url:"send2.jsp",
				method:"post",
				headers:{
					"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"
				},
				data:getSerialize($scope.formData)
			}).success(function(responseData){
				console.log(responseData.isSuccess);
			});
		};
	});
</script>
</head>
<body ng-controller="myCtrl">
	<h3>$http post 방식 요청 테스트</h3>
	<form ng-submit=send()>
		<label for="name">이름</label>
		<input ng-model="formData.name" type="text" name="name" id="name" />
		<label for="addr">주소</label>
		<input ng-model="formData.addr" type="text" name="addr" id="addr"/>
		<button type="submit">전송</button>
	</form>
	<p>formData = <strong>{{formData}}</strong></p>
	<a href="http5.jsp">다음예제</a>
</body>
</html>

