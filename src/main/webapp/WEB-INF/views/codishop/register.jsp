<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/codi/register.css" />
<link rel="stylesheet" href="/resources/css/common/search-box.css" />
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
					<span class="title_content">모델정보</span>
					<span class="model_info">이름: </span>
						<input type="text" name="codimodel_name" id="textForm2">
						
					<span class="model_info">키 :  </span>
						<input type="number" min="1" name="codi_cm" id="textForm2">
						
					<span class="model_info">무게 : </span>
						<input type="number"  min="1" name="codi_kg" id="textForm2">
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
				<div class="row hide-product">
					<div><span class="title_content">상품태그</span></div>
					<div style="width: 420px;">
						<div class="product-tag-selector"></div>
					</div>
				</div>
				<div class="row insert-product">
					<button id="addProductTag">상품태그 추가하기</button>
				</div>
				
				
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



<jsp:include page="../include/footer.jsp"/>