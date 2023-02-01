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
				</td>
			</tr>
			<tr>
				<td>
					<span>닉네임</span>
				</td>
				<td>
					<span class="info" name="m_nickname">${pri.m_nickname}</span>
				</td>
			</tr>
			<tr>
				<td>
					<span>이름</span>
				</td>
				<td>
					<span class="info" name="m_name">${pri.m_name}</span>
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
				</td>
			</tr>
			<tr>
				<td>
					<span>핸드폰번호</span>
				</td>
				<td>
					<span class="info" name="m_phone">${pri.m_phone}</span>
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
<script type="text/javascript" src='/resources/js/rental/slick.min.js'></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소 api 사용하기 위해 명시 -->
<script  type="text/javascript">
	$(function(){
		var nicknameCheckValue = 'n';
		var emailCheckValue = 'n';
		
		// 닉네임 정규식
		var regNickName = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
		// 이메일 정규식
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		
		// 닉네임 조건에 맞는지 확인-----------------------------
		$("#nickNameText").on("keyup", function(e){
			if(!regNickName.test($("#nickNameText").val())){
				$("#nickNameCheck").text("2-16자 영어 또는 숫자 또는 한글로 입력하세요.");
				nicknameCheckValue = 'n';
				return;
			}else if(regNickName.test($("#nickNameText").val())){
				$.ajax({
					type : "POST",
		            url : "/member/ajax/checkAjax",
		            dataType : 'json',
		            contentType : 'application/json',
		            data : JSON.stringify({m_nickname : $("#nickNameText").val()}),
		            success : function(result){
		            	if(result==0){
							$("#nickNameCheck").text("사용가능한 닉네임 입니다.");
							nicknameCheckValue = 'y';
		            	}else{
							$("#nickNameCheck").text("중복된 닉네임 입니다.");
							nicknameCheckValue = 'n';
		            	}
		            }
				});
			}
		});
		
		
		// 이메일 조건에 맞는지 확인------------------------------------------------
		$("#emailText").on("keyup", function(e){
			console.log($("#emailText").val());
			if(!regEmail.test($("#emailText").val())){
				$("#emailCheck").text("이메일을 확인하세요.");
				emailCheckValue = 'n';
				return;
			}else{
				$("#emailCheck").text("사용가능한 이메일입니다.");
				emailCheckValue = 'y';
			}
		});
		
		// 전화번호 조건에 맞는지 확인------------------------------------------------
		$("#phoneText").on("keyup", function(e){
			console.log($("#phoneText").val());
			if($("#phoneText").val().length != 13){
				$("#phoneCheck").text("전화번호를 전부 입력하세요.");
				return;
			}else{
				$("#phoneCheck").text("");
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
				$(item).contents().unwrap().wrap( '<input class="inputInfo" name="'+$(item).attr("name")+'" value="'+str+'">' ); // item 태그를 없애고 input 태그로 감싼다.
			});
			// 주소는 적을게 많아서 따로 뺌
			var addr=$("#addr_Span").text();
			var addr_detail=$("#addr_detail_Span").text();
			$("#addr_Span")
				.contents()
				.unwrap()
				.wrap('<input type="text" id="sample6_address" name="m_addr" onclick="sample6_execDaumPostcode()" placeholder="주소" value="'+addr+'">');
			$("#addr_detail_Span").contents().unwrap().wrap('<input type="text" name="m_Detail_addr" id="sample6_detailAddress" value="'+addr_detail+'"/>');
			
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
				$("#modifyForm").attr("action", "/member/successModify");
				$("#modifyForm").submit();
			});
			// 회원탈퇴 버튼 클릭 이벤트
			$("#deleteBtn").on("click",function(e){
				e.preventDefault();
				if(confirm("정말 탈퇴..하시겠습니까?")){ // 확인창 띄우기
					$("#modifyForm").attr("action", "/member/deleteMember");
					$("#modifyForm").submit();
				};
			});
	}); // onload end--------------------------------------------------------------------------
	
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

</script>
<jsp:include page="../include/footer.jsp"/>