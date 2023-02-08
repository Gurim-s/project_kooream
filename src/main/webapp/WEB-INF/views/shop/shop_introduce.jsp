<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../include/header.jsp"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/shop/shop_introduce.css'/>">
	<button id="modify_btn" onclick="modiPage(${vo.p_no})">상품 수정</button>
	<button id="remove_btn" onclick="remove(${vo.p_no})">삭제</button>
	<div class="wrap clearfix">
		<div class="product_photo">
			<div id="slideShow" id="slideShow">
			<div id="imgSlider"></div>
			<ul class="slides" style="display:none;">
				<c:forEach items="${imageUrls}" var="imageUrl">
					<li><img class="product_image" src="${imageUrl}"></li>	
				</c:forEach>
		    </ul>  
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
					<span class="recent_price">즉시 구매가</span>
				<div class="price">
					<div class="amount">
						<span class="product_price">${vo.min_bid_buy }</span> 
						<span class="won">원</span>
							<!-- <p class="fluctuation">99,000원 (+24.6%)</p> -->
					</div>
				</div>
			</div>
			<div class="btn_inter_box">
				<div class="btn_box">
					<div class="btn_buy" onclick="getPage(${vo.p_no})">
						<div class="buy_box">
							<strong class="buy_text">구매</strong>
						</div>
						<div class="buy_price_box">
							<div class="buy_price">${vo.min_bid_buy }원</div>
							<div class="buy_now">즉시 구매가</div>
						</div>
					</div>
					<div class="btn_sell" onclick="getSell(${vo.p_no})">
						<div class="sell_box">
							<strong class="buy_text">판매</strong>
						</div>
						<div class="buy_price_box">
							<div class="buy_price">${vo.max_bid_sell }원</div>
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
					<div class="product_title">발매가</div>
					<div class="model_intro">${vo.p_release_price }원</div>
				</div>
				<div class="model_box">
<%-- 					<div class="product_title">발매가</div>
					<div class="model_intro">${vo.p_release_price }원</div> --%>
				</div>
			</div>
			<h3 class="bsinfo">배송정보</h3>
			<div class="delivery_way_wrap">
				<div class="way_info">
					<img src="/resources/img/bsicon.png" style="width:40px; height: 40px;">
					<div class="way_desc">
						<span class="delivery">빠른배송</span>
						<span class="delivery_won"> 5,000원</span>
						<div class="sub_text">지금 결제시 <span class="delivery_est">1일 ~ 2일 후 도착 예정</span></div>
					</div>
				</div>
			</div>
			<div class="delivery_way_wrap">
				<div class="way_info">
					<img src="/resources/img/boxicon.png" style="width:40px; height: 40px;">
					<div class="way_desc">
						<span class="delivery">일반배송</span>
						<span class="delivery_won"> 3,000원</span>
						<div class="sub_text">검수 후 배송 ・ 5-7일 내 도착 예정</div>
					</div>
				</div>
			</div>
			<div class="delivery_way_wrap">
				<div class="way_info">
					<img src="/resources/img/warehouse.png" style="width:40px; height: 40px;">
					<div class="way_desc">
						<span class="delivery">창고보관</span>
						<span class="delivery_won"> 첫 30일 무료</span>
						<div class="sub_text">배송 없이 창고에 보관 ・ 빠르게 판매 가능</div>
					</div>
				</div>
			</div>
			<div class="graph">
				<div>그래프 공간</div>
				<div>넣을지 말지는 나중에 생각</div>
				<div>못넣을듯</div>
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
					<img class="binfo_p" src="/resources/img/guide_icon1.png" style="width:40px; height: 35px;">
					<div class="text_area">100% 정품 보증</div>
					<p class="text_desc">KREAM에서 검수한 상품이 정품이 아닐 경우, 구매가의 3배를 보상합니다.</p>
				</div>
				<div class="bottom_info2">
					<img class="binfo_p" src="/resources/img/guide_icon2.png" style="width:40px; height: 35px;">
					<div class="text_area">엄격한 다중 검수</div>
					<p class="text_desc">모든 상품은 검수센터에 도착한 후, 상품별 전문가 그룹의 체계적인 시스템을 거쳐 검수를 진행합니다.</p>
				</div>
				<div class="bottom_info2">
					<img class="binfo_p" src="/resources/img/guide_icon3.png" style="width:40px; height: 35px;">
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
<script type="module" src="<c:url value='/resources/js/shop/shop_introduce.js'/>"></script>
<script type="text/javascript">
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
		if (confirm("정말 삭제하시겠습니까?")) {
			alert("삭제 되었습니다.");
			location.href = "/shop/remove/" + pno;
		} else {
			alert("취소되었습니다.");
		}
	}
	
	function getPage(pno) {
		location.href="/shop/shop_buypage/" + pno;
	}
	
	function getSell(pno) {
		/* location.href="/shop/shop_sellpage/" + pno; */
		location.href="/shop/shop_Sell_Sizeselect/" + pno;
	}

/* 	onscroll = function() {
		  var nVScroll = document.documentElement.scrollTop || document.body.scrollTop;
		  if(nVScroll > 40) $("#slides")css("position", "fixed"); 
		  else $("#slides").css("position", "relative");
		}; */

		$(window).scroll(function() {
			if($(this).scrollTop() > 200) {
				$("#slideShow").css('position','fixed');
				$("#slideShow").css('width', '600px');
			}
			else {
				$("#slideShow").css('position','relative');
				$("#slideShow").css('width', '100%');
			}
		});
</script>