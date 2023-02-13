<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		float: right;
		font-weight: bold;
		font-size: 14px;
		padding-right: 10px;
	}
	
	.minus_btn{
		float: right;
		font-weight: bold;
		font-size: 14px;
		padding-right: 10px;
		display:none;
	}
	
	.all_category.clicked {
		display:none;
	}
	.plus_btn.clicked {
		display:none;
	}

	.minus_btn.clicked {
		display: block;
	}
	
	.category_menu{
		display: none;
	}
	
	.category_menu.clicked {
		display: block;
	}
	
	.main-content-box{
		margin-top: 10px;
	}
	
	.product_box{
		float: left;
		width: calc(25% - 10px);
		height : 450px;
		cursor:pointer;
		
	}
	
	.filter_box{
		float: left;
		display: inline-block;
		margin-right: 10px;
		padding-right: 10px;
		height: 100%;
	}
	
	.product_all{
		width: calc(100% - 220px);
		display: inline-block;
		grid-column-gap: 20px;
	}
	
	.brand_name{
		font-size: 13px;
		font-weight: bold;
	}
	
	.product_name_eng{
		line-height: 16px;
		font-size: 13px;
	}
	
	.product_name_kor, .buy_price{
		line-height: 13px;
		margin-top: 2px;
		font-size: 11px;
		color: rgba(34,34,34,.5);
	}
	
	.view_price{
		line-height: 17px;
		font-size: 14px;
		font-weight: 700;
	}
	
	.badge_product {
		position: relative;
		display: inline-block;
		vertical-align: top;
		line-height: 11px;
		padding: 4.5px 5.5px 4.5px 17px;
		color: #31b46e;
		background-color: #f2f9f6;
		border-radius: 2px;
		font-size: 11px;
		letter-spacing: -.33px;
		height: 20px;
		margin-bottom: 10px;
	}
	
	.product_image {
		border-radius: 7px;
		width: 100%;
	}
	
	.product_box:not(:nth-child(4n)) {
		margin-right: 10px;
	}
	
</style>
	<sec:authentication property="principal.member" var="pri"/>
	<div class="shop_title" style="height: 110px; width: 100%;">
		<h2 class="shop_text">SHOP</h2>
			<c:if test="${pri.authList.get(0).auth eq 'ROLE_ADMIN' }">
				<button id="p_i_btn">상품 등록</button>
			</c:if>
	</div>
	<div class="main-content-box clearfix">
		<div class="filter_box" style="border : 1px solid black; width : 210px;">
			<div class="filter_status" style="padding : 23px 0 15px;">
				<span class="filter_text">필터</span>
			</div>
			<div class="filter_title" id="filter_title">
				<div class="title_box">
					<span class="categoty">카테고리</span><br/>
					<span class="all_category">모든 카테고리</span>
				</div>
				<div class="plus_btn">+</div>
				<div class="minus_btn">-</div>
			</div>
			<div class="category_menu" id="category_menu">
				<label><input type="checkbox" class = "p_category" name = "p_category" onclick='checkOnlyOne(this)' value="shoes">신발</label><br/>
				<label><input type="checkbox" class = "p_category" name = "p_category" onclick='checkOnlyOne(this)' value="shirt">상의</label><br/>
				<label><input type="checkbox" class = "p_category" name = "p_category" onclick='checkOnlyOne(this)' value="pants">하의</label><br/>
				<label><input type="checkbox" class = "p_category" name = "p_category" onclick='checkOnlyOne(this)' value="other">패션잡화</label>
			</div>
			<div class="filter_title">
				<div class="title_box">
					<span class="categoty">브랜드</span><br/>
					<span class="all_category">모든 브랜드</span>
				</div>
				<div class="plus_btn">+</div>
				<div class="minus_btn">-</div>
			</div>
			<div class="category_menu" id="category_menu">
				<label><input type="checkbox" value="Nike">Nike</label><br/>
				<label><input type="checkbox" value="Vans">Vans</label><br/>
				<label><input type="checkbox" value="Jordan">Jordan</label><br/>
				<label><input type="checkbox" value="Apple">Apple</label>
			</div>
			<div class="filter_title">
					<div class="title_box">
						<span class="categoty">신발 사이즈</span><br/>
						<span class="all_category">모든 사이즈</span>
					</div>
				<div class="plus_btn">+</div>
				<div class="minus_btn">-</div>
			</div>
			<div class="category_menu" id="category_menu">
				<label><input type="checkbox" value="Nike">250</label><br/>
				<label><input type="checkbox" value="Vans">260</label><br/>
				<label><input type="checkbox" value="Jordan">270</label><br/>
				<label><input type="checkbox" value="Apple">280</label>
			</div>
		</div>
		<div class="product_all">
			<c:forEach items="${bidList}" var="bid">
				<div class="product_box" onclick="getPage(${bid.p_no})">
					<c:if test="${not empty bid.imageUrls }">
						<img class="product_image" src="${bid.imageUrls.get(0) }">
					</c:if>
					<div class="brand_name" >${bid.p_brand}</div>
					<div class="product_name_eng">${bid.p_name_en}</div>
					<div class="product_name_kor">${bid.p_name_ko}</div>		
					<div class="badge_product">빠른 배송</div>
					<div class="view_price"><fmt:formatNumber value="${bid.min_bid_buy}" pattern="#,###,###원"/></div>
					<div class="buy_price">즉시 구매가</div>
					<div class="buy_price">${bid.p_no}</div>
				</div>
			</c:forEach>
<!-- 		<div class="product_box">
				<img class="product_image" src="../resources/img/ps5.png">
				<div class="brand_name">Sony</div>
				<div class="product_name_eng">Sony Playstation 5 Blu-ray Edition (SIEK 220V)</div>
				<div class="product_name_kor">소니 플레이스테이션 5 블루레이 에디션 (국내 정식 발매 제품)</div>
				<div class="badge_product">빠른 배송</div>
				<div class="view_price">637,000원</div>
				<div class="buy_price">즉시 구매가</div>
			</div>
			<div class="product_box">
				<img class="product_image" src="../resources/img/iphone.png">
				<div class="brand_name">Apple</div>
				<div class="product_name_eng">Apple iPhone 14 Pro 128GB Space Black (Korean Ver.)</div>
				<div class="product_name_kor">애플 아이폰 14 프로 128기가 스페이스 블랙 (국내 정식 발매 제품)</div>
				<div class="badge_product">빠른 배송</div>
				<div class="view_price">1,553,000원</div>
				<div class="buy_price">즉시 구매가</div>
			</div> -->
		</div>
	</div>
	
<jsp:include page="../include/footer.jsp"/>

<script type="text/javascript">
	$(".p_category").click(function (e) {
		var cateproduct = $(e.target).val();
		var productVO = !(e.target.checked) ? {p_category: 'all'}
											: {p_category:cateproduct};
		
		$.ajax({
			url:'/shop/select_cate',
			type: 'post',
			data: JSON.stringify(productVO),
			dataType:'json',
			contentType:"application/json",
		}).done(function(cate) {
			$('.product_all').empty();
			console.log(cate);
			var str='<div class="container">';
			for(var i=0; i<cate.length; i++) {
				/* str += '<a href="/shop/shop_introduce?p_no=' + cate[i].p_no + '">'; */	// 페이지 이동하면서 p_no, b_no값 가지고 이동 
					// brandshop(컨트롤러) 에서 /get을 탐  
				
				// 이미지 하나만 보여주기
				if(cate[i].attachList.length > 0) {
					var uploadPath = cate[i].attachList[0].uploadPath;
					var uuid = cate[i].attachList[0].uuid;
					var fileName = cate[i].attachList[0].fileName;
					var fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
					str += '<div class="product_box" onclick="getPage(' + cate[i].p_no + ')">'
					str += '<img class="product_image" src="/displayImage?fileName='+ fileCallPath + '" />';	// 이미지
				}

				str += '<div class="brand_name">' +cate[i].p_brand+ '</div>';
				str += '<div class="product_name_eng">' +cate[i].p_name_en+ '</div>';
				str += '<div class="product_name_eng">' +cate[i].p_name_ko+ '</div>';
				str += '<div class="badge_product">빠른 배송</div>';
				str += '<div class="view_price">'+cate[i].min_bid_buy+'원</div>';
				str += '<div class="buy_price">즉시 구매가</div>';
				str += '<div class="buy_price">'+cate[i].p_no+'</div>';
				str += '</div>'
			}
				str += '</div>'
				$('.product_all').html(str);
		});
	});


	var filters = $('.filter_title');
	
	filters.on('click', function(e) {
		$(e.target).closest('.filter_title').find('.all_category').toggleClass('clicked');
		$(e.target).closest('.filter_title').find('.plus_btn').toggleClass('clicked');
		$(e.target).closest('.filter_title').find('.minus_btn').toggleClass('clicked');
	});

// 	var elementToToggle = $('.category_menu');
	var button = $('.filter_title');

	$(button).on('click', (e) => {
		var category_menu = $(e.target).closest('.filter_title').next('.category_menu'); // 가장 가까운 .filter_title 부모 요소 선택
		if ($(category_menu).css('display') === 'block') {
			$(category_menu).css('display', 'none');
		} else {
			$(category_menu).css('display', 'block');
		}
	});
	
/* 	const checkboxes = document.querySelectorAll('input[type="checkbox"]');

	checkboxes.forEach(checkbox => {
		checkbox.addEventListener('change', event => {
			const checkedCheckbox = event.target;
				checkboxes.forEach(checkbox => {
					if (checkbox !== checkedCheckbox) {
						checkbox.checked = false;
					}
				});
		});
	}); */
	
	
	function checkOnlyOne(element) {
		  const isChecked = element.checked;
		  const checkboxes = document.getElementsByName("p_category");
		  
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  });
		  
		  element.checked = isChecked? true: false;
	}
	
	$("#p_i_btn").on("click",function(){
		location.href="/shop/shop_register";
	});
	
// 	$(".product_box").on("click",function(){
// 		location.href="/shop/shop_bidpage/";
		
/* 		actionForm.attr("action", "/shop/shop_bidpage");

		var str ='';
		str += '<input type="hidden" name="p_no" value="'${bid.p_no}'">';
		
		actionForm.html(str);
		actionForm.submit(); */
// 	});
	
	function getPage(pno) {
		location.href="/shop/shop_introduce/" + pno;
	}

/* 	$(".product_box").click(function(e) {
		// <a> 클릭 시 페이지 이동이 이루어지지 않게 하기 위해
		e.preventDefault();	// 기본 href 경로 이동 방지	
		actionForm.attr("action", "/shop/shop_allList");
		
		var str ='';
		str += '<input type="hidden" name="p_no" value="'+$(this).attr("href")+'">';
		
		actionForm.html(str);
		actionForm.submit();
	}); */
	
/* 	$(".product_sort").click(function () {
	 	var val1 = $("input[name='product_sort']:checked").val()
	 	console.log(val1);
	}); */
</script>