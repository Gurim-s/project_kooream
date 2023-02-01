<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="../include/header.jsp"/>
<style>
	#categroyBox{
		width: 300px;
		margin-top: 160px;
		float:left;
		display:inline-block;
	}
	.category{
		padding: 16px 0;
		cursor: pointer;
    	border-bottom: 1px solid #ebebeb;
    	width: 180px;
    	font-weight: bold;
	}
	ul li{
		padding: 6px;
	}
	.hideMenu{
		display: none;
	}
	.category span{
		float: right;
    	margin-right: 11px;
    	font-size: 24px;
    	margin-top: -2px;
    	color: #00000061;
    	font-family: cursive
	}
	img{
		width: 195px;
	}
	#serachBox{
		width: 423px;
		margin: auto;
	}
	#serachValue{
		width: 387px;
	}
	#rPrdtBtn{
		margin-left: 815px;
	}
</style>
	<!-- 검색버튼 -->
	<div id="serachBox">
		<input type="text" id="serachValue" placeholder="상품명(한글,영문),브랜드명으로 검색하세요.">
		<button id="serchBtn">검색</button>
	</div>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
			<button id="rPrdtBtn">상품 등록</button>
		</sec:authorize>
	<!-- 좌측 카테고리 박스------------------------------------------------------- -->
	<div id="categroyBox">
		<form id="myForm" action="/rental/rentalList">
		<input type="hidden" id="searchKeyword" name="keyword"> <!-- 검색키워드 저장 -->
		<input type="hidden" id="orderValue" name="order"> <!-- 순서 저장 -->
			<ul>
				<li class="category">카테고리<span id="cSpan">+</span></li>
				<li class="hideMenu">
					<ul>
						<li>
							<input type="checkbox" class="ctgrType" id ="bag" value ="bag"/>&nbsp;&nbsp;<label for="bag">가방</label><br/>
						</li>
						<li>
							<input type="checkbox" class="ctgrType" id ="accessories" value ="accessories">&nbsp;&nbsp;<label for="accessories">패션잡화</label><br/>
						</li>
					</ul>
				</li>
				
				<li class="category">브랜드<span id="bSpan">+</span></li>
				<li class="hideMenu">
					<ul>
						<li>
							<input type="checkbox" id="allSlctBtn">&nbsp;&nbsp;<label for="allSlctBtn">전체보기</label><br/>
						</li>
						<li>
							<input type="checkbox" class="brandType" id ="9999" value ="9999">&nbsp;&nbsp;<label for="9999">GUCCI</label><br/>
						</li>
						<li>
							<input type="checkbox" class="brandType" id ="9998" value ="9998">&nbsp;&nbsp;<label for="9998">DIOR</label><br/>
						</li>
						<li>
							<input type="checkbox" class="brandType" id ="9997" value ="9997">&nbsp;&nbsp;<label for="9997">LOUISVUITTON</label><br/>
						</li>
						<li>
							<input type="checkbox" class="brandType" id ="9996" value ="9996">&nbsp;&nbsp;<label for="9996">CHANEL</label><br/>
						</li>
						<li>
							<input type="checkbox" class="brandType" id ="9995" value ="9995">&nbsp;&nbsp;<label for="9995">PRADA</label><br/>
						</li>
					</ul>
				</li>
				
				<li class="category">가격<span id="pSpan">+</span></li>
				<li class="hideMenu">
					<ul>
						<li>
							<input type="checkbox" class="price" id ="50000" value ="50000">&nbsp;&nbsp;<label for="50000">5만원이하</label><br/>
						</li>
						<li>
							<input type="checkbox" class="price" id ="100000" value ="100000">&nbsp;&nbsp;<label for="100000">10만원이하</label><br/>
						</li>
						<li>
							<input type="checkbox" class="price" id ="150000" value ="150000">&nbsp;&nbsp;<label for="150000">15만원이하</label><br/>
						</li>
					</ul>
				</li>
			</ul>
		</form>
	</div>
	<!-- 리스트 순서 필터 ----------------------------------------------------->
	<div>
		<select id="selectOrderID" name="selectOrder">
			<option value="popularity">인기순</option>
			<option value="recent">최신순</option>
			<option value="rowPrice">가격낮은순</option>
		</select>
	</div>
	
	<!-- 배너 이미지-------------------------------------------------------- -->
	<div class="slick" style="width:502px">
		<c:forEach var="image" items="${imageList }">
			<div style="width:700px"><img src="/display/${image.img_url }"/></div>
		</c:forEach>
	</div>
	
	<!-- 상품 리스트-------------------------------------------------------------- -->
	<div id="productList" style="display:inline-block;width:75%;margin-top:155px; magin-bottom:50px;">
		<div>검색하신 상품이 존재하지 않습니다.</div>
	</div>
	
	
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script  type="text/javascript">
	$(function(){ //------------------------------------------------------------------------------------onload start
		/*
		// 사진 슬라이드 효과 주기위한 옵션---배너----
		$('.slick').slick({
			  dots: true, //페이지 네비게이션
			  arrows:true, // next, prev 이동 버튼
			  autoplay:true, // 자동 넘김 여부
			  infinite: false, //반복설정
			  speed: 300, //슬라이드 속도
			  autoplaySpeed : 10000,   // 자동 넘김시 슬라이드 시간
			  pauseOnHover : true,// 마우스 hover시 슬라이드 멈춤
			  vertical : false,  // 세로 방향 슬라이드 옵션
			  prevArrow : "<button type='button' class='slick-prev' value=←>Previous</button>",        
			  nextArrow : "<button type='button' class='slick-next'value=→>Next</button>", //화살표 커스텀
			  slidesToShow: 1, //보여질 슬라이드 수
			  slidesToScroll: 1, //넘겨질 슬라이드 수
			  responsive: [ // -> 반응형 옵션
			    {
			      breakpoint: 480,// 반응형 ~ 480
			      settings: {
			        slidesToShow: 1,
			        slidesToScroll: 1
			      }
			    }
			 ]
		});
		*/
		// 카테고리 클릭 이벤트------------------------------------------------------
		$(".category").on("click", function(e){
			if($(this).next().css("display") == "none"){
				$(this).children("span").text("-")
				$(this).next().slideDown();
			}else{
				$(this).children("span").text("+")
				$(this).next().slideUp();
			}
		});

		// 카테고리 별 클릭 이벤트-----------------------------------------------
		$(".brandType").on("click", function(){		// class brandType 클릭 시
			if($(this).is(":checked")){				// 그 brandType이 체크일 경우	
				
				$(this).attr("name","brandType")	// name속성에 brandType을 넣어준다.
			}else{									// 체크가 아닐경우
				$("#allSlctBtn").prop("checked",false);
				$(this).removeAttr("name")				// name 속성에 brandType을 제거한다.
			}
			if($(".brandType:checked").length == 5){ // 브랜드 타입이 다 체크될경우 전체보기 체크되게
				$("#allSlctBtn").prop("checked",true);
			}else{
				$("#allSlctBtn").prop("checked",false);
			}
			idx=1;
			getList();
		});
		
		$(".ctgrType").on("click", function(){

			if($(this).is(":checked")){
				$(this).attr("name", "ctgrType")
			}else{
				$(this).removeAttr("name")	
			}
			idx=1;
			getList();
		});
		$(".price").on("click", function(){
			var target = $(this)						// this -> 클릭된 셀렉트박스
			if($(this).prop("checked")){
				$(".price").each(function(idx,item){ 	// target -> 클릭된 셀렉트박스. 위에 this와 동일
					if($(item).is(":checked") && target.attr("id") !=$(item).attr("id")){ // 새로 체크한게 기존에 체크했던 항목이 아닐경우 
						$(item).prop("checked", false);									  // check풀기
						$(item).removeAttr("name");
					}
				})
			}	
		});
		$(".price").on("click", function(){
			if($(this).is(":checked")){
				$(this).attr("name", "price")
			}else{
				$(this).removeAttr("name")	
			}
			idx=1;
			getList();
		});
		
		// 브랜드 전체선택 버튼----------------------------------------------
		$("#allSlctBtn").on("click", function(){
			if($(this).is(":checked")){
				$(".brandType").prop("checked", true);
				$(".brandType").attr("name","brandType");
			}else{
				$(".brandType").prop("checked", false);
				$(".brandType").removeAttr("name");
			}
			idx=1;
			getList();
		});
		
		// 가격별 조회 하나만 체크되게 하기------------------------------------

		// 카테고리 조회 버튼 클릭 이벤트--------------------------------------------
		$("#sbmBtn").on("click", function(){
			var num =0;
			$(".brandType").each(function(index,item){
				if($(this).prop("checked")){
					num +=1;
				}
			});
			if(num==0){
				$("#allSlctBtn").click();
			}
			idx = 1;	// idx를 1로 초기화 해줘야함
			getList();
		});
		
		// 안쓰는데 나중에 참고될것같아 남김--------------------------------------start
		// 카테고리 필더링 조회 후 체크박스 유지--------------------------------
		<c:forEach var="rntVo" items="${rntVo.brandType }">
			if($("#bSpan").text()=="+"){
				$("#bSpan").parent().click();
			}
			<c:choose>
				<c:when test="${rntVo eq 9999}">
					//$("input[value=9999]").prop("checked", true);
					$("input[value=9999]").click();
				</c:when>
				<c:when test="${rntVo eq 9998}">
					$("input[value=9998]").click();
				</c:when>
				<c:when test="${rntVo eq 9997}">
					$("input[value=9997]").click();
				</c:when>
				<c:when test="${rntVo eq 9996}">
					$("input[value=9996]").click();
				</c:when>
				<c:when test="${rntVo eq 9995}">
					$("input[value=9995]").click();
				</c:when>
			</c:choose>
		</c:forEach>
		<c:forEach var="rntVo" items="${rntVo.ctgrType }">
			if($("#cSpan").text()=="+"){
				$("#cSpan").parent().click();
			}
			<c:choose>
				<c:when test="${rntVo eq 'bag'}">
					$("input[value='bag']").click();
				</c:when>
				<c:when test="${rntVo eq 'accessories'}">
					$("input[value='accessories']").click();
				</c:when>
			</c:choose>
		</c:forEach>
		<c:forEach var="rntVo" items="${rntVo.price }">
			if($("#pSpan").text()=="+"){
				$("#pSpan").parent().click();
			}
			<c:choose>
				<c:when test="${rntVo eq 50000}">
					$("input[value=50000]").click();
				</c:when>
				<c:when test="${rntVo eq 100000}">
					$("input[value=100000]").click();
				</c:when>
				<c:when test="${rntVo eq 150000}">
					$("input[value=150000]").click();
				</c:when>
			</c:choose>
		</c:forEach> // 안쓰는데 나중에 참고될것같아 남김--------------------------end
		
		// 스크롤 내리면 삼품 불러오는 ajax-----------------------------------------------
		$(window).scroll(function(){
			var scrT = $(window).scrollTop();
				console.log(scrT); //스크롤 값 확인용
			if(scrT+3 >= $(document).height() - $(window).height()){ // $(document).height() : 페이지 전체크기, $(window).height() : 화면상 보이는 크기
				// 페이지 전체크기 =< 스크롤크기(아래 내려갈 공간) + 화면상 보이는 크기 --> 상품 더보기되면서 페이지 전체크기 늘어남
				idx += 1; //스크롤이 끝에 도달했을때 실행될 이벤트
				getList();
			} else {
				//아닐때 이벤트
			}
		});
		
		// 선택된 배너에 맞춰서 브랜드 상품 보여주기 및 브랜드 체크---------------------------
		<c:forEach var="rntVo" items="${param.brandType }">
			if($("#bSpan").text()=="+"){
				$("#bSpan").parent().click();
			}
			<c:choose>
				<c:when test="${rntVo eq 9999}">
					//$("input[value=9999]").prop("checked", true);
					$("input[value=9999]").click();
				</c:when>
				<c:when test="${rntVo eq 9998}">
					$("input[value=9998]").click();
				</c:when>
				<c:when test="${rntVo eq 9997}">
					$("input[value=9997]").click();
				</c:when>
				<c:when test="${rntVo eq 9996}">
					$("input[value=9996]").click();
				</c:when>
				<c:when test="${rntVo eq 9995}">
					$("input[value=9995]").click();
				</c:when>
			</c:choose>
		</c:forEach>
		// 처음 상품 리스트 보여주기 위해서 getList 에이젝스함수 실행해줌-----------
		getList();
		
		// 상품등록 버튼 클릭이벤트-----------------------------------------
		$("#rPrdtBtn").on("click",function(){
			location.href="/rental/addRntPrdtPage";
		});
		
		// 검색버튼 클릭이벤트---------------------------------------------
		$("#serchBtn").on("click", function(){

			getList();
		});
		
		// 검색 키워드 입력후 enter 눌렀을때 이벤트------------------------------
		$('#serachValue').on('keydown', function(e){
			if (e.code == 'Enter'){
				$('#serchBtn').click()
			}
		})
		
		// 상품 리스트 순서 보여주기-----------------------------------------------
		$("#selectOrderID").on('change',function(e){
			
			var selectOrder = $("#selectOrderID").val();
			$("#orderValue").val(selectOrder);
			getList();
		});
		
		
		
		
	});//------------------------------------------------------------------------------------onload end
	
	// 페이징처리를 위해 전역변수 선언
	var idx = 1;
		
		
	//------------------------------------------------------------------------------------상품 리스트 가져오는 함수--------
	function getList(){
		var getListIdx = 8;	// 페이지에 보이는 상품 갯수
		$("#searchKeyword").val($("#serachValue").val().trim())
		$.ajax({
            type : "POST",            
            url : "/rental/ajax/rentalList",      
            data : $("#myForm").serialize(),     
            success : function(result){
				if(result.length){	// 리스트로 오기떄문에 .length 붙여줘야됨. 리스트 아니면 .length안붙여도됨
	            	var str = '';
					var getLength = 0;
					if((idx*getListIdx)>=result.length){
						getLength = result.length;
					}else{
						getLength = idx*getListIdx;
					}
					
					for(var i=0; i<getLength; i++){
						str += '<a href="/rental/viewRntPrdt?p_no='+result[i].p_no+'">';
						str += '<div class="product" style="display: inline-block;width:225px;height: 330px;float:left;padding:15px">';
						str += '<img src="/display/'+result[i].img_url+'">';
						str += '<div>'+result[i].p_brand+'</div>';
						str += '<div style="font-size:13px">'+result[i].p_name_en+'</div>';
						str += '<div style="font-size:10px;color: #808080bd;">'+result[i].p_name_ko+'</div>';
						str += '<div style="font-size: 13px;">'+result[i].r_price+'원</div>';
						str += '</div>';
						str += '</a>';
					}
				}else{
					var str='';
					str += '<div class="product" style="display: inline-block;width:225px;height: 330px;float:left;padding:15px">';
					str += '상품이 존재하지 않습니다.';
					str += '</div>';
				}
				$("#productList").html(str);
				
				
            }// ajax end-------------------------------------------
            
        });
	}

</script>
<jsp:include page="../include/footer.jsp"/>