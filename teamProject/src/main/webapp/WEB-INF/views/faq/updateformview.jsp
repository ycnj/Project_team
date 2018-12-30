<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<!-- link 로딩 -->
<jsp:include page="../include/MSC1.jsp" />
	<title>Home</title>
	<style>		
		.top-img{
             position: relative;
             height: 400px;
             padding: 0;
             background: url(${pageContext.request.contextPath }/resources/images/movie/배경화면/faq1.jpeg) no-repeat;
             background-size: cover;
         }
         .service-features {
		    background-color: #6e94b599;
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
        #service-bottom
        ========================== -->

	<section id="service-bottom">
		<div class="top-img">
			</div>
		<div class="container">
			
			<div class="service-features wow fadeInRight">
				<h3>OUR DESIGNS COMES WITH...</h3>
				<ul>
					<li>Responsive Design</li>
					<li>Modern And Clean Design</li>
					<li>Clean Code</li>
					<li>Browser Friendly</li>
				</ul>
			</div>
		</div>
	</section>
	<!--
        End #service-bottom
        ========================== -->


       <section id="contact">
            <div class="container contFont">
                <div class="row">
					<div class="container contFont container2">                  
				         <div class="row">           
							<div class="col-sm-8 col-sm-offset-3 col-xs-offset-2" style="padding-left:170px;">
					            <ul Class="pagination pagination-lg">
					             	<li><a href="${pageContext.request.contextPath}/user/userboardview.do">질문게시판<span class="sr-only">(current)</span></a></li>					             	                          
					          		<c:if test="${!empty sessionScope.id }">
					          		<li><a href="${pageContext.request.contextPath}/ask/qnalistview.do">1:1문의목록<span class="sr-only">(current)</span></a></li>
					          		<li class="active"><a href="${pageContext.request.contextPath}/faq/faqlistview.do">FAQ 목록</a></li>								          		
					          		</c:if>     					          		
					    		</ul>
				    		</div>
				    	</div>    
				    </div>	
                    
                    <div class="section-title text-center wow fadeInDown">
                    	<c:choose>
                    	<c:when test="${id eq 'master' }">
                        <h2>${id}마스터 관리자 페이지 입니다.</h2>
                        </c:when>
                        <c:otherwise>
                        <h2>자주 물어보는 질문 목록 입니다.</h2>
                        </c:otherwise>  
                        </c:choose>               
                    </div>				    
						                                	             
                    </div> <!-- .col-md-2 -->
                    <div class="col-md-10 col-sm-10" style="padding-left:100px;">
					<div class="container">
						<div class="center-block">
							 <jsp:include page="updateform.jsp" />
						</div>
					</div>
				</div>                    

                </div>

        </section>

        <!-- #quotes -->
        <section id="quotes">
			<jsp:include page="../include/quotes.jsp" />
        </section>
        
        <!-- End #quotes -->


        <!-- #footer -->
        <footer id="footer" class="text-center">
   			<jsp:include page="../include/footer.jsp" />
        </footer>
        <!-- End #footer -->



<!-- js파일 로딩 -->
<jsp:include page="../include/MSC2.jsp" />
<!-- javascript	 -->
<script>
	$("#nav>li:eq(6)").attr("class", "current");
</script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script>

		var oEditors = [];

		//추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

		nhn.husky.EZCreator
				.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "content",
					sSkinURI : "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",
					htParams : {
						bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
						fOnBeforeUnload : function() {
							//alert("완료!");
						}
					}, //boolean
					fOnAppLoad : function() {
						//예제 코드
						//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
					},
					fCreator : "createSEditor2"
				});

		function submitContents(elClickedObj) {
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
			var title=$("#title").val();
			var content=$("#content").val();
			if (title== "" || title == null) {
				alert("제목을 입력하세요");
				return false;
			}
			if (content == '<p>&nbsp;</p>') {
				alert("내용을 입력하세요");
				return false;
			}
			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}
	</script>


</body>
</html>





