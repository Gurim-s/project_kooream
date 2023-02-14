<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp"/>
<style>
	.content_area{
		overflow: hidden;
		max-width: 780px;
		min-height: 900px;
		margin: 0 auto;
		padding: 20px 40px 160px;
		border: 1px solid black;
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
	
	.infobox{
		border-bottom: 1px solid #ebebeb;
		padding-bottom: 40px;
	}
	
	.badge_product{
		position: relative;
		right: unset;
		bottom: unset;
		margin-top: 6px;
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
	}
	
	.size_product{
		margin-top: 5px;
		font-size: 14px;
		height: 20px;
		text-align: center;
	}
	
	.size_price{
		color: #f15746;
		margin-top: 1px;
    	font-size: 12px;
    	text-align: center;
    	font-weight: bold;
	}
	
	.badge_logo{
		width: 11px;
		height: 13px;
	}
	
	.select_box{
		overflow: hidden;
		margin: 4px;
		display: inline-block;
		vertical-align: top;
		width: calc(33.33333% - 12px);
		border: 1px solid #d3d3d3;
		height: 52px;
		border-radius: 10px;
		background-color: #fff;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
		font-weight: normal;
	}
	
	.all_box{
		padding: 20px 0;
	}
	
	.bid_or_buy{
		display: flex;
		padding-top: 20px;
		border-top: 1px solid #ebebeb;
		background-color: #fff;
	}
	
	.buy_box{
		background-color: #333;
		display: flex;
		align-items: center;
		justify-content: center;
		padding: 16px 18px 16px 14px;
		border-radius: 10px;
		color: #fff;
		box-sizing: border-box;
		position: relative;
		width: 100%;
		height : 64px;
		cursor:pointer;
	}
	
	.buy_price{
		font-weight: bold;
		font-size: 16px;
	}
	
	.buy_price, .buy_badge{
		color: white;
	}
	
	.btn_box{
		text-align: center;
	}
	
	.buy_badge{
		font-size: 13px;
	}
	
</style>


<div class="content_area">
	<form name="size_select" method="post" id="size_select">
		<div class="buy_before">
			<div class="product_info">
				<div class="infobox">
					<c:forEach items="${imageUrls}" var="imageUrl" begin="0" end="0">
						<img class="product_image" src="${imageUrl }">
					</c:forEach>
					<div class="product_infobox">
						<div class="code">${vo.p_model_no }</div>
						<div class="name">${vo.p_name_en }</div>
						<div class="kor_name">${vo.p_name_ko }</div>
						<%-- <div class="p_size">${vo2.pp_size }</div> --%>
						<div class="badge_product">
							빠른배송
						</div>
					</div>
				</div>
				<div class="all_box">
	 			<c:forEach items="${vo2}" var="vo2">
					<div class="select_box">
						<div class="size_product">
							<input type="radio" name="pp_size" value="${vo2.pp_size }">
							${vo2.pp_size }
						</div>
						<div class="size_price">
						<fmt:formatNumber value="${vo2.bid_buy }" pattern="#,###,###원"/>
						</div>
					</div>
				</c:forEach>
				<input type="hidden" name="p_no" value="${vo.p_no }">
	<!-- 				<div class="select_box">
						<div class="size_product">
							255
						</div>
						<div class="size_price">
							30000
						</div> -->
					</div>
				</div>
				
			</div> <!-- box_all -->
			<div class="bid_or_buy">
				<div class="buy_box">
					<div class="btn_box">
						<!-- <div class="buy_price">999,000</div> -->
						<div class="buy_badge">일반 배송</div>
					</div>
				</div>
			</div>
		</form>
	</div>

<script type="text/javascript">
/* 	$(".select_box").click(function(){
		if($(".select_box").css("font-weight") != "nomal")
	    {
	        $(".select_box").css({"font-weight": "bold"})
	        $(".select_box").css({"border": "1px solid black"})
	    } else { 
	        $(".select_box").css({"border": "normal"})
	    }
		
		if($(".select_box").css("font-weight") == "nomal")
	    {
	        $(".select_box").css({"font-weight": "normal"})
	        $(".select_box").css({"border": "none"})
	    } else { 
	        $(".select_box").css({"border": "bold"})
	    }
	}); */
	var pno = ${vo.p_no };
	
	$(".buy_box").on("click",function(){
		var form = $('form');
		form.attr("action", "/shop/shop_buypage");
		console.log(form);
		$(form).submit();
	});
</script>
<jsp:include page="../include/footer.jsp"/>