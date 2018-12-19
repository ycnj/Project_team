<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/updateform.jsp</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
<h3>회원정보 수정 페이지 입니다</h3>
<form action="update.do" method="post" id="updateForm">
	<label for="name">이름</label>
	<input type="text" name="name" id="name" value="${dto.name }" disabled="disabled" /><br />
	<label for="rrn">생년월일</label>
	<input type="date" name="rrn" id="rrn" value="${dto.rrn }" disabled="disabled"/><br/>
	<input type="hidden" name="id" value="${dto.id }"/>
	<label for="id">아이디</label>
	<input type="text" id="id" value="${dto.id }" 
		disabled="disabled"/><br/>
	<label for="email">이메일 주소</label>
	<input type="text" name="email" id="email" 
		value="${dto.email }"/><br/>
	<label for="phon">폰</label>
	<input type="text" name="phon" id="phon" value="${dto.phon }" /><br/>
<div class="form-group">                   
<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" value="${dto.addr1 }" >
    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
</div>
<div class="form-group">
    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" value="${dto.addr2 }" />
</div>
<div class="form-group">
    <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text" value="${dto.addr3 }"  />
</div>		

		<label for="gender">성별</label>
			<c:if test="${dto.gender eq 'M' }">
			<input type="text" value="남자" disabled="disabled" /> <br />
			</c:if>
			<c:if test="${dto.gender eq 'F' }">
			<input type="text" value="여자" disabled="disabled" /> <br />
			</c:if>				
	<button type="submit">수정 확인</button>
</form>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
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
<a href="pwd_updateform.do">비밀번호 수정</a>
</body>
</html>








