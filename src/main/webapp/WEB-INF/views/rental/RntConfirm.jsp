<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp"/>
</head>
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
		width: 125px;
	}
</style>
<body>
<!-- 좌측 카테고리 박스------------------------------------------------------- 
<div id="categroyBox">
	<form id="myForm" action="/rental/rentalList">
		<ul>
			<li class="category">쇼핑정보<span id="cSpan">+</span></li>
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
			
			<li class="category">내정보<span id="bSpan">+</span></li>
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
			
			
		</ul>
	</form>
</div>
<div>
	<table>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>
					<img src="/display/${vo.img_url}">
				</td>
				<td>
					<div>${vo.p_name_ko }</div>
					<div>${vo.p_name_en }</div>
				</td>
				<td>
					예약금액
				</td>
				<td>
					<span>${vo.strt_r_date }</span>
					<span>-</span>
					<span>${vo.rtrn_r_date }</span>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
-->
</body>
<script>
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
		
		
		
		
		
		
		
		
	}); //------------------------------------------------------------------------------------onload end
</script>
<jsp:include page="../include/footer.jsp"/>