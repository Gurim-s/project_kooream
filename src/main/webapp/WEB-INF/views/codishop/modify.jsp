<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/codi/codi.css" />
<jsp:include page="../include/header.jsp"/>
<body class="cordi_update">
	<div class="codi_update">
		<div class="social_title">
			<h1 style="text-align: center;">코디 수정</h1>
		</div> <!--social_title..........end  -->
		
		<hr/>
		<br/><br/><br/>
		
		<form action="/codishop/modify" method="post" id="operForm">
			<div class="update_codi">
				<div class="row">
					<input type="hidden" name="codi_no" value="${vo.codi_no }">
					<span class="title_content">코디제목</span>
					<input id="textForm" class="form-control" name="codi_title" value="${vo.codi_title }">
				</div>
				<div class="row">
					<span class="title_content">코디소개</span>
					<input id="textForm" class="form-control" name="codi_content" value="${vo.codi_content }">
				</div>
<!-- 				<div class="row"> -->
<!-- 					<span class="title_content">해시태그</span> -->
<!-- 					<input type="textForm" name="hashTags" id="textForm"> -->
<!-- 				</div> -->
				<div class="row">
					<span class="title_content">상품태그</span>
					<input type="textForm" name="m_no" id="textForm" value="${vo.m_no }" readonly="readonly">
				</div>
			
				<div class="row">
					<div class="codi_model">
						<span class="title_content">모델 정보</span></div>
						<span id="textForm2">이름: ${vo.codimodel_name }</span>
						<span id="textForm2">키 :  ${vo.codi_cm } </span>
						<span id="textForm2">무게 : ${vo.codi_kg } </span>
				</div>
<!-- 				<div class="row"> -->
<!-- 					<span class="title_content">사진 등록</span> -->
<!-- 					<div> -->
<!-- 						<div> -->
<!-- 							<input type="file" name="uploadFile" multiple="multiple" accept="image/jpeg, image/gif, image/png"> -->
<!-- 						</div> -->
<!-- 						<div class="uploadResult"> -->
<!-- 			               <ul></ul> -->
<!-- 			            </div>					 -->
<!-- 					</div> -->
<!-- 				</div>	row.... end -->
				
				<div class="Btn-group">
					<button class="btn btn-go"   id="modify" data-oper="modify">수정</button>
					<button class="btn btn-back" id="back_go" data-oper="back">뒤로</button>
					<button class="btn btn-List" id="List_go" data-oper="list">목록</button>
				</div>
				
			</div><!-- update_codi end -->
		</form>
		
		
	</div> <!-- codi_update ... end  -->

</body>
<script type="text/javascript">



$(function() {
	var operForm = $("#operForm");
	
		
		
	$("button").on("click", function(e){
		e.preventDefault();
		var oper = $(this).data("oper");

		if(oper == 'list'){
			location.href='/codishop/list';
			return;
		}else if(oper == 'back'){
			history.back();
			return;
		}else{
			console.log("submit checked");
			
		}
		 
		operForm.submit();
		
	});
	
		
});
</script>

<style>
.Btn-group{
	text-align: center;
	
}

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
	  width: 24%;
	  border:none;
	  border-bottom : 3px solid #ebebeb;
	  outline:none;
	  color: #636e72;
	  font-size:20px;
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
.btn-go{
	display: inline-block;
    padding: 1em 2em;
    border-radius: 0;
  	color: #b2876f;
    margin-top:2rem;
    font-weight: bold;
    font-size: 0.678rem;
    letter-spacing: 2px;
    text-transform: uppercase;
    text-decoration: none;
    background-color : 	#E6E6FA;
	  background: linear-gradient(to right, rgba(#b2876f, 0) 25%, rgba(#b2876f, .8) 75%);
	  background-position: 1% 50%;
	  background-size: 400% 300%;
	  border: 1px solid #b2876f;
	  @include transition;
	 
	  &:hover{
	    color: white;
	      color: #fff;
	    	background-position: 99% 50%;
 		}
}
.btn-List{
	display: inline-block;
    padding: 1em 2em;
    border-radius: 0;
  	color: #b2876f;
    margin-top:2rem;
    font-weight: bold;
    font-size: 0.678rem;
    letter-spacing: 2px;
    text-transform: uppercase;
    text-decoration: none;
    background-color : 	#E6E6FA;
	  background: linear-gradient(to right, rgba(#b2876f, 0) 25%, rgba(#b2876f, .8) 75%);
	  background-position: 1% 50%;
	  background-size: 400% 300%;
	  border: 1px solid #b2876f;
	  @include transition;
  
	  &:hover{
	    color: white;
	      color: #fff;
     	background-position: 99% 50%;
 		}
}
.btn-back{
	display: inline-block;
    padding: 1em 2em;
    border-radius: 0;
  	color: #b2876f;
    margin-top:2rem;
    font-weight: bold;
    font-size: 0.678rem;
    letter-spacing: 2px;
    text-transform: uppercase;
    text-decoration: none;
    background-color : 	#E6E6FA;
	  background: linear-gradient(to right, rgba(#b2876f, 0) 25%, rgba(#b2876f, .8) 75%);
	  background-position: 1% 50%;
	  background-size: 400% 300%;
	  border: 1px solid #b2876f;
	  @include transition;
  
	  &:hover{
	    color: white;
	      color: #fff;
     	background-position: 99% 50%;
 		}
}

</style>

<jsp:include page="../include/footer.jsp"/>