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
  <sec:authentication property="principal.member" var="pri"/>	<!-- ?????????????????? member?????? ???????????????  -->
	<form action="/Payment/addpayment" id="myForm" method="post">
		<div class="buy_before">
<!-- -------------------------------------?????? ????????? ????????????----------------------------------------------------------------  -->
			<div class="product_info">
				<div class = "infobox">
					<c:forEach var="product" items="${productList }" varStatus="i">
						<c:url value="/displayImage" var="imgSrc">
							<c:param name="fileName" value="${product.uploadPath }/s_${product.uuid }_${product.fileName }"></c:param>
						</c:url>
							<img class="product_image" alt="???????????????" src="${imgSrc }">
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
<!-- -------------------------------------?????? ??????----------------------------------------------------------------  -->
			<div class="section_total">
				<div class="section_unit">
					<div class="section_title">
                  <h3 class="title_txt">?????? ??????</h3>
                  <!-- <a href="#" class="add_more_btn">+ ??? ?????? ??????</a> -->
               		</div> 
               			<input type="checkbox" id="copyAddr">?????? ???????????????
               		 <div><input type="text" class="guide_txt" 
                                 id="sample6_address" 
                                 name="m_addr" onclick="sample6_execDaumPostcode()" 
                                 placeholder="????????? ??????????????????."></div>
               <div><input type="text" class="guide_txt" id="sample6_detailAddress" name="m_Detail_addr" placeholder="??????????????? ???????????????."></div>
              		<input type="hidden" name = "m_adress" value="">
               <!-- <a href="#" class="delivery_info">
                  <span class="guide_txt">
                     ????????? ??????????????????.
                  </span>
               </a> -->

<!-- -------------------------------------?????? ??????----------------------------------------------------------------  -->
					<div class="shipping_memo">
						<input type="text" class="button_shipping">
							<span class="button_shipping_memo">?????? ??? ??????????????? ???????????????.</span>						
						
					</div>
				</div>
				<div class="section_unit2">
					<div class="section_title">
						<h3 class="title_txt"> ?????? ??????</h3>
					</div>
					<div class="section_content">
						<div class="delivery_option">
							<div class="way_info">
								<div class="way_status">
									<img src="/resources/img/deliverycar.png" class="way_img">
								</div>
								<div class="way_desc">
									<p class="company">
										<span class="badge_title">????????? ??????</span>
										<span>??????</span>
									</p>
									<p class="sub_txt">
									????????? ??????????????? ?????? ?????? ??????
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- -------------------------------------?????? ??????----------------------------------------------------------------  -->
			<div class="section_total">
				<div class="section_title">
					<h3 class="title_txt">?????? ?????? ??????</h3>
				</div>
				<div class="instant_group">
					<div class="order_info">
						<dl class="price_box">
							<dt class="price_title">??? ????????????</dt>
							<dd class="price empty_price">
								<span class="amount"></span>
							</dd>
						</dl>
					</div>
					<div class="price_bind">
						<dl class="price_addition">
							<dt class="price_title"><span>?????????</span></dt>
							<dd class="price_text"></dd>
						</dl>
						<dl class="price_addition">
							<dt class="price_title2"><span>?????????</span></dt>
							<dd class="price_text2">????????? ??????</dd>
						</dl>
					</div>
				</div>
			</div>

<!-- -------------------------------------????????????----------------------------------------------------------------  -->
			<div class="section_total">
				<div>
					<ul class="check_list">
						<li>
							<div class="notice_group">
								<div>
									<input type='checkbox' name="check_all" value='selectall' onclick='selectAll(this)'/> 
								<b>?????? ??????</b>
							</div>
							</div>
							<div class="notice_group notice2">
								<div class="text_group">
									<p class="notice_maintext">??????????????? ???3??? ????????? ???????????????.</p>
									<p class="notice_subtext">???????????????</p>
								</div>
								<div class="check_d">
									<input type="checkbox" class="chbox" name="check_all">
								</div>
							</div>
							<div class="notice_group notice2">
								<div class="text_group">
									<p class="notice_maintext">'????????????'??? ??????????????? ?????? ????????? ???????????????.</p>
								</div>
								<div class="check_d">
									<input type="checkbox" class="chbox" name="check_all">
								</div>
							</div>
							<div class="notice_group notice2">
								<div class="text_group">
									<p class="notice_maintext">?????? ????????? ?????? ??????????????????, ?????? ????????? ???????????????.</p>
								</div>
								<div class="check_d">
									<input type="checkbox" class="chbox" name="check_all">
								</div>
							</div>
						</li>
					</ul>
<!-- -------------------------------------?????? ??? ??????----------------------------------------------------------------  -->
					<div class="price_total">
						<dl class="price_box2">
							<dt class="price_title3">??? ????????????</dt>
							<dd class="empty_price2"></dd>
						</dl>
					</div>
<!-- -------------------------------------????????????----------------------------------------------------------------  -->
					<div class="now_buy_btn">
						<button type="button" class="btn_box full" id="gopayment" >?????? ??????</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<!-- ------------------------------------- ???????????? ?????? ----------------------------------------------------------------  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- ?????? api ???????????? ?????? ?????? -->
<!-- ???????????? -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- ???????????? ??? ! -->
<script type="text/javascript">
/* ?????? ??????  */
var IMP = window.IMP; // ?????? ??????
IMP.init("imp56461814"); // ???: imp00000000a
var check=0;
$(function(){
	
//-------------------------------------------------------??????????????? ???????????? ?????? ?????????
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

//-------------------------------------------------------???????????? + ???????????? ?????????	
	$(document).on("click","#gopayment",function(e){
		e.preventDefault();
// 	    var check=0;
		$(".chbox").each(function(idx,item){ // idx ?????? , item ???????????? ???
		    if(!$(item).is(':checked')){	//	check??? ???????????? ????????? 
		       alert("?????? ?????? ??? ?????? ???????????????.");
		       check=1;
		       return false;	// ????????? ????????? ??????
		    }
		});
// 	?????? ?????? requestPay() ?????? ?????? ?????? ?????? ????????? ?????? ????????? submit ?????? ?????????
		requestPay();
// 		if(check==0){
// 			var form = $('#myForm');
// 			var str = '';
// 			var ad = $("#sample6_address").val() +  $("#sample6_detailAddress").val();
// 			$(".pno").each(function(index, item){
// 				str += '<input type="hidden" class = "paddr" name ="paymentList['+index+'].m_adress" value="'+ad+'"/>';
// 			});
// 			form.append(str);
// 			//console.log(form.serialize());
// 			form.submit();
// 		}
	});
	
	//------------------------------------------------------- ?????? API
	function requestPay() {
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name : '?????????',
            amount : sum,
            buyer_email : 'iamport@siot.do',
            buyer_name : '???????????????',
            customer_uid: '??????' + new Date().getTime(),
            buyer_tel : '010-1234-5678',
            buyer_addr : '$("#sample6_address")'+'$("#sample6_detailAddress")',
            buyer_postcode : '123-456'
        }, function (rsp) { // callback
            if (rsp.success) {
                console.log(rsp);
                var msg = '????????? ?????????????????????.';
/*              msg += '??????ID : ' + rsp.imp_uid;
                msg += '?????? ??????ID : ' + rsp.merchant_uid;
                msg += '?????? ?????? : ' + rsp.paid_amount;
                msg += '?????? ???????????? : ' + rsp.apply_num; */
                alert(msg);
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
                
            } else {
                console.log(rsp);
                msg += '???????????? : ' + rsp.error_msg;
                alert(msg);
                return;
            }
            
        });
    }

//-------------------------------------------------------????????????	

 	var priceList = Array.from($('input.price'));	// jquery ???????????? ??????(?)
 	//var priceList = $('input.price');	// jquery ???????????? ?????? // ????????????,,, ?????? ????????????,, ????????????,,
 		
		console.log(priceList);

 		var price = 0;
		var sum = 0;

			for(var i=0; i<priceList.length; i++) {
				sum += Number(priceList[i].value);	// ???????????? price??? ????????????
				console.log(sum);
			}
			
			$('.price_text').html(sum.toLocaleString('ko-KR'));
			$('.empty_price2').html(sum.toLocaleString('ko-KR'));
			$('.amount').html(sum.toLocaleString('ko-KR'));

			




});	// $(function ()) ?????? ???			
	
//-------------------------------------------------------?????? api
	function sample6_execDaumPostcode() {
	   new daum.Postcode({
	        oncomplete: function(data) {
	           document.getElementById("sample6_address").value = data.address; // ?????? ??????
	            document.querySelector("#sample6_detailAddress").focus(); //???????????? ?????????
	        }
	   }).open();
	}
		
//------------------------------------------------------- ?????? ?????? ?????? 
function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('check_all');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}





















</script>
<jsp:include page="../include/footer.jsp"/>