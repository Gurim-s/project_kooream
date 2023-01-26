<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../include/header.jsp"/>
<style>
	.wrap {
		width: 100%;
		border: 1px solid black;
	}
	
	.product_photo {
		float:left;
		width: 50%;
		height: 4000px;
		border: 1px solid black;
	}
	
	.product_introduce{
		float:left;
		width: 50%;
		height: 4000px;
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
		font-weight: bold;
	}
	
	.fluctuation{
		color: #f15746;
		font-size: 13px;
		font-weight: normal;
	}
	
	.btn_box{
		margin-top: 17px;
		display: flex;
		height: 60px;
		border: 1px solid black;
	}
	
	.btn_buy {
		height: 100%;
		width: 50%;
		border: 1px solid black;
		background-color: #ef6253;
		border-radius: 7px;
	}

	.buy_box {
		float: left;
		width: 55px;
		height: 100%;
		border-right: 1px solid #da5b4e;
	}
	
	.sell_box{
		float: left;
		width: 55px;
		height: 100%;
		border-right: 1px solid #3a9b68;
	}
	
	.buy_text {
		display: inline-block;
		font-size: 18px;
		color:white;
		margin-top: 14px;
		margin-left: 7px;
	}
	
	.buy_price_box{
		float: left;
		margin-left: 7px;
		margin-top: 10px;
	}
	
	.buy_price{
		color:white;
		font-size: 15px;
		font-weight: 700;
	}
	
	.buy_now{
		color:white;
		font-size: 11px;
		font-weight: 600;
	}
	
	.btn_sell{
		height: 100%;
		width: 50%;
		border: 1px solid black;
		background-color: #41b979;
		border-radius: 7px;
		margin-left: 11px;
	}
	
	.interest_p{
		display: flex;
		-webkit-box-align: center;
		align-items: center;
		-webkit-box-pack: center;
		justify-content: center;
		border: 1px solid #ebebeb;
		border-radius: 10px;
		color: #333;
		margin-top: 12px;
		height:58px;
	}
	
	.inter_p {
		font-size: 15px;
		font-weight: 400;
		letter-spacing: normal;
	}
	
	.inter_count {
		font-size: 15px;
		font-weight: 600;
		letter-spacing: normal;
	}
	
	.intro_title{
		line-height: 22px;
		padding: 40px 0 20px;
		font-size: 18px;
		letter-spacing: -.15px;
	}
	
	.detail_product_wrap{
		display: flex;
		min-height: 20px;
		padding-top: 20px;
		padding-bottom: 20px;
		border-top: 1px solid #ebebeb;
		border-bottom: 1px solid #ebebeb;
	}
	
	.product_title{
		line-height: 14px;
		font-size: 12px;
		letter-spacing: -.33px;
		color: rgba(34,34,34,.5);
	}
	
	.model_num{
		margin-top: 4px;
		word-break: break-word;
		line-height: 17px;
		font-size: 14px;
		font-weight: 600;
	}
	
	.model_box{
		padding: 0 12px;
		width: 25%;
	}
	
	.model_intro{
		margin-top: 4px;
		word-break: break-word;
		line-height: 17px;
		font-size: 14px;
	}
	
	.bsinfo{
		line-height: 17px;
		padding-bottom: 0;
		font-size: 14px;
		letter-spacing: -.21px;
		font-weight: 400;
		color: rgba(34,34,34,.8);
		padding-top : 40px;
	}
	
	.delivery_way_wrap{
		padding-top : 12px;
		padding: 18px 0;
	}
	
	.delivery {
		margin: auto;
		font-weight: 600;
		font-size: 14px;
		letter-spacing: -.21px;
	}
	
	.delivery_won{
	font-size: 14px;
	letter-spacing: -.21px;
	}
	
	
	.way_info{
		display: flex;
		-webkit-box-align: center;
		align-items: center;
		width: 100%;

	}
	
	.sub_text{
		line-height: 16px;
		margin-top: 3px;
		font-size: 14px;
		color: rgba(34,34,34,.5);
	}
	
	.delivery_est{
		color: #297dcb;
	}
	
	.way_desc{
		margin-left: 20px;
	}
	
	.delivery_way_wrap{
		border-bottom: 1px solid #ebebeb;
	}
	
	.graph{
		height: 593px;
		width: 100%;
		border: 1px solid black;
		text-align: center;
	}
	
	.confirm_wrap{
		padding-top: 39px;
	}
	
	.confirm_title{
		line-height: 22px;
		padding-bottom: 12px;
		font-size: 18px;
		letter-spacing: -.27px;
		border-bottom: 1px solid #ebebeb;
	}
	
	.confirm_content{
		font-size: 15px;
		letter-spacing: -.15px;
	}
	
	.dropdown_head, .confirm_info, .refund_head{
		padding: 18px 0 17px;
		border-bottom: 1px solid #ebebeb;
		cursor: pointer;
		width: 100%;
	}
	
	.dropdown_content, .confirm_txt, .refund_txt{
		padding: 20px 0;
		border-bottom: 1px solid #ebebeb;
		border-top: 1px solid #222;
		display: none;
	}
	
	.title_txt, .content_item{
		font-size: 13px;
		letter-spacing: -.07px;
		color: rgba(34,34,34,.8);
		margin-top: 20px;
	}
	
	.main_txt{
		margin-top: 10px;
	}
	
	.buy_txt{
		margin-top: 20px;
	}
	
	.title_head{
		font-weight: bold;
		font-size: 13px;
	}
	
	.main_txt_bold{
		font-weight: bold;
	}
	
	.confirm_txt_body{
		margin-top: 38px;
	}
	
	.point_guidebox{
	padding-top: 40px;
	}
	
	.binfo_p{
		float: left;
		margin-right: 14px;
	}
	
	.bottom_info2{
	margin-top: 20px;
	}
	
	.text_area{
		display: block;
		line-height: 16px;
		font-size: 13px;
		letter-spacing: -.07px;
		font-weight: 600;
		letter-spacing: normal;	
	}
	
	.text_desc{
		margin-top: 1px;
		line-height: 16px;
		font-size: 13px;
		letter-spacing: normal;
		color: rgba(34,34,34,.5);
	}
	
	.notice_product{
		margin-top: 20px;
		padding-top: 40px;
		border-top: 1px solid #f0f0f0;
		font-size: 12px;
		color: #909090
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
	<button id="modify_btn" onclick="modiPage(${vo.p_no})">상품 수정</button>
	<button id="remove_btn" onclick="remove(${vo.p_no})">삭제</button>
	<div class="wrap clearfix">
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
				<div class="brand_name">${vo.p_brand }</div>
				<div class="product_name_eng">${vo.p_name_en }</div>
				<div class="product_name_kor">${vo.p_name_ko }</div>
			</div>
			<div class="detail_size">
				<span class="size_text">사이즈</span>
				<span class="all_size">모든 사이즈</span>
			</div>
			<div class="detail_price">
					<span class="recent_price">최근 거래가</span>
				<div class="price">
					<div class="amount">
						<span class="product_price">${vo.p_release_price }</span> 
						<span class="won">원</span>
							<p class="fluctuation">99,000원 (+24.6%)</p>
					</div>
				</div>
			</div>
			<div class="btn_inter_box">
				<div class="btn_box">
					<div class="btn_buy">
						<div class="buy_box">
							<strong class="buy_text">구매</strong>
						</div>
						<div class="buy_price_box">
							<div class="buy_price">402,000원</div>
							<div class="buy_now">즉시 구매가</div>
						</div>
					</div>
					<div class="btn_sell">
						<div class="sell_box">
							<strong class="buy_text">판매</strong>
						</div>
						<div class="buy_price_box">
							<div class="buy_price">412,000원</div>
							<div class="buy_now">즉시 판매가</div>
						</div>
					</div>
				</div>
				<div class="interest_p">
					<span class="inter_p">관심 상품</span>
					<span class="inter_count">1.3만</span>
				</div>
			</div>
			<h3 class="intro_title">상품 정보</h3>
			<div class="detail_product_wrap">
				<div class="model_box">
					<div class="product_title">모델번호</div>
					<div class="model_num">${vo.p_model_no }</div>
				</div>
				<div class="model_box">
					<div class="product_title">출시일</div>
					<div class="model_intro">${vo.p_release_date }</div>
				</div>
				<div class="model_box">
					<div class="product_title">컬러</div>
					<div class="model_intro">TAXI/BLACK-SAIL</div>
				</div>
				<div class="model_box">
					<div class="product_title">발매가</div>
					<div class="model_intro">${vo.p_release_price }원</div>
				</div>
			</div>
			<h3 class="bsinfo">배송정보</h3>
			<div class="delivery_way_wrap">
				<div class="way_info">
					<img src="../resources/img/bsicon.png" style="width:40px; height: 40px;">
					<div class="way_desc">
						<span class="delivery">빠른배송</span>
						<span class="delivery_won"> 5,000원</span>
						<div class="sub_text">지금 결제시 <span class="delivery_est">내일 1/11(수) 도착 예정</span></div>
					</div>
				</div>
			</div>
			<div class="delivery_way_wrap">
				<div class="way_info">
					<img src="../resources/img/boxicon.png" style="width:40px; height: 40px;">
					<div class="way_desc">
						<span class="delivery">일반배송</span>
						<span class="delivery_won"> 3,000원</span>
						<div class="sub_text">검수 후 배송 ・ 5-7일 내 도착 예정</div>
					</div>
				</div>
			</div>
			<div class="delivery_way_wrap">
				<div class="way_info">
					<img src="../resources/img/warehouse.png" style="width:40px; height: 40px;">
					<div class="way_desc">
						<span class="delivery">창고보관</span>
						<span class="delivery_won"> 첫 30일 무료</span>
						<div class="sub_text">배송 없이 창고에 보관 ・ 빠르게 판매 가능</div>
					</div>
				</div>
			</div>
			<div class="graph">
				그래프 공간
				넣을지 말지는 나중에 생각
			</div>
			<div class="confirm_wrap">
				<h3 class="confirm_title">구매 전 꼭 확인해주세요!</h3>
				<div class="confirm_content">
					<div class="dropdown_head">
						<p class="title">배송 기간 안내</p>
					</div>
					<div class="dropdown_content">
						<strong class="title_head">KREAM은 최대한 빠르게 모든 상품을 배송하기 위해 노력하고 있습니다. 
						배송 시간은 판매자가 검수를 위하여 상품을 검수센터로 보내는 속도에 따라 차이가 있습니다.</strong>
						<div class="title_txt">
							<p>[빠른배송 구매]</p>
							<p class="main_txt">- 판매자가 보관 신청한 상품 중 검수에 합격한 상품을 KREAM의 전용 창고에 보관합니다. 보관 상품에 한하여 바로 구매와 95점 구매가 가능합니다.</p>
							<p class="main_txt">- 오늘(오후 11:59까지) 결제하면 내일 바로 출고되어 빠른 배송이 가능합니다. (연휴 및 공휴일, 천재지변, 택배사 사유 등 예외적으로 출고일이 변경될 수 있습니다. 빠른배송 안내</p>
							<p class="buy_txt">[일반 구매]</p>
							<p class="main_txt">- 거래가 체결된 시점부터 48시간(일요일•공휴일 제외) 내에 판매자가 상품을 발송해야 하며, 통상적으로 발송 후 1-2일 내에 KREAM 검수센터에 도착합니다.</p>
						</div>
						<div class="content_item">
							<p class="main_txt">- 검수센터에 도착한 상품은 입고 완료 후 3영업일 이내에 검수를 진행합니다. 검수 합격시 배송을 준비합니다.</p>
							<p>* 상품 종류 및 상태에 따라 검수 소요 시간은 상이할 수 있으며, 구매의사 확인에 해당할 경우 구매자와 상담 진행으로 인해 지연이 발생할 수 있습니다.</p>
						</div>
					</div>
					<div class="confirm_head">
						<p class="confirm_info">검수 안내</p>
					</div>
					<div class="confirm_txt">
						<strong class="title_head">판매자의 상품이 검수센터에 도착하면 전담 검수팀이 철저한 분석과 검사로 정가품 확인을 진행합니다.</strong>
						<div class="title_txt">
							<p class="main_txt">- 검수센터에서는 정가품 여부를 확인하기 위하여, 지속적으로 데이터를 쌓고 분석하여 기록하고 있습니다.</p>
							<p class="main_txt">- 업계 전문가로 구성된 검수팀은 박스와 상품의 라벨에서 바느질, 접착, 소재 등 모든 것을 검수합니다.</p>
						<div class="confirm_txt_body">
							<p class="main_txt_bold">검수 결과는 불합격•검수 보류•합격의 세가지 상태로 결과가 변경됩니다. (검수기준 보기)</p>
						</div>
						</div>
						<div class="content_item">
							<p class="content_txt">* 검수 합격: KREAM 검수택(Tag)이 부착되어 배송을 준비함</p>
							<p class="content_txt">* 검수 보류: 앱에서 사진으로 상품의 상태 확인 및 구매 여부를 선택. (24시간 이후 자동 검수 합격)</p>
							<p class="content_txt">* 검수 불합격: 즉시 거래가 취소되고 구매하신 금액을 환불 처리함.(환불 수단은 결제 수단과 동일)</p>
						</div>
					</div>
					<div class="refund_head">
						<p class="refund_info">구매 환불/취소/교환 안내</p>
					</div>
					<div class="refund_txt">
						<strong class="title_head">KREAM은 익명 거래를 기반으로 판매자가 판매하는 상품을 구매자가 실시간으로 구매하여 거래를 체결합니다.</strong>
						<div class="title_txt">
							<p class="main_txt">- 단순 변심이나 실수에 의한 취소/교환/반품이 불가능합니다. 상품을 원하지 않으시는 경우 언제든지 KREAM에서 재판매를 하실 수 있습니다.</p>
							<p class="main_txt">- 상품 수령 후, 이상이 있는 경우 KREAM 고객센터로 문의해주시기 바랍니다.</p>
						</div>
					</div>
				</div>
			<div class="point_guidebox">
				<div class="bottom_info">
					<img class="binfo_p" src="../resources/img/guide_icon1.png" style="width:40px; height: 35px;">
					<div class="text_area">100% 정품 보증</div>
					<p class="text_desc">KREAM에서 검수한 상품이 정품이 아닐 경우, 구매가의 3배를 보상합니다.</p>
				</div>
				<div class="bottom_info2">
					<img class="binfo_p" src="../resources/img/guide_icon2.png" style="width:40px; height: 35px;">
					<div class="text_area">엄격한 다중 검수</div>
					<p class="text_desc">모든 상품은 검수센터에 도착한 후, 상품별 전문가 그룹의 체계적인 시스템을 거쳐 검수를 진행합니다.</p>
				</div>
				<div class="bottom_info2">
					<img class="binfo_p" src="../resources/img/guide_icon3.png" style="width:40px; height: 35px;">
					<div class="text_area">정품 인증 패키지</div>
					<p class="text_desc">검수에 합격한 경우에 한하여 KREAM의 정품 인증 패키지가 포함된 상품이 배송됩니다.</p>
				</div>
			</div>
		</div>
			<div class="notice_product">
				크림(주)는 통신판매 중개자로서 통신판매의 당사자가 아닙니다. 본 상품은 개별판매자가 등록한 상품으로 상품, 상품정보, 거래에 관한 의무와 책임은 각 판매자에게 있습니다. 
				단, 거래과정에서 검수하고 보증하는 내용에 대한 책임은 크림(주)에 있습니다.
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
	
	// 배송기간 안내 접기 펼치기
	$(".dropdown_head").click(function(){
		if($(".dropdown_content").css("display") == "none")
	    {
	        $(".dropdown_content").show();
	        $(".dropdown_head").css({"font-weight": "bold"})
	        
	    } else {
	        $(".dropdown_content").hide();
	        $(".dropdown_head").css({"font-weight": "normal"})
	    }
	});
	
	$(".confirm_head").click(function(){
		if($(".confirm_txt").css("display") == "none")
	    {
	        $(".confirm_txt").show();
	        $(".confirm_info").css({"font-weight": "bold"})
	        
	    } else {
	        $(".confirm_txt").hide();
	        $(".confirm_info").css({"font-weight": "normal"})
	    }
	});
	
	$(".refund_head").click(function(){
		if($(".refund_txt").css("display") == "none")
	    {
	        $(".refund_txt").show();
	        $(".refund_info").css({"font-weight": "bold"})
	        
	    } else {
	        $(".refund_txt").hide();
	        $(".refund_info").css({"font-weight": "normal"})
	    }
	});
	
	function modiPage(pno) {
		location.href="/shop/shop_modify/" + pno;
	}
	
	function remove(pno) {
		if (confirm("확인(예) 또는 취소(아니오)를 선택해주세요.")) {
			alert("삭제 되었습니다.");
			location.href = "/shop/remove/" + pno;
		} else {
			alert("취소되었습니다.");
		}
	}
</script>