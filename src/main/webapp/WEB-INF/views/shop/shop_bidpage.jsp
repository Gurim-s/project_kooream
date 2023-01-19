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
	}
	
	.all_box{
	margin-top: 20px;
	}
	
</style>


<div class="content_area">
	<div class="buy_before">
		<div class="product_info">
			<div class="infobox">
				<img class="product_image" src="../resources/img/ps5.png">
				<div class="product_infobox">
					<div class="code">DZ5485-612</div>
					<div class="name">Jordan 1 Retro High OG Chicago 2022</div>
					<div class="kor_name">조던 1 레트로 하이 OG 시카고 2022</div>
					<div class="badge_product">
						<img class="badge_logo" src="../resources/img/badge_logo.png">빠른배송
					</div>
				</div>
			</div>
			<div class="all_box">
				<div class="select_box"></div>
				<div class="select_box"></div>
				<div class="select_box"></div>
				<div class="select_box"></div>
				<div class="select_box"></div>
				<div class="select_box"></div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../include/footer.jsp"/>