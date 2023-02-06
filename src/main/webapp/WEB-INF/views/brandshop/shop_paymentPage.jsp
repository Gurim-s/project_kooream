<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../include/header.jsp"/>
<style>
	.content_area{
		overflow: hidden;
		max-width: 780px;
		min-height: 900px;
		margin: 0 auto;
		padding: 20px 40px 160px;
		background-color: #fafafa;
	}
	
	.buy_before{
		-webkit-box-align: center;
		align-items: center;
		width: 100%;
		margin-bottom: 20px;
	}
	
	.product_info{
		padding: 12px 32px;
		background-color: #fff;
	}
	
	.product_image{
		border-radius: 7px;
		height: 80px;
		width: 80px;
		float: left;
		margin-right: 16px;
		position: relative;
	}
	
	.code{
		line-height: 17px;
		font-size: 14px;
		font-weight: 700;
	}
	
	.name{
		line-height: 17px;
		font-size: 14px;
	}
	
	.kor_name{
		line-height: 16px;
		font-size: 13px;
		letter-spacing: -.05px;
		color: rgba(34,34,34,.5);
	}
	
	.p_size{
		font-size: 14px;
		font-weight: 700;
		margin-top: 7px;
		margin-bottom: 7px;
	}
	
	.section_total{
		padding: 32px;
		background-color: #fff;
		border-top: 8px solid #fafafa;
	}
	
	.title_txt{
		line-height: 22px;
		font-size: 18px;
		font-weight: 700;
		letter-spacing: -.15px;
	}
	
	.add_more_btn{
		margin-left: auto;
		padding-left: 2px;
		font-size: 13px;
		letter-spacing: -.07px;
		color: rgba(34,34,34,.5);
	}
	
	.section_title{
		display: flex;
		-webkit-box-align: center;
		align-items: center;
		padding-bottom: 12px;
	}
	
	.delivery_info{
		display: flex;
		width: 100%;
		height: 44px;
		border-radius: 10px;
		border: 1px solid #ebebeb;
		background-color: #fafafa;
		-webkit-box-align: center;
		align-items: center;
	}
	
	.guide_txt{
		margin-left: 12px;
		font-size: 14px;
		letter-spacing: -.21px;
		color: rgba(34,34,34,.5);
	}
	
	.shipping_memo{
		position: relative;
		margin-top: 12px;
	}
	
	.button_shipping{
		font-size: 14px;
		height: 48px;
		padding: 14px 12px;
		-webkit-box-flex: 0;
		border: 1px solid #ebebeb;
		border-radius: 10px;
		width: 100%;
		text-align: left;
		cursor: pointer;
	}
	
	button{
		outline: none;
		background: none;
		background-color: transparent;
		appearance: none;
	}
	
	.button_shipping_memo{
		color: rgba(34,34,34,.3);
	}
	
	.section_unit2{
		margin-top: 22px;
		padding-top: 15px;
		border-top: 1px solid #ebebeb;
	}
	
	.delivery_option{
		background: #fafafa;
		border: 1px solid #ebebeb;
		cursor: not-allowed;
		padding: 12px 15px;
		border-radius: 10px;
	}
	
	.way_info{
		display: flex;
		-webkit-box-align: center;
		align-items: center;
		width: 100%;
	}
	
	.way_status{
		-webkit-box-flex: 0;
		flex: none;
		margin-right: 14px;
	}
	
	.way_img{
		width: 40px;
		height: 40px;
	}
	
	img{
		border: 0;
		vertical-align: top;
	}
	
	.company{
		font-size: 14px;
		letter-spacing: -.21px;
		line-height: 17px;
	}
	
	.badge_title{
		font-weight: 600;
	}
	
	.sub_txt{
		line-height: 16px;
		margin-top: 3px;
		font-size: 14px;
		color: rgba(34,34,34,.5);
	}
	
	.instant_group{
		padding-top: 22px;
	}
	
	.order_info{
		padding-top: 0;
		border-top: 0;
		padding-bottom: 19px;
		border-bottom: 2px solid #ebebeb;
	}
	
	.price_box{
		display: block;
		line-height: 26px;
	    font-size: 20px;
	    font-weight: 600;
	    letter-spacing: normal;
	}
	
	.price_title{
		width: 100%;
		font-size: 14px;
		font-weight: 700;
		letter-spacing: -.01px;
	}
	
	.amount{
		width: 100%;
		text-align: right;
		display: block;
	}
	
	.price_addition{
		display: flex;
		-webkit-box-pack: justify;
		justify-content: space-between;
		-webkit-box-align: center;
		align-items: center;
		min-height: 26px;
		font-size: 13px;
		letter-spacing: -.07px;
		font-weight: 700;
	}
	
	.price_bind{
		padding-top: 11px;
		font-size: 13px;
		letter-spacing: -.07px;
	}
	
	.price_tilte{
		color: #222;
	}
	
	.price_text{
		text-align: right;
		white-space: nowrap;
		color: #222;
		font-size: 14px;
		letter-spacing: -.21px;
	}
	
	.price_title2, .price_text2{
		font-weight: normal;
		color: rgba(34,34,34,.5);
	}
	
	.check_list {
		padding-bottom: 16px;
	}
	
	ul{
		list-style: none;
	}
	
	.notice_maintext{
		line-height: 18px;
		font-size: 15px;
		letter-spacing: -.01px;
	}
	
	.notice_subtext{
		margin-top: 4px;
		line-height: 16px;
		font-size: 13px;
		letter-spacing: -.05px;
		color: rgba(34,34,34,.5);
	}
	
	.chbox{
		margin-left: auto;
	}
	
	.notice_group{
		display: flex;
		-webkit-box-align: center;
		align-items: center;
		padding: 19px 0 20px;
		width: 100%;
	}
	
	.text_group{
		margin-right: 20px;
		word-break: keep-all;
		word-wrap: break-word;
	}
	
	.notice2{
		border-top: 1px solid #ebebeb;
	}
	
	.check_d{
		display: inline-block;
		float: right;
	}
	
	.price_box2{
		display: flex;
		-webkit-box-pack: justify;
		justify-content: space-between;
		-webkit-box-align: center;
		align-items: center;
	}
	
	.price_title3{
		line-height: 18px;
		font-size: 15px;
		letter-spacing: -.01px;
		font-weight: 700;
	}
	
	.now_buy_btn{
		margin-top: 10px;
		font-weight: 600;
	}
	
		.btn_box{
		width: 100%;
		font-size: 16px;
		letter-spacing: -.16px;
		height: 52px;
		border-radius: 12px;
		color: #fff;
		background-color: #222;
		vertical-align: middle;
		text-align: center;
		align-items: center;
    }
    
    .full{
		display: inline-flex;
		cursor: pointer;
		-webkit-box-align: center;
		align-items: center;
		-webkit-box-pack: center;
		justify-content: center;
		vertical-align: middle;
		text-align: center;
    }


</style>

<div class="content_area">
	<form name="shop_bidsell" method="post" id="bidSellForm">
		<div class="buy_before">
			<div class="product_info">

			</div>
			<div class="section_total">
				<div class="section_unit">
					<div class="section_title">
						<h3 class="title_txt">배송 주소</h3>
						<a href="#" class="add_more_btn">+ 새 주소 추가</a>
					</div>
					
					<a href="#" class="delivery_info">
						<span class="guide_txt">
							주소를 추가해주세요. >
						</span>
					</a>
					<div class="shipping_memo">
						<button class="button_shipping">
							<span class="button_shipping_memo">배송 시 요청사항을 선택하세요.</span>						
						</button>
					</div>
				</div>
				<div class="section_unit2">
					<div class="section_title">
						<h3 class="title_txt"> 배송 방법</h3>
					</div>
					<div class="section_content">
						<div class="delivery_option">
							<div class="way_info">
								<div class="way_status">
									<img src="/resources/img/deliverycar.png" class="way_img">
								</div>
								<div class="way_desc">
									<p class="company">
										<span class="badge_title">브랜드 배송</span>
										<span>무료</span>
									</p>
									<p class="sub_txt">
									입점한 브랜드에서 직접 택배 배송
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section_total">
				<div class="section_title">
					<h3 class="title_txt">최종 주문 정보</h3>
				</div>
				<div class="instant_group">
					<div class="order_info">
						<dl class="price_box">
							<dt class="price_title">총 결제금액</dt>
							<dd class="price empty_price">
								<span class="amount">${vo.sum_price}</span>
							</dd>
						</dl>
					</div>
					<div class="price_bind">
						<dl class="price_addition">
							<dt class="price_title"><span>구매가</span></dt>
							<dd class="price_text"></dd>
						</dl>
						<dl class="price_addition">
							<dt class="price_title2"><span>배송비</span></dt>
							<dd class="price_text2">배송비 무료</dd>
						</dl>
					</div>
				</div>
			</div>
			<div class="section_total">
				대충 결제 공간
			</div>
			<div class="section_total">
				<div>
					<ul class="check_list">
						<li>
							<div class="notice_group">
								<div class="text_group">
									<p class="notice_maintext">KREAM의 검수 없이 제휴 사업자가 직접 배송하며, 재고 부족 등 사업자의 상황에 따라 거래가 취소될 수 있습니다.</p>
									<p class="notice_subtext">앱 알림 해제, 알림톡 차단, 전화번호 변경 후 미등록 시에는 거래 진행 상태 알림을 받을 수 없습니다.</p>
								</div>
								<div>
									<input type="checkbox" class="chbox">
								</div>
							</div>
							<div class="notice_group notice2">
								<div class="text_group">
									<p class="notice_maintext">개인정보의 제3자 제공에 동의합니다.</p>
									<p class="notice_subtext">자세히보기</p>
								</div>
								<div class="check_d">
									<input type="checkbox" class="chbox">
								</div>
							</div>
							<div class="notice_group notice2">
								<div class="text_group">
									<p class="notice_maintext">'결제하기'를 선택하시면 즉시 결제가 진행됩니다.</p>
								</div>
								<div class="check_d">
									<input type="checkbox" class="chbox">
								</div>
							</div>
							<div class="notice_group notice2">
								<div class="text_group">
									<p class="notice_maintext">구매 조건을 모두 확인하였으며, 거래 진행에 동의합니다.</p>
								</div>
								<div class="check_d">
									<input type="checkbox" class="chbox">
								</div>
							</div>
						</li>
					</ul>
					<div class="price_total">
						<dl class="price_box2">
							<dt class="price_title3">총 결제금액</dt>
							<dd class="empty_price2">-</dd>
						</dl>
					</div>
					<div class="now_buy_btn">
						<div class="btn_box full" >결제 하기</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
//-------------------------------------------------상품이미지 + 리스트 가지고오기
$(function(){	// list()함수 실행하기위한
	list();
});

	function list() {	// 상품이미지 보여주기
		$.ajax({
			url:'/Payment/paymentList',
			type: 'get',
 			dataType:"json",
 			contentType:"application/json",

 		})
 		.done(function (json) {	// success 대신 사용
 			
			var str='<div class="infobox">';
			
			console.log(json);	// f12누르면 나오는,, 정보가 json에 저장이 잘 되어있는지 확인

			for(var i=0; i<json.length; i++) {
				str += '<a href="/brandshop/get?p_no='+json[i].p_no+'&b_no='+json[i].b_no+'">';	// 페이지 이동하면서 p_no, b_no값 가지고 이동 
							// brandshop(컨트롤러) 에서 /get을 탐  
					
					if(json[i].attachList.length > 0) {
						var uploadPath = json[i].attachList[0].uploadPath;
						var uuid = json[i].attachList[0].uuid;
						var fileName = json[i].attachList[0].fileName;
						var fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
						
						str += '<img class = "product_image" src="/displayImage?fileName='+ fileCallPath + '" />';	// 이미지
					}//-------- if문 끝
					
					/*브랜드명, 영문명, 사이즈, 가격  mapper.xml에서 조인해서 가지고오고, Vo에 이름 만들면 가지고 올수있음 */
					
					str += '<div class="product_infobox">';
						str += '<div class="code">'+json[i].p_model_no+'</div>';
						str += '<div class="name">'+json[i].p_name_en+'</div>';
						str += '<div class="kor_name">'+json[i].p_name_ko+'</div>';
						str += '<div class="p_size">'+json[i].pp_size+'</div>';
						
					/* str += '<div class="p_info" style="font-weight: bold; font-size: 15px;" data-price = "'+json[i].p_release_price+'">'+json[i].p_release_price+'원</div><br/>'; */
				str += '</a>'
					str += '</div>'
					/* str += '<button class = "remove_button" data-cartno="'+json[i].cart_no+'" >삭제</button>' */

			}//------------- for 문 끝
			
			str += '</div>'	// <div class = infobox"> 끝
			$('.product_info').html(str);	// 여기서 append를 사용하면 내용이 계속 쌓이는거고 새로가지고오지 못한다.. 그래서 html사용해야함,,,,,
			
			for(var i= 0; i<json.length; i++){
				var price = json[i].sum_price;
				//console.log(price);
				if(price != null){
					var sum = 0;
					sum += Number(price);
					console.log(sum);
					
				}
			}
			
			$('.price_text').html(sum);

			
		});// ---------done 끝
		
 	};// ------- list 함수 끝
 	





















</script>
<jsp:include page="../include/footer.jsp"/>