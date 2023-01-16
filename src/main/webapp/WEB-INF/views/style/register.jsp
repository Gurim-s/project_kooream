<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style/register.css'/>">
	<div id="title">
		<h1>STYLE 등록</h1>
	</div>
	<div class="form-wrapper">
		<form action="/style/register" method="post">
			<ul id="register-list" class="first-step">
				<li id="selectImg">
					<div class="btn-container">
						<a href="#" class="next-step">다음</a>
					</div>
					<ul id="selectRatio">
						<li data-ratio="1" class="selected">
							<div>1:1</div>
						</li>
						<li data-ratio="3/4">
							<div>3:4</div>
						</li>
						<li data-ratio="4/3">
							<div>4:3</div>
						</li>
					</ul>
					<div class="uploader-container"></div>
				</li>
				<li id="selectProduct">
					<div class="btn-container">
						<a href="#" class="prev-step">뒤로</a>
						<a href="#" class="next-step">다음</a>
					</div>
					<div class="clearfix"></div>
					<div class="img-slider-container"></div>
					<div class="product-tag"></div>
				</li>
				<li id="inputContent">
					<div class="btn-container">
						<a href="#" class="prev-step">뒤로</a>
						<a href="#" id="submit">완료</a>
					</div>
					<textarea name="content" placeholder="#아이템과 #스타일을 자랑해보세요..."></textarea>
<!-- 				<div class="editable textarea" contenteditable="true"></div> -->
					<div class="recommend-tags"></div>
				</li>
			</ul>
			<div class="clearfix"></div>
		</form>
	</div>
	<script type="module" src="<c:url value='/resources/js/style/register.js'/>"></script>
<jsp:include page="../include/footer.jsp"/>