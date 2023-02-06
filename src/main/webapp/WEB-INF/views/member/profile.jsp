<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/myPageCategory.jsp"/>
<style>
	#submitTd{
		display: none;
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

<!-- 회원정보 불러오기 -->
<div>
	<sec:authentication property="principal.member" var="pri"/>
	<div>
		<form id="modifyForm" method="post">
		<table>
			<tr>
				<td>
					<span>아이디</span>
				</td>
				<td>
					<span>${pri.m_id}</span>
					<input type="hidden" name="m_id" value="${pri.m_id}">
				</td>
			</tr>
			<tr>
				<td>
					<span>닉네임</span>
				</td>
				<td>
					<span>${pri.m_nickname}</span>
					<input type="hidden" name="m_nickname" value="${pri.m_nickname}">
				</td>
			</tr>
			<tr>
				<td>
					<span>이름</span>
				</td>
				<td>
					<span class="info" name="m_name">${pri.m_name}</span>
					<div id="namdCheck" class="checkText"></div>
				</td>
			</tr>
			<tr>
				<td>
					<span>생년월일</span>
				</td>
				<td>
					<span class="info" name="m_bday">${pri.m_bday}</span>
				</td>
			</tr>
			<tr>
				<td>
					<span>주소</span>
				</td>
				<td>
					<span id="addr_Span" name="m_addr"><c:out value="${fn:split(pri.m_addr,'/')[0]}"/></span>
				</td>
			</tr>
			<tr>
				<td>
					<span>상세주소</span>
				</td>
				<td>
					<span id="addr_detail_Span" name="m_Detail_addr"><c:out value="${fn:split(pri.m_addr,'/')[1]}"/></span>
				</td>
			</tr>
			<tr>
				<td>
					<span>이메일</span>
				</td>
				<td>
					<span class="info" name="m_email">${pri.m_email}</span>
					<div id="emailCheck" class="checkText"></div>
				</td>
			</tr>
			<tr>
				<td>
					<span>핸드폰번호</span>
				</td>
				<td>
					<span class="info" name="m_phone">${pri.m_phone}</span>
					<div id="phoneCheck" class="checkText"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" id="modifyTd">
					<button id="modifyBtn">개인정보수정</button>
					<button id="deleteBtn">회원탈퇴</button>
				</td>
				<td colspan="2" id="submitTd">
					<button id="successModify">수정완료</button>
					<button id="back">돌아가기</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
</div>
<!----------------------------- 모달창 -------------------------------------------------------------------------->
<div id="modal">
	
    <!-- 팝업뜰때 배경 -->
    <div id="mask"></div>

    <!--Popup Start -->
    <div id="layerbox" class="layerpop" style="width: 500px; height: 300px; border-radius: 13px;">
    	<form id="goPw">
        <article class="layerpop_area">
        	<div id="title">비밀번호를 입력해주세요.</div>
        	<a href="javascript:popupClose();" class="layerpop_close" id="layerbox_close">X</a>
        	<input id="content" type="text" name="m_pw">
        	<button id="matchPwBtn">개인정보수정</button>
        </article>
        </form>
    </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소 api 사용하기 위해 명시 -->
<script  type="text/javascript">
	$(function(){
		var nicknameCheckValue = 'y';
		var emailCheckValue = 'y';
		var phoneCheckValue = 'y'
		var emptyCheckValue = 'y'
		
		// 이메일 정규식
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		// 이메일 조건에 맞는지 확인------------------------------------------------
		$(document).on("keyup", "input[name='m_email']", function(e){
			console.log($("input[name='m_email']").val());
			if(!regEmail.test($("input[name='m_email']").val())){
				$("#emailCheck").text("이메일을 확인하세요.");
				emailCheckValue = 'n';
				return;
			}else{
				$("#emailCheck").text("사용가능한 이메일입니다.");
				emailCheckValue = 'y';
			}
		});
		
		// 전화번호 조건에 맞는지 확인------------------------------------------------
		$("input[name='m_phone']").on("keyup", function(e){
			console.log($("input[name='m_phone']").val());
			if($("input[name='m_phone']").val().length != 13){
				$("#phoneCheck").text("전화번호를 전부 입력하세요.");
				phoneCheckValue = 'n'
				return;
			}else{
				$("#phoneCheck").text("");
				phoneCheckValue = 'y'
			}
		});
		// 개인정보 수정 버튼 클릭 이벤트
		$("#modifyBtn").on("click", function(e){
			e.preventDefault();
			var str='';
			$(".info").each(function(idx,item){
				str = $(this).text();
				if($(item).attr("name")=="m_bday"){
					$(item).contents().unwrap().wrap( '<input type="date" name="'+$(item).attr("name")+'" class="inputInfo" value="'+str+'">' );
					return;
				}
				if($(item).attr("name")=="m_phone"){
					$(item).contents().unwrap().wrap( '<input name="'+$(item).attr("name")+'" class="inputInfo" value="'+str+'" oninput="autoHyphen2(this)" maxlength="13">' );
					return;					
				}
				$(item).contents().unwrap().wrap( '<input class="inputInfo" name="'+$(item).attr("name")+'" value="'+str+'">' ); // item 태그를 없애고 input 태그로 감싼다.
				$(item).contents().unwrap().wrap( '<span></span>' ); 
			});
			// 주소는 적을게 많아서 따로 뺌
			var addr=$("#addr_Span").text();
			var addr_detail=$("#addr_detail_Span").text();
			$("#addr_Span")
				.contents()
				.unwrap()
				.wrap('<input type="text" id="sample6_address" name="m_addr" onclick="sample6_execDaumPostcode()" class="inputInfo" placeholder="주소" value="'+addr+'">');
			$("#addr_detail_Span").contents().unwrap().wrap('<input type="text" name="m_Detail_addr" id="sample6_detailAddress" class="inputInfo" value="'+addr_detail+'"/>');
			
			// 수정완료, 돌아가기 버튼 보이게
			$("#modifyTd").css("display", "none");
			$("#submitTd").css("display", "block");
		});
			// 돌아가기 버튼 클릭 이벤트
			$("#back").on("click",function(e){
				e.preventDefault();
				location.href="/member/profile";
			});
			
			// 수정완료 버튼 클릭 이벤트
			$("#successModify").on("click", function(e){
				e.preventDefault();
				$(".inputInfo").each(function(idx, item){
					if(!$(item).val()){
						emptyCheckValue = 'n';
						return false;
					}	
				});
				if(nicknameCheckValue == 'y' 
						&& emailCheckValue == 'y'
						&& phoneCheckValue == 'y'
						&& emptyCheckValue == 'y'){
					
					// 모달창 실행 스크립트
					goDetail();
				}else{
					alert("조건에 맞게 입력해주세요.");
					return;
				}
			});
			// 회원탈퇴 버튼 클릭 이벤트
			$("#deleteBtn").on("click",function(e){
				e.preventDefault();
				if(confirm("정말 탈퇴..하시겠습니까?")){ // 확인창 띄우기
					$("#modifyForm").attr("action", "/member/deleteMember");
					$("#modifyForm").submit();
				};
			});
			
			// 전화번호 input 클릭이벤트
			$(document).on("click","input[name='m_phone']", function(){
				$("input[name='m_phone']").val("");
			});
			
			
			// 모달창에서 개인정보 수정 버튼 클릭시 이벤트
			$("#matchPwBtn").on("click", function(e){
				e.preventDefault();
				console.log("찍히나")
				
				
				$.ajax({
		            type : 'POST',            
		            url : "/member/ajax/matchPw",      
		            data : {m_pw : $("#content").val()},
		            dataType : 'json',
		            success : function(result){
						if(result){ // 컨트롤러에서 리턴받은 값이 true면.
							$("#modifyForm").attr("action", "/member/successModify");
							$("#modifyForm").submit();
						}else{
							alert("비밀번호가 일치하지 않습니다.");
							return;
						}
		            }
		        });
			});
			
			
	}); // onload end----------------------------------------------------------------------------------
	
	// 전화번호 조건문--------------------------------------
	const autoHyphen2 = function(target){ 
	// const는 값이 재할당 불가한 변수임. 변수에 함수를 집어넣음으로써 변수선언시 함수가 발동됨. 함수가 발동되게하려면 onload밖에 적어줘야함.
		
		target.value = target.value
		.replace(/[^0-9]/g, '')
		.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
	
	// 주소 api-----------------------
	function sample6_execDaumPostcode() {
    	new daum.Postcode({
      		oncomplete: function(data) {
      			document.getElementById("sample6_address").value = data.address; // 주소 넣기
                document.querySelector("#sample6_detailAddress").focus(); //상세입력 포커싱
                document.querySelector("#sample6_detailAddress").value='';//주소 넣으면 상세주소 초기화
      		}
    	}).open();
	}

	
	// 모달창 관련-----------------------------------------------
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