<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/js/rental/slick.css"/>
<link rel="stylesheet" type="text/css" href="/resources/js/rental/slick-theme.css"/>
<style>
	/*
	#prdtModBtn{
		float: right;
    	margin-top: -526px;
	}
	#removePrdtForm{
		float: right;
    	margin-top: -526px;
	}
	#prdtModBtn{
		margin-right: -70px;
	}
	*/
	#prdtInfo{
		display: inline-block;
		float: right;

	}
	#infoBox{
		font-size: 20px;
		margin-top: -577px;
		border-left: 1px solid #ebebeb;
		padding: 40px;
		/*margin-right: 25px;*/
	}
	
	#p_name_ko{
		height: 56px;
    	font-size: 16px;
  	  	color: #808080db;
	}
	.rntPrice{
		margin-right: 39px;
   		font-size: 13px;
  		color: #7c7c7c;
	}
	#body{
		font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,나눔고딕,Segoe UI,Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
		margin-left: 70px;
	}
	.buy{
		position: relative;
    	border-radius: 10px;
    	background-color: #41b979;
    	border: 0;
    	width: 220px;
    	color: white;
    	padding: 15px 5px 15px 5px;
    	text-align: center;
    }
    .slick-dots{
    	margin-bottom: 95px
    }
	
</style>
<jsp:include page="../include/header.jsp"/> 
<div id="body" style="margin-top: 70px;">
<!-- 상품 이미지-------------------------------------------------------- -->
<div class="slick" style="width:502px">
	<c:forEach var="image" items="${imageList }">
			<div style="width:700px"><img src="/display/${image.img_url }"/></div>
	</c:forEach>
</div>
<!-- 상품 상세내용-------------------------------------------------------- -->

<div id="prdtInfo">
	<table id="infoBox">
		<tr>
			<td colspan="2">${pvo.p_name_en }</td>
		</tr>
		<tr>
			<td style="border-bottom: 1px solid #ebebeb;" colspan="2" id="p_name_ko">${pvo.p_name_ko }</td>
		</tr>
		<tr>
			<td colspan="2" style="height: 80px; text-align: right;">
				<div class="rntPrice">1일 기준 대여금액</div>
				<div style="margin-right: 39px;">${pvo.r_price }원</div>
			</td>
		</tr>
		<tr>
			<td style="text-align:center;border-bottom: 1px solid #ebebeb; padding: 14px;">
				<input class="buy" type="button" value="관심상품"/>
			</td>
			<td style="text-align:center;border-bottom: 1px solid #ebebeb; padding: 14px;">
				<div><input class="buy" id="rsvtBtn" type="button" value="상품예약"/></div>
			</td>
		</tr>
		<tr style="font-size: 14px; ">
			<td style="height: 85px; border-bottom: 1px solid #ebebeb;">
				<div style="font-weight: 500;">모델번호</div>
				<div>${pvo.p_model_no }</div>
			</td>
			<td style="border-bottom: 1px solid #ebebeb;">
				<div style="font-weight: 500;border-left: 1px solid #ebebeb;padding: 15px 30px 0px;">출시가</div>
				<div style="border-left: 1px solid #ebebeb;padding: 0px 30px 15px;">${pvo.p_release_price }원</div>
			</td>
		</tr>
		<tr>
			<td style="text-align:center;padding: 14px;">
				<input id="prdtModBtn" class="buy" type="button" value="상품수정"/>
			</td>
			<td style="text-align:center;padding: 14px;">
				<form id="removePrdtForm" action="/rental/removeRntPrdt" method="post" >
					<input class="buy" type="button" id="prdtRemvBtn" value="상품삭제"/>
					<input type="hidden" name="p_no" value="${pvo.p_no }">
				</form>
			</td>
		</tr>
	</table>
</div>
<!-- 한줄평 등록-------------------------------------------------------- -->
<form id="reviewForm" action="/rental/rgstReview" method="post">
	<!--별점  -->
	<div id="rAll" >
		<span id="1" data-rval="n">☆</span>
		<span id="2" data-rval="n">☆</span>
		<span id="3" data-rval="n">☆</span>
		<span id="4" data-rval="n">☆</span>
		<span id="5" data-rval="n">☆</span>
	</div>
	
	<div>
		<input type="text" placeholder="한줄평을 남겨주세요.(최대 100자)" name="rp_content" maxlength="100"/>
		<input type="button" id="rpBtn" value="한줄평 등록"/>
		<input type="hidden" name="p_no" value="${pvo.p_no }"/>
		<input id="rst" type="hidden" name="rating"/>
	</div>
</form>






<!-- 한줄평 리스트 출력--------------------------------------------------------------------------- -->
<table class="table table-stripped" id="reviews">
    <thead>
        <tr>
            <th>Rating</th> <!-- 평점 -->
            <th>User</th>
            <th>Text</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="review" items="${reviewVO}" varStatus="status">
            <!-- 평점 기준 별표시 출력 -->
            <tr>
                <td>
                	<c:forEach varStatus="status" begin="1" end="5">
                		<c:if test="${status.count <= review.rating }">
                			<span>★&nbsp;</span>
                		</c:if>
                		<c:if test="${status.count > review.rating }">
                			<span>☆&nbsp;</span>
                		</c:if>
                	</c:forEach>
                </td>
                <td>익명</td>
                <td>${review.rp_content}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</div>


	
<script type="text/javascript" src='/resources/js/rental/slick.min.js'></script>
<script  type="text/javascript">
	
	var $ = jQuery.noConflict();	// j쿼리 충돌 막기 위해서 적어줌
	// -------------------------------------------------------------------------------------onload start
	$(function(){
		// 상품 수정 버튼 클릭 이벤트----------------------------------------------------------
		$("#prdtModBtn").on("click", function(){
			location.href="/rental/updateRntPrdtPage?p_no=${pvo.p_no}";
		});
		
		// 사진 슬라이드 효과 주기위한 옵션
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
		
		// 상품 삭제 버튼 클릭 이벤트--------------------------------------------
		$("#prdtRemvBtn").on("click", function(){
			if(confirm("상품을 삭제하시겠습니까?")){
				$("#removePrdtForm").submit();
			}else{
				return;
			}
		});
		
		// 별점 선택시 색칠----------------------------------------------------
		$("#rAll").on("click", function(){
			var idx = event.target.id;
			var str = '';
			/* event.target : 클릭이 된 요소 , event.type : 이벤트 타입을 알려줌(ex)click, keyboard, mouse 등등) */
			if(event.target.tagName=='SPAN'){
				for(var i=0; i<5; i++){
					if(i<idx){
						str += '<span id='+(i+1)+'>★&nbsp;</span>';
					}else{
						str += '<span id='+(i+1)+'>☆&nbsp;</span>';
					}
				}
				$("#rst").val(idx);
				$("#rAll").html(str);
			
			}
			
		});
		
		// 댓글 적합성 검사-------------------------------------------------------------------
		$("#rpBtn").on("click", function(){

			var rst = $("#rst").val();
			var rp_content = $("input[name='rp_content']").val();
			
			if(rst == '' || rst == 0){
				alert("별점을 선택해주세요.");
				return;
			}
			if(rp_content.length < 10){
				alert("10자 이상 입력해주세요.");
				return;
			}
			$("#reviewForm").submit();
		});
		
		// 상품예약 버튼 클릭 이벤트------------------------------------------------------------
		$("#rsvtBtn").on("click", function(){
			location.href="/rsvt/rsvtPage?p_no=${pvo.p_no}";
		});
		
		
		
		
	});
	// -------------------------------------------------------------------------------------onload end
	
	
	
	
	
	



</script>

<jsp:include page="../include/footer.jsp"/>