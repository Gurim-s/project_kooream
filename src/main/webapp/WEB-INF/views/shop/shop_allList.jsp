<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../include/header.jsp"/>

<style>
	.shop_title{
		border-bottom: 1px solid #ebebeb;
	}
	
	.shop_text{
		font-size: 28px;
		font-weight: 600;
		overflow: hidden;
	}
	
	.shop_title .shop_text {
		width: 200px;
		text-align: center;
		margin: 0 auto;
	}
	.categoty{
		position: relative;
		font-size: 20px;
		letter-spacing: -.07px;
		font-weight: 600;
	}
	.all_category{
		margin-top: 4px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		font-size: 14px;
		letter-spacing: -.15px;
		color: rgba(34,34,34,.5);
	}
	
	.filter_title {
		padding: 16px 0;
		justify-content: space-between;
		align-items: center;
		cursor: pointer;
		display: flex;
	}
	
	.all_category{
		display: block;
	}
	
	.plus_btn {
		float: RIGHT;
		font-weight: bold;
		font-size: 14px;
		padding-right: 10px;
	}
	
	.all_category.clicked {
		display:none;
	}
	.test {
		display:block;
	}
	.test.clicked {
		display: none;
	}
</style>
	<div class="shop_title" style="height: 110px; width: 100%;">
		<h2 class="shop_text">SHOP</h2>
	</div>
	<div style="border : 1px solid black; width : 210px;">
		<div class="filter_status" style="padding : 23px 0 15px;">
			<span class="filter_text">필터</span>
		</div>
		<div class="filter_title">
			<div class="title_box">
				<span class="categoty">카테고리</span><br/>
				<span class="all_category">모든 카테고리</span>
			</div>
			<div class="plus_btn">+</div>
		</div>
		<div class="filter_title">
			<div class="title_box">
				<span class="categoty">브랜드</span><br/>
				<span class="all_category">모든 브랜드</span>
			</div>
			<div class="plus_btn">+</div>
		</div>
		<div class="filter_title">
				<div class="title_box">
					<span class="categoty">성별</span><br/>
					<span class="all_category">모든 성별</span>
				</div>
			<div class="plus_btn">+</div>
		</div>
		<div class="filter_title">
				<div class="title_box">
					<span class="categoty">컬렉션</span><br/>
					<span class="all_category">모든 컬렉션</span>
				</div>
			<div class="plus_btn">+</div>
		</div>
		<div class="filter_title">
				<div class="title_box">
					<span class="categoty">신발 사이즈</span><br/>
					<span class="all_category">모든 사이즈</span>
					<span class="test clicked">테스트입니다.</span>
				</div>
			<div class="plus_btn">+</div>
		</div>
	</div>
<jsp:include page="../include/footer.jsp"/>

<script type="text/javascript">
	var filters = $('.filter_title');
	filters.on('click', function(e) {
		console.log('hello');
		$(e.target).closest('.filter_title').find('.all_category').toggleClass('clicked');
		$(e.target).closest('.filter_title').find('.test').toggleClass('clicked');
	});
 //보이기
	function div_show() {
		document.getElementById("all_category").style.display = "block";
	}
 
 //숨기기
	function div_hide() {
		document.getElementById("all_category").style.display = "none";
	}
</script>