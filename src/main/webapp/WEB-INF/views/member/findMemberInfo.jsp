<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>

<style>
	#findInfoBox{
		width: 300px;
		margin: auto;
		margin-top: 104px;
		font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,나눔고딕,Segoe UI,Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
	}
	#findIdUl li,#findPwUl li{
		padding: 10px;
	}
	input{border:0 solid black;}
	input:focus {outline:none;}
	.inputBox{
		border-bottom: 1px solid gray;
	}
	button{
		border: 0;
		width: 280px;
		height: 53px;
		border-radius: 7px;
		color: white;
		background-color: black;
		cursor: pointer;
	}
	.title, button, .spanText{
		font-weight: bold;
	}
	#radioLi{
		text-align: center;
		margin-bottom: 10px;
	}
	#findPwForm{
		display: none;
	}
	h1{
		margin-bottom: 35px;
	}
	.title{
		font-size: 14px;
	}
	
	
	#mask {
    position: absolute;
    left: 0;
    top: 0;
    z-index: 999;
    background-color: #000000;
    display: none; }

.layerpop {
    display: none;
    z-index: 1000;
    background: #fff;
    cursor: move; }

.layerpop_area #title {
    padding: 10px 10px 10px 10px;
    border: 0px solid #aaaaaa;
    background: #f1f1f1;
    color: white;
    font-size: 1.3em;
    font-weight: bold;
    line-height: 24px;
    background-color: black;
    border-top-right-radius: 13px;
    border-top-left-radius: 13px;
    font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,나눔고딕,Segoe UI,Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
    }

.layerpop_area .layerpop_close {
    width: 25px;
    height: 25px;
    display: block;
    position: absolute;
    top: 10px;
    right: 10px;
    background: transparent url('btn_exit_off.png') no-repeat;
    color: white;
    font-weight: bold;
    }

.layerpop_area .layerpop_close:hover {
    background: transparent url('btn_exit_on.png') no-repeat;
    cursor: pointer; }

.layerpop_area #content {
    width: 96%;    
    margin: 2%;
    color: black;
    font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,나눔고딕,Segoe UI,Helveica,Arial,Malgun Gothic,Dotum,sans-serif;}
</style>

<div id="findInfoBox">
	<h1 style="text-align: center; ">계정 찾기</h1>
	<div id="radioLi">
		<input type="radio" id="findIdBtn" name="radioBox" checked="checked" ><label for="findIdBtn"><span class="spanText">아이디찾기</span></label>
		<input type="radio" id="findPwBtn" name="radioBox"><label for="findPwBtn"><span class="spanText">비밀번호찾기</span></label>
	</div>
	<form id="findIdForm">
		<ul id="findIdUl">
			<li class="title">이름</li>
			<li class="inputBox">
				<input type="text" placeholder="이름을 입력하세요." name="m_name">
			</li>
			<li class="title">생년월일</li>
			<li class="inputBox">
				<input type="date" name="m_bday" onclick="this.showPicker()">
			</li>
			<li>
				<button class="findInfoBtn">아이디찾기</button>
			</li>
		</ul>
	</form>
	<form id="findPwForm">
		<ul id="findPwUl">
			<li class="title">아이디</li>
			<li class="inputBox">
				<input type="text" placeholder="아이디를 입력하세요." name="m_id">
			</li>
			<li class="title">이메일</li>
			<li class="inputBox">
				<input type="text" placeholder="이메일을 입력하세요." name="m_email">
			</li>
			<li>
				<button class="findInfoBtn">비밀번호찾기</button>
			</li>
		</ul>
	</form>
</div>

<!----------------------------- 모달창 -------------------------------------------------------------------------->
<div id="modal">
	
    <!-- 팝업뜰때 배경 -->
    <div id="mask"></div>

    <!--Popup Start -->
    <div id="layerbox" class="layerpop" style="width: 500px; height: 270px; border-radius: 13px;">
        <article class="layerpop_area">
        	<div id="title">찾기에 성공하였습니다.</div>
        	<a href="javascript:popupClose();" class="layerpop_close" id="layerbox_close">X</a> <br>
        	<div id="content" style="font-size: 30px; text-align: center; font-weight: bold;  margin-top: 60px;">레이어 팝업 내용<br/></div>
        </article>
    </div>
</div>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script  type="text/javascript">
$(function(){
	// 라디오체크박스 값이 바꼈을떄
	$("input[name='radioBox']").on("change",function(){
		// 체크된게 비번찾기 버튼일경우
		if($("#findPwBtn").is(":checked")){
			$("#findPwForm").css("display","block");
			$("#findIdForm").css("display","none");
		}else{
		// 체크된게 아이디찾기 버튼일 경우
			$("#findIdForm").css("display","block");
			$("#findPwForm").css("display","none");
		}
	});
	
	// 아이디,비밀번호찾기 버튼 클릭 이벤트
	$(".findInfoBtn").on("click",function(e){
		e.preventDefault();
		var form = null;
		if($("#findIdBtn").is(":checked")){
			form = $("#findIdForm").serialize();
		}else{
			form = $("#findPwForm").serialize();		
		}
		
		$.ajax({
            type : "POST",            
            url : "/member/ajax/findInfo",      
            data : form,
            success : function(result){
				if(result){
					//$("#modal").css("display","block");
					// 체크된게 아이디찾기인지 비번찾기인지 구분하여 모달창 타이을 변경
					if($("#findPwBtn").is(":checked")){
						$("#title").text("비밀번호찾기에 성공하였습니다.");
						$("#content").text(result.m_pw);
					}else{
						$("#title").text("아이디찾기에 성공하였습니다.");
						$("#content").text(result.m_id);
					}
					// 모달창 실행 스크립트
					goDetail();
				}else{
					alert("일치하는 정보가 없습니다.");
					return;
				}
            }
        });
	});
	
	
}); // onload end-------------------------------------------------------

function wrapWindowByMask() {
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height(); 
    var maskWidth = $(window).width();

    //문서영역의 크기 
    console.log( "document 사이즈:"+ $(document).width() + "*" + $(document).height()); 
    //브라우저에서 문서가 보여지는 영역의 크기
    console.log( "window 사이즈:"+ $(window).width() + "*" + $(window).height());        

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('#mask').css({
        'width' : maskWidth,
        'height' : maskHeight
    });

    //애니메이션 효과
    //$('#mask').fadeIn(1000);      
    $('#mask').fadeTo("slow", 0.5);
}

function popupOpen() {
    $('.layerpop').css("position", "absolute");
    //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
    $('.layerpop').css("top",(($(window).height() - $('.layerpop').outerHeight()) / 2) + $(window).scrollTop());
    $('.layerpop').css("left",(($(window).width() - $('.layerpop').outerWidth()) / 2) + $(window).scrollLeft());
    $('#layerbox').show();
}

function popupClose() {
    $('#layerbox').hide();
    $('#mask').hide();
}

function goDetail() {

    /*팝업 오픈전 별도의 작업이 있을경우 구현*/ 

    popupOpen(); //레이어 팝업창 오픈 
    wrapWindowByMask(); //화면 마스크 효과 
}
</script>

<jsp:include page="../include/footer.jsp"/>