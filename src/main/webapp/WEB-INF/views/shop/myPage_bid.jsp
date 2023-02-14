<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/myPageCategory.jsp"/>
<style>
	
	.product_image {
		height : 118px;
		width : 118px;
	}
	
	.product_info{
		margin-bottom: 20px;
	}
	
	.p_infobox{
		
	}
	
	table{
		margin-top : 5px;
		margin-bottom : 5px;
	}
	
	.bottom_line{
		margin-bottom: 20px;
	}
	
	.bid_date, .bid_no, .p_size {
		color: #555;
		font-size: 12px;
	}
	
	.p_size{
		margin-bottom: 5px;
	}
	
	.brand_namekr, .brand_nameen{
		font-size: 14px;
		font-size: 14px;
	}
	
	.bid_price{
		font-size: 14px;
		font-weight: bold;
	}
	
	.buy_bid_window, .buy_bid_window2, .buy_bid_window3, .buy_bid_window4{
		display: none;
	}
	
	.head_title {
		font-size: 30px;
		border-radius: 5px;
		font-weight: bold;
		color: #6d91b1;
	}
	.head_title3, .head_title4{
		font-size: 30px;
		border-radius: 5px;
		font-weight: bold;
		color: #f451dc;
	}
	
	
	.head_title2{
		font-size: 30px;
		border-radius: 5px;
		font-weight: bold;
		color: #6d91b1;
	}
	
	.center_line{
		margin: 30px 0;
	}
	
	
</style>
	<span class="head_title" id="head_title">- 구매 입찰 내역 ↓ (펼치기) -</span>
	<div class="buy_bid_window">
		<c:forEach items="${bvo}" var="bvo">
		<c:forEach items="${bvo.productvo }" var="pvo">
			<c:choose>
				<c:when test="${bvo.bid_sell eq 0 }">
				</c:when>
				<c:otherwise>
						<hr/>
						<table>
							<tr>
								<td class="table_pic" rowspan="4">
									<img class="product_image" src="${bvo.imageUrls.get(0) }">
								</td>
								<td>
									<div class="bid_no" >입찰 번호 : ${bvo.bid_no }</div>
									<div class="brand_namekr" >${pvo.p_name_ko }</div>
									<div class="brand_nameen" >${pvo.p_name_en }</div>
									<div class="p_size" >${bvo.pp_size }</div>
									<div class="bid_price"><fmt:formatNumber value="${bvo.bid_sell }" pattern="#,###,###원"/></div>
									<div class="bid_date">${bvo.bid_date }</div>
									<button id="remove_btn" onclick="remove(${bvo.bid_no })">입찰 철회</button>
								</td>
							</tr>
						</table>
						<hr class="bottom_line">
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</c:forEach>
	</div>
	<br/>
	
	<span class="head_title2" id="head_title2">- 판매 입찰 내역 ↓ (펼치기) -</span>
	<div class="buy_bid_window2">
	<c:forEach items="${bvo}" var="bvo">
	<c:forEach items="${bvo.productvo }" var="pvo">
		<c:choose>
			<c:when test="${bvo.bid_buy eq 0 }">
			</c:when>
			<c:otherwise>
				<hr/>
					<table>
						<tr>
							<td class="table_pic" rowspan="4">
								<img class="product_image" src="${bvo.imageUrls.get(0) }">
							</td>
							<td>
								<div class="bid_no" >입찰 번호 : ${bvo.bid_no }</div>
								<div class="brand_namekr" >${pvo.p_name_ko }</div>
								<div class="brand_nameen" >${pvo.p_name_en }</div>
								<div class="p_size" >${bvo.pp_size }</div>
								<div class="bid_price"><fmt:formatNumber value="${bvo.bid_buy }" pattern="#,###,###원"/></div>
								<div class="bid_date" >입찰 일자 : ${bvo.bid_date }</div>
								<button id="remove_btn" onclick="remove(${bvo.bid_no })">입찰 철회</button>
							</td>
						</tr>
					</table>
				<hr class="bottom_line">
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</c:forEach>
	</div>
	<br/>
	<hr class="center_line">
	
	<span class="head_title3" id="head_title3">- 즉시 구매 내역 ↓ (펼치기) -</span>
	<div class="buy_bid_window3">
	<c:forEach items="${buyvo }" var="buyvo">
	<c:forEach items="${buyvo.productvo }" var="pvo">
	<hr/>
		<table>
			<tr>
				<td class="table_pic" rowspan="4">
					<img class="product_image" src="${buyvo.imageUrls.get(0) }">
				</td>
				<td>
					<div class="bid_no" >거래 번호 : ${buyvo.buy_no }</div>
					<div class="brand_namekr" >${pvo.p_name_ko }</div>
					<div class="brand_nameen" >${pvo.p_name_en }</div>
					<div class="bid_price" ><fmt:formatNumber value="${buyvo.pay_price }" pattern="#,###,###원"/></div>
					<div class="bid_date" >${buyvo.buy_date }</div>
				</td>
			</tr>
		</table>
	<hr class="bottom_line">	
	</c:forEach>
	</c:forEach>
	</div>
	<br/>
	
	<span class="head_title4" id="head_title4">- 즉시 판매 내역 ↓ (펼치기) -</span>
	<div class="buy_bid_window4">
	<c:forEach items="${sellvo }" var="sellvo">
	<c:forEach items="${sellvo.productvo }" var="pvo">
	<hr/>
		<table>
			<tr>
				<td class="table_pic" rowspan="4">
					<img class="product_image" src="${sellvo.imageUrls.get(0) }">
				</td>
				<td>
					<div class="bid_no" >거래 번호 : ${sellvo.buy_no }</div>
					<div class="brand_namekr" >${pvo.p_name_ko }</div>
					<div class="brand_nameen" >${pvo.p_name_en }</div>
					<div class="bid_price" ><fmt:formatNumber value="${sellvo.pay_price }" pattern="#,###,###원"/></div>
					<div class="bid_date" >${sellvo.buy_date }</div>
				</td>
			</tr>
		</table>
	<hr class="bottom_line">
	</c:forEach>
	</c:forEach>
	</div>

	

<jsp:include page="../include/footer.jsp"/>
<script type="text/javascript">
	function remove(bid_no) {
		if (confirm("입찰 철회하시겠습니까?")) {
			alert("삭제 되었습니다.");
			location.href = "/shop/bidremove/" + bid_no;
		} else {
			alert("취소되었습니다.");
		}
	}
	
	const subs = document.getElementById('head_title');
	const subs2 = document.getElementById('head_title2');
	const subs3 = document.getElementById('head_title3');
	const subs4 = document.getElementById('head_title4');
	
	$(".head_title").click(function(){
		if($(".buy_bid_window").css("display") == "none")
	    {
	        $(".buy_bid_window").show();
	        subs.innerText = '- 구매 입찰 내역 ↑ (접기) -';
	        
	    } else {
	        $(".buy_bid_window").hide();
	        subs.innerText = '- 구매 입찰 내역 ↓ (펼치기) -';
	    }
	});
	
	$(".head_title2").click(function(){
		if($(".buy_bid_window2").css("display") == "none")
	    {
	        $(".buy_bid_window2").show();
	        subs2.innerText = '- 판매 입찰 내역 ↑ (접기) -';
	    } else {
	        $(".buy_bid_window2").hide();
	        subs2.innerText = '- 판매 입찰 내역 ↓ (펼치기) -';
	    }
	});
	
	$(".head_title3").click(function(){
		if($(".buy_bid_window3").css("display") == "none")
	    {
	        $(".buy_bid_window3").show();
	        subs3.innerText = '- 즉시 구매 내역 ↑ (접기) -';
	        
	    } else {
	        $(".buy_bid_window3").hide();
	        subs3.innerText = '- 즉시 구매 내역 ↓ (펼치기) -';
	    }
	});
	
	$(".head_title4").click(function(){
		if($(".buy_bid_window4").css("display") == "none")
	    {
	        $(".buy_bid_window4").show();
	        subs4.innerText = '- 즉시 판매 내역 ↑ (접기) -';
	        
	    } else {
	        $(".buy_bid_window4").hide();
	        subs4.innerText = '- 즉시 판매 내역 ↓ (펼치기) -';
	    }
	});
</script>