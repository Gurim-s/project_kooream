<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> <!-- 관리자 권한 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../include/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.div{
		width : 100%;		
	}
	.brand{
		width : 50%;
		float : left;
	}
	.p_right{
		width : 50%;
		float : right;
	}
	.full{
		clear: both;
	}
	.btn button{
		width: 100%; 
		height: 50px;
		border-radius : 8px;
		border: none;
		cursor:pointer;
		font-size: 17px;
	}
	.admin_btn button{
		width: 100%;
	}
	.brand_member {
		border-left:1px solid black;
		border-collapse: collapse;
		width: 100%;
		height: 200px;
		border-right:none;
		border-left:none;
	}
	.brand_member th{
		background-color: #fafafa;
		width: 230px;
	
	}
	.full{
		position: center;
		
	}
    .top-menu li a{
        display: inline-block;
		text-align: center;
		width: 300px;
		padding: 20px;
		text-decoration: none;
		color: black;
		font-size: 15px;

	}

	.top-menu{
		text-align: center;	/* top-menu 가운데 정렬  */
	}
	
	.top-menu li{ 
		display: inline-block;	/* top-menu 리스트 가로정렬  */
	}
	#product_buy{
		background-color: rgb(239, 98, 83); 
		color: white;
	}
	#popup01{
	    display: none;
	}
	#popup01{
		width: 400px;
		height: 600px;
		position: absolute;
		top: 50%;	/* 모달창 가운데로 위치시키기  */
		left: 50%;	/* 모달창 가운데로 위치시키기  */
		margin: -250px 0 0 -250px; /* 모달창 가운데로 위치시키기  */
		background-color: #fff;
		border-radius: 10px;
		z-index: 2;
	 	padding: 40px; 
		text-align: center;
	}
	.backon{			/* 모달 뒷배경 */
	    content: "";
	    width: 100%;
	    height: 100%;
	    background: #00000054;
	    position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 1;
	}
	.sizebtn{
		background : white;
		width : 60%;
		height : 40px;
		border-radius : 5px;
		border-color: gray;
		outline: 0;
		cursor:pointer;
	}
	.close{				/*  닫기버튼 */
		position:absolute;
		top:25px;
		right: 25px;
		cursor:pointer;
	}
	.sizeok{
		bottom: 40px;
		left : 15%;
		position:absolute;	/* 적어야 밑으로 내려감,,  */
		width: 70%;
		cursor:pointer;
		height: 40px;
		background: black;
		color : white;
		border-radius : 8px;
		
	}
	.openPopup{
		cursor:pointer;	/* 버튼클릭시 마우스커서 손가락모양으로 변경 */
		border: none;
		background: none;
	}
	.v-line {
		border-left: 1px solid  #ebebeb ;
		height:52%;
	 	left: 47.5%;
	 	position: absolute;
	 	color: gray;
	}
	.sizee{
		font-size: 20px;
		font-weight: bold;
	}
	#topButton {
	position: fixed; 
	right: 5%; bottom: 50px; 
	display: none; 
	z-index: 999;
	width: 50px;
	}

  

</style>
</head>
<body>
<div id="topButton" style="cursor: pointer"><img src="../resources/img/top.png" id="topButtonImg"></div>
		
<!-- ------------------------------------------이미지 보여주기---------------------------------------------------- -->
<div class= "brand">
	<ul>
		<li>
<%-- 		<c:url var="imgSrc" value="${vo.attachList.get(0).uploadPath + vo.attachList.get(0).uuid +vo.attachList.get(0).fileName}" /> --%>
<%-- 		<c:out value="imgSrc"></c:out> --%>
<!-- 		<img src="/brandfile/display?fileName=   "/> -->
							
			<c:url value="/displayImage" var="imgSrc"><!-- c:url 자동 인코딩  -->
				<c:param name="fileName" value="${vo.attachList.get(0).uploadPath }/${vo.attachList.get(0).uuid }_${vo.attachList.get(0).fileName }"></c:param>
				<!-- get(0)은 attachList가 list 형태이기 때문에 맨 처음 사진만 불러오려고 0번으로 지정해서 불러오는 중임 -->
			</c:url>
				<img alt="상품이미지" src="${imgSrc }">
		</li>
	</ul>
</div>
<div class="v-line"></div>
<!-- ------------------------------------------ 상품 정보---------------------------------------------------------- -->
<div class = "p_right"><!-- 상품정보 오른쪽 정렬시작 -->
	<div style="font-size: 18px; font-weight: bold; text-decoration: underline; text-decoration-thickness : 2px; margin: 2px;">${vo.b_name }<img style= "width : 25px;  " src =../resources/img/check.png/></div>
	<div style=" margin: 2px; font-size: 18px;">${vo.p_name_en }</div>
	<div style="font-size: 14px; color: gray; margin: 2px;">${vo.p_name_ko }</div>
<br/>
<!-- ------------------------------------------ 옵션선택(모달창) ---------------------------------------------------- -->
<div id="popup01">
	<div class="close">X</div>
		<div class="modal_body">옵션<br/><br/><br/><br/>

			<c:forEach var="size" items="${sizeVOlist}">
				<button class = "sizebtn" >${size.pp_size }</button><br/><br/>
			</c:forEach>
				<button class = "sizeok">선택확인</button>
		</div>
</div>
<div class = "sizesee" style="float: right;"></div>
<button style="font-size: 15px;" class="openPopup">옵션선택  ▼</button><br/>
<!-- ------------------------------------------ 구매가격 ---------------------------------------------------- -->
<br/><hr/>
<div style="margin: 8px;">구매가
	<span style="font-size: 23px; float: right; font-weight: bold;"><fmt:formatNumber value="${vo.p_release_price }" pattern="#,###,###원"/></span></div>
	<br/>
<!-- ------------------------------------------ 버튼 ---------------------------------------------------- -->
<div class = "btn">
	<button style="font-weight: bold;" type="button" id="product_buy">구매하기</button><br/><br/>
	<%-- <input type="hidden" name="p_noList" value = "${vo.p_no }" />  form으로 보내기--%>
	<button type="button" id="product_cart">장바구니</button><br/><br/>
		<input type="hidden" name = "pp_size" value = "">
</div>
	<div class = "admin_btn"><!--  버튼 이어 붙이기,,,,, -->
		<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
			<button style="border: none; cursor:pointer; height: 30px;" type="button" id = "product_modify"> 수정하기</button><!--  관리자만 볼 수 있게 -->
		</sec:authorize>
		
		
		<!-- <button type="button" id = "product_remove"> 삭제하기</button> -->
	</div>
		<form action="/brandshop/modify" method="get" id="operForm">
	
		</form>

<!-- ------------------------------------------ 배송 관련 ---------------------------------------------------- -->
<div>
	<p style="margin: 8px;">배송정보</p>
	<img style="width:40px; float:left; margin: 8px;" src="../resources/img/box.png"/>
	<div style="float:left; font-size: 13px; font-weight: bold;"><p>브랜드배송 무료</p></div><br/>
	<p style=" font-size: 13px;">입점한 브랜드에서 직접 택배 배송</p>
</div>
<!-- ------------------------------------------ 광고 배너---------------------------------------------------- -->
<br/>
<div>
	<img style="width: 100%; height: 70px;" class = "add_img" src="../resources/img/add.jpg"/>
</div>
</div><!-- 상품정보 오른쪽 정렬 끝 -->
<!-- ------------------------------------------ 중간 메뉴 ---------------------------------------------------- -->	
<div class = "full" >
	<br/>
	<br/>
	<hr/>
		<ul class = "top-menu">
			<li><a href = "#tag1">상품상세보기</a></li>
			<li><a href = "#tag2">판매자 정보</a></li>
			<li><a href = "#tag3">교환 및 반품</a></li>
		</ul>
	<hr/><br/><br/><br/><br/>
	
	<div  style="margin-left:auto; margin-right:auto; text-align: center;">본 상품은 '${vo.b_name }' 브랜드 판매자가 배송하는 상품입니다.</div>
</div>
	<a name = "tag1"></a>
<!-- ------------------------------------------ 상세이미지 ---------------------------------------------------- -->	
<div style="margin: 100px;">
	<ul>
		<li>
		<c:forEach var="index" begin="1" end="${vo.attachList.size() - 1 }" step="1"> 
		<!-- 메인이미지 제외(0번)하고 1번부터 for문 시작해서 끝은 리스트의 길이는 size라고 함 근데 -1 해줘야함 검색해보기 -->
			<c:set var="attachDate" value="${vo.attachList.get(index) }"></c:set>
		<!-- index가 1 부터 list 끝까지 / get안에 index를 넣어서 그 길이만큼 for문 돌리기   -->
			<c:url value="/displayImage" var="imgSrc"><!-- c:url 자동 인코딩  -->
				<c:param name="fileName" value="${attachDate.uploadPath }/${attachDate.uuid }_${attachDate.fileName }"></c:param>	
			</c:url> <!-- if문  -->
				<img alt="상품이미지" src="${imgSrc }" style="float: center;">
		</c:forEach>
		</li>
	</ul>
</div>

	<br/>
<!-- ------------------------------------------ 판매자 정보 ---------------------------------------------------- -->	
<a name = "tag2"></a>	
<br/>
<h3>판매자 정보</h3>
	<br/>
	<table class="brand_member" border="1" >
		<tr>
			<th>상호명</th>
			<td>&nbsp; ${vo.b_name }</td>
		</tr>
		<tr>
			<th>사업자 등록번호</th>
			<td>&nbsp; ${vo.b_bnum }</td>
		</tr>
		<tr>
			<th>대표자</th>
			<td>&nbsp; ${vo.b_boss }</td>
		</tr>
		<tr>
			<th>사업장 소재지</th>
			<td>&nbsp; ${vo.b_badress }</td>
		</tr>
		<tr>
			<th>고객센터</th>
			<td>&nbsp; ${vo.b_managernum }</td>
		</tr>
		
	</table>
	<br/>
	<br/><br/>
<!-----------지도 API ------------->
<h3>사업장 위치</h3>
<br/>
<div>${vo.b_badress }</div><br/>
<div id="map" style="width:100%; height:400px;"></div>
	<br/>
	<br/>
<!-- ------------------------------------------ 교환 및 반품 안내 ---------------------------------------------------- -->		
<br/>
<a name = "tag3"></a>
<h3>교환 및 반품 안내</h3>
	<br/>
	<table class="brand_member" border="1" >
		<tr>
			<th>교환/반품 접수 방법 및 기간</th>
			<td>
				&nbsp; • 구매자 단순 변심으로 인한 교환/반품 가능 기간은 상품 수령일로부터 7일 이내이며 배송비는 구매자가 부담합니다.<br/>
				&nbsp; • 상품이 표시/광고내용과 다르거나 제품의 하자의 경우 상품 수령일로부터 3개월 이내, 또는 사실을 알게된 날 (알 수 있었던 날)부터 &nbsp; &nbsp; &nbsp;30일 이내에  신청 가능하며 배송비는 판매자가 부담합니다.<br/>
				&nbsp; • 교환/반품 시 먼저 판매자와 사유, 택배사, 배송비, 반품 주소 등을 협의하신 후 반품 상품을 발송해주세요.<br/>
				&nbsp; • 동일 상품 내 추가 금액이 없는 옵션만 교환 가능합니다.<br/>
				&nbsp; • 출고 이후 교환/반품/환불 요청 시 상품 회수 후 처리됩니다.<br/>
			</td>
		</tr>
		<tr>
			<th>교환/반품 비용</th>
			<td>
				&nbsp; • 반품 배송비: 4,000원<br/>
				&nbsp; • 교환 배송비: 4,000원<br/>
				&nbsp; • 최초 배송비가 무료일 경우, 왕복 배송비(반품 배송비+최초 배송비)가 부과됩니다.<br/>
				&nbsp; • 교환/반품 비용 및 지불 방식은 상품 및 교환/반품 사유에 따라 상이할 수 있으므로 반품/교환 접수 시 최종 내용을 확인하시기 바&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;랍니다.<br/>
				&nbsp; • 제주/도서산간 지역은 추가 운임이 발생할 수 있습니다.<br/>
			</td>
		</tr>
		<tr>
			<th>교환/반품 불가 사유</th>
			<td>
				&nbsp; • 구매회원의 단순변심으로 인한 교환/반품 요청이 상품 등을 수령한 날로부터 7일을 경과한 경우·구매회원의 귀책사유로 상품이 멸&nbsp; &nbsp; &nbsp;실·훼손된 경우(다만, 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외함)<br/>
				&nbsp; • 구매회원의 사용 또는 일부 소비 및 시간이 지나 다시 판매하기 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우<br/>
				&nbsp; • 복제가 가능한 재화 등의 포장을 훼손한 경우<br/>
				&nbsp; • 개별적으로 주문제작되는 상품으로 재판매가 불가능한 경우<br/>
				&nbsp; • 세트 상품 중 일부 상품만 보낸 경우<br/>
				&nbsp; • 교환/반품 접수 없이 상품을 임의로 반송했을 경우<br/>
				&nbsp; • 기타 관련 법령이 정하는 청약철회 제한사유에 해당하는 경우<br/>
			</td>
		</tr>

		
	</table>
	<br/>
	<br/>
	

<!-- ------------------------------------------ 스크립트 시작 ---------------------------------------------------- -->		
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b676d54f5b1a30b4b0cd24d103eede8"></script><!-- 지도 api사용 하기 위한 스크립트  -->
<script type="text/javascript">
$('#page-navigator').hide();

<!-- ------------------------------------------ 수정페이지 이동 ---------------------------------------------------- -->		
$(function () {	// 수정페이지로 이동

	var operForm = $("#operForm");
	var pno = '${vo.p_no}';	
	var bno = '${vo.b_no}';	
	var price ='${vo.p_release_price}';


	$("#product_modify").click(function () {
		location.href="/brandshop/modify?p_no=${vo.p_no}&b_no=${vo.b_no}"

	});
	
<!-- ------------------------------------------ 모달창 ---------------------------------------------------- -->		
	$(document).ready(function( $ ){     
		$(".openPopup").on("click", function(event) {  //팝업오픈 버튼 누르면
		$("#popup01").show();   //팝업 오픈
		$("body").append('<div class="backon"></div>'); //뒷배경 생성
		});
	    
	    $("body").on("click", function(event) { 
	    	if(event.target.className == 'close' || event.target.className == 'backon'){
	            $("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
	            $(".backon").hide();
	        }
	    });
	 
	});
	
<!-- ------------------------------------------ 사이즈선택  ---------------------------------------------------- -->	
	
	$(document).on("click",".sizebtn", function () {
		var sizeval =  $(this).text();
		$(".sizesee").html('<div class = "sizee" >'+ sizeval +'</div>');
			$(document).on("click",".sizeok", function () {
				console.log(sizeval);
				
				if(sizeval != null){
					$(".sizesee").html('<div class = "sizee" >'+ sizeval +'</div>');
            		$("#popup01").hide(); //확인버튼 이거나 뒷배경 클릭시 팝업 삭제
            		$(".backon").hide();
           			$("input[name='pp_size']").attr('value', sizeval);
			
				} else if(sizeval == null){	// else 는 ()안돼!!!
					alert("사이즈 선택 후 선택완료 눌러주세요");
				}; 
				
			});

	});

<!-- ------------------------------------------ 장바구니 담기 ---------------------------------------------------- -->	
	$("#product_cart").click(function (e) {
 		e.preventDefault();
		//var formData = $("#form1").serialize();
		var sizeval = $("input[name='pp_size']").val()
			if (sizeval.length == 0){
				alert("사이즈를 선택해 주세요");
				return;
			}
			console.log("gggggggggggggggggggggggggg");
			$.ajax({
				url : "/brandCart/addCart",	
				type : "POST",	// post or get
				//datetype :'form',	// form이 아닐 경우에만 json
				data : {p_no:pno, b_no:bno, pp_size:sizeval}, // 가지고 갈 값 적기 // 컬럼명 값
				dataType : 'json',
				success : function (result) {
					var confirm_val = confirm("장바구니에 추가되었습니다. 장바구니 페이지로 이동하시겠습니까?");
						if(confirm_val){
							location.href="/brandCart/brandCart"
						}else{
							
						}
				},
				error : function () {
					alert("카트 담기 실패");
				}
						
			});
				
	});
	
<!-- ------------------------------------------ 구매하기  ---------------------------------------------------- -->	
	$("#product_buy").click(function (e) {
		e.preventDefault();	
		var sizeval = $("input[name='pp_size']").val()
			if (sizeval.length == 0){
				alert("사이즈를 선택해 주세요");
				return;	
			}else{
				var confirm_val = confirm("구매하시겠습니까? 확인누르시면 구매창으로 이동합니다");
					if(confirm_val){	
					location.href= '/Payment/payment?p_noList=${vo.p_no}';	// p_noList 보내기,,!!!
					
					}
			}
	});
	
<!-- ------------------------------------------ 맨위로 가는 버튼  ---------------------------------------------------- -->		
	 $(document).ready(function() {

			$(window).scroll(function() {
			    // top button controll
			    if ($(this).scrollTop() > 500) {
			        $('#topButton').fadeIn();
			    } else {
			        $('#topButton').fadeOut();
			    }
			});

			$("#topButtonImg").click(function() {
				$('html, body').animate({scrollTop:0}, '300');
			});

	});
<!-- ------------------------------------------ 지도 api  ---------------------------------------------------- -->			 
		var bno = '${vo.b_no}';	
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var b_51 = {  //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.5214207, 127.0269771), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		
		var b_52 = {  //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.5545094,126.9182184), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
		var b_53 = {  //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
		var b_54 = {  //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.5484274,126.9224548), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
		
		var b_55 = {  //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.5473901, 127.0540434), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
			
		if(bno == 51){
			var map = new kakao.maps.Map(container, b_51); //지도 생성 및 객체 리턴
		}else if(bno == 52){
			var map = new kakao.maps.Map(container, b_52);
		}else if(bno == 53){
			var map = new kakao.maps.Map(container, b_53);
		}else if(bno == 54){
			var map = new kakao.maps.Map(container, b_54);
		}else if(bno == 55){
			var map = new kakao.maps.Map(container, b_55);
		}
		
		var marker = new kakao.maps.Marker();

		// 타일 로드가 완료되면 지도 중심에 마커를 표시합니다
		kakao.maps.event.addListener(map, 'tilesloaded', displayMarker);

		function displayMarker() {
		    
		    // 마커의 위치를 지도중심으로 설정합니다 
		    marker.setPosition(map.getCenter()); 
		    marker.setMap(map); 
	
		}
	
	

/* 	$("#product_buy").click(function (e) {
		e.preventDefault();
		var sizeval = $("input[name='pp_size']").val()
		var price ='${vo.p_release_price}';
			if (sizeval.length == 0){
				alert("사이즈를 선택해 주세요");
				return;
			}
			$.ajax({
				url : "/Payment/addpayment",
				type : "POST",
				data : {p_no:pno, b_no:bno, sum_price:price, pp_size:sizeval },
				dataType : 'json',
				success : function (result) {
					location.href = "/Payment/payment" //  location.href 기본적으로 getMapping
				},
				error : function () {
					alert("구매하기 실패")
				}
			}); 
			
	});
 */
}); // $(function () { 끝


</script>

</body>
</html>
<jsp:include page="../include/footer.jsp"/>
