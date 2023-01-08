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
		<input type="file" id="tempImage" multiple="multiple"/>
		<form action="/style/register" method="post">
			<h2>사진 등록</h2>
			<div class="image-register clearfix">
				<div>
					<ul class="preview-list preview-select">
						<li class="">
							<label for="tempImage" class="input-image-btn">
								<span>+</span>
							</label>
						</li>
					</ul>
				</div>
				<div id="previewImageSlider" class="preview-image-slider">
					<ul class="preview-list preview-slider">
					</ul>
					<button class="next-img">&gt;</button>
					<button class="prev-img">&lt;</button>
				</div>
			</div>
			<h2>내용입력</h2>
			<div class="clearfix">
			<!-- 해시태그 기능 추가시 수정 -->
<!-- 				<div class="editable textarea" contenteditable="true"></div> -->
				<textarea name="style_content"></textarea>
			</div>
			<h2>상품태그(임시)</h2>
			<div class="form-btn">
				<button type="submit">등록</button>
				<button type="reset">취소</button>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="<c:url value='/resources/js/style/register.js'/>"></script>
<jsp:include page="../include/footer.jsp"/>