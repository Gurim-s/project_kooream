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
      margin-top: 7px;
      width: 100%;
      font-size: 14px;
      letter-spacing: -.21px;
      color: rgba(34,34,34,.5);
      height: 44px;
       border-radius: 10px;
       border: 1px solid #ebebeb;   
       background-color: #fafafa;
       -webkit-box-align: center;
       align-items: center;
       padding: 14px 12px;
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
  <sec:authentication property="principal.member" var="pri"/>	<!-- 시큐리티에서 member정보 가지고오기  -->
	<form action="/Payment/addpayment" id="myForm" method="post">
		<div class="buy_before">
<!-- -------------------------------------상품 리스트 보여주기----------------------------------------------------------------  -->
			<div class="product_info">
				<div class = "infobox">
					<c:forEach var="product" items="${productList }" varStatus="i">
						<c:url value="/displayImage" var="imgSrc">
							<c:param name="fileName" value="${product.attachList.get(0).uploadPath }/${product.attachList.get(0).uuid }_${product.attachList.get(0).fileName }"></c:param>
						</c:url>
							<img class="product_image" alt="상품이미지" src="${imgSrc }">
								<div class="code">${product.p_model_no}</div>
								<div class="name">${product.p_name_en }</div>
								<div class="kor_name">${product.p_name_ko }</div>
								<div class="p_size">${product.sizeVoList.get(0).pp_size }</div>
								<%-- <div class="p_size">${product.p_release_price}</div> --%>
								<input type="hidden" class = "price" name ="paymentList[${i.index }].pay_price"  value="${product.p_release_price}"/>
								<input type="hidden" class = "pno" name ="paymentList[${i.index }].p_no" value="${product.p_no}"/>
					</c:forEach>
								
				</div>
			</div>
<!-- -------------------------------------주소 추가----------------------------------------------------------------  -->
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
               <!-- <a href="#" class="delivery_info">
                  <span class="guide_txt">
                     주소를 입력해주세요.
                  </span>
               </a> -->

<!-- -------------------------------------배송 관련----------------------------------------------------------------  -->
					<div class="shipping_memo">
						<input type="text" class="button_shipping">
							<span class="button_shipping_memo">배송 시 요청사항을 선택하세요.</span>						
						
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
<!-- -------------------------------------상품 합계----------------------------------------------------------------  -->
			<div class="section_total">
				<div class="section_title">
					<h3 class="title_txt">최종 주문 정보</h3>
				</div>
				<div class="instant_group">
					<div class="order_info">
						<dl class="price_box">
							<dt class="price_title">총 결제금액</dt>
							<dd class="price empty_price">
								<span class="amount"></span>
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
<!-- -------------------------------------결제----------------------------------------------------------------  -->
			<div class="section_total">
				대충 결제 공간
			</div>
<!-- -------------------------------------체크박스----------------------------------------------------------------  -->
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
									<input type="checkbox" class="chbox" >
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
<!-- -------------------------------------상품 총 금액----------------------------------------------------------------  -->
					<div class="price_total">
						<dl class="price_box2">
							<dt class="price_title3">총 결제금액</dt>
							<dd class="empty_price2"></dd>
						</dl>
					</div>
<!-- -------------------------------------결제버튼----------------------------------------------------------------  -->
					<div class="now_buy_btn">
						<button type="button" class="btn_box full" id="gopayment" >결제 하기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소 api 사용하기 위해 명시 -->
<script type="text/javascript">


$(function(){
	
//-------------------------------------------------------기본배송지 체크박스 클릭 이벤트
	$("#copyAddr").on("click", function(){
		if($(this).is(':checked')){
			var addrList = "${pri.m_addr}".split("/");
		    $("#sample6_address").val(addrList[0]);
		    $("#sample6_detailAddress").val(addrList[1]);
		}else{
			$("#sample6_address").val("");
			$("#sample6_detailAddress").val("");
		}
	});	

//-------------------------------------------------------체크박스 + 구매하기 클릭시	
	$(document).on("click","#gopayment",function(){
	    var check=0;
		$(".chbox").each(function(idx,item){ // idx 순서 , item 들어가는 값
		    if(!$(item).is(':checked')){	//	check가 되어있지 않으면 
		       alert("전체 동의 후 결제 가능합니다.");
		       check=1;
		       return false;	// 반복문 밖으로 나감
		    }
		});
		
		
		
		
	 
		if(check==0){

			var form = $('#myForm');
			var str = '';
			var ad = $("#sample6_address").val() +  $("#sample6_detailAddress").val();
			$(".pno").each(function(index, item){
				str += '<input type="hidden" class = "paddr" name ="paymentList['+index+'].m_adress" value="'+ad+'"/>';
			});
			form.append(str);
			//console.log(form.serialize());
			form.submit();
		}
			 


	});
		
//-------------------------------------------------------상품합계	

 	var priceList = Array.from($('input.price'));	// jquery 문법으로 변경(?)
 	//var priceList = $('input.price');	// jquery 문법으로 변경 // 이게뭐야,,, 너무 어려운걸,, 찾아보자,,
 		
		console.log(priceList);

 		var price = 0;
		var sum = 0;

			for(var i=0; i<priceList.length; i++) {
				sum += Number(priceList[i].value);	// 배열에서 price값 꺼내오기
				console.log(sum);
			}
			
			$('.price_text').html(sum.toLocaleString('ko-KR'));
			$('.empty_price2').html(sum.toLocaleString('ko-KR'));
			$('.amount').html(sum.toLocaleString('ko-KR'));

			
//-------------------------------------------------------기본배송지 체크박스 클릭 이벤트
	$("#copyAddr").on("click", function(){
		if($(this).is(':checked')){
			var addrList = "${pri.m_addr}".split("/");
		    $("#sample6_address").val(addrList[0]);
		    $("#sample6_detailAddress").val(addrList[1]);
		}else{
			$("#sample6_address").val("");
			$("#sample6_detailAddress").val("");
		}
	});	




});	// $(function ()) 함수 끝			
	
//-------------------------------------------------------주소 api
	function sample6_execDaumPostcode() {
	   new daum.Postcode({
	        oncomplete: function(data) {
	           document.getElementById("sample6_address").value = data.address; // 주소 넣기
	            document.querySelector("#sample6_detailAddress").focus(); //상세입력 포커싱
	        }
	   }).open();
	}
		
		





















</script>
<jsp:include page="../include/footer.jsp"/>