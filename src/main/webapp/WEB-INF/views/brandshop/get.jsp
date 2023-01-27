<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	}
	.admin_btn button{
		width: 100%;
	}
	.brand_member {
		border: 1px solid black;
		border-collapse: collapse;
		width: 100%;
	}
	.full{
		position: center;
		
	}
     .modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.show {
        display: block;
      }

      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;

        width: 400px;
        height: 600px;

        padding: 40px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
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
	




</style>
</head>
<body>
	<div>
		<h1 class="page-header"> 상세보기 페이지</h1>
	</div>
		<div >
			<%-- <label>상품 번호</label>
			<input name ="p_no" value="${vo.p_no }" readonly="readonly"/> --%>
<!-- 			<label>상품 메인 이미지</label> -->
				<div class= "brand">
					<ul>
						<li>
<%-- 							<c:url var="imgSrc" value="${vo.attachList.get(0).uploadPath + vo.attachList.get(0).uuid +vo.attachList.get(0).fileName}" /> --%>
<%-- 							<c:out value="imgSrc"></c:out> --%>
<!-- 							<img src="/brandfile/display?fileName=   "/> -->
							
							<c:url value="/brandfile/display" var="imgSrc"><!-- c:url 자동 인코딩  -->
								<c:param name="fileName" value="${vo.attachList.get(0).uploadPath }/${vo.attachList.get(0).uuid }_${vo.attachList.get(0).fileName }"></c:param>
								<!-- get(0)은 attachList가 list 형태이기 때문에 맨 처음 사진만 불러오려고 0번으로 지정해서 불러오는 중임 -->
							</c:url>
							<img alt="상품이미지" src="${imgSrc }">
						</li>
					</ul>
				</div>
			<%-- <div>
			${vo.b_name }"</div> --%>
				<div class = "p_right">
				<div>${vo2.b_name }</div>
				<div>${vo.p_name_en }</div>
				<div>${vo.p_name_ko }</div>
			<br/>
			<div><span>옵션</span></div>
			<div class = "modal">
				<div class="modal_body">사이즈 선택
					<div>
						<hr/>
						<br/><br/><br/>
						<button style="width: 300px;">FREE</button>
					</div>
				</div>
			</div>
			<button class="btn_size">옵션선택</button>
			<!-- <span style="font-size: 20px; float: right;">옵션선택</span></a></div> -->
			<br/>
			<br/>
			<hr/>
		
			<br/>
			<div>구매가</div>
			<div><span style="font-size: 25px; float: right;">${vo.p_release_price }원</span></div>
			<br/>
			<br/>
			<div class = "btn">
			<button id = "product_buy" style="background: red; color: white;">구매하기</button><br/>
			<br/>

				<button type="button" id="product_cart">장바구니</button><br/>

			
			<br/>
			</div>
			<div class = "admin_btn"><!--  버튼 이어 붙이기,,,,, -->
			<button type="button" id = "product_modify"> 수정하기</button><!--  관리자만 볼 수 있게 -->
			<!-- <button type="button" id = "product_remove"> 삭제하기</button> -->
			</div>
				<form action="/brandshop/modify" method="get" id="operForm">
				<%-- <input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }"> --%>
			</form>
			<br/>
			</div>
			<div>
				<p>배송정보</p>
				<p>브랜드배송 무료</p>
				<p>입점한 브랜드에서 직접 택배 배송</p>
			</div>
	</div>
	
	
	<div class = "full" >
	<br/>
	<br/>
		<ul class = "top-menu">

		<li><a href = "#tag1">상품상세보기</a></li>
		<li><a href = "#tag2">교환 및 반품</a></li>
		<li><a href = "#">스타일</a></li>
		</ul>

	<br/>
	<br/>
	<br/>
	<br/>
	
	<div  style="margin-left:auto; margin-right:auto; text-align: center;">본 상품은 '${vo2.b_name }' 브랜드 판매자가 배송하는 상품입니다.</div>
	</div>
	<a name = "tag1"></a>
	<div style="margin: 100px;">
	<ul>
		<li>
		<c:forEach var="index" begin="1" end="${vo.attachList.size() - 1 }" step="1"> 
		<!-- 메인이미지 제외(0번)하고 1번부터 for문 시작해서 끝은 리스의 길이는 size라고 함 근데 -1 해줘야함 검색해보기 -->
			<c:set var="attachDate" value="${vo.attachList.get(index) }"></c:set>
		<!-- index가 1 부터 list 끝까지 / get안에 index를 넣어서 그 길이만큼 for문 돌리기   -->
			<c:url value="/brandfile/display" var="imgSrc"><!-- c:url 자동 인코딩  -->
				<c:param name="fileName" value="${attachDate.uploadPath }/${attachDate.uuid }_${attachDate.fileName }"></c:param>	
			</c:url> <!-- if문  -->
			<img alt="상품이미지" src="${imgSrc }" style="float: center;">
		</c:forEach>
		
		</li>
	
	</ul>
	</div>
	<div class = "brands">
	</div>
	<br/>

	<a name = "tag2"></a>
	<h3>판매자 정보</h3>
	<br/>
	<table class="brand_member" border="1" >
		<tr>
			<th>상호명</th>
			<td>&nbsp; ${vo2.b_name }</td>
		</tr>
		<tr>
			<th>사업자 등록번호</th>
			<td>&nbsp; ${vo2.b_bnum }</td>
		</tr>
		<tr>
			<th>대표자</th>
			<td>&nbsp; ${vo2.b_boss }</td>
		</tr>
		<tr>
			<th>사업장 소재지</th>
			<td>&nbsp; ${vo2.b_badress }</td>
		</tr>
		<tr>
			<th>고객센터</th>
			<td>&nbsp; ${vo2.b_managernum }</td>
		</tr>
		
	</table>
	<br/>
	<br/>
	
		<h3>교환 및 반품 안내</h3>
	<br/>
	<table class="brand_member" border="1" >
		<tr>
			<th>교환/반품 접수 방법 및 기간</th>
			<td>
				&nbsp; • 구매자 단순 변심으로 인한 교환/반품 가능 기간은 상품 수령일로부터 7일 이내이며 배송비는 구매자가 부담합니다.<br/>
				&nbsp; • 상품이 표시/광고내용과 다르거나 제품의 하자의 경우 상품 수령일로부터 3개월 이내, 또는 사실을 알게된 날 (알 수 있었던 날)부터 30일 이내&nbsp; &nbsp; &nbsp; 에  신청 가능하며 배송비는 판매자가 부담합니다.<br/>
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
				&nbsp; • 교환/반품 비용 및 지불 방식은 상품 및 교환/반품 사유에 따라 상이할 수 있으므로 반품/교환 접수 시 최종 내용을 확인하시기 바랍니다.<br/>
				&nbsp; • 제주/도서산간 지역은 추가 운임이 발생할 수 있습니다.<br/>
			</td>
		</tr>
		<tr>
			<th>교환/반품 불가 사유</th>
			<td>
				&nbsp; • 구매회원의 단순변심으로 인한 교환/반품 요청이 상품 등을 수령한 날로부터 7일을 경과한 경우·구매회원의 귀책사유로 상품이 멸실·훼손된 경&nbsp; &nbsp; &nbsp; 우(다만, 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외함)<br/>
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
	


<script type="text/javascript">

//	const body = document.querySelector('body');
//	const modal = document.querySelector('.modal');
//	const btn_size = document.querySelector('.btn_size');
	
//	btn_size.addEventListener('click', () => {
//	  modal.classList.toggle('show');
	
//	  if (modal.classList.contains('show')) {
//	    body.style.overflow = 'hidden';
//	  }
//	});
	
//	modal.addEventListener('click', (event) => {
//	  if (event.target === modal) {
//	    modal.classList.toggle('show');
	
//	    if (!modal.classList.contains('show')) {
//	      body.style.overflow = 'auto';
//	    }
//	  }
//	});


$(function () {	// 수정페이지로 이동

	var operForm = $("#operForm");
	
	var pno = '${vo.p_no}';	
	var bno = '${vo.b_no}';	


	
	$("#product_modify").click(function () {
		location.href="/brandshop/modify?p_no=${vo.p_no}&b_no=${vo.b_no}"

	});


	$("#product_cart").click(function (e) {
		e.preventDefault();
		//var formData = $("#form1").serialize();
		console.log("gggggggggggggggggggggggggg");
		$.ajax({
			url : "/brandCart/addCart",	
			type : "POST",	// post or get
			//datetype :'form',	// form이 아닐 경우에만 json
			data : {p_no:pno, b_no:bno}, // 가지고 갈 값 적기 // 컬럼명 값
			dataType : 'json',
			success : function (result) {
				alert("카트담기 성공")
			},
			error : function () {
				alert("카트 담기 실패")
			}
					
			});
			
		});
});
		
		








</script>

</body>
</html>
<jsp:include page="../include/footer.jsp"/>
