<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- <link rel="stylesheet" href="/resources/css/codi/codi.css" /> -->
<jsp:include page="../include/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/codi/list.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 <script>
	 var IMP = window.IMP; // 생략 가능
	 IMP.init("imp56461814"); // 예: imp00000000a
    
        function requestPay() {
            IMP.request_pay({
                pg : 'kakaopay',
                pay_method : 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name : '상품명',
                amount : 100,
                buyer_email : 'iamport@siot.do',
                buyer_name : '구매자이름',
                customer_uid: '사람' + new Date().getTime(),
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                    var msg = '결제가 완료되었습니다.';
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    alert(msg);
                } else {
                    console.log(rsp);
                    msg += '에러내용 : ' + rsp.error_msg;
                    alert(msg);
                    return;
                }
                
            });
        }
    </script>

<body class="cordishop">
	
	 <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
	
	<div class="codi_box">

		<div class="social_title">
			<h1>Codi Shop</h1>
		</div>
		<br/>
		<div class="container social">
			<div class="keyword_brand">
				<div id="tag_List">
								
				</div>
			</div>
		</div>
		<div class="codi_search">
			<div class="search_btn">
				<select name="searchType" id="searchType">
					<option value="codi_title">제목</option>
					<option value="codi_content">내용</option>
					<option value="titcont">제목+내용</option>
					<option value="codimodel_name">모델명</option>
				</select>
				<input type="text" id="searchName"  name="searchName" placeholder="검색어 입력">
				<button id="searchBtn" class="btn_search search-btn">검색</button>
			</div>
		</div>
		<br/>
		<hr/>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
		<div class="codi_insert">
			<div class="insert_btn">
				<a href="/codishop/register" class="btn_search">코디 등록</a>
			</div>
			<br/>
			<hr/>
			<br/>
		</div>
		</sec:authorize>
		
		<div id="codi-list" class="clearfix">
			<div class="list-column" id="first">
			</div>
			<div class="list-column" id="second">
			</div>
			<div class="list-column" id="third">
			</div>
			<div class="list-column" id="force">
			</div>
		</div>
		<div class="More_btn">
			<a href="#" id="load" class="btn_More">더보기(MORE)</a>
		</div>
		
	</div>
</body>

<script type="module" src="/resources/js/codi/list.js"></script>


</html>
<jsp:include page="../include/footer.jsp"/>