<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</style>
	<!-- 좌측 카테고리 박스------------------------------------------------------- -->
	<div id="categroyBox">
		<form id="myForm" action="/rental/rentalList">
			<ul>
				<li class="category">카테고리<span id="cSpan">+</span></li>
				<li class="hideMenu">
					<ul>
						<li>
							<input type="checkbox" class="ctgrType" value ="bag"/>&nbsp;&nbsp;가방<br/>
						</li>
						<li>
							<input type="checkbox" class="ctgrType" value ="accessories">&nbsp;&nbsp;패션잡화<br/>
						</li>
					</ul>
				</li>
				
				<li class="category">브랜드<span id="bSpan">+</span></li>
				<li class="hideMenu">
					<ul>
						<li>
							<input type="checkbox" id="allSlctBtn">&nbsp;&nbsp;전체보기<br/>
						</li>
						<li>
							<input type="checkbox" class="brandType" value ="9999">&nbsp;&nbsp;GUCCI<br/>
						</li>
						<li>
							<input type="checkbox" class="brandType" value ="9998">&nbsp;&nbsp;DIOR<br/>
						</li>
						<li>
							<input type="checkbox" class="brandType" value ="9997">&nbsp;&nbsp;LOUISVUITTON<br/>
						</li>
						<li>
							<input type="checkbox" class="brandType" value ="9996">&nbsp;&nbsp;CHANEL<br/>
						</li>
						<li>
							<input type="checkbox" class="brandType" value ="9995">&nbsp;&nbsp;PRADA<br/>
						</li>
					</ul>
				</li>
				
				<li class="category">가격<span id="pSpan">+</span></li>
				<li class="hideMenu">
					<ul>
						<li>
							<input type="checkbox" class="price" value ="50000">&nbsp;&nbsp;5만원이하<br/>
						</li>
						<li>
							<input type="checkbox" class="price" value ="100000">&nbsp;&nbsp;10만원이하<br/>
						</li>
						<li>
							<input type="checkbox" class="price" value ="150000">&nbsp;&nbsp;15만원이하<br/>
						</li>
					</ul>
				</li>
				<li>
					<input type="button" id="sbmBtn" value="조회">
				</li>
			</ul>
		</form>
	</div>
	<!-- 상품 리스트-------------------------------------------------------------- -->
	<div id="productList" style="display:inline-block;width:75%;margin-top:155px; magin-bottom:50px;">
	
	</div>
	
	
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script  type="text/javascript">
	$(function(){ //------------------------------------------------------------------------------------onload start
		
		
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

		// 필터 별 조회 버튼 클릭 이벤트-----------------------------------------------
		$(".brandType").on("click", function(){		// class brandType 클릭 시
			if($(this).is(":checked")){				// 그 brandType이 체크일 경우				
				$(this).attr("name","brandType")	// name속성에 brandType을 넣어준다.
			}else{									// 체크가 아닐경우
				$(this).removeAttr("name")				// name 속성에 brandType을 제거한다.
			}										
		});
		
		$(".ctgrType").on("click", function(){
			if($(this).is(":checked")){
				$(this).attr("name", "ctgrType")
			}else{
				$(this).removeAttr("name")	
			}
		});
		
		$(".price").on("click", function(){
			if($(this).is(":checked")){
				$(this).attr("name", "price")
			}else{
				$(this).removeAttr("name")	
			}
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
		});
		
		// 가격별 조회 하나만 체크되게 하기------------------------------------
		$(".price").on("click", function(){
			if($(this).prop("checked")){
				$(".price").prop("checked",false);
				$(this).prop("checked",true);
			}
				
			
		});
		// 필터 검색 버튼 클릭 이벤트--------------------------------------------
		$("#sbmBtn").on("click", function(){
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
		
		// 스크롤 내리면 삼품 불러오는 ajax
		$(window).scroll(function(){
			var scrT = $(window).scrollTop();
				console.log(scrT); //스크롤 값 확인용
			if(scrT >= $(document).height() - $(window).height()){ // $(document).height() : 페이지 전체크기, $(window).height() : 화면상 보이는 크기
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
		
		
		
		
		
		
	});//------------------------------------------------------------------------------------onload end
	
	// 페이징처리를 위해 전역변수 선언
	var idx = 1;
		
		
	//------------------------------------------------------------------------------------상품 리스트 가져오는 함수--------
	function getList(){
		var getListIdx = 8;	// 페이지에 보이는 상품 갯수
		$.ajax({
            type : "POST",            
            url : "/rental/ajax/rentalList",      
            data : $("#myForm").serialize(),     
            success : function(result){
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
            
				$("#productList").html(str);
            }
            
        });
	}

</script>
<jsp:include page="../include/footer.jsp"/>