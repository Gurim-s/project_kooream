<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp"/>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	
	.empty_price2{
		text-align: right;
		white-space: nowrap;
		color: #222;
		font-size: 18px;
		letter-spacing: -.21px;
		font-weight: bold;
	
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
	<form name="now_buy" method="post" id="now_buy">
		<div class="buy_before">
			<div class="product_info">
				<div class="product_info">
					<div class="infobox">
						<c:forEach items="${imageUrls}" var="imageUrl" begin="0" end="0">
							<img class="product_image" src="${imageUrl }">
						</c:forEach>
						<!-- <img class="product_image" src="/resources/img/ps5.png"> -->
						<div class="product_infobox">
						<div class="code">${vo.p_model_no }</div>
						<div class="name">${vo.p_name_en }</div>
						<div class="kor_name">${vo.p_name_ko }</div>
						<div class="p_size">${vo2.pp_size }</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section_total">
				<div class="section_unit">
				<h3 class="title_txt">판매 정산 계좌</h3>
					<!-- <select id="bankcode" name="bankcode" onchange="ChangeValue()"> -->
					<select id="bankcode" name="bankcode">
						<option value="0">은행 선택</option>
						<option value="국민은행">국민은행</option>
						<option value="하나은행">하나은행</option>
						<option value="신한은행">신한은행</option>
						<option value="카카오뱅크">카카오뱅크</option>
						<option value="케이뱅크">케이뱅크</option>
						<option value="기업은행">기업은행</option>
					</select>
					계좌번호<input type="number" name="backacct" placeholder="숫자만 입력">
					예금주<input type="text" name="account_holder">
				</div>
			</div>
			<div class="section_total">
				<div class="section_unit">
					<div class="section_title">
 					<h3 class="title_txt">배송 주소</h3>
                  <!-- <a href="#" class="add_more_btn">+ 새 주소 추가</a> -->
               		</div> 
               		<input type="checkbox" id="copyAddr">기본 배송지선택
               		<div><input type="text" class="guide_txt" 
                                 id="sample6_address" 
                                 name="m_addr" onclick="sample6_execDaumPostcode()" 
                                 placeholder="주소를 입력해주세요."></div>
               <div><input type="text" class="guide_txt" id="sample6_detailAddress" name="m_Detail_addr" placeholder="상세주소를 입력하세요."></div>
              		<input type="hidden" name = "m_adress" value="">
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
										<span class="badge_title">택배 발송</span>
										<span>선불</span>
									</p>
									<p class="sub_txt">
									착불 발송 시 정산금액에서 차감
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
							<dt class="price_title">판매 입찰가</dt>
							<dd class="price empty_price">
								<span class="amount">${vvo }원</span>
							</dd>
						</dl>
					</div>
					<div class="price_bind">
						<dl class="price_addition">
							<dt class="price_title2"><span>배송비</span></dt>
							<dd class="price_text2">무료 배송</dd>
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
									<p class="notice_maintext">거래가 체결되면 일요일 · 공휴일을 제외하고 48시간 내에 KREAM으로 발송을 완료한 후, 발송 정보를 정확히 입력해야 합니다.</p>
									<p class="notice_subtext">착불 배송 시 판매 금액에서 차감 정산하며, 미정산 시 별도 고지없이 해당 금액을 결제 시도할 수 있습니다.</p>
								</div>
								<div>
									<input type="checkbox" class="chbox" id="cbcon">
								</div>
							</div>
							<div class="notice_group notice2">
								<div class="text_group">
									<p class="notice_maintext">송장 번호 미기재·오입력 시 입고가 진행되지 않으며, 발송 후 5일(일요일·공휴일 제외) 내 미도착은 허위 정보 입력으로 간주하여 미입고 페널티를 부과합니다.</p>
									<p class="notice_subtext">앱 알림 해제, 알림톡 차단, 전화번호 변경 후 미등록 시에는 거래 진행 상태 알림을 받을 수 없으며 이로 인한 거래 실패는 판매자의 책임입니다.</p>
								</div>
								<div class="check_d">
									<input type="checkbox" class="chbox" id="cbcon">
								</div>
							</div>
							<div class="notice_group notice2">
								<div class="text_group">
									<p class="notice_maintext">검수 기준과 페널티 및 이용 정책을 다시 한번 확인하였습니다.</p>
									<p class="notice_subtext">이용정책 위반 시, 판매 금액의 최대 15.0%의 페널티가 부과됩니다. 페널티 회피 시 이후 거래가 제한되며 별도 고지없이 해당 금액을 결제 시도할 수 있습니다.</p>
								</div>
								<div class="check_d">
									<input type="checkbox" class="chbox" id="cbcon">
								</div>
							</div>
							<div class="notice_group notice2">
								<div class="text_group">
									<p class="notice_maintext">검수 기준과 페널티 및 이용 정책을 다시 한번 확인하였습니다.</p>
									<p class="notice_subtext">이용정책 위반 시, 판매 금액의 최대 15.0%의 페널티가 부과됩니다. 페널티 회피 시 이후 거래가 제한되며 별도 고지없이 해당 금액을 결제 시도할 수 있습니다.</p>
								</div>
								<div class="check_d">
									<input type="checkbox" class="chbox" id="cbcon">
									<input type="hidden" name="p_no" value="${vo.p_no }">
									<input type="hidden" name="pp_size" value="${vo2.pp_size }">
									<input type="hidden" name="bid_buy" id="bid_buy" value="${vvo }">
								</div>
							</div>
						</li>
					</ul>
					<div class="price_total">
						<dl class="price_box2">
							<dt class="price_title3">판매 입찰가</dt>
							<dd class="empty_price2">${vvo }원</dd>
						</dl>
					</div>
					<div class="now_buy_btn">
						<div class="btn_box full" >판매 입찰 하기</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	var m_no = $('input[name="pri_m_no"]').val();
	var m_no_input = '<input type="hidden" name ="m_no" value="'+ m_no +'">';

	$(".btn_box").on("click",function(){
		if($('#bankcode').val() == 0){
			alert("[은행]을 선택해주세요");
			return false;
		} 
		if($('#backacct').val() == '') {
			alert("[계좌번호]를 확인해주세요");
			return false;
		}
		if($('#account_holder').val() == '') {
			alert("[예금주]를 확인해주세요");
			return false;
		}
		if ($('input:checkbox[id="cbcon"]').is(":checked") != true) {
			alert("동의하기 체크박스 선택하여야합니다.")
			return false;
		} else {
			$('.price_box2').html(m_no_input);
			var form = $('form');
			form.attr("action", "/shop/shop_bidsellComplete");
			console.log(form);
			console.log(m_no_input);
			$('.price_box2').html(m_no_input);
 			$(form).submit();
		}
	});
	
/* 	function ChangeValue() {
		var target2 = $("#bankcode option:selected").val();
		var brando = '<input type="hidden" name="backcode" value="'+ target2 +'">';
		
		console.log(target2);
		console.log(brando);
		$('.price_total').html(brando);
	} */
	
	

</script>
<jsp:include page="../include/footer.jsp"/>