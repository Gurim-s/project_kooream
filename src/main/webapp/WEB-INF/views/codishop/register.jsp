<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/codi/codi.css" />
<jsp:include page="../include/header.jsp"/>

<body class="cordiregister">

	<div class="codi_box">
		<div class="social_title">
			<h1 style="text-align: center;">코디 등록</h1>
		</div> <!--social_title..........end  -->
		<hr/>
		<br/><br/><br/>
		<form action="/codishop/register" method="post" role="form">
			<div class="insert_codi">
				<div class="row">
					<span class="title_content">코디제목</span>
					<input type="text" class="codi_title" id="textForm">
				</div>
				<div class="row">
					<span class="title_content">코디소개</span>
					<input type="text" class="codi_content" id="textForm">
				</div>
				
				<div class="row">
					<span class="title_content">해시태그</span>
					<input type="text" name="hashTags" id="textForm">
				</div>
				
				<div class="row">
					<span class="title_content">상품태그</span>
					<input type="text" name="item_tag" id="textForm">
				</div>
				
				<div class="row">
					<span class="title_content">모델정보</span>
					<span>이름: </span>
						<input type="text" name="model_name" id="textForm2">
						
					<span>키 :  </span>
						<input type="number" name="model_cm" id="textForm2">
						
					<span>무게 : </span>
						<input type="number" name="model_kg" id="textForm2">
				</div>
				<div class="row">
					<span class="title_content">사진 등록</span>
					<input type="file" name="uploadFile" multiple="multiple" class="custom-btn btn-1">
				</div>
			</div> <!--  insert_codi.... end -->
			<hr/>
			<br/><br/><br/>
			<div class="btn btn_all">
				<button class="btn1" data-oper="list">목록으로 가기</button>
				<button class="btn1" data-oper="register">상품 등록</button>
				<button class="btn1" data-oper="reset">취소</button>
			</div> <!-- btn btn_all......... end -->
	</form>
		
	</div> <!-- codi_box ........... end -->
</body>
</html>
<script type="text/javascript">
	$(function() {
		
		
		
		// 폼 오브젝트 만들기
		var formObj = $("from[role='form']");
		
		
		// -----버튼 클릭 스크립트
		$("button").on("click", function(e) {
			e.preventDefault(); // 이벤트 막기
			
			var oper = $(this).data("oper"); // 버튼 가지고 있는 data-oper 속성
			
			if(oper == 'list'){
				history.back();
				return;
			}else if(oper == 'reset'){
				formObj[0].reset();
				return;
			}else{
				console.log("submit clicked");
				var str = '';
			
				
				
				
			formObj.append(str);
			formObj.submit();
			}
			
			
		}); // button click end 
		
		
		
		
		
	}); // function end




</script>



<style>
#textForm{
	  width: 70%;
	  border:none;
	  border-bottom : 3px solid #ebebeb;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	  text-align: center;
	  
}
#textForm2{
	  width: 18%;
	  border:none;
	  border-bottom : 3px solid #ebebeb;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	  text-align: center;
	  
}
.title_content{
    display: flex;
    align-items: center;
    width: 100px;
    height: 40px;
    font-weight: bold;
}
.row {
	width : 50%;
    display: flex;
    padding: 10px 0;
    margin: auto;
}
.btn1{
 	position:relative;
	left:5%;
	border-radius: 15px;
	transform: translateX(-50%);
	margin-bottom: 40px;
	width:10%;
	height:40px;
	background-color : #ebebeb;
	background-position: left;
	background-size: 200%;
	color:black;
	font-weight: bold;
	border:none;
	cursor:pointer;
	transition: 0.4s;
	display:inline;
}
.btn 

</style>

<jsp:include page="../include/footer.jsp"/>