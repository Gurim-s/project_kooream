<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../include/header.jsp"/>
<style>
	.wrap {
		width: 100%;
		height: 1000px;
		border: 1px solid black;
	}
	
	.product_photo {
		float:left;
		width: 50%;
		height: 500px;
		border: 1px solid black;
	}
	
	.product_introduce{
		float:left;
		width: 50%;
		height: 500px;
		border: 1px solid black;
		position: relative;
		padding-left: 2%;
		
	}
	
	li{
		list-style-type: none;
	}
	
	.product_image{
		width: 300px;
		height: 300px;
	}
	
	.product_name_eng{
		margin-bottom: 4px;
		font-size: 18px;
		letter-spacing: -.09px;
		font-weight: 400;
	}
	
	.product_name_kor{
		line-height: 17px;
		font-size: 14px;
		letter-spacing: -.21px;
		letter-spacing: -.15px;
		color: rgba(34,34,34,.5);
	}
	
/* 	.introduce_box {
		position: relative;
		padding-left: 3.334%;
	} */
	
	.detail_size{
		padding-top: 19px;
		padding-bottom: 12px;
		border-bottom: 1px solid #ebebeb;
	}
	
	.all_size{
		display: block;
		font-size: 16px;
		line-height: 24px;
		letter-spacing: -.21px;
		font-weight: 700;
		float: right;
	}
	
	.detail_price {
		margin-top: 11px;
		min-height: 44px;
	}
	
	.recent_price {
		float: left;
		padding-top: 5px;
		display: inline-block;
		font-size: 12px;
		color: rgba(34,34,34,.8);
	}
	
	.price {
		float: right;
		padding-top: 2px;
		text-align: right;
    }
	
	.product_price {
		display: inline-block;
		line-height: 26px;
		vertical-align: top;
		font-size: 20px;
		letter-spacing: -.1px;
	}
	
	.won {
		font-size: 19px;
		letter-spacing: -.27px;
	}
	
	.amount {
		font-weight: 700;
	    font-size: 0;
	}

/* 보여줄 구간의 높이와 넓이 설정 */
	#slideShow{
		width: 500px;
		height: 300px;
		position: relative;
		margin: 50px auto;
		overflow: hidden;   
		/*리스트 형식으로 이미지를 일렬로 
		정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은
		hidden으로 숨겨줘야됨*/
	}

	.slides{
		position: absolute;
		left: 0;
		top: 0;
		width: 2500px; /* 슬라이드할 사진과 마진 총 넓이 */
		transition: left 0.5s ease-out; 
		/*ease-out: 처음에는 느렸다가 점점 빨라짐*/
	}

/* 첫 번째 슬라이드 가운데에 정렬하기위해
첫번째 슬라이드만 margin-left조정 */
	.slides li:first-child{
		margin-left: 100px;
	}

/* 슬라이드들 옆으로 정렬 */
	.slides li:not(:last-child){
		float: left;
		margin-right: 100px;
	}

	.slides li{
		float: left;
	}

	.controller span{
		position: absolute;
		background-color: transparent;
		color: black;
		text-align: center;
		border-radius: 50%;
		padding: 10px 20px;
		top: 50%;
		font-size: 1.3em;
		cursor: pointer;
	}

	/* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */
	.controller span:hover{
		background-color: rgba(128, 128, 128, 0.11);
	}

	.prev{
		left: 10px;
	}
	
	.brand_name {
		box-sizing: border-box;
		display: inline-block;
		vertical-align: top;
		line-height: 19px;
		padding-top: 1px;
		margin-bottom: 9px;
		font-size: 18px;
		letter-spacing: -.27px;
		font-weight: 800;
		border-bottom: 2px solid #222;
	}

/* 이전 화살표에 마우스 커서가 올라가 있을때 
이전 화살표가 살짝 왼쪽으로 이동하는 효과*/
	.prev:hover{
		transform: translateX(-10px);
	}

	.next{
		right: 10px;
	}

	/* 다음 화살표에 마우스 커서가 올라가 있을때 
	이전 화살표가 살짝 오른쪽으로 이동하는 효과 */
	.next:hover{
		transform: translateX(10px);
	}
</style>
	<div class="wrap">
		<div class="product_photo">
		
			<div id="slideShow">
			<ul class="slides">
				<li><img class="product_image" src="../resources/img/iphone.png"></li>
				<li><img class="product_image" src="../resources/img/ps5.png"></li>
		    </ul>  
				<p class="controller">

			<!-- &lang: 왼쪽 방향 화살표
			&rang: 오른쪽 방향 화살표 -->
			<span class="prev">&lang;</span>  
			<span class="next">&rang;</span>
				</p>
			</div>
		</div>
		<div class="product_introduce">
			<div class="introduce_box">
				<div class="brand_name">Apple</div>
				<div class="product_name_eng">Apple iPhone 14 Pro 128GB Space Black (Korean Ver.)</div>
				<div class="product_name_kor">애플 아이폰 14 프로 128기가 스페이스 블랙 (국내 정식 발매 제품)</div>
			</div>
			<div class="detail_size">
				<span class="size_text">사이즈</span>
				<span class="all_size">모든 사이즈</span>
			</div>
			<div class="detail_price">
					<span class="recent_price">최근 거래가</span>
				<div class="price">
					<div class="amount">
						<span class="product_price">501,000</span>
						<span class="won">원</span>
						<div class="fluctuation">99,000원</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../include/footer.jsp"/>

<script type="text/javascript">
	const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
	const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들
	let currentIdx = 0; //현재 슬라이드 index
	const slideCount = slideImg.length; // 슬라이드 개수
	const prev = document.querySelector('.prev'); //이전 버튼
	const next = document.querySelector('.next'); //다음 버튼
	const slideWidth = 300; //한개의 슬라이드 넓이
	const slideMargin = 100; //슬라이드간의 margin 값

	//전체 슬라이드 컨테이너 넓이 설정
	slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

	function moveSlide(num) {
		slides.style.left = -num * 400 + 'px';
		currentIdx = num;
	}

	prev.addEventListener('click', function () {
		/*첫 번째 슬라이드로 표시 됐을때는 
		이전 버튼 눌러도 아무런 반응 없게 하기 위해 
		currentIdx !==0일때만 moveSlide 함수 불러옴 */
		
		if (currentIdx !== 0) moveSlide(currentIdx - 1);
	});

	next.addEventListener('click', function () {
		/* 마지막 슬라이드로 표시 됐을때는 
		다음 버튼 눌러도 아무런 반응 없게 하기 위해
		currentIdx !==slideCount - 1 일때만 
		moveSlide 함수 불러옴 */
		if (currentIdx !== slideCount - 1) {
			moveSlide(currentIdx + 1);
		}
	});
</script>