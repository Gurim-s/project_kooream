<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/codi/codi.css" />
<jsp:include page="../include/header.jsp"/>


	<div class="codi_box">
		<div class="social_title">
			<h1 style="text-align: center;">코디 등록</h1>
		</div> <!--social_title..........end  -->
		<hr/>
		<br/><br/><br/>
		<form name="codi_register" action="/codishop/register" method="post" role="form">
			<div class="insert_codi">
				<div class="row">
					<span class="title_content">코디제목</span>
					<input type="text" name="codi_title" id="textForm" placeholder="제목입력">
				</div>
				<div class="row">
					<span class="title_content">코디소개</span>
					<input type="text" name="codi_content" id="textForm" placeholder="코디입력">
				</div>
				
				<div class="row">
					<span class="title_content">해시태그</span>
					
					<input type="text" class="tag" id="tag" placeholder="엔터로 해시태그를 등록해주세요.">
				</div>
				<div class="row tagResult">
            		<ul id="tag-list">
            		</ul>
				</div>
				
				<div class="row">
					<span class="title_content">상품태그</span>
					<input type="text" name="m_no" id="textForm"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="상품 번호 입력">
				</div>
				
				<div class="row">
					<span class="title_content">모델정보</span>
					<span class="model_info">이름: </span>
						<input type="text" name="codimodel_name" id="textForm2">
						
					<span class="model_info">키 :  </span>
						<input type="number" name="codi_cm" id="textForm2">
						
					<span class="model_info">무게 : </span>
						<input type="number" name="codi_kg" id="textForm2">
				</div>
				<div class="row">
					<div><span class="title_content">사진 등록</span></div>
				 <div class="panel-body">
		            <div class="form-group uploadDiv">
<!-- 		               <input type="file" id="uploadFile" name="uploadFile" multiple="multiple"> -->
		            </div>
		            <div class="uploadResult">
		               <ul></ul>
		            </div>
			         </div>
				</div>	<!-- row.... end -->
			</div> <!--  insert_codi.... end -->
			<hr/>
			<br/><br/><br/>
			<div class="btn btn_all">
				<button class="btn1" data-oper="list">목록으로 가기</button>
				<button class="btn1" data-oper="register">코디 등록</button>
				<button class="btn1" data-oper="reset">취소</button>
			</div> <!-- btn btn_all......... end -->
		</form>
		
	</div> <!-- codi_box ........... end -->
<script type="module" src="/resources/js/codi/register.js"></script>
<script type="text/javascript">





</script>

<style>
/* 이미지 업로드 테스트 */
#att_zone{
	width: 505px;
	min-height:150px;
	padding:10px;
	border:1px dotted #00f;
}
#att_zone:empty:before{
	content : attr(data-placeholder);
	color : #999;
	font-size:.9em;
}



/* 테스트 */
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
.tag{
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
.del-btn{
	border: 1px solid #ebebeb;


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
	min-width: 600px;
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
.model_info{
	font-size : large;
	font-weight: bold;
}
.panel-body{
	width: 70%;
}

</style>

<jsp:include page="../include/footer.jsp"/>