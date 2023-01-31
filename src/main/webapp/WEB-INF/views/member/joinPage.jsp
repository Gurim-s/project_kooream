<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<div>
	<form id="myForm" method="post">
		<ul>
			<li>아이디</li>
			<li>
				<input type="text" id="idText" name="m_id">
			</li>
			<li>
				<div id="idCheck"></div>
			</li>
			<li>비밀번호</li>
			<li>
				<input type="password" id="pwText" name="m_pw">
			</li>
			<li>
				<div id="pwCheck"></div>
			</li>
			<li>닉네임</li>
			<li>
				<input type="text" id="nickNameText" name="m_nickname">
			</li>
			<li>
				<div id="nickNameCheck"></div>
			</li>
			<li>이름</li>
			<li>
				<input type="text" id="nameText" name="m_name">
			</li>
			<li>
				<div id="namdCheck"></div>
			</li>
			<li>생년월일</li>
			<li>
				<input type="date" name="m_bday">
			</li>
			<li>주소</li>
			<li>
				<input type="text" id="sample6_address" name="m_addr" onclick="sample6_execDaumPostcode()" placeholder="주소"><br>
			</li>
			<li>상세주소</li>
			<li>
				<input type="text" id="sample6_detailAddress" name="m_Detail_addr">
			</li>
			<li>*이메일은 회원정보를 찾을때 필요하니 정확하게 입력바랍니다.</li>
			<li>이메일</li>
			<li>
				<input type="text" id="emailText" name="m_email">
			</li>
			<li>
				<div id="emailCheck"></div>
			</li>
			<li>전화번호</li>
			<li>
				<input type="text" id="phoneText" name="m_phone" oninput="autoHyphen2(this)" maxlength="13">
			</li>
			<li>
				<div id="phoneCheck"></div>
			</li>
			<li>
				<button id="joinBtn">회원가입</button>
			</li>
		</ul>
	</form>
</div>
<script type="text/javascript" src='/resources/js/rental/slick.min.js'></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소 api 사용하기 위해 명시 -->
<script  type="text/javascript">
	$(function(){
		var idCheckValue = 'n';
		var pwCheckValue = 'n';
		var nicknameCheckValue = 'n';
		var emailCheckValue = 'n';
		
		// 아이디 정규식		
		var regId = /^(?=.*[a-z])(?=.*[0-9])[a-z0-9]{5,16}$/;	 
		// 비밀번호 정규식
		var regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;	
		// 닉네임 정규식
		var regNickName = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
		// 이메일 정규식
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		// 아이디를 입력할때마다 테이블에 값 있는지, 조건에 맞는지 비교------------------
		$("#idText").on("keyup", function(e){
			if(!regId.test($("#idText").val())){
				$("#idCheck").text("아이디를 5-16자 소문자+숫자로 입력하세요.");
				idCheckValue = 'n';
				return;
			}else if(regId.test($("#idText").val())){
				$.ajax({
					type : "POST",            
		            url : "/member/ajax/checkAjax",
		            dataType : 'json',
		            contentType : 'application/json', // 컨트롤러에서 RequestParam 혹은 RequestBody로 받을때 jsp에서 json으로 보낸다고 명시
		            data : JSON.stringify({m_id : $("#idText").val()}),	//  JSON.stringify() -> 컨트롤러에서 받는 Object를 json형태로 변환
		            success : function(result){
		            	if(result==0){
							$("#idCheck").text("사용가능한 아이디 입니다.");
							idCheckValue = 'y';
		            	}else{
							$("#idCheck").text("중복된 아이디 입니다.");
							idCheckValue = 'n';
		            	}
		            }
				});
			}
		});
		
		// 비밀번호 조건에 맞는지 확인----------------------------
		$("#pwText").on("keyup", function(e){
			console.log($("#pwText").val());
			if(!regPw.test($("#pwText").val())){
				$("#pwCheck").text("비밀번호를 8-16자 영어+숫자+특수문자로 입력하세요.");
				pwCheckValue = 'n';
				return;
			}else{
				$("#pwCheck").text("사용가능한 비밀번호입니다.");
				pwCheckValue = 'y';
			}
		});
		
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
		
		// 회원가입 버튼 클릭 이벤트--------------------------------------------------
		$("#joinBtn").on("click", function(e){
			e.preventDefault();
			var idx=0;
			$("input").each(function(index,item){
				if(!$(item).val()){
					var str = $(item).parent().prev().text();
					alert(str + "을(를) 입력해주세요.");
					idx=1;
					return false;
				}else{
					idx=0;
					return;
				}
			});
			if(idx==0){
				if(idCheckValue != 'y' || pwCheckValue != 'y' || nicknameCheckValue != 'y' || emailCheckValue != 'y' || $("#phoneText").val().length != 13){
				
					alert("조건에 맞춰 작성해주세요.");
					return;
				}else{
					$("#myForm").attr("action","/member/join");
					$("#myForm").submit();
				}
			}
			
		});
		
		
		
		
	}); //------------------------------------------------------------------------------onload end
	

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
      		}
    	}).open();
	}
		
		
</script>
<jsp:include page="../include/footer.jsp"/>