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
	}
	
	.buy_before{
		-webkit-box-align: center;
		align-items: center;
		width: 100%;
		margin-bottom: 20px;
	}
	
	.product_info{
		padding: 32px 32px 28px;
		box-shadow: 0 4px 10px 0 rgb(0 0 0 / 10%);
		background-color: #fff;
		border-bottom: 1px solid #ebebeb;
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
	
	.infobox{
		border-bottom: 1px solid #ebebeb;
		padding-bottom: 30px;
	}
	
	.buy_price, .sell_price{
		align-items: center;
		padding-top: 28px;
		padding-bottom: 22px;
	}
	
	.buy_price {
		width : 50%;
		float: left;
		text-align: center;
	}
	
	.box_border{
		border-right: 1px solid #ebebeb;
	}
	
	.sell_price {
		width : 50%;
		float: right;
		text-align: center;
	}
	
	.price_descision_box{
		overflow : hidden;
	}
	
	.now_buysell{
		font-size: 12px;
		letter-spacing: -.06px;
		color: rgb(144 144 144);
	}
	
	.now_price, .won{
		font-size: 16px;
	}
	
	.select_box{
		border-radius: 80px;
		border: 1px solid #ebebeb;
		margin-bottom: 27px;
		background-color: #f4f4f4;
	}
	
	.box_test{
		overflow : hidden;
	}
	
	.bid_box{
		float: left;
		border-radius: 80px;
		padding: 14px 0;
		font-size: 14px;
		text-align: center;
		width:50%;
		cursor:pointer;
		background-color: #ef6253;
		color:white;
		font-weight: 700;
	}
	
	.sell_box{
		float: right;
		border-radius: 80px;
		padding: 14px 0;
		font-size: 14px;
		color: rgba(34,34,34,.8);
		text-align: center;
		width:50%;
		cursor:pointer;
	}
	
	.sell_box{
		font-weight: 700;
	}
	
	.sell_box2{
		float: right;
		border-radius: 80px;
		padding: 14px 0;
		font-size: 14px;
		text-align: center;
		width:50%;
		cursor:pointer;
		background-color: #ef6253;
		color:white;
		
	}
	
	.bid_box2{
		float: left;
		border-radius: 80px;
		padding: 14px 0;
		font-size: 14px;
		color: rgba(34,34,34,.8);
		text-align: center;
		width:50%;
		cursor:pointer;
		background-color: #f4f4f4;
		font-weight: 700;
	}
	
	.orenge_box{
	
	}
	
	.price{
		display: flex;
		-webkit-box-align: center;
		align-items: center;
		margin-top: 15px;
		float: right;
	}
	
	.price_now_box{
		display: flex;
		justify-content: space-between;
		padding-bottom: 10px;
		border-bottom: 2px solid #ebebeb;
		
	}
	
	.price_now_title{
		font-size: 14px;
		letter-spacing: -.21px;
		font-weight: 700;
		min-width: 63px;
	}
	
	.price{
		font-size: 20px;
		font-weight: 600;
	}
	
	.price_bind{
		color: rgba(34,34,34,.5);
		padding-top: 10px;
		font-size: 14px;
	}
	
	.price_bind_empty{
		color: rgba(34,34,34,.5);
		padding: 15px 0 30px 0;
		font-size: 14px;
	}
	
	.buy_total_confirm{
		border-top: 1px solid #ebebeb;
		background-color: #fff;
	}
	
	.price_total{
		padding-top: 16px;
		padding-bottom: 12px;
	}
	
	.price_title{
		font-size: 13px;
		letter-spacing: -.07px;
	}
	
	.price_box{
		display: flex;
		justify-content: space-between;
		align-items: center;
    }
    
    .price_empty_desc{
		color: #909090;
    }
    
    .now_buy_btn, .buy_bid_btn{
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
    
	.price_input{
		border: none;
		text-align: right;
    }
    
    .bid_now_box{
    	display: none;
    }
    
	input:focus {outline: none;}
	
	.buy_bid_btn{
		display: none;
	}

</style>

<div class="content_area">
	<form name="shop_register" action="/shop/shop_buypage" method="post" id="buyBidForm">
		<div class="buy_before">
			<div class="product_info">
				<div class="infobox">
					<img class="product_image" src="/resources/img/ps5.png">
					<div class="product_infobox">
						<div class="code">${vo.p_model_no }</div>
						<div class="name">${vo.p_name_en }</div>
						<div class="kor_name">${vo.p_name_ko }</div>
						<div class="p_size">${vo.p_size }</div>
					</div>
				</div>
				<div class="price_descision_box">
					<div class="buy_price">
						<div class="box_border">
							<div class="now_buysell">즉시 구매가</div>
							<span class="now_price">${vo.min_bid_buy }</span><span class="won">원</span>
						</div>
					</div>
					<div class="sell_price">
						<div class="now_buysell">즉시 판매가</div>
						<span class="now_price">${vo.max_bid_sell }</span><span class="won">원</span>
					</div>
				</div>
					<div class="instant_group">
						<div class="select_box">
							<div class="box_test">
								<div class="bid_box">
									즉시 구매
								</div>
								<div class="sell_box">
									구매 입찰
								</div>
							</div>
						</div>
						<div class="price_now">
							<dl class="price_now_box">
								<dt class="price_now_title">즉시 구매가</dt>
								<dd class="price">
									<span class="amount">${vo.min_bid_buy }</span>
									<span class="won">원</span>
								</dd>
							</dl>
							<dl class="bid_now_box">
								<dt class="price_now_title">입찰</dt>
								<dd class="price">
									<input type="number" placeholder="희망가 입력" id="bid_sell" name="bid_sell" class="price_input">
									<input type="hidden" name="p_no" value="${vo.p_no}">
									<span class="won">원</span>
								</dd>
							</dl>
						</div>
						<div class="price_bind">
							<p class="price_bind_empty">총 결제금액은 다음 화면에서 계산됩니다.</p>
						</div>
					<div class="buy_total_confirm">
						<div class="price_total">
							<dl class="price_box">
								<dt class="price_title">총 결제금액</dt>
								<dd class="price_empty_desc">다음 화면에서 확인</dd>
							</dl>
						</div>
					</div>
					<div class="now_buy_btn">
						<div class="btn_box full">즉시 구매 하기</div>
					</div>
					<div class="buy_bid_btn">
						<div class="btn_box full" onclick="test()">구매 입찰 하기</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	$(".bid_box").on('click', function(){
	    $(this).removeClass("bid_box2");
	    $(".sell_box").removeClass("sell_box2");
	    $(".bid_now_box").hide();
		$(".price_now_box").show();
		$(".now_buy_btn").show();
		$(".buy_bid_btn").hide();
	});
	
	$(".sell_box").on('click', function(){
	    $(this).addClass("sell_box2");
	    $(".bid_box").addClass("bid_box2");
	    $(".price_now_box").hide();
		$(".bid_now_box").show();
		$(".buy_bid_btn").show();
		$(".now_buy_btn").hide();
	});
	
/* 	function buyNowPage(pno) {
		var price = $('[name="want_price"]').val();
 		location.href="/shop/shop_bidbuy?pno=" + pno + "&price="+price;
	} */

	function test() {
		var bid_price = $('#bid_sell').val();

		if(bid_price == '' || bid_price < 1){
			alert("입찰가를 확인하여해주세요");
			return false;
		}

		var form = $('#buyBidForm');
		form.submit();
	}

</script>
<jsp:include page="../include/footer.jsp"/>