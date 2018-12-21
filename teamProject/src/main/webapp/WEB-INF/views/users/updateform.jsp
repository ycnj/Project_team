<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>

<html  class="no-js">
<!--<![endif]-->
<head>
<!-- link 로딩 -->
<jsp:include page="../include/MSC1.jsp" />
	<title>users/updateform.jsp</title>
<!-- post -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	.table{
		width: 95%;
		color: black;

	}
	.table th{
		width: 200px;
		text-align: center;
	}
	.table td{
		text-align: center;
		color: blue;
	}
	.section-center{
	margin : 0 auto 50px;
	width: 600px;
	}
	
	.pagination-lg > li > a,
	.pagination-lg > li > span {
	  padding: 40px 40px;
	  font-size: 18px;
	  line-height: 1.3333333;
	}
	
	#about{
		padding-top: 10px;
	}
	
	.section-title{
		margin-bottom: 55px;
	}
	.col-xs-offset-3 {
	    margin-left: 15%;
	}
	.row{
		text-align: center;
	}
</style>
</head>

    <body>

        <!--
        Fixed Navigation
        ==================================== -->
        <header id="navigation" class="navbar-fixed-top" >
        	<div class="container">
				<jsp:include page="../include/header.jsp" />
            </div>			
        </header>
        <!--
        End Fixed Navigation
        ==================================== -->
        <!--
        Home Slider
        ==================================== -->
         <section id="service-bottom" style="height: 200px;" >
            <div class="container" >
            	               
            </div>
        </section>
        <!--
        End #home Slider
        ========================== -->
        <br /><br />
       <!--
		Selection Menu
		==================================== -->
		<div class="container contFont">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3 col-xs-offset-2">
					<ul class="pagination pagination-lg">
					  <li class="active"><a href="${pageContext.request.contextPath }/users/info.do">개인정보 <span class="sr-only">(current)</span></a></li>
					  <li><a href="${pageContext.request.contextPath }/users/resDetail.do">예매내역 <span class="sr-only">(current)</span></a></li>
					</ul>
				</div>				
			</div>
		</div>
		<!--
       Selection Menu
       ========================== -->
		<br /><br />
   
 
        <!--
        #about
        ========================== -->
        <section id="about">
            <div class="container" >
                <div class="row">
	            	
                    <div class="section-title text-center wow fadeInUp">
                        <h2><strong>${id }</strong> 님 정보 수정중..</h2>    
                    </div>

				<div class="section-center text-center form-group">
					<form action="update.do" method="post" id="updateForm">

						<table class="table table-bordered">

							<tr>
								<th>이름</th>
								<td><input class="form-control" type="hidden" name="name"
									id="name" value="${dto.name }" disabled="disabled" />
									${dto.name }</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input class="form-control" type="hidden" name="rrn"
									id="rrn" value="${dto.rrn }" disabled="disabled" /> ${dto.rrn }</td>
							</tr>
							<tr>
								<th>아이디</th>
								<td><input type="hidden" name="id" id="id"
									value="${dto.id }" />
									 ${dto.id }</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input class="form-control" type="text" name="email"
									id="email" value="${dto.email }" /></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input class="form-control" type="text" name="phon"
									id="phon" value="${dto.phon }" /></td>
							</tr>
							<tr>
								<th>지번</th>
								<td><input class="form-control"
									style="width: 65%; display: inline;" placeholder="우편번호"
									name="addr1" id="addr1" type="text" readonly="readonly"
									value="${dto.addr1 }">
									<button type="button" class="btn btn-default"
										onclick="execPostCode();">
										<i class="fa fa-search"></i> 우편번호 찾기
									</button></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input class="form-control" style="top: 5px;"
									placeholder="도로명 주소" name="addr2" id="addr2" type="text"
									readonly="readonly" value="${dto.addr2 }" /></td>
							</tr>
							<tr>
								<th>상세주소</th>
								<td><input class="form-control" placeholder="상세주소"
									name="addr3" id="addr3" type="text" value="${dto.addr3 }" />
								</td>
							</tr>
							<tr>
								<th>성별</th>
								<c:if test="${dto.gender eq 'M' }">
									<td>남자</td>
								</c:if>
								<c:if test="${dto.gender eq 'F' }">
									<td>여자</td>
								</c:if>
							</tr>
							<tr>
								<th>가입일</th>
								<td>${dto.rdate }</td>
							</tr>
						</table>
						<button class="btn btn-info" type="submit">수정 확인</button>
						<a class="btn btn-info" href="pwd_updateform.do">비밀번호 수정</a> 
						<a class="btn btn-warning" href="javascript:deleteConfirm()">회원탈퇴</a>
					</form>
				</div>



				<div class="about-us text-center wow fadeInDown">

                    </div>
                </div>
            </div>
        </section>
        <!--
        End #about
        ========================== -->




        <!--
        #quotes
        ========================== -->
        <section id="quotes">
            <div class="container">
                <div class="row wow zoomIn">
                    <div class="col-lg-12">
                        <div class="call-to-action text-center">
                            <p>“ACCUMSAN ID CURABITUR ET PORTITOR MAURIS BLANDIT DOLOR LOREM SOME EST OUR DONEC STIN LORTIOS”</p>
                            <span>John Doe</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--
        End #quotes
        ========================== -->


        <!--
        #footer
        ========================== -->
        <footer id="footer" class="text-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="footer-logo wow fadeInDown">
                            <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo">
                        </div>

                        <div class="footer-social wow fadeInUp">
                            <h3>We are social</h3>
                            <ul class="text-center list-inline">
                                <li><a href="http://goo.gl/RqhEjP"><i class="fa fa-facebook fa-lg"></i></a></li>
                                <li><a href="http://goo.gl/hUfpSB"><i class="fa fa-twitter fa-lg"></i></a></li>
                                <li><a href="http://goo.gl/r4xzR4"><i class="fa fa-google-plus fa-lg"></i></a></li>
                                <li><a href="http://goo.gl/k9zAy5"><i class="fa fa-dribbble fa-lg"></i></a></li>
                            </ul>
                        </div>

                        <div class="copyright">
                           
                           Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>

                        </div>

                    </div>
                </div>
            </div>
        </footer>
        <!--
        End #footer
        ========================== -->


<!-- js파일 로딩 -->
<jsp:include page="../include/MSC2.jsp" />
<!-- javascript	 -->
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


	function deleteConfirm(){
		var isDelete=confirm("${id} 회원님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath}/users/delete.do";
		}
	}

	$("#nav>li:eq(7)").attr("class", "current");

	$(function(){

	    jQuery(window).scroll(function () {
	        if (jQuery(window).scrollTop() > 100) {
	            jQuery("#navigation").css("background-color","#00C7FC");
	            jQuery("#navigation").addClass("animated-nav");
	        } else {
	            jQuery("#navigation").css("background-color","transparent");
	            jQuery("#navigation").removeClass("animated-nav");
	        }
	    });
	});
</script>
</body>
</html>
