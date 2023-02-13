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
	button:active {
 		background-color: rgba(34,34,34,.8);
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
	     
	}
	
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
	    font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,나눔고딕,Segoe UI,Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
	}
	#content{
		font-size: 30px; 
		text-align: center; 
		font-weight: bold;  
		
	}
	.pwTitle{
		font-size: 15px;
		text-align: left;
		margin-top: 15px;
	}
	.newPwDiv{
		text-align: left;
		border-bottom: 1px solid #c9bdbd;
    	width: 443px;
    	margin-left: 10px;
	}
	article div{
		margin-bottom: 5px;
	}
	.checkText{
		font-size: 3px;
		color: red;
		text-align: left;
		height: 15px;
		margin-left: 17px;
	}
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
				<input type="text" class="emptyCheck" placeholder="이름을 입력하세요." name="m_name">
			</li>
			<li class="title">생년월일</li>
			<li class="inputBox">
				<input type="date" class="emptyCheck" name="m_bday" onclick="this.showPicker()">
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
				<input type="text" class="emptyCheck" placeholder="아이디를 입력하세요." name="m_id">
			</li>
			<li class="title">이메일</li>
			<li class="inputBox">
				<input type="text" class="emptyCheck" placeholder="이메일을 입력하세요." name="m_email">
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
    <div id="layerbox" class="layerpop" style="width: 500px; height: 300px; border-radius: 13px;">
    	<form id="goPw">
        <article class="layerpop_area">
        	<div id="title">찾기에 성공하였습니다.</div>
        	<a href="javascript:popupClose();" class="layerpop_close" id="layerbox_close">X</a>
        	<div id="content">레이어 팝업 내용<br/></div>
        </article>
        </form>
    </div>
</div>

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
		var emptyCheck=0;

			var form = null;
			if($("#findIdBtn").is(":checked")){
				$("#findIdForm .emptyCheck").each(function(){
					if(!$(this).val()){
						var str=$(this).parent().prev().text();
						alert(str+"를 입력해주세요.");
						emptyCheck=1;
						return false;
					}
				})
				form = $("#findIdForm").serialize();
			}else{
				$("#findPwForm .emptyCheck").each(function(){
					if(!$(this).val()){
						var str=$(this).parent().prev().text();
						alert(str+"를 입력해주세요.");
						emptyCheck=1;
						return false;
					}
				})
				form = $("#findPwForm").serialize();
			}
			if(emptyCheck > 0){
				return;
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
							$("#title").text("일치하는 계정을 찾았습니다.");
							// $("#content").text(result.m_pw);
							var pwStr="";
							
							pwStr += '<div class="pwTitle">  &nbsp;&nbsp;&nbsp;  새로 생성할 비밀번호 입력</div>';
							pwStr += '<div  class="newPwDiv">&nbsp;<input type="password" id="pwText" name="m_pw"></div>';
							pwStr += '<div id="pwCheck" class="checkText"> </div>';
							pwStr += '<div class="pwTitle">  &nbsp;&nbsp;&nbsp;  비밀번호 확인</div>';
							pwStr += '<div class="newPwDiv">&nbsp;<input type="password" id="newPwText"></div>';
							pwStr += '<div id="newPwCheck" class="checkText"> </div>';
							pwStr += '<div><button style="margin-top: 5px;" id="updatePwBtn">비밀번호생성</button></div>';
							pwStr += '<div><input type="hidden" name="m_id" value="'+result.m_id+'"></div>';
							
							$("#content").html(pwStr);
							
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
	
	// 비밀번호 조건에 맞는지 확인(테스트위해 잠시 막아둠)----------------------------
	
	// 비밀번호 정규식
	var regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
	var pwCheckValue = 'y';
	var newPwCheckValue = 'y';
	
	/*
	// 비밀번호 입력
	$(document).on("keyup","#pwText",function(e){
		console.log($(this).val());
		if(!regPw.test($("#pwText").val())){
			$("#pwCheck").css("color", "red");
			$("#pwCheck").text("비밀번호를 8-16자 영어+숫자+특수문자로 입력하세요.");
			pwCheckValue = 'n';
			return;
		}else{
			$("#pwCheck").css("color", "green");
			$("#pwCheck").text("사용가능한 비밀번호입니다.");
			pwCheckValue = 'y';
		}
	});
	// 비밀번호 확인 입력
	$(document).on("keyup","#newPwText",function(e){
		if($("#pwText").val()==$("#newPwText").val()){
			$("#newPwCheck").css("color", "green");
			$("#newPwCheck").text("확인 되었습니다.");
			newPwCheckValue = 'y';
		}else{
			$("#newPwCheck").css("color", "red");
			$("#newPwCheck").text("위에 입력한 비밀번호와 같지 않습니다.");
			newPwCheckValue = 'n';
		}
	});
	*/
	
	// 비밀번호 생성 버튼 클릭 이벤트
	$(document).on("click", "#updatePwBtn",function(e){
		e.preventDefault();
		if(pwCheckValue=='y' && newPwCheckValue=='y'){
			$("#goPw").attr("action", "/member/updatePw");
			$("#goPw").attr("method", "post");
			$("#goPw").submit();
		}
		
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